$ErrorActionPreference = 'Stop'

$packageName= 'playnite'
$url        = 'https://github.com/JosefNemec/Playnite/releases/download/4.21/PlayniteInstaller.exe'
$url64      = 'https://github.com/JosefNemec/Playnite/releases/download/4.21/PlayniteInstaller.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64

  softwareName  = 'playnite*'

  checksum      = 'D86CAED820E1865660711FE72F3F1542F156760A12B6E6B77CEC2583C32FFF23'
  checksumType  = 'sha256'
  checksum64    = 'D86CAED820E1865660711FE72F3F1542F156760A12B6E6B77CEC2583C32FFF23'
  checksumType64= 'sha256'

  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
