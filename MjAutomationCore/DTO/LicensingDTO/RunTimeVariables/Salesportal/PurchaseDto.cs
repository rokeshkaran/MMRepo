using SeleniumAutomationUtils.SeleniumExtensions;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Extensions;
using MjAutomationCore.General.Api.Salesportal;
using Newtonsoft.Json;
using AutomationUtils.Extensions;

namespace MjAutomationCore.DTO.LicensingDTO.RunTimeVariables.Salesportal
{
    public class PurchaseDto
    {
        public CustomerDto Customer { get; set; }

        [JsonProperty("customer_name")]
        public string CustomerName
        {
            get
            {
                return Customer.Name;
            }

            set
            {
                if (Customer is null)
                {
                    Customer = new CustomerDto() { Name = value };
                }
                else
                {
                    Customer.Name = value;
                }
            }
        }

        [JsonProperty("tenant_id")]
        public string TenantId
        {
            get
            {
                if (CustomerName is null)
                {
                    throw new System.Exception("Unable to create purchase without customer data");
                }

                return Customer.Id;
            }
        }

        [JsonProperty("seats")]
        public string Seats { get; set; }

        [JsonProperty("used_seats")]
        public string UsedSeats { get; set; }

        [JsonProperty("product_id")]
        public string ProductId { get; set; }

        [JsonProperty("end_date")]
        public string EndDateIso { get; set; }

        private string _endDate;
        public string EndDate
        {
            get
            {
                return _endDate;
            }

            set
            {
                _endDate = value;
                EndDateIso = value.Date().DateIso();
            }
        }

        private string purchaseId;

        [JsonProperty("purchase_id")]
        public string PurchaseId
        {
            get
            {
                if (string.IsNullOrEmpty(purchaseId))
                {
                    var client = new RestWebClient();
                    purchaseId = client.FrontendV1Client.InitApiMethods<PurchaseApi>().GetPurchase(this).PurchaseId;
                }
                return purchaseId;
            }
            set
            {
                purchaseId = value;
            }
        }

        [JsonProperty("tenant_type")]
        public string TenantType { get; set; }

        [JsonProperty("purchase_type")]
        public string PurchaseType { get; set; }

        [JsonProperty("duration")]
        public string Duration { get; set; }

        [JsonProperty("product_label")]
        public string ProductLabel { get; set; }

        [JsonProperty("ref_id")]
        public object RefId { get; set; }

        [JsonProperty("source")]
        public string Source { get; set; }

        [JsonProperty("license_model")]
        public string LicenseModel { get; set; }

        [JsonProperty("created_at")]
        public string CreatedAt { get; set; }

        [JsonProperty("updated_at")]
        public string UpdatedAt { get; set; }

        [JsonProperty("id")]
        public string Id { get; set; }

        [JsonProperty("status")]
        public object Status { get; set; }

        [JsonProperty("scim_group_ids")]
        public object ScimGroupIds { get; set; }
    }
}