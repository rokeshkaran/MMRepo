using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MjAutomationCore.DTO.WebAppDTO.Clouds.MindManagerCloud.MindManagerStorageExplorer;

namespace MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.Clouds.MindManager
{
    public class MindManagerCloudItemList
    {
        public List<MindManagerCloudItemDto> Value;

        public MindManagerCloudItemList()
        {
            Value = new List<MindManagerCloudItemDto>();
        }
    }
}
