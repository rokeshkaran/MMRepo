using AutomationUtils.Api;
using AutomationUtils.Extensions;
using AutomationUtils.Utils;
using MjAutomationCore.Providers;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;
using System;
using System.Net;

namespace MjAutomationCore.General.Api.Jira
{
    public class JiraApi : BaseApiMethods
    {
        public string GetCuttentJiraStatus(string issueId)
        {
            try
            {
                RestRequest request = new RestRequest($"MMCV-{issueId}", Method.Get);
                request.AddHeader("Authorization", JiraProvider.AuthToken);

                var response = Client.Execute(request);
                response.Validate(HttpStatusCode.OK, "Response wasn't received");
                return JsonConvert.DeserializeObject<JObject>(response.Content)["fields"]["status"]["name"].ToString();
            }
            catch (Exception e)
            {
                Logger.Write($"Unable to get jira status for '{issueId}' ticket: {e}", Logger.LogLevel.Warning);
                return string.Empty;
            }
        }

        public string GetResolvedInBuild(string issueId)
        {
            try
            {
                RestRequest request = new RestRequest($"MMCV-{issueId}", Method.Get);
                request.AddHeader("Authorization", JiraProvider.AuthToken);

                var response = Client.Execute(request);
                response.Validate(HttpStatusCode.OK, "Response wasn't received");

                return JsonConvert.DeserializeObject<JObject>(response.Content)["fields"]["customfield_10136"]["value"].ToString();
            }

            catch (Exception ex)
            {
                Console.WriteLine("Error retrieving JIRA issue: {0}", ex.Message);
                return string.Empty;
            }
        }
    }
}