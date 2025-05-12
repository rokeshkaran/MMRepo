using AutomationUtils.Extensions;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.General.Api.Account;
using MjAutomationCore.General.Api.ApplicationStatus;
using MjAutomationCore.General.Api.Jira;
using System.Collections.Generic;
using System.Text.RegularExpressions;

namespace MjAutomationCore.Helpers
{
    public class JiraHelper
    {
        private static readonly RestWebClient _restClient = new RestWebClient();
        public static bool ShouldSkipTest(string issueId)
        {
            var doneStatuses = new List<string> { "Closed", "Done", "Resolved", "Verified" };
            var status = _restClient.JiraClient.InitApiMethods<JiraApi>().GetCuttentJiraStatus(issueId);
            AutomationUtils.Utils.Logger.Write($"'{issueId}' Jira has '{status}'", AutomationUtils.Utils.Logger.LogLevel.Info);

            var result = !doneStatuses.Contains(status);
            AutomationUtils.Utils.Logger.Write($"The test should be skipped - '{result}'", AutomationUtils.Utils.Logger.LogLevel.Info);
            return result;
        }

        public static bool IsApplicationBuildVersionLowerThanResolvedInJiraIssue(string issueId)
        {
            var appStatus = _restClient.FrontendV2Client.InitApiMethods<ApplicationStatusApiMethods>().GetAppBuildVersionV2();
            var resolvedInBuild = _restClient.JiraClient.InitApiMethods<JiraApi>().GetResolvedInBuild(issueId);
            if(resolvedInBuild.Equals("<!-- 000 000 0000 -->n/a")) { return false; }
            string pattern = @"(?<=-->\s*)\d+\.\d+\.\d+";
            Match match = Regex.Match(resolvedInBuild, pattern);
            string versionNumber = match.Value;

            return VersionHelper.CompareVersions(appStatus, versionNumber);
        }
    }
}