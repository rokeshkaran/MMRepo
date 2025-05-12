using System.Collections.Generic;
using MjAutomationCore.DTO.WebAppDTO.Clouds.OneDrive;

namespace MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.Clouds.OneDrive
{
    public class OneDriveItemList
    {
       public List<OneDriveItemDto> Value;

        public OneDriveItemList()
        {
            Value = new List<OneDriveItemDto>();
        }
    }
}
