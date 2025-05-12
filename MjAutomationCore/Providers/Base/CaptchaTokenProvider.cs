using MjAutomationCore.AppConfig.Base;
using System;

namespace MjAutomationCore.Providers.Base
{
    public class CaptchaTokenProvider
    {
        public static string CaptchaToken
        {
            get
            {
                switch (EnvironmentProvider.Env)
                {
                    case "envQa":
                    case "envappQA":
                        //return KeyVaultHelper.GetSecretValue(CaptchaTokenEnvironment.QACaptchaToken);
                        return "6U7gueIuSR1JTYFLwCFfEth3VOP76O1GZaMu3ni2Lsk";
                    case "envStaging":
                    case "envappStaging":
                        //return KeyVaultHelper.GetSecretValue(CaptchaTokenEnvironment.StagingCaptchaToken);
                        return "2IDKZqdEu8SHbvEKeuEamDrOqXLiTWScVt29ZUcwzkM";
                    case "envProd":
                    case "envappProd":
                        //return KeyVaultHelper.GetSecretValue(CaptchaTokenEnvironment.ProdCaptchaToken);
                        return "2IDKZqdEu8SHbvEKeuEamDrOqXLiTWScVt29ZUcwzkM";
                    default:
                        throw new Exception("Environment was not identified");
                }
            }
        }
    }
}