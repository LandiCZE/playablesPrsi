# Packages the game as a YouTube Playables bundle: dist/prsi-playable.zip with index.html at the root.
$ErrorActionPreference = "Stop"
$dist = Join-Path $PSScriptRoot "dist"
New-Item -ItemType Directory -Force $dist | Out-Null
$zip = Join-Path $dist "prsi-playable.zip"
if (Test-Path $zip) { Remove-Item $zip }
Compress-Archive -Path (Join-Path $PSScriptRoot "index.html") -DestinationPath $zip
"Built $zip ($([math]::Round((Get-Item $zip).Length / 1KB, 1)) KiB)"
