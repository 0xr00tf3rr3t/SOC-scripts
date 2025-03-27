$users = Import-Csv -Path "$PSScriptRoot\users.csv"
Connect-MsolService
# Loop through each user in the CSV and set the password
foreach ($user in $users) {
    Write-Host("Change password for next login for user $user.UserPrincipalName")
    Set-MsolUserPassword -UserPrincipalName $user.UserPrincipalName -ForceChangePassword $true -ForceChangePasswordOnly $true
}