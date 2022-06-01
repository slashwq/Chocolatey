$ErrorActionPreference = 'Stop'

$packageName= 'playnite'
$url        = 'https://github.com/JosefNemec/Playnite/releases/download/9.18/Playnite918.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url
  softwareName  = 'playnite*'
  checksum      = '80d9fbdd2f44703fa2ebea4e48ac90f91a0351293dd1fc036bc638e35c0d4d89'
  checksumType  = 'sha256'
  silentArgs   = '/SP- /VERYSILENT /NORESTART'
  validExitCodes= @(0)
  softwareExe   = 'Playnite*'
}

# Stop-Process called before the install to make sure install goes through successfully.
Write-Output "Killing the $($packageArgs['softwareExe']) process..."
Get-Process -ProcessName $packageArgs['softwareExe'] -ErrorAction SilentlyContinue | Stop-Process
Install-ChocolateyPackage @packageArgs
Write-Output "Sleeping and preparing to kill elevated $($packageArgs['softwareExe']) process..."
Start-Sleep -Seconds 5
Get-Process -ProcessName $packageArgs['softwareExe'] -ErrorAction SilentlyContinue | Stop-Process