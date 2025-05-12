using MjAutomationCore.AppConfig.CloudServiceCredentials;

namespace MjAutomationCore.Providers.Clouds.Box
{
    public class BoxAppApiProvider
    {
        //public static string AccessTokenUrl => KeyVaultHelper.GetSecretValue(BoxAppConfig.BoxAccessTokenEndpoint);
        //public static string ApiUrl => KeyVaultHelper.GetSecretValue(BoxAppConfig.BoxApiBaseUrl);
        //public static string UploadApiUrl => KeyVaultHelper.GetSecretValue(BoxAppConfig.BoxUploadApiUrl);
        //public static string ClientID => KeyVaultHelper.GetSecretValue(BoxAppConfig.BoxClientKey);
        //public static string ClientSecret => KeyVaultHelper.GetSecretValue(BoxAppConfig.BoxClientSecret);
        //public static string UserId => KeyVaultHelper.GetSecretValue(BoxAppConfig.BoxUserId);
        public static string AccessTokenUrl => "https://api.box.com/oauth2/token";
        public static string ApiUrl => "https://api.box.com/2.0";
        public static string UploadApiUrl => "https://upload.box.com/api/2.0";
        public static string ClientID => "jpkhc9gunimzsij518v8a9ry1ytjpahh";
        public static string ClientSecret => "jNdsBW4xUxhHXx1TtOKWyZHKX8A9yc82";
        public static string UserId => "12816496116";
    }
}