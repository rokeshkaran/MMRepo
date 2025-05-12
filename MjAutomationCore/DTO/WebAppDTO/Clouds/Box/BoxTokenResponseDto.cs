using Newtonsoft.Json;

namespace MjAutomationCore.DTO.WebAppDTO.Clouds.Box
{
    public class BoxTokenResponseDto
    {

        [JsonProperty("access_token")]
        public string AccessToken { get; set; }
    }
}