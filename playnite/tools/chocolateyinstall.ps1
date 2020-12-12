$ErrorActionPreference = 'Stop'

$packageName= 'playnite'
$url        = 'http://playnite.link/update/stable/8.10/Playnite810.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url

  softwareName  = 'playnite*'

  checksum      = 'CD515F8D7AFEE1AE683B98488C49486097B565B74CA34F1B0A01B8537AB94E89'
  checksumType  = 'sha256'

  silentArgs   = '/SP- /VERYSILENT /NORESTART'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
