using AutomationUtils.Api;
using MjAutomationCore.DTO.LicensingDTO.CustomerAdminPortal;
using MjAutomationCore.DTO.LicensingDTO.Provisioning;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.Net;

namespace MjAutomationCore.General.Api.Provisioning
{
    class AssignigSCIMUsersIntoGroupApi : BaseApiMethods
    {
        public void CreateGroupWithMember(ValueSecretToken secretToken, AssignigSCIMUsersIntoGroupDto info, string groupId)
        {
            RestRequest request = new RestRequest($"scim/Groups/{groupId}", Method.Patch);
            request.AddHeader("Authorization", "Bearer " + secretToken.Value);
            request.AddHeader("Content-Type", "application/scim+json");
            var requestBody = JsonConvert.SerializeObject(info);
            request.AddJsonBody(requestBody);
            var response = Client.Execute(request);

            if (!response.StatusCode.Equals(HttpStatusCode.NoContent))
            {
                throw new Exception($"Error response '{response.StatusCode}' status code. '{response.Content}' response Content. Users are not added to the group");
            }
        }
    }
}