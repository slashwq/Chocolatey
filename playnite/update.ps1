### Check version of PowerShell - only tested on PowerShell 7
#Requires -Version 7

$ProgressPreference = 'SilentlyContinue'

$local = @{
  chocoinstallpath = ".\tools\chocolateyinstall.ps1"
  chocoinstall     = Get-Content .\tools\chocolateyinstall.ps1
  url              = Get-Content .\tools\chocolateyinstall.ps1 | Select-String -Pattern 'http' | Select-Object -ExpandProperty Line
  checksum         = Get-Content .\tools\chocolateyinstall.ps1 | Select-String -Pattern 'checksum      ' | Select-Object -ExpandProperty Line
  nuspecpath       = ".\playnite.nuspec"
  nuspec           = Get-Content .\playnite.nuspec
  version          = Get-Content .\playnite.nuspec | Select-String -Pattern '(?<=\<version\>).*?(?=\<\/version\>)' -AllMatches | ForEach {$_.matches.value}
  releaseNotes     = Get-Content .\playnite.nuspec | Select-String -Pattern '(?<=\<releaseNotes\>).*?(?=\<\/releaseNotes\>)' -AllMatches | ForEach {$_.matches.value}
}

$remote = @{
  info             = Invoke-WebRequest 'https://playnite.link/update/stable/info.json' | ConvertFrom-Json
}

Write-Host "Checking nuspec version ..." $local.version
Write-Host "Checking latest version ..." $remote.info.latestVersion

If ($local.version -eq $remote.info.latestVersion) {
  Write-Host "No update needed."
  }

If ($local.version -lt $remote.info.latestVersion) {
  Write-Host "New update available."

  ### Stage variables for the download URL
  $dl = $remote.info.downloadServers | Select-Object -First 1
  $rn = $remote.info.releaseNotesUrlRoots | Select-Object -First 1
  $sv = $remote.info.latestVersion -replace '[.]'
  $fulldl = $dl + $remote.info.latestVersion + '/' + 'Playnite' + $sv + '.exe'
  $fullrn = $rn + $remote.info.latestVersion + '.html'

  ### Download to temp directory
  Write-Host 'Downloading Playnite' $remote.info.latestVersion '...'
  Invoke-WebRequest $fulldl -OutFile $env:TEMP\playnite.exe

  ### Grab the SHA256 of the download for Chocolatey
  $newchecksum = Get-FileHash -Algorithm SHA256 -Path $env:TEMP\playnite.exe | foreach { $_.Hash }
  Write-Host ''
  Write-Host 'Playnite' $remote.info.latestVersion 'downloaded to' $env:TEMP'\playnite.exe'
  Write-Host 'SHA256 is' $newchecksum
  Write-Host ''
  Write-Host 'Sleeping 10 seconds before editing Chocolatey files ...'
  Write-Host ''

  Start-Sleep -Seconds 10

  ### Delete the temp file - we no longer need it
  Remove-Item -Path $env:TEMP\playnite.exe

  ### Stage variables for updating the Chocolatey files.
  $newurl = "`$url        = '$fulldl'"
  $newchecksumline = "  checksum      = '$newchecksum'"
  
  ### Update the Chocolatey install PS1 and the nuspec file
  $local.chocoinstall | foreach { $_.replace($local.url,$newurl) } | Set-Content -Path $local.chocoinstallpath -Encoding UTF8
  Write-Host 'Updated' $local.chocoinstallpath 'URL value'
  Start-Sleep -Milliseconds 500
  # Bug fix because for some reason it's not reading the file again as expected.
  $local.chocoinstall = Get-Content .\tools\chocolateyinstall.ps1
  $local.chocoinstall | foreach { $_.replace($local.checksum,$newchecksumline) } | Set-Content -Path $local.chocoinstallpath
  Write-Host 'Updated' $local.chocoinstallpath 'checksum value'
  Start-Sleep -Milliseconds 500
  $local.nuspec | foreach { $_.replace($local.version,$remote.info.latestVersion) } | Set-Content -Path $local.nuspecpath
  Write-Host 'Updated' $local.nuspecpath 'version value'
  Start-Sleep -Milliseconds 500
  # Bug fix because for some reason it's not reading the file again as expected.
  $local.nuspec = Get-Content .\playnite.nuspec
  $local.nuspec | foreach { $_.replace($local.releaseNotes,$fullrn) } | Set-Content -Path $local.nuspecpath
  Write-Host 'Updated' $local.nuspecpath 'releaseNotes value'

  ### Compile the new Chocolatey package.
  choco pack $local.nuspecpath

  ### Upload the new Chocolatey package.
  $nupkg = 'playnite.' + $remote.info.latestVersion + '.nupkg'
  choco push $nupkg
  }