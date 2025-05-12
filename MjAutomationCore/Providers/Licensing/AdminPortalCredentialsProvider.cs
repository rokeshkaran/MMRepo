using MjAutomationCore.AppConfig.Licensing;
using System;

namespace MjAutomationCore.Providers.Licensing
{
    public static class AdminPortalCredentialsProvider
    {
        public static string Login => GetAdminPortalLogin();

        public static string Password => GetAdminPortalPassword();

        private static string GetAdminPortalLogin()
        {
            switch (EnvironmentProvider.Env)
            {
                case "envQa":
                case "envappQA":
                    //return KeyVaultHelper.GetSecretValue(AdminPortalLoginEnvironment.AdminPortalQALogin);
                    return "auto.test.mm.lc@gmail.com";
                case "envStaging":
                case "envappStaging":
                   // return KeyVaultHelper.GetSecretValue(AdminPortalLoginEnvironment.AdminPortalStagingLogin);
                    return "auto.test.mm.lc@gmail.com";
                case "envProd":
                    throw new NotImplementedException("Access to admin portal email is not currently supported in the production environment");
                default:
                    throw new Exception("Environment was not identified");
            }
        }

        private static string GetAdminPortalPassword(int index = 0)
        {
            switch (EnvironmentProvider.Env)
            {
                case "envQa":
                case "envappQA":
                    //return KeyVaultHelper.GetSecretValue(AdminPortalPasswordEnvironment.AdminPortalQAPassword);
                    return "Test728automation";
                case "envStaging":
                case "envappStaging":
                    return "Test728automation";
                case "envProd":
                    throw new NotImplementedException("Access to admin portal email is not currently supported in the production environment");
                default:
                    throw new Exception("Environment was not identified");
            }
        }
    }
}