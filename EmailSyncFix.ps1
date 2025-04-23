$UserCredential = Get-Credential
Connect-ExchangeOnline -Credential $UserCredential
Start-ADSyncSyncCycle -PolicyType Delta
Start-Sleep -Seconds 60
Set-Mailbox "user@domain.com" -EmailAddresses @{Add="SMTP:newprimary@domain.com"} -PrimarySmtpAddress "newprimary@domain.com"
Get-Mailbox "user@domain.com" | Select-Object PrimarySmtpAddress,EmailAddresses
Disconnect-ExchangeOnline -Confirm:$false