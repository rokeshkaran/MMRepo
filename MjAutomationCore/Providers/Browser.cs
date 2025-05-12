using MjAutomationCore.Utils;
using System.Threading;

namespace MjAutomationCore.Providers
{
    public static class Browser
    {
        private static ThreadLocal<string> _browserVersionWithLocale = new ThreadLocal<string>();
        private static ThreadLocal<string> _browserVersionWithPlatform = new ThreadLocal<string>();

        public static string BrowserVersionWithLocale
        {
            get => _browserVersionWithLocale.Value ?? ConfigReader.ByKey("browserVersionWithLocale");
            set => _browserVersionWithLocale.Value = value;
        }

        public static string TargetBrowser => ConfigReader.ByKey("targetBrowser");

        public static string Platform => ConfigReader.ByKey("browser.platform");
        public static string Resolution => ConfigReader.ByKey("browser.Size");
        public static string HubUri => ConfigReader.ByKey("browser.hubUri");
        public static string BrowserType => ConfigReader.ByKey("remoteDriver");

        public static object Active { get; internal set; }
        public static object RemoteDriver { get; internal set; }

        public static void SetBrowserVersionWithLocale(string version)
        {
            _browserVersionWithLocale.Value = version;
        }

        public static string BrowserVersionWithPlatform
        {
            get => _browserVersionWithPlatform.Value ?? "";
            set => _browserVersionWithPlatform.Value = value;
        }

        public static void SetBrowserVersionWithPlatform(string version)
        {
            _browserVersionWithPlatform.Value = version;
        }
    }
}