using MjAutomationCore.Providers.Base;
using RestSharp;
using System;
using System.Net;

namespace MjAutomationCore.Utils
{
    public class QaseReporters
    {
        public static void PostTestStatus(TestStatusQase json)
        {
            try
            {
                RestClient client = new RestClient(UrlProvider.DeployServiceURL);
                RestRequest request = new RestRequest("/Qase", Method.Post);
                request.AddJsonBody(json);
                RestResponse response = client.Execute(request);
                if (response.StatusCode.Equals(HttpStatusCode.OK))
                {
                    return;
                }
            }
            catch (Exception e)
            {
                AutomationUtils.Utils.Logger.Write(e, AutomationUtils.Utils.Logger.LogLevel.Error);
            }
        }
    }

    public class TestStatusQase
    {
        public string BuildId { get; set; }

        public string BuildName { get; set; }

        public string ProjectName { get; set; }

        public string Name { get; set; }

        public string Status { get; set; }

        public string Id { get; set; }

        public string Environment { get; set; }

        public string ProjectCode { get; set; }

        public long ElapsedTime { get; set; }

        //public string FileScreenshot { get; set; }

        public string Browser { get; set; }

        public string Comment { get; set; }
    }
}
