# Windows PowerShell; run from any directory. No build-time dependency.
# Hero credit: Claire Fackler, CINMS, NOAA. Public domain (US government work).
# https://commons.wikimedia.org/wiki/File:California_sea_lions_in_the_kelp_forest_off_San_Miguel_Island.jpg
# The icon, share card and square podcast template are original artwork.
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing
$images = Join-Path (Split-Path $PSScriptRoot) 'assets/images'
$brand = Join-Path $images 'brand'
$src = [IO.Path]::GetTempFileName()
# Original-size image from NOAA Photo Library's Flickr record (sanc0181).
$url = 'https://live.staticflickr.com/4089/5030208218_019fe7c27e_o.jpg'
function Brush($hex) { [Drawing.SolidBrush]::new([Drawing.ColorTranslator]::FromHtml($hex)) }
$ink = Brush '#242e2b'; $green = Brush '#05bf85'; $paper = Brush '#fbfaf5'
function Draw-Mark($g, $x, $y, $scale) {
    $state = $g.Save(); $g.TranslateTransform($x, $y); $g.ScaleTransform($scale, $scale)
    $pen = [Drawing.Pen]::new($green, 3); $pen.StartCap = $pen.EndCap = 'Round'
    foreach ($dy in 0, 8, 16) {
        $path = [Drawing.Drawing2D.GraphicsPath]::new()
        $path.AddBezier(10, (31 + $dy), 22, (34 + $dy), 26, (20 + $dy), 38, (23 + $dy))
        $path.AddBezier(38, (23 + $dy), 45, (25 + $dy), 47, (28 + $dy), 54, (26 + $dy))
        $g.DrawPath($pen, $path); $path.Dispose()
    }
    $g.FillEllipse($paper, 20, 14, 6, 6); $pen.Dispose(); $g.Restore($state)
}
try {
    [void][IO.Directory]::CreateDirectory($brand)
    Invoke-WebRequest -UseBasicParsing $url -OutFile $src
    $photo = [Drawing.Image]::FromFile($src)
    if ($photo.Width -ne 3072 -or $photo.Height -ne 2304) { throw 'Unexpected NOAA original dimensions.' }
    $codec = [Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object MimeType -eq 'image/jpeg'
    $quality = [Drawing.Imaging.EncoderParameters]::new(1)
    $quality.Param[0] = [Drawing.Imaging.EncoderParameter]::new([Drawing.Imaging.Encoder]::Quality, [long]81)
    foreach ($width in 720, 1440) {
        $height = [int]($width * $photo.Height / $photo.Width)
        $bmp = [Drawing.Bitmap]::new($width, $height); $g = [Drawing.Graphics]::FromImage($bmp)
        $g.InterpolationMode = 'HighQualityBicubic'; $g.DrawImage($photo, 0, 0, $width, $height)
        $name = if ($width -eq 720) { 'san-miguel-small.jpg' } else { 'san-miguel.jpg' }
        $bmp.Save((Join-Path $images $name), $codec, $quality); $g.Dispose(); $bmp.Dispose()
    }
    $quality.Dispose()
    $icon = [Drawing.Bitmap]::new(180, 180); $g = [Drawing.Graphics]::FromImage($icon)
    $g.Clear($ink.Color); $g.SmoothingMode = 'AntiAlias'; Draw-Mark $g 0 0 (180 / 64)
    $icon.Save((Join-Path $brand 'apple-touch-icon.png'), [Drawing.Imaging.ImageFormat]::Png); $g.Dispose(); $icon.Dispose()
    $card = [Drawing.Bitmap]::new(1200, 630); $g = [Drawing.Graphics]::FromImage($card)
    $g.SmoothingMode = 'AntiAlias'; $g.TextRenderingHint = 'AntiAliasGridFit'; $g.Clear($ink.Color)
    Draw-Mark $g 46 36 2
    $label = [Drawing.Font]::new('Consolas', 23, [Drawing.GraphicsUnit]::Pixel)
    $title = [Drawing.Font]::new('Georgia', 116, [Drawing.GraphicsUnit]::Pixel)
    $sub = [Drawing.Font]::new('Georgia', 38, [Drawing.FontStyle]::Italic, [Drawing.GraphicsUnit]::Pixel)
    $g.DrawString('INDEPENDENT FIELD JOURNAL', $label, $green, 70, 204)
    $g.DrawString('KnowOcean', $title, $paper, 58, 250)
    $g.DrawString('Reading the ocean.', $sub, $paper, 70, 410)
    $g.FillRectangle($green, 70, 540, 1060, 3)
    $g.DrawString('APPLIED MARINE SCIENCE', $label, $paper, 70, 561)
    $card.Save((Join-Path $brand 'social.png'), [Drawing.Imaging.ImageFormat]::Png)
    $label.Dispose(); $title.Dispose(); $sub.Dispose(); $g.Dispose(); $card.Dispose()

    # Edit the typography and title here for a new cover. Compose in a
    # 1000-unit square and render at 3x; keep text inside the 8% margin.
    $cover = [Drawing.Bitmap]::new(3000, 3000, [Drawing.Imaging.PixelFormat]::Format24bppRgb)
    $g = [Drawing.Graphics]::FromImage($cover)
    $nameFont = [Drawing.Font]::new('Georgia', 142, [Drawing.GraphicsUnit]::Pixel)
    $typeFont = [Drawing.Font]::new('Consolas', 72, [Drawing.GraphicsUnit]::Pixel)
    try {
        $g.SmoothingMode = 'AntiAlias'; $g.TextRenderingHint = 'AntiAliasGridFit'
        $g.Clear($ink.Color); $g.ScaleTransform(3, 3)
        Draw-Mark $g 270 24 7
        $g.DrawString('KnowOcean', $nameFont, $paper, 72, 507)
        $g.FillRectangle($green, 80, 716, 840, 4)
        $g.DrawString('PODCAST', $typeFont, $green, 74, 755)
        $cover.Save((Join-Path $brand 'podcast-artwork-template.png'), [Drawing.Imaging.ImageFormat]::Png)
    }
    finally { $nameFont.Dispose(); $typeFont.Dispose(); $g.Dispose(); $cover.Dispose() }
}
finally {
    if ($photo) { $photo.Dispose() }; Remove-Item -LiteralPath $src
    $ink.Dispose(); $green.Dispose(); $paper.Dispose()
}