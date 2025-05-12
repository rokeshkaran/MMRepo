using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;

namespace MjAutomationCore.DTO.SnapDTO.RunTimeVariables
{
    class TeamMembersDto
    {
        [JsonProperty("members")]
        public List<string> Member { get; set; }

        public string Members
        {
            set
            {
                if (!string.IsNullOrEmpty(value))
                {
                    Member = value.Split(',').ToList();
                }
            }
        }
    }
}