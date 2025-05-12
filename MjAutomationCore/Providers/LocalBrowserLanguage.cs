using MjAutomationCore.Utils;

namespace MjAutomationCore.Providers
{
    public static class LocalBrowserLanguage
    {
        public static string Lang => ConfigReader.ByKey("localBrowserLanguage");
    }
}