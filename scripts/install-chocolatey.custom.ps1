#iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
(new-object net.webclient).DownloadFile('https://chocolatey.org/install.ps1', 'C:\Windows\Temp\install-choco.ps1')

$env:chocolateyUseWindowsCompression = 'false'
for($try = 0; $try -lt 5; $try++)
{
  & C:/Windows/Temp/install-choco.ps1
  if ($?) { exit 0 }
  if (Test-Path C:\ProgramData\chocolatey) { exit 0 }
  Write-Host "Failed to install chocolatey (Try #${try})"
  Start-Sleep 2
}
Write-Error "Chocolatey failed to install, please re-build your machine again"
exit 2
