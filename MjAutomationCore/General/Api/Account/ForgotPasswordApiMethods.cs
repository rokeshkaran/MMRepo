using AutomationUtils.Api;
using Newtonsoft.Json;
using RestSharp;

namespace MjAutomationCore.General.Api.Account
{
    class ForgotPasswordApiMethods : BaseApiMethods
    {
        public RestResponse PostForgotPasswordRequest(string userEmail)
        {
            var request = new RestRequest("forgotPassword/request");
            request.AddHeader("Content-Type", "application/json");
            var requestBody = new { email = userEmail };
            request.AddJsonBody(JsonConvert.SerializeObject(requestBody));
            var response = Client.Post(request);
            return response;
        }
    }
}