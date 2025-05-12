using AutomationUtils.Extensions;
using AutomationUtils.Utils;

namespace MjAutomationCore.Providers.Clouds.SharePoint
{
    public class SharePointSiteUrlProvider
    {
        public static string SharePointMilanSite => Config.Read.ByKey("sharepoinUrl");
    }
}