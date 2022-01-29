$ErrorActionPreference = 'Stop'

$packageName= 'playnite'
$url        = 'https://playnite.link/update/stable/9.15/Playnite915.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url
  softwareName  = 'playnite*'
  checksum      = 'EB02C8B279A1EA0D8BE611B6F5D2344E33B6DFCA39E487A529ECBBB4C0EA752F'
  checksumType  = 'sha256'
  silentArgs   = '/SP- /VERYSILENT /NORESTART'
  validExitCodes= @(0)
  softwareExe   = 'Playnite*'
}

# Stop-Process called before the install to make sure install goes through successfully.
Write-Output "Killing the $($packageArgs['softwareExe']) process..."
Get-Process -ProcessName $packageArgs['softwareExe'] -ErrorAction SilentlyContinue | Stop-Process
Install-ChocolateyPackage @packageArgs
