using SeleniumAutomationUtils.SeleniumExtensions;
using MjAutomationCore.General.Api.Salesportal;
using Newtonsoft.Json;
using System.Collections.Generic;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using AutomationUtils.Extensions;

namespace MjAutomationCore.DTO.LicensingDTO.RunTimeVariables.Salesportal
{
    public class CustomerDto
    {
        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("type")]
        public string Type { get; set; }

        private string id;

        [JsonProperty("id")]
        public string Id
        {
            get
            {
                if (string.IsNullOrEmpty(id))
                {
                    var client = new RestWebClient();
                    id = client.FrontendV1Client.InitApiMethods<CustomerApi>().GetCustomerDetails(this).Id;
                }
                return id;
            }
            set
            {
                id = value;
            }
        }

        [JsonProperty("reglink")]
        public string Reglink { get; set; }

        [JsonProperty("token")]
        public string Token { get; set; }

        public List<PurchaseDto> Purchases = new List<PurchaseDto>();
    }
}