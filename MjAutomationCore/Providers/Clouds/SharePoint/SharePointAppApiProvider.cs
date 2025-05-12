using MjAutomationCore.AppConfig.CloudServiceCredentials;

namespace MjAutomationCore.Providers.Clouds
{
    public class SharePointAppApiProvider
    {
        //public static string AccessTokenUrl => KeyVaultHelper.GetSecretValue(SharePointAppConfig.SharePointAccessControlEndpoint);
        //public static string ClientID => KeyVaultHelper.GetSecretValue(SharePointAppConfig.SharePointAppClientId);
        //public static string TenantID => KeyVaultHelper.GetSecretValue(SharePointAppConfig.SharePointTenantId);
        //public static string ResourceID => KeyVaultHelper.GetSecretValue(SharePointAppConfig.SharePointResourceId);
        //public static string ClientSecret => KeyVaultHelper.GetSecretValue(SharePointAppConfig.SharePointAppClientSecret);
        //public static string SiteDomain => KeyVaultHelper.GetSecretValue(SharePointAppConfig.SharePointSiteDomain); 
        public static string AccessTokenUrl => "https://accounts.accesscontrol.windows.net";
        public static string ClientID => "0f2dcce0-5177-475b-8b5c-3315bb0d591f";
        public static string TenantID => "2a9ef514-cc9f-428e-9a36-549893b2b30e";
        public static string ResourceID => "00000003-0000-0ff1-ce00-000000000000";
        public static string ClientSecret => "Wy/nurC5lrlanJpRRQHdyF2erbb/612Km5jWg7GfFn0=";
        public static string SiteDomain => "mindmanager.sharepoint.com";
    }
}