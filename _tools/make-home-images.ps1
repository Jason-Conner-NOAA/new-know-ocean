# Hero credit: Claire Fackler, CINMS, NOAA. Public domain (US government work).
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing
$images = Join-Path (Split-Path $PSScriptRoot) 'assets/images'
$src = [IO.Path]::GetTempFileName()
try {
    Invoke-WebRequest -UseBasicParsing 'https://live.staticflickr.com/4089/5030208218_019fe7c27e_o.jpg' -OutFile $src
    $photo = [Drawing.Image]::FromFile($src)
    if ($photo.Width -ne 3072 -or $photo.Height -ne 2304) { throw 'Unexpected NOAA original dimensions.' }
    $codec = [Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object MimeType -eq 'image/jpeg'
    $quality = [Drawing.Imaging.EncoderParameters]::new(1)
    $quality.Param[0] = [Drawing.Imaging.EncoderParameter]::new([Drawing.Imaging.Encoder]::Quality, [long]81)
    foreach ($width in 720, 1440) {
        $height = [int]($width * $photo.Height / $photo.Width)
        $bmp = [Drawing.Bitmap]::new($width, $height); $g = [Drawing.Graphics]::FromImage($bmp)
        try {
            $g.InterpolationMode = 'HighQualityBicubic'; $g.DrawImage($photo, 0, 0, $width, $height)
            $name = if ($width -eq 720) { 'san-miguel-small.jpg' } else { 'san-miguel.jpg' }
            $bmp.Save((Join-Path $images $name), $codec, $quality)
        }
        finally { $g.Dispose(); $bmp.Dispose() }
    }
}
finally {
    if ($quality) { $quality.Dispose() }; if ($photo) { $photo.Dispose() }; Remove-Item -LiteralPath $src
}
& (Join-Path $PSScriptRoot 'make-brand-images.ps1')