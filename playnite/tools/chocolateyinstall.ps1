$ErrorActionPreference = 'Stop'

$packageName= 'playnite'
$url        = 'http://playnite.link/update/stable/8.1/Playnite81.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url

  softwareName  = 'playnite*'

  checksum      = '6D56A4193183B76A5EDAE2567671E9D1D4CC47B47A085C32757637E301C8D9CE'
  checksumType  = 'sha256'

  silentArgs   = '/SP- /VERYSILENT /NORESTART'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
