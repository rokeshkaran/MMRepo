using MjAutomationCore.DTO.SnapDTO.RunTimeVariables;
using Newtonsoft.Json;

namespace MjAutomationCore.DTO.SnapDTO.SnapUser
{
    class SenderDto : BaseSnapUserDto
    {
        [JsonProperty("request_key")]
        public string RequestKey { get; set; }
    }
}