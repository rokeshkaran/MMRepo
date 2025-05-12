using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MjAutomationCore.DTO.WebAppDTO.Clouds.MindManagerCloud.MindManagerStorageExplorer
{
    public class MindManagerItemDirectory
    {
        [JsonProperty("own")]
        public MindManagerDirectoryDetails OwnDirectory { get; set; }

        [JsonProperty("shared")]
        public MindManagerDirectoryDetails SharedDirectory { get; set; }
    }
}
