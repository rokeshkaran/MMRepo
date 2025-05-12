using MjAutomationCore.AppConfig;
using MjAutomationCore.AppConfig.CloudServiceCredentials;

namespace MjAutomationCore.Providers.Clouds.OneDrive
{
    public class OneDriveAppApiProvider
    {
        //public static string AccessTokenUrl => KeyVaultHelper.GetSecretValue(OneDriveAppApiConfig.OneDriveAccessTokenUrl);
        //public static string ClientID => KeyVaultHelper.GetSecretValue(OneDriveAppApiConfig.OneDriveClientId);
        //public static string TenantID => KeyVaultHelper.GetSecretValue(OneDriveAppApiConfig.OneDriveTenantId);
        //public static string ClientSecret => KeyVaultHelper.GetSecretValue(OneDriveAppApiConfig.OneDriveClientSecret);
        //public static string Scope => KeyVaultHelper.GetSecretValue(OneDriveAppApiConfig.OneDriveScope);
        //public static string EndPointURL => KeyVaultHelper.GetSecretValue(OneDriveAppApiConfig.OneDriveEndPointURL); 
        public static string AccessTokenUrl => "https://login.microsoftonline.com";
        public static string ClientID => "ee899155-56d7-4294-bf68-0960e473858b";
        public static string TenantID => "2a9ef514-cc9f-428e-9a36-549893b2b30e";
        public static string ClientSecret => "33G8Q~C1~TIALU8XsnLdHCzIL6J3TtdrtiYKhcF-";
        public static string Scope => "https://graph.microsoft.com/.default";
        public static string EndPointURL => "https://graph.microsoft.com/v1.0/users";
    }
}
