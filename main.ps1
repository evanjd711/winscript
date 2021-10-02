Set-ExecutionPolicy RemoteSigned -Scope Process
Unblock-File -Path $env:USERPROFILE\Downloads\setup.ps1 
.\setup.ps1
Unblock-File -Path $env:USERPROFILE\Downloads\users.ps1