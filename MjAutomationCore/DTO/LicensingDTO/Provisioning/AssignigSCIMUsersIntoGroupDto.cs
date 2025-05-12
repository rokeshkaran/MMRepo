using Newtonsoft.Json;
using System.Collections.Generic;

namespace MjAutomationCore.DTO.LicensingDTO.Provisioning
{
    public class AssignigSCIMUsersIntoGroupDto
    {
        [JsonProperty("schemas")]
        public List<string> schemas = new List<string>();

        [JsonProperty("Operations")]
        public List<Operation> Operations = new List<Operation>();

        public class Operation
        {
            [JsonProperty("op")]
            public string op { get; set; }

            [JsonProperty("path")]
            public string path { get; set; }

            [JsonProperty("value")]
            public List<Values> value { get; set; }
        }

        public class Values
        {
            [JsonProperty("value")]
            public string value { get; set; }
        }
    }
}