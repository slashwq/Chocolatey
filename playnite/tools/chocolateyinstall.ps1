$ErrorActionPreference = 'Stop'

$packageName= 'playnite'
$url        = 'http://playnite.link/update/stable/8.5/Playnite85.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url

  softwareName  = 'playnite*'

  checksum      = 'BFD74C4F44D91C967745C9D3E546AD992A6D0A683EB026A2B6D68802BD4756A5'
  checksumType  = 'sha256'

  silentArgs   = '/SP- /VERYSILENT /NORESTART'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
