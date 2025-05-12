using AutomationUtils.Api;
using AutomationUtils.Extensions;
using AutomationUtils.Utils;
using MjAutomationCore.DTO.BaseDto.AccountDTO;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.Net;

namespace MjAutomationCore.General.Api.Account
{
    class AccountApiMethods : BaseApiMethods
    {
        public RestResponse PostSignUpRequest(string jsonBody)
        {
            var request = new RestRequest("signup", Method.Post);
            request.AddJsonBody(jsonBody);
            var response = Client.Execute(request);
            return response;
        }

        public RestResponse GetUserData(string token)
        {
            var request = new RestRequest("me", Method.Get);
            request.AddHeader("Authorization", $"Bearer {token}");
            var response = Client.Execute(request);
            return response;
        }

        private UserDataResponseDto DeserializeSignupRequest(RestResponse response)
        {
            Logger.Write($"Response content: '{response.Content}'");
            return JsonConvert.DeserializeObject<UserDataResponseDto>(response.Content);
        }

        public UserDataResponseDto GetSignupRequest(string token)
        {
            var userAccountResponse = GetUserData(token);
            return DeserializeSignupRequest(userAccountResponse);
        }

        public void VerifyAccount(string userId, string adminToken)
        {
            var request = new RestRequest($"users/{userId}", Method.Put);
            request.AddHeader("Authorization", $"Bearer {adminToken}");
            request.AddParameter("email_verified", true);
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, "Response wasn't received");
        }

        public void DeleteUserAccount(string userId, string adminToken)
        {
            var request = new RestRequest($"users/{userId}?all=true", Method.Delete);
            request.AddHeader("Authorization", $"Bearer {adminToken}");
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, $"Unable to execute DELETE request. URI: {response.ResponseUri}");
        }

        public void CreateAccount(SignupRequestDto signupRequest)
        {
            var json = JsonConvert.SerializeObject(signupRequest);
            PostSignUpRequest(json);
        }

        public RestResponse CloseSystemMessage(string token)
        {
            var request = new RestRequest("me/system-message/do-not-show-this-message-again", Method.Post);
            request.AddHeader("Authorization", $"Bearer {token}");
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.NoContent, $"Unable to close system message: {response.ResponseUri}");
            return response;
        }

        public RestResponse CloseShowEditorMessage(string token)
        {
            //Get Current Date
            DateTime currentDate = DateTime.UtcNow;
            string isoDate = currentDate.ToString("o");
            var request = new RestRequest("me", Method.Put);
            request.AddHeader("Authorization", $"Bearer {token}");
            request.AddParameter("canvas_flags[topicAuthorDontShowAgainSetTime]", isoDate);
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, $"Unable to close ShowEditor message: {response.ResponseUri}");
            return response;
        }
    }
}