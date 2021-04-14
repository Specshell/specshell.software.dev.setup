choco install -y Microsoft-Windows-Subsystem-Linux --source="'windowsfeatures'"

#--- Ubuntu ---
# TODO: Move this to choco install once --root is included in that package
$item = "wslubuntu2004"
$file = "$env:TEMP\$item.appx"
Write-Host "Downloading $item"
curl.exe -sL https://aka.ms/$item -o $file
Add-AppxPackage $file
Remove-Item $file
# run the distro once and have it install locally with root user, unset password

RefreshEnv
Ubuntu2004 install --root
Ubuntu2004 run apt update
Ubuntu2004 run apt upgrade -y

