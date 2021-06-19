$ErrorActionPreference = 'Stop'

$packageName= 'playnite'
$url        = 'https://playnite.link/update/stable/8.13/Playnite813.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url

  softwareName  = 'playnite*'

  checksum      = '1507C2377118302346DAD3767FBFFD6BB5CAE44ED2F91EADD158D6533AFD5661'
  checksumType  = 'sha256'

  silentArgs   = '/SP- /VERYSILENT /NORESTART'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
