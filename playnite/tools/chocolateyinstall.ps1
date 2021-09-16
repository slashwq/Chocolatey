$ErrorActionPreference = 'Stop'

$packageName= 'playnite'
$url        = 'https://playnite.link/update/stable/8.15/Playnite815.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url

  softwareName  = 'playnite*'

  checksum      = '107D0461D38E44C0915738BE1F2ADEDE0E6132B98A422D0EC173C765E64EE37D'
  checksumType  = 'sha256'

  silentArgs   = '/SP- /VERYSILENT /NORESTART'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
