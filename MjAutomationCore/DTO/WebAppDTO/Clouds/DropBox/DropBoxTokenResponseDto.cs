using Newtonsoft.Json;

namespace MjAutomationCore.DTO.WebAppDTO.Clouds.DropBox
{
    public class DropBoxTokenResponseDto
    {
        [JsonProperty("token_type")]
        public string TokenType { get; set; }

        [JsonProperty("expires_in")]
        public string ExpiresIn { get; set; }

        [JsonProperty("access_token")]
        public string AccessToken { get; set; }
    }
}
