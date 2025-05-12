using Newtonsoft.Json;

namespace MjAutomationCore.DTO.WebAppDTO.Publish
{
    public class PublishDto
    {
        [JsonProperty("id")]
        public string Id { get; set; }

        [JsonProperty("url")]
        public string Url { get; set; }

        [JsonProperty("previewUrl")]
        public string PreviewUrl { get; set; }

        [JsonProperty("options")]
        public string Options { get; set; }

        [JsonProperty("publishId")]
        public string PublishId { get; set; }

        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("createdAt")]
        public string CreatedAt { get; set; }

        [JsonProperty("updatedAt")]
        public string UpdatedAt { get; set; }

        [JsonProperty("viewsCount")]
        public string ViewsCount { get; set; }

        [JsonProperty("publishType")]
        public string PublishType { get; set; }

        public string PublishFile { get; set; }

        public string UserToken { get; set; }

        [JsonProperty("region")]
        public string Region { get; set; }

        [JsonProperty("password")]
        public string Password { get; set; }

        [JsonProperty("logo")]
        public string Logo { get; set; }
    }
    public class Option
    {
        [JsonProperty("downloadable")]
        public bool Downloadable { get; set; }

        [JsonProperty("mode")]
        public string Mode { get; set; }

        [JsonProperty("mapFitContent")]
        public bool MapFitContent { get; set; }

        [JsonProperty("topicClickOpensLink")]
        public bool TopicClickOpensLink { get; set; }

        [JsonProperty("brandingHyperlink")]
        public string BrandingHyperlink { get; set; }
    }
}
