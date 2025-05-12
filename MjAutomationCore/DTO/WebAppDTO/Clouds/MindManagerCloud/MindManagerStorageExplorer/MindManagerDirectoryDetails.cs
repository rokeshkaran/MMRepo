using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MjAutomationCore.DTO.WebAppDTO.Clouds.MindManagerCloud.MindManagerStorageExplorer
{
    public class MindManagerDirectoryDetails
    {
        [JsonProperty("path")]
        public string DirectoryPath { get; set; }

        [JsonProperty("type")]
        public string DirectoryType { get; set; }

        [JsonProperty("children")]
        public List<MindManagerCloudItemDto> ItemDetails { get; set; }
    }
}
