using MjAutomationCore.AppConfig;

namespace MjAutomationCore.Providers.Email
{
    public class GmailProvider
    {
        //public static string EmailAddress => KeyVaultHelper.GetSecretValue(GmailLogin.UserOneGmailLogin);

        //public static string PasswordEmail => KeyVaultHelper.GetSecretValue(GmailPassword.UserOneGmailPassword);

        //public static string CodePasswordEmail => KeyVaultHelper.GetSecretValue(GmailCodePassword.UserOneGmailCodePassword);

        //public static string EmailLC => KeyVaultHelper.GetSecretValue(GmailLogin.UserForLicensingGmailLogin);

        //public static string CodePasswordLC => KeyVaultHelper.GetSecretValue(GmailCodePassword.GmailForLicensingCodePassword);
        public static string EmailAddress => "automation.test.user.mj@gmail.com";

        public static string PasswordEmail => "testautomation0378";

        public static string CodePasswordEmail => "tckhuahlvrpvbngi";

        public static string EmailLC => "automation.user.mm.lc@gmail.com";

        public static string CodePasswordLC => "zohecugufhyrsmqz";
    }
}