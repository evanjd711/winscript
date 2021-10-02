$osInfo = Get-CimInstance -ClassName Win32_OperatingSystem
if($osInfo.ProductType -eq 2) {
    Write-Host "Configuring AD Users"
    import-module ActiveDirectory
    $pass = Get-Credential
    Get-ADUser -Filter * | Set-ADAccountPassword -NewPassword $pass.Password -Reset
    Get-ADUser -Filter * | Set-ADUser -AllowReversiblePasswordEncryption $false -CannotChangePassword $true -ChangePasswordAtLogon $false -PasswordNotRequired $false
    $adminz = @(Get-ADGroupMember "Domain Admins" | Select-Object -ExpandProperty name)
    Foreach($a in $adminz) {
        if($a -ne "Administrator") {
            Remove-ADGroupMember -Identity "Domain Admins" -Members $a
        } 
    }
} elseif ($osInfo.ProductType -eq 1 -or $osInfo.ProductType -eq 3) {
    Write-Host "Configuring Local Users"
    $pass = ConvertTo-SecureString (Read-Host -prompt "Enter the password you will use") -Force
    Get-LocalUser | Set-LocalUser -Password $pass -UserMayChangePassword $false 
    Get-LocalUser | Disable-LocalUser
}