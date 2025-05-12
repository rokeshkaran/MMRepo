using Newtonsoft.Json;

namespace MjAutomationCore.DTO.LicensingDTO.Provisioning
{
    class SCIMGroupDto
    {
        [JsonProperty("externalId")]
        public string ExternalId { get; set; }

        [JsonProperty("displayName")]
        public string Name { get; set; }

        [JsonProperty("active")]
        public bool Active { get; set; }

        [JsonProperty("id")]
        public string Id { get; set; }
    }
}
