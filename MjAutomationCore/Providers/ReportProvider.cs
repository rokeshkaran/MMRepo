using MjAutomationCore.Utils;

namespace MjAutomationCore.Providers
{
    public class ReportProvider
    {
        public static string Report => ConfigReader.ByKey("report");
    }
}