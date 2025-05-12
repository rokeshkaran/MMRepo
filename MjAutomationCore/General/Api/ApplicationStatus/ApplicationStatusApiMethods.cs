using AutomationUtils.Api;
using AutomationUtils.Extensions;
using Newtonsoft.Json.Linq;
using RestSharp;
using System.Net;

namespace MjAutomationCore.General.Api.ApplicationStatus
{
    class ApplicationStatusApiMethods : BaseApiMethods
    {
        public string GetAppBuildVersionV2()
        {
            var request = new RestRequest("status", Method.Get);
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, $"Failed to retrieve status. StatusCode: {response.StatusCode}");
            var content = response.Content;
            var version = JObject.Parse(content)["app"]?["version"]?.ToString();
            return version;
        }

        public RestResponse GetStatusV1()
        {
            var request = new RestRequest("status");
            return Client.Get(request);
        }
    }
}