using AutomationUtils.Api;
using AutomationUtils.Utils;
using MjAutomationCore.DTO.LicensingDTO.CustomerAdminPortal;
using MjAutomationCore.DTO.LicensingDTO.Provisioning;
using MjAutomationCore.DTO.LicensingDTO.RunTimeVariables.Salesportal;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.Net;

namespace MjAutomationCore.General.Api.Provisioning
{
    class SCIMGroupApi : BaseApiMethods
    {
        public string CreatingSCIMGroup(ValueSecretToken secretToken, SCIMGroupDto scimGroup)
        {
            RestRequest request = new RestRequest("scim/Groups", Method.Post);
            request.AddHeader("Authorization", "Bearer " + secretToken.Value);
            var id = $"00000000-0000-0000-0000-0{TestDataGenerator.RandomNum(999999, 100000)}";
            request.AddJsonBody(new { externalId = id, displayName = scimGroup.Name, active = true });
            var response = Client.Execute(request);
            if (!response.StatusCode.Equals(HttpStatusCode.Created) && !response.StatusCode.Equals(HttpStatusCode.OK))
            {
                throw new Exception($"Error response '{response.StatusCode}' status code. '{response.Content}' response content. Group not created");
            }

            var groupId = JsonConvert.DeserializeObject<CustomerDto>(response.Content).Id;

            return groupId;
        }

        public void RemoveGroupById(ValueSecretToken secretToken, string groupId)
        {
            RestRequest request = new RestRequest($"scim/Groups/{groupId}", Method.Delete);
            request.AddHeader("Authorization", "Bearer " + secretToken.Value);
            var response = Client.Execute(request);
            if (!response.StatusCode.Equals(HttpStatusCode.NoContent) && !response.StatusCode.Equals(HttpStatusCode.OK))
            {
                throw new Exception($"Error response '{response.StatusCode}' status code. '{response.Content}' response content");
            }
        }
    }
}