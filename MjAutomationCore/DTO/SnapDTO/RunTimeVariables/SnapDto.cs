using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Utils;
using Newtonsoft.Json;
using OpenQA.Selenium;
using OpenQA.Selenium.Remote;
using System.Text;

namespace MjAutomationCore.DTO.SnapDTO.RunTimeVariables
{
    public class SnapDto
    {
        [JsonProperty("type")]
        public string Type { get; set; }

        [JsonProperty("source")]
        public string Source { get; set; }

        [JsonProperty("text")]
        public string Text { get; set; }

        [JsonProperty("link")]
        public string Link { get; set; }

        [JsonProperty("note")]
        public string Note { get; set; }

        [JsonProperty("id")]
        public string Id { get; set; }

        public string File { get; set; }

        public string Token { get; set; }
    }
}