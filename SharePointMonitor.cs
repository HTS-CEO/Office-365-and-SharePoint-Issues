using System;
using Microsoft.Azure.WebJobs;
using Microsoft.Extensions.Logging;
using Microsoft.Graph;
using Microsoft.Graph.Auth;
using Microsoft.Identity.Client;

public static class SharePointMonitor
{
    [FunctionName("SharePointMonitor")]
    public static async Task Run([TimerTrigger("0 0 18 * * *")]TimerInfo myTimer, ILogger log)
    {
        IConfidentialClientApplication confidentialClient = ConfidentialClientApplicationBuilder
            .Create("client_id")
            .WithTenantId("tenant_id")
            .WithClientSecret("client_secret")
            .Build();
        ClientCredentialProvider authProvider = new ClientCredentialProvider(confidentialClient);
        GraphServiceClient graphClient = new GraphServiceClient(authProvider);
        var site = await graphClient.Sites["root"].Request().GetAsync();
        log.LogInformation($"Current site: {site.WebUrl}");
    }
}