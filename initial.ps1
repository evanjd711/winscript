Set-ExecutionPolicy Restricted
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -uri https://github.com/evanjd711/winscript/archive/refs/heads/main.zip -OutFile $env:USERPROFILE\Downloads\win.zip
cd $env:USERPROFILE\Downloads
Write-Out "temp"
Add-Type -assembly "system.io.compression.filesystem"
[io.compression.zipfile]::ExtractToDirectory("$env:USERPROFILE\Downloads\win.zip", "$env:USERPROFILE\Downloads")
Set-ExecutionPolicy RemoteSigned -Scope Process
Unblock-File .\winscript-main\main.ps1
.\winscript-main\main.ps1