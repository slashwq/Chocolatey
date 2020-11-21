$ErrorActionPreference = 'Stop'

$packageName= 'playnite'
$url        = 'http://playnite.link/update/stable/8.7/Playnite87.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url

  softwareName  = 'playnite*'

  checksum      = '5CDB5F4F4DB19024F196E42E00376DE67835F8EEF699E977F0B9AA1898C5E5E8'
  checksumType  = 'sha256'

  silentArgs   = '/SP- /VERYSILENT /NORESTART'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
