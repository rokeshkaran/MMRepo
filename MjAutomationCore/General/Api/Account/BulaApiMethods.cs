using AutomationUtils.Api;
using AutomationUtils.Extensions;
using RestSharp;
using System;
using System.Net;
using System.Threading;

namespace MjAutomationCore.General.Api.Account
{
    class BulaApiMethods : BaseApiMethods
    {
        public void AcceptBula(string token, string tenantId)
        {
            var request = new RestRequest($"/subscription-tenant/{tenantId}/bula-accept", Method.Post);
            request.AddHeader("Authorization", $"Bearer {token}");
            RestResponse response = new RestResponse();
            for (int i = 0; i < 10; i++)
            {
                response = Client.Execute(request);
                if (response.StatusCode == HttpStatusCode.OK)
                {
                    response.Validate(HttpStatusCode.OK, "Response wasn't received");
                    return;
                }
                else
                {
                    Thread.Sleep(500);
                }
            }
            throw new Exception($"Failed to accept BULA via Api. Response:{response.Content}");

        }

        private RestResponse GetBulaAddendum(string token, string tenantId)
        {
            var request = new RestRequest($"/subscription-tenant/{tenantId}/bula-addendum", Method.Get);
            request.AddHeader("Authorization", $"Bearer {token}");
            RestResponse response = new RestResponse();
            for (int i = 0; i < 20; i++)
            {
                response = Client.Execute(request);

                if (response.StatusCode == HttpStatusCode.OK)
                {
                    response.Validate(HttpStatusCode.OK, "Response wasn't received");
                    return response;
                }
                else
                {
                    Thread.Sleep(500);
                }
            }

            throw new Exception($"Failed to retrieve BULA addendum via API. Response: {response.Content}");
        }

        private RestResponse AcceptBulaAddendum(string token, string tenantId)
        {
            var request = new RestRequest($"/subscription-tenant/{tenantId}/bula-addendum", Method.Patch);
            request.AddHeader("Authorization", $"Bearer {token}");
            request.AddHeader("Content-Type", "application/json");
            var body = new { accept = true };
            request.AddJsonBody(body);
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.NoContent, "The tenant has not successfully accepted the BULA addendum.");
            return response;
        }

        public RestResponse ProcessBulaAddendum(string token, string tenantId)
        {
            var getResponse = GetBulaAddendum(token, tenantId);
            if (getResponse.StatusCode == HttpStatusCode.OK)
            {
                return AcceptBulaAddendum(token, tenantId);
            }
            return getResponse;
        }
    }
}