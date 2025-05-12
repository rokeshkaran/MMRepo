using MjAutomationCore.Utils;

namespace MjAutomationCore.Providers
{
    public static class TeamCityConfigProvider
    {
        public static string BuildNumber => ConfigReader.ByKey("buildNumber");
        public static string BuildName => ConfigReader.ByKey("buildName");
        public static string ProjectName => ConfigReader.ByKey("projectName");
    }
}