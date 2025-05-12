using MjAutomationCore.Utils;
using System;

namespace MjAutomationCore.Providers.Base
{
    class UrlProvider
    {
        public static string Url => UrlEnvironment();

        public static string UrlEnvironment()
        {
            switch (EnvironmentProvider.Env)
            {
                case "envappQA":
                    return ConfigReader.ByKey("appQaURL");
                case "envQa":
                    return ConfigReader.ByKey("cloud.QaURL");
                case "envStaging":
                    return ConfigReader.ByKey("cloud.StagingURL");
                case "envappStaging":
                    return ConfigReader.ByKey("appStagingURL");
                case "envProd":
                    return ConfigReader.ByKey("cloud.ProdURL");
                case "envappProd":
                    return ConfigReader.ByKey("appProdURL");
                default:
                    throw new Exception("Environment was not identified");
            }
        }

        public static string SalesPortalUrl => SalesPortalUrlEnvironment();

        public static string SalesPortalUrlEnvironment()
        {
            switch (EnvironmentProvider.Env)
            {
                case "envappQA":
                    return ConfigReader.ByKey("cloud.QaSpURL");
                case "envQa":
                    return ConfigReader.ByKey("cloud.QaSpURL");
                case "envStaging":
                    return ConfigReader.ByKey("cloud.StagingSpURL");
                case "envappStaging":
                    return ConfigReader.ByKey("cloud.StagingSpURL");
                case "envProd":
                    return ConfigReader.ByKey("cloud.ProdSpURL");
                default:
                    throw new Exception("Environment was not identified");
            }
        }

        public static string LicenseSupportUrl => LicenseSupportUrlEnvironment();

        public static string LicenseSupportUrlEnvironment()
        {
            switch (EnvironmentProvider.Env)
            {
                case "envappQA":
                    return ConfigReader.ByKey("licenseSupportURLQA");
                case "envQa":
                    return ConfigReader.ByKey("licenseSupportURLQA");
                case "envStaging":
                    return ConfigReader.ByKey("licenseSupportURLStaging");
                case "envappStaging":
                    return ConfigReader.ByKey("licenseSupportURLStaging");
                case "envProd":
                    throw new NotImplementedException();
                default:
                    throw new Exception("Environment was not identified");
            }
        }

        public static string CustomerAdminPortalUrl => CustomerAdminPortallUrlEnvironment();

        public static string CustomerAdminPortallUrlEnvironment()
        {
            switch (EnvironmentProvider.Env)
            {
                case "envappQA":
                    return ConfigReader.ByKey("qa.adminPortalURL");
                case "envQa":
                    return ConfigReader.ByKey("qa.adminPortalURL");
                case "envStaging":
                    return ConfigReader.ByKey("stg.adminPortalURL");
                case "envappStaging":
                    return ConfigReader.ByKey("stg.adminPortalURL");
                case "envProd":
                    throw new NotImplementedException();
                default:
                    throw new Exception("Environment was not identified");
            }
        }

        public static string UrlMindjetStore => ConfigReader.ByKey("appMjStoreURL");
        public static string UrlMail => ConfigReader.ByKey("mailinatorURL");
        public static string SharepoinUrl => ConfigReader.ByKey("sharepoinUrl");
        public static string DeployServiceURL => ConfigReader.ByKey("azureApiUrl");
        public static string DownloadLibraryURL => ConfigReader.ByKey("downloadLibraryURL");
    }
}