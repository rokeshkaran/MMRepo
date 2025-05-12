using MjAutomationCore.AppConfig.Base;

namespace MjAutomationCore.Providers.Base
{
    public class MetaUaAccountProvider
    {
        //private static string LoginFormat = KeyVaultHelper.GetSecretValue(UserLoginMetaUa.LoginFormatMetaUa);
        private static string LoginFormat = "automationtestmm{0}@meta.ua";

        //public static string Password => KeyVaultHelper.GetSecretValue(UserPasswordMetaUa.PasswordMetaUa);
        public static string Password => "wss721h48!";

        public static string GetFormattedLoginString(string user)
        {
            return string.Format(LoginFormat, user);
        }
    }
}