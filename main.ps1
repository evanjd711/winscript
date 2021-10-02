Set-ExecutionPolicy RemoteSigned -Scope Process
Unblock-File -Path $env:USERPROFILE\Downloads\winscript-main\setup.ps1 
.\setup.ps1
Unblock-File -Path $env:USERPROFILE\Downloads\winscript-main\users.ps1