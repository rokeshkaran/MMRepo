using MjAutomationCore.Utils;

namespace MjAutomationCore.Providers.AzureProviders
{
    class AzureServicePrincipalCredentials
    {
        public static string ClientId => ConfigReader.ByKey("ClientId");
        public static string TenantId => ConfigReader.ByKey("TenantId");
        public static string ClientSecret => ConfigReader.ByKey("ClientSecret");
    }
}