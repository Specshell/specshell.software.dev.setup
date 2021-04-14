# How to install the setup :wrench

With help of **ClickOnce** we can install and run Windows application by clicking a link in a web page. That makes the process easier for us because we do not need to set configurations for the installer. **ClickOnce** requests are handled by the native file handler in Windows.

## ClickOnce Microsoft Edge

<pre><b><a href="https://boxstarter.org/package/url?https://raw.githubusercontent.com/Specshell/specshell.software.dev.setup/windows.ps1" rel="nofollow"">Click here to start install</a> </b></pre>

 :one: **Allow open the file** <br>
 ![first step](https://user-images.githubusercontent.com/58290791/113137405-c8300400-9224-11eb-8ba3-e7516158cfd4.PNG)

 :two: **Run the application** <br>
 ![Do you want to run](https://user-images.githubusercontent.com/58290791/113137411-cb2af480-9224-11eb-9194-5c113fb7e299.PNG)

## ClickOnce Chromium Edge

```powershell
$path = "HKLM:\SOFTWARE\Policies\Microsoft\Edge"
New-Item $path -Force | Out-Null
Set-ItemProperty -LiteralPath "$PATH" ClickOnceEnabled 1
```

## Windows Powershell

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force `
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072 `
iex ((New-Object System.Net.WebClient).DownloadString('https://boxstarter.org/bootstrapper.ps1')) `
Get-Boxstarter -Force `
Install-BoxstarterPackage -PackageName https://boxstarter.org/package/url?https://raw.githubusercontent.com/Specshell/specshell.software.dev.setup/windows.ps1
```
