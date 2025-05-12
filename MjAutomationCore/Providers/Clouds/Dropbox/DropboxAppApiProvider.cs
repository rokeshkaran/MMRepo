using MjAutomationCore.AppConfig.CloudServiceCredentials;

namespace MjAutomationCore.Providers.Clouds.Dropbox
{
    public class DropboxAppApiProvider
    {
        //public static string AccessTokenUrl => KeyVaultHelper.GetSecretValue(DropboxAppConfig.DropboxAccessTokenEndpoint);
        //public static string Url => KeyVaultHelper.GetSecretValue(DropboxAppConfig.DropboxApiContentEndpoint);
        //public static string ClientKey => KeyVaultHelper.GetSecretValue(DropboxAppConfig.DropboxClientKey);
        //public static string ClientSecret => KeyVaultHelper.GetSecretValue(DropboxAppConfig.DropboxClientSecret);
        //public static string DropboxRefreshToken => KeyVaultHelper.GetSecretValue(DropboxAppConfig.DropboxRefreshToken);
        public static string AccessTokenUrl => "https://api.dropbox.com/oauth2/token";
        public static string Url => "https://content.dropboxapi.com/2/";
        public static string ClientKey => "q88pxbgmr90f2f0";
        public static string ClientSecret => "ckdqifziv2czlg4";
        public static string DropboxRefreshToken => "CGwlOFfhZf0AAAAAAAAAAf3kI_oD8_igLH2b4D-BKHDwQekd6zmSclqq0-hwv4En";
    }
}