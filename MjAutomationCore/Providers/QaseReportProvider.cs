using System;
using System.Collections.Generic;
using System.Linq;

namespace MjAutomationCore.Providers
{
    public class QaseReportProvider
    {
        public static string ReportProvider(List<string> tags)
        {
            if (tags.Any(x => x.Equals("Licensing")))
            {
                return "LICENSE";
            }
            else if (tags.Any(x => x.Equals("MindManager")))
            {
                return "WEB";
            }
            else if (tags.Any(x => x.Equals("Snap")))
            {
                return "MSNAP";
            }

            throw new Exception("Unable to get project code");
        }
    }
}