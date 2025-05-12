using MjAutomationCore.AppConfig.Base;
using MjAutomationCore.AppConfig.Licensing;
using NUnit.Framework.Internal;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Dropbox.Api.TeamLog.DefaultLinkExpirationDaysPolicy;
using static Dropbox.Api.TeamLog.TimeUnit;

namespace MjAutomationCore.Providers.Licensing
{
    public class MultipleAdminPortalCredentialsHelper
    {
       //private static string LoginFormat = KeyVaultHelper.GetSecretValue(AdminPortalLoginEnvironment.MultipleAdminPortalLoginFormat);
        private static string LoginFormat = "auto.test.mm.lc{0}@gmail.com";

        //public static string Password => KeyVaultHelper.GetSecretValue(AdminPortalPasswordEnvironment.MultipleAdminPortalPassword);
        public static string Password => "Test728automation";

        public static string GetFormattedLoginString(string user)
        {
            return string.Format(LoginFormat, user);
        }
    }
}
