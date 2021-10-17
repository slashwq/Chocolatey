$ErrorActionPreference = 'Stop'

$packageName= 'playnite'
$url        = 'https://playnite.link/update/stable/9.3/Playnite94.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url
  softwareName  = 'playnite*'
  checksum      = 'D080A74CED32E8B0A7823B9A12845EC7B15F6E6024CECFAA88EDDCCF096D71FA'
  checksumType  = 'sha256'
  silentArgs   = '/SP- /VERYSILENT /NORESTART'
  validExitCodes= @(0)
  softwareExe   = 'Playnite*'
}

# Stop-Process called before the install to make sure install goes through successfully.
Write-Output "Killing the $($packageArgs['softwareExe']) process..."
Get-Process -ProcessName $packageArgs['softwareExe'] -ErrorAction SilentlyContinue | Stop-Process
Install-ChocolateyPackage @packageArgs