using MjAutomationCore.AppConfig.CloudServiceCredentials;
using System;

namespace MjAutomationCore.Providers.Clouds.Box
{
    public class BoxProvider
    {
        public static string GetBoxLogin(string userIndex = "1")
        {
            switch (userIndex)
            {
                //BoxUserOne
                case "1":
                    //return KeyVaultHelper.GetSecretValue(BoxLogin.BoxUserOne);
                    return "auto.test@mindmanagercloudqa.com";
                //BoxUserTwo
                case "2":
                    //return KeyVaultHelper.GetSecretValue(BoxLogin.BoxUserTwo);
                    return "auto.test.mm2@gmail.com";
                default:
                    throw new Exception("Invalid user index for Box login");
            }
        }

        public static string GetBoxPassword(string userIndex = "1")
        {
            switch (userIndex)
            {
                //BoxPasswordOne
                case "1":
                    //return KeyVaultHelper.GetSecretValue(BoxPasswords.BoxUserPasswordOne);
                    return "Testautomation0378";
                //BoxPasswordTwo
                case "2":
                    //return KeyVaultHelper.GetSecretValue(BoxPasswords.BoxUserTwoPasswordTwo);
                    return "Testautomation0378";
                default:
                    throw new Exception("Invalid user index for Box login");
            }
        }
    }
}