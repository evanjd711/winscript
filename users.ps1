$osInfo = Get-CimInstance -ClassName Win32_OperatingSystem
if($osInfo.ProductType -eq 2) {
    import-module ActiveDirectory
    $pass = ConvertTo-SecureString (Read-Host -prompt "Enter the password you will use") -AsPlainText -Force
    Get-ADUser -Filter * | Set-ADAccountPassword -NewPassword $pass -Reset
    Get-ADUser -Filter * | Set-ADUser -AllowReversiblePasswordEncryption $false -CannotChangePassword $false -ChangePasswordAtLogon $false -PasswordNotRequired $false
} elseif ($osInfo.ProductType -eq 1 -or $osInfo.ProductType -eq 3) {
    $pass = ConvertTo-SecureString (Read-Host -prompt "Enter the password you will use") -Force
    Get-LocalUser | Set-LocalUser -Password $pass -UserMayChangePassword $false 
    Get-LocalUser | Disable-LocalUser
}