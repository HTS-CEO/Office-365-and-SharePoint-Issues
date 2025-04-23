Install-Module -Name PnP.PowerShell -Force -AllowClobber
$SiteUrl = "https://yourtenant.sharepoint.com"
Connect-PnPOnline -Url $SiteUrl -Interactive
Set-PnPTenant -Identity "yourtenant.sharepoint.com" -NewDomainName "newdomain.sharepoint.com"
Get-PnPTenant | Select-Object RootSiteUrl
Disconnect-PnPOnline