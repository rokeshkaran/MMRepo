using MjAutomationCore.Utils;
using System;

namespace MjAutomationCore.Providers
{
    class EndpointUrlProvider
    {
        public static string EndpointUrlForEnvironment(string version, bool useBackend = false)
        {
            string baseUrl = useBackend ? EndpointUrlForBackEnd() : EndpointUrlForFrontEnd();
            return $"{baseUrl}v{version}/";
        }

        private static string EndpointUrlForFrontEnd()
        {
            switch (EnvironmentProvider.Env)
            {
                case ("envappQA"):
                    return ConfigReader.ByKey("endpointUrl.App.QA");
                case ("envQa"):
                    return ConfigReader.ByKey("endpointUrl.App.QA");
                case ("envStaging"):
                    return ConfigReader.ByKey("endpointUrl.App.Stg");
                case ("envappStaging"):
                    return ConfigReader.ByKey("endpointUrl.App.Stg");
                case ("envProd"):
                    return ConfigReader.ByKey("endpointUrl.Prod");
                case ("envappProd"):
                    return ConfigReader.ByKey("endpointUrl.Prod");
                default:
                    throw new Exception("Environment was not identified");
            }
        }

        private static string EndpointUrlForBackEnd()
        {
            switch (EnvironmentProvider.Env)
            {
                case ("envappQA"):
                    return ConfigReader.ByKey("endpointUrl.QA");
                case ("envQa"):
                    return ConfigReader.ByKey("endpointUrl.QA");
                case ("envStaging"):
                    return ConfigReader.ByKey("endpointUrl.Stg");
                case ("envappStaging"):
                    return ConfigReader.ByKey("endpointUrl.Stg");
                case ("envProd"):
                    return ConfigReader.ByKey("endpointUrl.Prod");
                case ("envappProd"):
                    return ConfigReader.ByKey("endpointUrl.Prod");
                default:
                    throw new Exception("Environment was not identified");
            }
        }
    }
}