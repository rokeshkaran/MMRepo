using MjAutomationCore.AppConfig.Licensing;
using System;

namespace MjAutomationCore.Providers.Licensing
{
    public static class UserAdminPortalProvider
    {
        public static string AdminLogin => GetAdminLogin();

        public static string AdminPassword => GetAdminPassword();

        private static string GetAdminLogin()
        {
            switch (EnvironmentProvider.Env)
            {
                case "envQa":
                case "envappQA":
                    //return KeyVaultHelper.GetSecretValue(UserAdminPortalLogin.UserAdminQALogin);
                    return "user_admin_automation_qa@mj.auto.tests.com";
                case "envStaging":
                case "envappStaging":
                    //return KeyVaultHelper.GetSecretValue(UserAdminPortalLogin.UserAdminStagingLogin);
                    return "user_admin_automation_stg@mj.auto.tests.com";
                case "envProd":
                case "envappProd":
                    //return KeyVaultHelper.GetSecretValue(UserAdminPortalLogin.UserAdminProdLogin);
                    return "user_admin_automation_prod@mj.auto.tests.com";
                default:
                    throw new Exception("Environment was not identified");
            }
        }

        private static string GetAdminPassword()
        {
            switch (EnvironmentProvider.Env)
            {
                case "envQa":
                case "envappQA":
                    //return KeyVaultHelper.GetSecretValue(UserAdminPortalPassword.UserAdminQAPassword);
                    return "auto72011test";
                case "envStaging":
                case "envappStaging":
                    //return KeyVaultHelper.GetSecretValue(UserAdminPortalPassword.UserAdminStagingPassword);
                    return "auto72011test";
                case "envProd":
                case "envappProd":
                    //return KeyVaultHelper.GetSecretValue(UserAdminPortalPassword.UserAdminProdPassword);
                    return "pMXx13vde0sP";
                default:
                    throw new Exception("Environment was not identified");
            }
        }
    }
}