[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -uri https://github.com/PowerShell/PowerShell/releases/download/v7.1.4/PowerShell-7.1.4-win-x86.msi -OutFile .\Downloads\ps.msi
cd Downloads
msiexec.exe /Package ps.msi /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ENABLE_PSREMOTING=0 REGISTER_MANIFEST=1
& 'C:\Program Files (x86)\Powershell\7\pwsh.exe'
$osInfo = Get-CimInstance -ClassName Win32_OperatingSystem
if($osInfo.ProductType -eq 2) {
    import-module ActiveDirectory
    $pass = ConvertTo-SecureString (Read-Host -prompt "Enter the password you will use") -Force
    Get-ADUser -Filter * | Set-ADAccountPassword -NewPassword $pass -Reset
} elseif ($osInfo.ProductType -eq 1 -or $osInfo.ProductType -eq 3) {
    $pass = ConvertTo-SecureString (Read-Host -prompt "Enter the password you will use") -Force
    Get-LocalUser | Set-LocalUser -Password $pass -UserMayChangePassword $false 
    Get-LocalUser | Disable-LocalUser
}