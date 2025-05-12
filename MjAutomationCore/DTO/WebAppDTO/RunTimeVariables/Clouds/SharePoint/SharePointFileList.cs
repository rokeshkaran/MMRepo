using System.Collections.Generic;

namespace MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.Clouds.SharePoint
{
    public class SharePointFileList
    {
        public List<SharePointFileDto> Value;

        public SharePointFileList()
        {
            Value = new List<SharePointFileDto>();
        }
    }
}