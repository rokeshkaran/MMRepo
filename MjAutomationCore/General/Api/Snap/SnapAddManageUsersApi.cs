using AutomationUtils.Api;
using AutomationUtils.Extensions;
using MjAutomationCore.DTO.SnapDTO.RunTimeVariables;
using MjAutomationCore.DTO.SnapDTO.SnapUser;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;

namespace MjAutomationCore.General.Api.Snap
{
    class SnapAddManageUsersApi : BaseApiMethods
    {
        public void RequestAccessToSendCaptureItems(SnapRecipientsListDto recipients, string token)
        {
            var request = new RestRequest("capture-share", Method.Post);
            request.AddHeader("Authorization", $"Bearer {token}");
            request.AddJsonBody(new { recipients = recipients.Value.Select(x => x.Email).ToArray() });

            var response = Client.Execute(request);

            if (!response.StatusCode.Equals(HttpStatusCode.OK))
            {
                throw new Exception($"Error response '{response.StatusCode}' status code. '{response.Content}' response content");
            }
        }

        public void DeleteRecipient(string id ,string token)
        {
            var request = new RestRequest($"capture-share?recipientUserId={id}", Method.Delete);
            request.AddHeader("Authorization", $"Bearer {token}");
            var response = Client.Execute(request);

            if (!response.StatusCode.Equals(HttpStatusCode.OK))
            {
                throw new Exception($"Error response '{response.StatusCode}' status code. '{response.Content}' response content");
            }
        }

        public SnapRecipientsListDto GetRecipientList(string token)
        {
            var request = new RestRequest("capture-share", Method.Get);
            request.AddHeader("Authorization", $"Bearer {token}");
            var response = Client.Execute(request);

            if (!response.StatusCode.Equals(HttpStatusCode.OK))
            {
                throw new Exception($"Error response '{response.StatusCode}' status code. '{response.Content}' response content");
            }

            var recipientList = JsonConvert.DeserializeObject<SnapRecipientsListDto>(response.Content);
            return recipientList;
        }

        public SnapSendersDto GetSenderListInvites(string token)
        {
            var request = new RestRequest("capture-invites", Method.Get);
            request.AddHeader("Authorization", $"Bearer {token}");
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, "Response wasn't received");
            var recipientList = JsonConvert.DeserializeObject<SnapSendersDto>(response.Content);
            return recipientList;
        }

        public void AcceptsAccessToReceiveCaptureItems(string requestKey, string token)
        {
            var request = new RestRequest("capture-share-accept", Method.Post);
            request.AddHeader("Authorization", $"Bearer {token}");
            request.AddParameter("requestKey", requestKey);
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, "Response wasn't received");
        }

        public List<RecipientDto> GetSenderList(string token)
        {
            var request = new RestRequest("capture-share", Method.Get);
            request.AddHeader("Authorization", $"Bearer {token}");
            var response = Client.Execute(request);

            if (!response.StatusCode.Equals(HttpStatusCode.OK))
            {
                throw new Exception($"Error response '{response.StatusCode}' status code. '{response.Content}' response content");
            }

            var senderList = JsonConvert.DeserializeObject<List<RecipientDto>>(response.Content);
            return senderList;
        }
    }
}