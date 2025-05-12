using MjAutomationCore.DTO.WebAppDTO.Clouds.Box;
using System.Collections.Generic;

namespace MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.Clouds.Box
{
    public class BoxFileList
    {
        public List<BoxFileDto> Files;

        public BoxFileList()
        {
            Files = new List<BoxFileDto>();
        }
    }
}