$ErrorActionPreference = 'Stop'

$packageName= 'playnite'
$url        = 'https://github.com/JosefNemec/Playnite/releases/download/9.12/Playnite912.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url
  softwareName  = 'playnite*'
  checksum      = '503CA0693DE6AFF04DD921AC640503D8F0E8D5E17262FC78B29C4CDB4EEB4E4C'
  checksumType  = 'sha256'
  silentArgs   = '/SP- /VERYSILENT /NORESTART'
  validExitCodes= @(0)
  softwareExe   = 'Playnite*'
}

# Stop-Process called before the install to make sure install goes through successfully.
Write-Output "Killing the $($packageArgs['softwareExe']) process..."
Get-Process -ProcessName $packageArgs['softwareExe'] -ErrorAction SilentlyContinue | Stop-Process
Install-ChocolateyPackage @packageArgs