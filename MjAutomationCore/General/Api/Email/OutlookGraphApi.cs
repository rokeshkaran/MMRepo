using AutomationUtils.Api;
using AutomationUtils.Extensions;
using MjAutomationCore.DTO.LicensingDTO.RunTimeVariables.Email;
using MjAutomationCore.Providers.Email;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text.RegularExpressions;
using System.Threading;

namespace MjAutomationCore.General.Api.Email
{
    public class OutlookGraphApi : BaseApiMethods
    {
        private RestResponse PostAccessTokenRequest()
        {
            var request = new RestRequest($"{OutlookGraphApiProvider.AccessTokenUrl}/{OutlookGraphApiProvider.TenantID}/oauth2/v2.0/token", Method.Post);
            request.AddHeader("Content-Type", "application/x-www-form-urlencoded");
            request.AddParameter("grant_type", "client_credentials");
            request.AddParameter("client_id", OutlookGraphApiProvider.ClientID);
            request.AddParameter("client_secret", OutlookGraphApiProvider.ClientSecret);
            request.AddParameter("scope", OutlookGraphApiProvider.Scope);
            var response = Client.Execute(request);
            return response;
        }

        public string GetAccessToken()
        {
            var response = PostAccessTokenRequest();
            response.Validate(HttpStatusCode.OK, "Response wasn't received");
            return JsonConvert.DeserializeObject<OutlookGraphApiTokenResponseDto>(response.Content).AccessToken;
        }

        private RestResponse ExecuteGetEmailRequest(string emailAddress, string accessToken, int top, int skip)
        {
            var getEmailDetails = new RestRequest($"{OutlookGraphApiProvider.EndPointURL}/users/{emailAddress}/mailFolders/Inbox/messages?&$top={top}&$skip={skip}", Method.Get);
            getEmailDetails.AddHeader("Authorization", "Bearer " + accessToken);
            var response = Client.Execute(getEmailDetails);
            response.Validate(HttpStatusCode.OK, "Response wasn't received");
            return response;
        }

        public List<OutlookEmailResponseDto> GetEmailsOutlookBySubject(string emailAddress, string subjectEmail)
        {
            var accessToken = GetAccessToken();
            var allEmails = new List<OutlookEmailResponseDto>();
            for (int j = 0; j < 30; j++)
            {
                int top = 100;
                int skip = 0;
                for (int i = 0; i < 5; i++, top++, skip += top)
                {
                    var response = ExecuteGetEmailRequest(emailAddress, accessToken, top, skip);
                    response.Validate(HttpStatusCode.OK, "Get email request failed");
                    var emailDetails = JsonConvert.DeserializeObject<OutlookEmailsDto>(response.Content);
                    var filteredEmails = FilterAndSortEmails(emailDetails, subjectEmail);
                    allEmails.AddRange(filteredEmails);

                    if (filteredEmails.Count > 0)
                    {
                        return allEmails;
                    }
                }
                Thread.Sleep(1000);
            }

            throw new Exception($"Subject email '{subjectEmail}' not found in the mailbox after 30 seconds");
        }

        private List<OutlookEmailResponseDto> FilterAndSortEmails(OutlookEmailsDto emailDetails, string subjectEmail)
        {
            var filteredMessages = emailDetails.Value
                .Where(message => Regex.Replace(message.Subject, @"[\u00A0\s]+", " ") == subjectEmail)
                .OrderByDescending(message => message.ReceivedDateTime)
                .ToList();
            return filteredMessages;
        }

        public void DeleteEmail(string Id)
        {
            var accessToken = GetAccessToken();
            var request = new RestRequest($"{OutlookGraphApiProvider.EndPointURL}/users/{OutlookGraphApiProvider.EmailAddress}/mailFolders/Inbox/messages/{Id}", Method.Delete);
            request.AddHeader("Authorization", $"Bearer {accessToken}");
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, "Email was not deleted from mailbox");
        }

        public void MarkEmailAsRead(string mail, string Id)
        {
            var accessToken = GetAccessToken();
            var request = new RestRequest($"{OutlookGraphApiProvider.EndPointURL}/users/{mail}/mailFolders/Inbox/messages/{Id}", Method.Patch);
            request.AddHeader("Authorization", $"Bearer {accessToken}");
            request.AddJsonBody(new { IsRead = true });
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, "Email was not marked as read");
        }
    }
}

