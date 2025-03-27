#####################################################################
#                                                                   #
#   Script Name   : ChangePassword                                  #
#   Description   : Quickly forces users to change their passwords  #
#   Author        : Michael A. Valentín                             #
#   Email         : mvalentin@valensys.net                          #
#   Last Modified : 03/27/25                                        #
#   Version       : 1.0                                             #
#                                                                   #
#####################################################################

$users = Import-Csv -Path "$PSScriptRoot\users.csv"
Connect-MsolService
# Loop through each user in the CSV and set the password
if ($users)
{
foreach ($user in $users) {
    Write-Host("Changing password for next login for user $user.UserPrincipalName")
    Set-MsolUserPassword -UserPrincipalName $user.UserPrincipalName -ForceChangePassword $true -ForceChangePasswordOnly $true
}
}
else {
    $mailbox=Read-Host -Prompt "Please provide the user to be forced to change login"
    Set-MsolUserPassword -UserPrincipalName $mailbox -ForceChangePassword $true -ForceChangePasswordOnly $true
    
}