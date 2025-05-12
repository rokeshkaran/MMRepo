using MjAutomationCore.AppConfig;

namespace MjAutomationCore.Providers
{
    public static class JiraProvider
    {
        //public static string Url => KeyVaultHelper.GetSecretValue(JiraSecret.JiraApiUrl);

        //public static string AuthToken => KeyVaultHelper.GetSecretValue(JiraSecret.JiraAuthenticationToken);
        public static string Url => "https://mindjet.atlassian.net/rest/api/2/issue/";

        public static string AuthToken => "Basic cnVmYXQuYWxpeWV2QGFsbHVkby5jb206QVRBVFQzeEZmR0YwQ1Jic296dnZfdWItNXYxaHhLSFVpOWdfRGktU0JRRkxCOHd3UEs0SWdPX2NXNXNtWTVNNDA0WENlbHFHNTlzUC1uRU1LMmtfMFl4a0JiRkVBVEJIVzR4bjZQeVpOTi1IYWwyeVhRcGhaT1JVVkgxSndZV2Z5TERNT1JZUnEwYUprbzFMbzk2MjFRVm5YQTZBcWxsRUFkb3BXc0I2dy1Rem9rbFo4bG15dUY0PUE1MzY4NUU4";
    }
}