﻿using Newtonsoft.Json;

namespace MjAutomationCore.DTO.BaseDto.AccountDTO
{
    public class SignInResponseDto : BaseAccountDto
    {
        [JsonProperty("email_verified")]
        public bool EmailVerified { get; set; }

        [JsonProperty("id_token")]
        public string IdToken { get; set; }

        [JsonProperty("token_type")]
        public string TokenType { get; set; }

        [JsonProperty("expires_in")]
        public int ExpiresIn { get; set; }

        [JsonProperty("refresh_token")]
        public string RefreshToken { get; set; }
    }
}
