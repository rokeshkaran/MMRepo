using MjAutomationCore.Utils;

namespace MjAutomationCore.Providers
{
    public class PathProvider
    {
        public static string DownloadsFolder => ConfigReader.ByKey("downloadsFolder");
        public static string RemoteDownloadsFolder => ConfigReader.ByKey("remoteDownloadsFolder");
    }
}