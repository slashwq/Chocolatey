$ErrorActionPreference = 'Stop'

$packageName= 'playnite'
$url        = 'https://github.com/JosefNemec/Playnite/releases/download/4.30/Playnite430.exe'
$url64      = 'https://github.com/JosefNemec/Playnite/releases/download/4.30/Playnite430.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64

  softwareName  = 'playnite*'

  checksum      = 'EC123F7A2BB7D0EC2B0F176A1BB7F855137BB4423CD78560E9C0C07C2EB5692C'
  checksumType  = 'sha256'
  checksum64    = 'EC123F7A2BB7D0EC2B0F176A1BB7F855137BB4423CD78560E9C0C07C2EB5692C'
  checksumType64= 'sha256'

  silentArgs   = '/SP- /VERYSILENT /NORESTART'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
