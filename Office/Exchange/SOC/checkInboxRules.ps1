##############################################################
#                                                            #
#   Script Name   : checkInboxRules                          #
#   Description   : Quick Inbox Rule and Fowarding check     #
#   Author        : Michael A. Valentín                      #
#   Email         : mvalentin@valensys.net                   #
#   Last Modified : 03/27/25                                 #
#   Version       : 1.0                                      #
#                                                            #
##############################################################
Connect-ExchangeOnline
$mailbox= Read-Host "Which Mailbox would you like to scan?"
Get-InboxRule -Mailbox $mailbox | Select-Object @{Name="Mailbox";Expression={$mailbox}}, Name, Description  | Export-Csv -Path "./${mailbox}-MailboxRules.csv" -NoTypeInformation -Append 
Get-Mailbox $mailbox | Select-Object UserPrincipalName,ForwardingSmtpAddress,DeliverToMailboxAndForward | Export-Csv -Path "./${mailbox}-Forward.csv" -NoTypeInformation -Append 