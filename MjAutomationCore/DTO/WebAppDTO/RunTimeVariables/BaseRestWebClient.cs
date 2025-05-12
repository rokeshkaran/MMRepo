using RestSharp;

namespace MjAutomationCore.DTO.WebAppDTO.RunTimeVariables
{
    public class BaseRestWebClient
    {
        public void RestWebClientCloud()
        {
            var client = new RestClient("http://juribaautomationapi.azurewebsites.net");

            var request = new RestRequest("/api/sms", Method.Get);

            var response = client.Execute(request);

        }
    }
}
