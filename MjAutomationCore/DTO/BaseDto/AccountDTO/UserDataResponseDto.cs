using Newtonsoft.Json;

namespace MjAutomationCore.DTO.BaseDto.AccountDTO
{
    class UserDataResponseDto
    {
        [JsonProperty("id")]
        public string Id { get; set; }

        [JsonProperty("email")]
        public string Email { get; set; }

        [JsonProperty("email_verified")]
        public int EmailVerified { get; set; }

        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("given_name")]
        public string FirstName { get; set; }

        [JsonProperty("family_name")]
        public string LastName { get; set; }

        [JsonProperty("username")]
        public string Username { get; set; }

        [JsonProperty("meta")]
        public MetaData Meta { get; set; }
    }

    public class MetaData
    {
        [JsonProperty("accepted_terms")]
        public string AcceptedTerms { get; set; }

        [JsonProperty("first_name")]
        public string FirstName { get; set; }

        [JsonProperty("last_name")]
        public string LastName { get; set; }

        [JsonProperty("cognito_id")]
        public string CognitoId { get; set; }

        [JsonProperty("services")]
        public Services Services { get; set; }
    }

    public class Services
    {
        [JsonProperty("msteams_sharepoint_2a9ef514cc9f428e9a36549893b2b30e")]
        public string MsteamsSharepoint { get; set; }

        [JsonProperty("sharepoint_service_nzljNDFhNDc0ZmI1OTVlZg")]
        public string SharepointService { get; set; }
    }
}
