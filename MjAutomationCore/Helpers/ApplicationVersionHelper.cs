using AutomationUtils.Extensions;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.General.Api.ApplicationStatus;
using System.Text.RegularExpressions;
using System;

namespace MjAutomationCore.Helpers
{
    public static class ApplicationVersionHelper
    {
        private static readonly RestWebClient _restClient = new RestWebClient();

        public static string GetCurrentBuildVersion()
        {
            try
            {
                var envBuild = _restClient.FrontendV2Client.InitApiMethods<ApplicationStatusApiMethods>().GetAppBuildVersionV2();
                return envBuild;
            }
            catch (Exception ex)
            {
                throw new InvalidOperationException("Unable to retrieve the current build version.", ex);
            }
        }

        public static bool IsVersionValid(string requiredVersion, string currentVersion)
        {
            return string.Compare(requiredVersion, currentVersion) <= 0;
        }

        public static string ExtractVersionFromTag(string buildTag)
        {
            if (string.IsNullOrEmpty(buildTag))
            {
                return null;
            }

            var versionPattern = @"Build_(\d+\.\d+\.\d+)";
            var match = Regex.Match(buildTag, versionPattern);
            return match.Success ? match.Groups[1].Value : null;
        }
    }
}