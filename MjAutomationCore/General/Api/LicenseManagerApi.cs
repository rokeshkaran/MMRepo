using AutomationUtils.Api;
using MjAutomationCore.DTO.ApiRequestDto.CreateNewObject;
using Newtonsoft.Json;
using RestSharp;

namespace MjAutomationCore.General.Api
{
    class LicenseManagerApi : BaseApiMethods
    {
        public RestResponse PostTrialLicenseActivationRequest(string token, TrialLicenseApi requestDto)
        {
            var request = new RestRequest("subscription-trial");
            request.AddHeader("Authorization", $"Bearer {token}");
            request.AddHeader("Content-Type", "application/json");

            request.AddJsonBody(JsonConvert.SerializeObject(requestDto));
            var response = Client.Post(request);
            return response;
        }

        public RestResponse PostLicenseVerificationRequest(string token, string productVersion)
        {
            var request = new RestRequest("subscription-verify");
            request.AddQueryParameter("idToken", token);
            request.AddHeader("Content-Type", "application/json");

            var requestBody = new { ProductVersion = productVersion };
            request.AddJsonBody(requestBody);

            var response = Client.Post(request);
            return response;
        }
    }
}