using AutomationUtils.Api;
using AutomationUtils.Utils;
using MjAutomationCore.DTO.LicensingDTO.CustomerAdminPortal;
using MjAutomationCore.DTO.LicensingDTO.RunTimeVariables.Salesportal;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.Net;

namespace MjAutomationCore.General.Api.Provisioning
{
    class SCIMUsersApi : BaseApiMethods
    {
        public string CreatingSCIMUsers(ValueSecretToken secretToken, string user)
        {
            RestRequest request = new RestRequest("scim/Users", Method.Post);
            request.AddHeader("Authorization", "Bearer " + secretToken.Value);
            var id = $"{TestDataGenerator.RandomNum(99999999, 10000000)}-{TestDataGenerator.RandomNum(9999, 1000)}-{TestDataGenerator.RandomNum(9999, 1000)}-{TestDataGenerator.RandomNum(9999, 1000)}-{TestDataGenerator.RandomNum(999999999, 100000000)}";
            request.AddJsonBody(new { externalId = id, userName = user, active = true });
            var response = Client.Execute(request);
            if (!response.StatusCode.Equals(HttpStatusCode.Created) && !response.StatusCode.Equals(HttpStatusCode.OK))
            {
                throw new Exception($"Error response '{response.StatusCode}' status code. '{response.Content}' response content. User '{user}' was not created");
            }

            var userId = JsonConvert.DeserializeObject<CustomerDto>(response.Content).Id;

            return userId;
        }
    }
}