[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12Se
Invoke-WebRequest -uri https://github.com/evanjd711/winscript/archive/refs/heads/main.zip -OutFile $env:USERPROFILE\Downloads\win.zip
cd $env:USERPROFILE\Downloads
Expand-Archive win.zip
copy .\win\winscript-main .\ -r
Set-ExecutionPolicy RemoteSigned -Scope Process
Unblock-File .\winscript-main\main.ps1
.\winscript-main\main.ps1