using Newtonsoft.Json;

namespace MjAutomationCore.DTO.WebAppDTO.Clouds.MindManagerCloud.MindManagerStorageExplorer
{
    public class MindManagerCloudItemDto
    {
        [JsonProperty("name")]
        public string ItemName { get; set; }

        [JsonProperty("uuid")]
        public string ItemId { get; set; }

        [JsonProperty("path")]
        public string ItemPath { get; set; }

        [JsonProperty("size")]
        public string ItemSize { get; set; }

        [JsonProperty("type")]
        public string ItemType { get; set; }

        [JsonProperty("createdAt")]
        public string CreatedAt { get; set; }

        [JsonProperty("updatedAt")]
        public string UpdatedAt { get; set; }
        
        [JsonProperty("url")]
        public string AwsUrl { get; set; }

        public string Token { get; set; }
    }
}
