using MjAutomationCore.AppConfig.CloudServiceCredentials;
using System;

namespace MjAutomationCore.Providers.Clouds.SharePoint
{
    public class SharePointProvider
    {
        public static string GetSharepointLogin(string userIndex = "1")
        {
            switch (userIndex)
            {
                ////SharePointUserOne
                //case "1":
                //    return KeyVaultHelper.GetSecretValue(SharePointLogin.SharePointUserOne);
                ////SharePointUserTwo
                //case "2":
                //    return KeyVaultHelper.GetSecretValue(SharePointLogin.SharePointUserTwo);
                ////SharePointUserThree
                //case "3":
                //    return KeyVaultHelper.GetSecretValue(SharePointLogin.SharePointUserThree);
                    //SharePointUserOne
                case "1":
                    return "auto.test@mindmanagercloudqa.com";
                //SharePointUserTwo
                case "2":
                    return "auto.test.2@mindmanagercloudqa.com";
                //SharePointUserThree
                case "3":
                    return "auto.test.3@mindmanagercloudqa.com";
                default:
                    throw new Exception("Invalid user index for SharePoint login");
            }
        }

        public static string GetSharepointPassword(string userIndex = "1")
        {
            switch (userIndex)
            {
                ////SharePointPasswordOne
                //case "1":
                //    return KeyVaultHelper.GetSecretValue(SharePointPasswords.SharePointUserPasswordOne);
                ////SharePointPasswordTwo
                //case "2":
                //    return KeyVaultHelper.GetSecretValue(SharePointPasswords.SharePointUserPasswordTwo);
                ////SharePointPasswordThree
                //case "3":
                //    return KeyVaultHelper.GetSecretValue(SharePointPasswords.SharePointUserPasswordThree);
                //SharePointPasswordOne
                case "1":
                    return "Testautomation0378";
                //SharePointPasswordTwo
                case "2":
                    return "UI04l0kg3";
                //SharePointPasswordThree
                case "3":
                    return "MO1l0h4s4";
                default:
                    throw new Exception("Invalid user index for SharePoint login");
            }
        }
    }
}