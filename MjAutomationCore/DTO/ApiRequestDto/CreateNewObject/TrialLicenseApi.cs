using Newtonsoft.Json;

namespace MjAutomationCore.DTO.ApiRequestDto.CreateNewObject
{
    public class TrialLicenseApi
    {
        [JsonProperty("productId")] public string ProductId { get; set; }

        [JsonProperty("clientVersion")] public string ClientVersion { get; set; }

        [JsonProperty("deviceId")] public string DeviceId { get; set; }
        [JsonProperty("productVersion")] public string ProductVersion { get; set; }
    }
}