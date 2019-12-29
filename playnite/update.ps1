Import-Module au

$releases = 'https://github.com/JosefNemec/Playnite/releases'

function global:au_SearchReplace {
  @{
    "tools\chocolateyinstall.ps1" = @{
      "(^[$]url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
      "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
    }
  }
}
function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }
function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re       = '/releases/download/*'
  $url      = $download_page.links | ? href -match $re | select -First 2 -expand href
  $url32    = 'https://github.com' + $url[0]
  $version  = ($url[0] -split '\/' | select -Index 5).Substring(0)

  return @{ URL32 = $url32; Version = $version }
}

update -ChecksumFor none
