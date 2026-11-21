# Run with Windows PowerShell. Uses only local, publisher-supplied artwork.
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing
$brand = Join-Path (Split-Path $PSScriptRoot) 'assets/images/brand'
$logo = [Drawing.Image]::FromFile((Join-Path $brand 'logo.png'))
$ink = [Drawing.SolidBrush]::new([Drawing.ColorTranslator]::FromHtml('#082832'))
$teal = [Drawing.SolidBrush]::new([Drawing.ColorTranslator]::FromHtml('#166575'))
function Write-Canvas($name, $width, $height, $paint) {
    $canvas = [Drawing.Bitmap]::new($width, $height, [Drawing.Imaging.PixelFormat]::Format24bppRgb)
    $g = [Drawing.Graphics]::FromImage($canvas)
    try {
        $g.Clear([Drawing.Color]::White)
        $g.InterpolationMode = 'HighQualityBicubic'; $g.PixelOffsetMode = 'HighQuality'
        $g.TextRenderingHint = 'AntiAliasGridFit'
        & $paint $g
        $canvas.Save((Join-Path $brand $name), [Drawing.Imaging.ImageFormat]::Png)
    } finally { $g.Dispose(); $canvas.Dispose() }
}
function Draw-Label($g, $text, $family, $size, $brush, $x, $y, $width, $height) {
    $font = [Drawing.Font]::new($family, $size, [Drawing.GraphicsUnit]::Pixel)
    $format = [Drawing.StringFormat]::new(); $format.Alignment = 'Center'; $format.LineAlignment = 'Center'
    try { $g.DrawString($text, $font, $brush, [Drawing.RectangleF]::new($x,$y,$width,$height), $format) }
    finally { $format.Dispose(); $font.Dispose() }
}
try {
    Copy-Item (Join-Path $brand 'logo_180.png') (Join-Path $brand 'apple-touch-icon.png') -Force
    Write-Canvas 'logo_192.png' 192 192 { param($g) $g.DrawImage($logo, 0, 0, 192, 192) }
    # Even the corners of this artwork rectangle fit within the 40%-radius safe circle.
    Write-Canvas 'maskable-512.png' 512 512 { param($g) $g.DrawImage($logo, 112, 112, 288, 288) }
    Write-Canvas 'social.png' 1200 630 { param($g)
        $g.DrawImage($logo, 38, 90, 450, 450)
        Draw-Label $g 'KnowOcean' 'Georgia' 104 $ink 476 190 680 146
        Draw-Label $g 'A FIELD JOURNAL OF APPLIED MARINE SCIENCE' 'Consolas' 23 $teal 476 338 680 58
        $g.FillRectangle($teal, 0, 606, 1200, 24)
    }
    Write-Canvas 'podcast-artwork-template.png' 3000 3000 { param($g)
        $g.DrawImage($logo, 570, 30, 1860, 1860)
        Draw-Label $g 'KnowOcean' 'Georgia' 415 $ink 120 1750 2760 590
        Draw-Label $g 'PODCAST' 'Consolas' 168 $teal 120 2380 2760 230
        $g.FillRectangle($teal, 0, 2875, 3000, 125)
    }
} finally { $logo.Dispose(); $ink.Dispose(); $teal.Dispose() }