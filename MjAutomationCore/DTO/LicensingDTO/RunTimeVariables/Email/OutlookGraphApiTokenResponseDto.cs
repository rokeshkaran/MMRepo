using Newtonsoft.Json;

namespace MjAutomationCore.DTO.LicensingDTO.RunTimeVariables.Email
{
    public class OutlookGraphApiTokenResponseDto
    {
        [JsonProperty("token_type")]
        public string TokenType { get; set; }

        [JsonProperty("expires_in")]
        public string ExpiresIn { get; set; }

        [JsonProperty("access_token")]
        public string AccessToken { get; set; }
    }
}