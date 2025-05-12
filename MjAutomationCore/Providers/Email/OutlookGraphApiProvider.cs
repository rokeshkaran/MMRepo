using MjAutomationCore.AppConfig;

namespace MjAutomationCore.Providers.Email
{
    public class OutlookGraphApiProvider
    {
        //public static string AccessTokenUrl => KeyVaultHelper.GetSecretValue(MicrosoftGraphOutlookApiConfig.OutlookAccessTokenUrl);
        //public static string ClientID => KeyVaultHelper.GetSecretValue(MicrosoftGraphOutlookApiConfig.OutlookClientId);
        //public static string TenantID => KeyVaultHelper.GetSecretValue(MicrosoftGraphOutlookApiConfig.OutlookTenantId);
        //public static string ClientSecret => KeyVaultHelper.GetSecretValue(MicrosoftGraphOutlookApiConfig.OutlookClientSecret);
        //public static string Scope => KeyVaultHelper.GetSecretValue(MicrosoftGraphOutlookApiConfig.OutlookScope);
        //public static string EndPointURL => KeyVaultHelper.GetSecretValue(OutlookEmailCredentials.OutlookEndpointUrl);
        //public static string EmailAddress => KeyVaultHelper.GetSecretValue(OutlookEmailCredentials.OutlookEmailAddress);
        public static string AccessTokenUrl => "https://login.microsoftonline.com";
        public static string ClientID => "3d66d7fc-8354-4056-9f37-5f8043c2d249";
        public static string TenantID => "2a9ef514-cc9f-428e-9a36-549893b2b30e";
        public static string ClientSecret => "Js~8Q~MnNvlKXZfAv.SLGtog0sV23JNgcRKHAduu";
        public static string Scope => "https://graph.microsoft.com/.default";
        public static string EndPointURL => "https://graph.microsoft.com/v1.0";
        public static string EmailAddress => "auto.test@mindmanager.onmicrosoft.com";
    }
}