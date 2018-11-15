$ErrorActionPreference = 'Stop'

$packageName= 'playnite'
$url        = 'https://github.com/JosefNemec/Playnite/releases/download/4.60/Playnite460.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url

  softwareName  = 'playnite*'

  checksum      = '4CB6B568211CE6C66118C4F17D6610B7DBB317F2EF312E8C8A71C7210AA7A3D4'
  checksumType  = 'sha256'

  silentArgs   = '/SP- /VERYSILENT /NORESTART'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
