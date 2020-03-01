$ErrorActionPreference = 'Stop'

$packageName= 'playnite'
$url        = 'https://playnite.link/update/stable/7.2/Playnite72.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url

  softwareName  = 'playnite*'

  checksum      = 'A0448D9E71C35F543861B8984812B2675D16A974FB19825DF55886EF3966318C'
  checksumType  = 'sha256'

  silentArgs   = '/SP- /VERYSILENT /NORESTART'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
