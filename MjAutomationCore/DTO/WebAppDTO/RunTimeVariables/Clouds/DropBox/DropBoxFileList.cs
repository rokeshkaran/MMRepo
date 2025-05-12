using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.Clouds.Box;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.Clouds.DropBox
{
    public class DropBoxFileList
    {
        public List<DropBoxFileDto> Value;

        public DropBoxFileList()
        {
            Value = new List<DropBoxFileDto>();
        }
    }
}
