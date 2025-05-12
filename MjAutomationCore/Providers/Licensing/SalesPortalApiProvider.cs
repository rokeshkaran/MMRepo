using MjAutomationCore.AppConfig.Licensing;
using System;

namespace MjAutomationCore.Providers.Licensing
{
    class SalesPortalApiProvider
    {
        public static string ApiKey
        {
            get
            {
                switch (EnvironmentProvider.Env)
                {
                    case ("envappQA"):
                    case ("envQa"):
                        //return KeyVaultHelper.GetSecretValue(SalesPortalApiKey.SalesPortalQAApiKey);
                        return "xuVF9xNQKWs8rvnxWtCRwUdvMzE23Bcx";
                    case ("envStaging"):
                    case ("envappStaging"):
                        //return KeyVaultHelper.GetSecretValue(SalesPortalApiKey.SalesPortalStagingApiKey);
                        return "aoFvHQPJvp6wcowqCCAZzUv3hZosZgKY";
                    case "envProd":
                    case "envappProd":
                        //return KeyVaultHelper.GetSecretValue(SalesPortalApiKey.SalesPortalProdApiKey);
                        return "aoFvHQPJvp6wcowqCCAZzUv3hZosZgKY";
                    default:
                        throw new Exception("Environment was not identified");
                }
            }
        }
    }
}