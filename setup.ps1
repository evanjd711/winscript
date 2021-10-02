Write-Host "Installing PowerShell 7"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -uri https://github.com/PowerShell/PowerShell/releases/download/v7.1.4/PowerShell-7.1.4-win-x86.msi -OutFile $env:USERPROFILE\Downloads\ps.msi
cd $env:USERPROFILE\Downloads
try {
    msiexec.exe /Package ps.msi /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ENABLE_PSREMOTING=0 REGISTER_MANIFEST=1
} catch {
    Write-Host "Powershell installation failed"
}
try {
    & 'C:\Program Files (x86)\Powershell\7\pwsh.exe'
} catch {
    Write-Host "Powershell launch failed"
}