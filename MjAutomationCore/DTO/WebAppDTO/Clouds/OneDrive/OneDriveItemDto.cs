using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MjAutomationCore.DTO.WebAppDTO.Clouds.OneDrive
{
    public class OneDriveItemDto
    {
        [JsonProperty("id")]
        public string ItemId { get; set; }

        [JsonProperty("name")]
        public string ItemName { get; set; } 
        
        [JsonProperty("createdDateTime")]
        public string ItemCreatedDateTime { get; set; }
        
        [JsonProperty("lastModifiedDateTime")]
        public string ItemLastModifiedDateTime { get; set; }
        
        [JsonProperty("size")]
        public string ItemSize { get; set; }

        public string AccessToken { get; set; }

        public string ParentFolderName { get; set; }

        public string UserEmail { get; set; }

        public string FileName { get; set; }

        public string FilePath { get; set; }
    }
}