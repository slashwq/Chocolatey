$ErrorActionPreference = 'Stop'

$packageName= 'encrypto'
$url        = 'https://dl.devmate.com/com.macpaw.win.Encrypto/EncryptoforWin.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url

  softwareName  = 'encrypto*'

  checksum      = '841C55824F88B7FD6D1474ADB8E4F7AA854677DFAF1CE4542768DD99EB73AB59'
  checksumType  = 'sha256'

  silentArgs   = '/SP- /VERYSILENT /NORESTART'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
