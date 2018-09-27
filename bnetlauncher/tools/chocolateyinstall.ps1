$packageName = 'bnetlauncher'
$url = 'https://madalien.com/pub/bnetlauncher/bnetlauncher_v121.zip'
$checksum = 'F947FDE2D04E2AFF152B3343EC3A05078A1A12A53CECE5E50DCECD232216F7D6'
$checksumType = 'sha256'
$binRoot = Get-BinRoot
$installPath = Join-Path $binRoot $packageName

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -UnzipLocation $installPath `
                             -Checksum $checksum `
                             -ChecksumType $checksumType
