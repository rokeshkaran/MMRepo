using MjAutomationCore.AppConfig.CloudServiceCredentials;

namespace MjAutomationCore.Providers.Clouds.Google
{
    public class GoogleProvider
    {
        //public static string GoogleEmail => KeyVaultHelper.GetSecretValue(GDriveLogin.GDriveeUser);
        //public static string GooglePassword => KeyVaultHelper.GetSecretValue(GDrivePassword.GDriveUserPassword);
        //public static string VerificationKeyForGoogle => KeyVaultHelper.GetSecretValue(GDriveVerificationKey.VerificationKeyForGDrive);
        public static string GoogleEmail => "automationtestmj@gmail.com";
        public static string GooglePassword => "TestPs1!";
        public static string VerificationKeyForGoogle => "au7igntb66zyvg22tpbwry4zfszs2m4e";
    }
}