using Newtonsoft.Json;
using System.Collections.Generic;

namespace MjAutomationCore.DTO.SnapDTO.RunTimeVariables
{
    class SnapUserDto : BaseSnapUserDto
    {
        [JsonProperty("senders")]
        public List<Sender> Senders = new List<Sender>();

        [JsonProperty("recipients")]
        public List<Sender> Recipients = new List<Sender>();

        public class Sender
        {
            [JsonProperty("email")]
            public string Email { get; set; }

            [JsonProperty("request_key")]
            public string RequestKey { get; set; }
        }
    }
}