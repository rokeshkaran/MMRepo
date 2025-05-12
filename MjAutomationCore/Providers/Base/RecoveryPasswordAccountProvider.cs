using MjAutomationCore.AppConfig.Base;

namespace MjAutomationCore.Providers.Base
{
    class RecoveryPasswordAccountProvider
    {
        //public static string Login => KeyVaultHelper.GetSecretValue(RecoveryPasswordUserLogin.RecoveryPasswordUserLogin);
        public static string Login => "automation.mj.fp@gmail.com";

        //public static string Password => KeyVaultHelper.GetSecretValue(RecoveryPasswordUserPassword.RecoveryPasswordUserPassword);
        public static string Password => "TestPs1!";

        //public static string GmailApiAccessPasswordCode => KeyVaultHelper.GetSecretValue(GmailApiAccessCode.RecoveryPasswordGmailApiAccessCode);
        public static string GmailApiAccessPasswordCode => "RecoveryPasswordGmailApiAccessCode";
    }
}