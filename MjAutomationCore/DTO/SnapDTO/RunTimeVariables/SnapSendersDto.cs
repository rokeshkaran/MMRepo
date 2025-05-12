using Newtonsoft.Json;
using System.Collections.Generic;
using static MjAutomationCore.DTO.SnapDTO.RunTimeVariables.SnapUserDto;

namespace MjAutomationCore.DTO.SnapDTO.RunTimeVariables
{
    class SnapSendersDto : BaseSnapUserDto
    {
        [JsonProperty("senders")]
        public List<Sender> Senders = new List<Sender>();
    }
}