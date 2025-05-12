using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;

namespace MjAutomationCore.DTO.LicensingDTO.CustomerAdminPortal
{
    class SubscriptionActionDTO
    {
        [JsonProperty("actionType")]
        public string ActionType { get; set; }

        [JsonProperty("purchaseId")]
        public string PurchaseId { get; set; }

        [JsonProperty("email")]
        public List<string> Email { get; set; }

        public string Emails
        {
            set
            {
                if (!string.IsNullOrEmpty(value))
                {
                    Email = value.Split(',').ToList();
                }
            }
        }
    }
}