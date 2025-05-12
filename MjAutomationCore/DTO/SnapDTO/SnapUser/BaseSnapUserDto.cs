using Newtonsoft.Json;

namespace MjAutomationCore.DTO.SnapDTO.RunTimeVariables
{
    class BaseSnapUserDto
    {
        [JsonProperty("user_id")]
        public string UserId { get; set; }

        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("email")]
        public string Email { get; set; }

        [JsonProperty("status")]
        public string Status { get; set; }

        public string Token { get; set; }
    }
}