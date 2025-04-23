$AdminCredential = Get-Credential
Connect-SPOService -Url https://yourtenant-admin.sharepoint.com -Credential $AdminCredential
Set-SPOTenant -Identity "yourtenant.sharepoint.com" -NewDomainName "newdomain.sharepoint.com"
Get-SPOTenant | Select-Object RootSiteUrl
Disconnect-SPOService