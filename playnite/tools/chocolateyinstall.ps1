$ErrorActionPreference = 'Stop'

$packageName= 'playnite'
$url        = 'http://playnite.link/update/stable/7.6/Playnite76.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url

  softwareName  = 'playnite*'

  checksum      = '4F9C1D2EB10D1553B1A5259D4E3152813C2501AAAA8AEE61C10754E814E010E5'
  checksumType  = 'sha256'

  silentArgs   = '/SP- /VERYSILENT /NORESTART'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
