using Newtonsoft.Json;

namespace MjAutomationCore.DTO.BaseDto.AccountDTO
{
    public class BaseAccountDto
    {
        [JsonProperty("email")]
        public string Email { get; set; }

        [JsonProperty("password")]
        public string Password { get; set; }
    }
}
