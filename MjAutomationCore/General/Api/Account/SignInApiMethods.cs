using AutomationUtils.Api;
using AutomationUtils.Extensions;
using AutomationUtils.Utils;
using MjAutomationCore.DTO.BaseDto.AccountDTO;
using MjAutomationCore.Providers.Base;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.Net;
using System.Threading;

namespace MjAutomationCore.General.Api.Account
{
    class SignInApiMethods : BaseApiMethods
    {
        public RestResponse PostSignInRequest(string userName, string password)
        {
            var request = new RestRequest("signin", Method.Post);
            request.AddParameter("username", userName);
            request.AddParameter("password", password);
            request.AddParameter("g-recaptcha-response", CaptchaTokenProvider.CaptchaToken);
            RestResponse response = new RestResponse();
            for (int i = 0; i < 5; i++)
            {
                response = Client.Execute(request);
                if (response.StatusCode == HttpStatusCode.OK)
                {
                    response.Validate(HttpStatusCode.OK, "Response wasn't received");
                    return response;
                }
                else
                {
                    Thread.Sleep(1000);
                }
            }
            throw new Exception($"Failed to Post SignIn Request via API after 5 attempts. Response Content: {response.Content}");
        }

        public SignInResponseDto SignInUser(string email, string password)
        {
            var signInRequest = PostSignInRequest(email, password);
            return DeserializeSignInResponse(signInRequest);
        }

        public string ExtractIdToken(RestResponse response)
        {
            var responseContent = DeserializeSignInResponse(response);
            return responseContent.IdToken;
        }

        private SignInResponseDto DeserializeSignInResponse(RestResponse response)
        {
            try
            {
                Logger.Write("Response Status Code: " + response.StatusCode);
                if (response != null && !string.IsNullOrEmpty(response.Content))
                {
                    Logger.Write("Response Content: " + response.Content);
                    return JsonConvert.DeserializeObject<SignInResponseDto>(response.Content);
                }
                else
                {
                    Logger.Write("Empty or null response content received when deserializing JSON response");
                    throw new Exception("Empty or null response content");
                }
            }
            catch (JsonReaderException ex)
            {
                Logger.Write("Error parsing JSON response: " + ex.Message);
                Logger.Write("Response content: " + response.Content);
                throw new Exception("Error parsing JSON response", ex);
            }
        }
    }
}
