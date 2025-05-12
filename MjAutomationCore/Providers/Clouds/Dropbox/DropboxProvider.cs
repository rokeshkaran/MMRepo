using MjAutomationCore.AppConfig;
using MjAutomationCore.AppConfig.CloudServiceCredentials;
using MjAutomationCore.Utils;
using System;

namespace MjAutomationCore.Providers.Clouds.Dropbox
{
    public class DropboxProvider
    {
        public static string GetDropboxLogin(string userIndex = "1")
        {
            switch (userIndex)
            {
                //DropboxUserOne
                case "1":
                    //return KeyVaultHelper.GetSecretValue(DropboxLogin.DropboxUserOne);
                    return "";
                //DropboxUserTwo
                case "2":
                    //return KeyVaultHelper.GetSecretValue(DropboxLogin.DropboxUserTwo);
                    return "";
                //DropboxUserThree
                case "3":
                    //return KeyVaultHelper.GetSecretValue(DropboxLogin.DropboxUserThree);
                    return "";
                default:
                    throw new Exception("Invalid user index for Dropbox login");
            }
        }

        public static string GetDropboxPassword(string userIndex = "1")
        {
            switch (userIndex)
            {
                //DropboxPasswordOne
                case "1":
                    //return KeyVaultHelper.GetSecretValue(DropboxPasswords.DropboxUserPasswordOne);
                    return "";
                //DropboxPasswordTwo
                case "2":
                    //return KeyVaultHelper.GetSecretValue(DropboxPasswords.DropboxUserPasswordTwo);
                    return "";
                //DropboxPasswordThree
                case "3":
                    //return KeyVaultHelper.GetSecretValue(DropboxPasswords.DropboxUserPasswordThree);
                    return "";
                default:
                    throw new Exception("Invalid user index for Dropbox login");
            }
        }
    }
}