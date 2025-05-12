using MjAutomationCore.AppConfig.Licensing;
using System;

namespace MjAutomationCore.Providers.Licensing
{
    class SupportPortalApiProvider
    {
        public static string ApiKey
        {
            get
            {
                switch (EnvironmentProvider.Env)
                {
                    case ("envappQA"):
                    case ("envQa"):
                        //return KeyVaultHelper.GetSecretValue(SupportPortalApiKey.SupportPortalQAApiKey);
                        return "xuVF9xNQKWs8rvnxWtCRwUdvMzE23Bcx";
                    case ("envStaging"):
                    case ("envappStaging"):
                        //return KeyVaultHelper.GetSecretValue(SupportPortalApiKey.SupportPortalStagingApiKey);
                        return "veJ2rTB8pFepthQq7MWvpaTVWAT3rxRb";
                    case "envProd":
                    case "envappProd":
                        //return KeyVaultHelper.GetSecretValue(SupportPortalApiKey.SupportPortalProdApiKey);
                        return "veJ2rTB8pFepthQq7MWvpaTVWAT3rxRb";
                    default:
                        throw new Exception("Environment was not identified");
                }
            }
        }
    }
}