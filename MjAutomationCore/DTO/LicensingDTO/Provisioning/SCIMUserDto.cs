using Newtonsoft.Json;

namespace MjAutomationCore.DTO.LicensingDTO.Provisioning
{
    class SCIMUserDto
    {
        [JsonProperty("externalId")]
        public string ExternalId { get; set; }

        [JsonProperty("userName")]
        public string Name { get; set; }

        [JsonProperty("active")]
        public bool Active { get; set; }

        [JsonProperty("id")]
        public string Id { get; set; }
    }
}