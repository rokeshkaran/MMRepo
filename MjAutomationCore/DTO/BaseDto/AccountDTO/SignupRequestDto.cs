using MjAutomationCore.Providers.Base;
using Newtonsoft.Json;

namespace MjAutomationCore.DTO.BaseDto.AccountDTO
{
    class SignupRequestDto : BaseAccountDto
    {
        [JsonProperty("g-recaptcha-response")]
        public string RecaptchaResponse { get; set; } = CaptchaTokenProvider.CaptchaToken;

        [JsonProperty("user_metadata")]
        public UserMetadataDto UserMetadata { get; set; }
    }

    public class UserMetadataDto
    {
        [JsonProperty("first_name")]
        public string FirstName { get; set; }

        [JsonProperty("last_name")]
        public string LastName { get; set; }
    }
}