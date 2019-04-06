$ErrorActionPreference = 'Stop'

$packageName= 'playnite'
$url        = 'https://github.com/JosefNemec/Playnite/releases/download/4.74/Playnite474.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url

  softwareName  = 'playnite*'

  checksum      = '2E0CC42039322D733B3A55143F2819B2DAA97151ECDE6A49D79164A78F00F03F'
  checksumType  = 'sha256'

  silentArgs   = '/SP- /VERYSILENT /NORESTART'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
