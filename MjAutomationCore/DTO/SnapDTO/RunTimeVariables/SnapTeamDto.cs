using Newtonsoft.Json;
using System.Collections.Generic;

namespace MjAutomationCore.DTO.SnapDTO.RunTimeVariables
{
    public class SnapTeamDto
    {
        [JsonProperty("teams")]
        public List<Team> Teams = new List<Team>();

        public class Team
        {
            [JsonProperty("team_id")]
            public string TeamId { get; set; }

            [JsonProperty("name")]
            public string Name { get; set; }

            [JsonProperty("owner_user_id")]
            public string OwnerUserId { get; set; }

            [JsonProperty("owner_name")]
            public string OwnerName { get; set; }

            [JsonProperty("owner_email")]
            public string OwnerEmail { get; set; }

            [JsonProperty("status")]
            public string Status { get; set; }

            [JsonProperty("request_key")]
            public string RequestKey { get; set; }

            public string Token { get; set; }
        }
    }
}