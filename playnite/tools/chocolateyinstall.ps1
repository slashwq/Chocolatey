$ErrorActionPreference = 'Stop'

$packageName= 'playnite'
$url        = 'https://playnite.link/update/stable/7.4/Playnite74.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url

  softwareName  = 'playnite*'

  checksum      = '37EFFDC71213329FCE6D0FEEE2CCF6A9D80F7B9731C02E0F704BD9189A09BDF5'
  checksumType  = 'sha256'

  silentArgs   = '/SP- /VERYSILENT /NORESTART'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
