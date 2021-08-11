choco install -y Microsoft-Windows-Subsystem-Linux --source="'windowsfeatures'"

if (!(Get-Command "ubuntu2004.exe" -ErrorAction SilentlyContinue)) {
  choco install wsl-ubuntu-2004 --params "/InstallRoot:true"

  RefreshEnv
  Ubuntu2004 run apt update
  Ubuntu2004 run apt upgrade -y
}
