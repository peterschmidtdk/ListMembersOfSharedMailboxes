#
$Mailboxes = Get-Mailbox -RecipientTypeDetails SharedMailbox -ResultSize:Unlimited | Select Identity,Alias,DisplayName | sort displayname

#List and exports the permissions to a CSV file
$mailboxes | sort displayname | foreach {Get-MailboxPermission -Identity $_.alias | ft identity,user,accessrights} | Export-Csv .\SharedMailboxPermissions.csv
