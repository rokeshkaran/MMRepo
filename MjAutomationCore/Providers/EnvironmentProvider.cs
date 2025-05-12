using MjAutomationCore.Utils;

namespace MjAutomationCore.Providers
{
    public static class EnvironmentProvider
    {
        public static string Env => ConfigReader.ByKey("environment");
    }
}