# Description: Boxstarter Script
# The Specshell setup

Disable-UAC
Disable-MicrosoftUpdate

# Get the base URI path from the ScriptToCall value
$bstrappackage = "-bootstrapPackage"
$helperUri = $Boxstarter['ScriptToCall']
$strpos = $helperUri.IndexOf($bstrappackage)
$helperUri = $helperUri.Substring($strpos + $bstrappackage.Length)
$helperUri = $helperUri.TrimStart("'", " ")
$helperUri = $helperUri.TrimEnd("'", " ")
$helperUri = $helperUri.Substring(0, $helperUri.LastIndexOf("/"))
$helperUri += "/scripts"
Write-Host "helper script base URI is $helperUri"

function ExecuteScript {
  Param ([string]$script)
  Write-Host "executing $helperUri/$script ..."
  Invoke-Expression ((new-object net.webclient).DownloadString("$helperUri/$script"))
}

ExecuteScript "SystemConfiguration.ps1"
ExecuteScript "RemoveDefaultApps.ps1"
ExecuteScript "Devtools.ps1"
ExecuteScript "WSL.ps1"

Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula
