using MjAutomationCore.AppConfig.Base;
using System;

namespace MjAutomationCore.Providers.UserProvider
{
    public static class RegularUserProvider
    {
        public static string Email => GetEmail();

        public static string Password => GetPassword();

        private static string GetEmail()
        {
            switch (EnvironmentProvider.Env)
            {
                case "envQa":
                case "envappQA":
                    //return KeyVaultHelper.GetSecretValue(UserLogin.RegularUserQALogin);
                    return "automation.mj.qa@gmail.com";
                case "envStaging":
                case "envappStaging":
                    //return KeyVaultHelper.GetSecretValue(UserLogin.RegularUserStagingLogin);
                    return "automation.mj.s@gmail.com";
                case "envProd":
                case "envappProd":
                    //return KeyVaultHelper.GetSecretValue(UserLogin.RegularUserProdLogin);
                    return "automation.prodmj@gmail.com";
                default:
                    throw new Exception("Environment was not identified");
            }
        }

        private static string GetPassword()
        {
            switch (EnvironmentProvider.Env)
            {
                case "envQa":
                case "envappQA":
                    //return KeyVaultHelper.GetSecretValue(UserPassword.RegularUserQAPassword);
                    return "TestPs1!";
                case "envStaging":
                case "envappStaging":
                    //return KeyVaultHelper.GetSecretValue(UserPassword.RegularUserStagingPassword);
                    return "TestPs1!";
                case "envProd":
                case "envappProd":
                    //return KeyVaultHelper.GetSecretValue(UserPassword.RegularUserProdPassword);
                    return "yl5gD3GeSoHgdj9^C";
                default:
                    throw new Exception("Environment was not identified");
            }
        }
    }
}