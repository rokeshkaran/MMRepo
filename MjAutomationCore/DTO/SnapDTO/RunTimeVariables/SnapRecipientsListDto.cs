using MjAutomationCore.DTO.SnapDTO.SnapUser;
using Newtonsoft.Json;
using System.Collections.Generic;

namespace MjAutomationCore.DTO.SnapDTO.RunTimeVariables
{
    class SnapRecipientsListDto
    {
        [JsonProperty("recipients")]
        public List<RecipientDto> Value { get; set; }

        public SnapRecipientsListDto()
        {
            Value = new List<RecipientDto>();
        }
    }
}