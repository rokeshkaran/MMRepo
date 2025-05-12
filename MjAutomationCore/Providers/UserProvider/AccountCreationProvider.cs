using MjAutomationCore.AppConfig;

namespace MjAutomationCore.Providers.UserProvider
{
    public class AccountCreationProvider
    {
        //public static string EmailForAccountCreation => KeyVaultHelper.GetSecretValue(GmailLogin.UserTwoGmailLogin);
        //public static string CodePasswordForAccountCreation => KeyVaultHelper.GetSecretValue(GmailCodePassword.UserTwoGmailCodePassword);
        public static string EmailForAccountCreation => "autotest.user.mm@gmail.com";
        public static string CodePasswordForAccountCreation => "sfyzcxtltyvofjsw";
    }
}