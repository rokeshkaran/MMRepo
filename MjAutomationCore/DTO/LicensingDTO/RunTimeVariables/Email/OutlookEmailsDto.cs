using MjAutomationCore.DTO.LicensingDTO.RunTimeVariables;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MjAutomationCore.DTO.LicensingDTO.RunTimeVariables.Email
{
    public class OutlookEmailsDto
    {
        public List<OutlookEmailResponseDto> Value;

        public OutlookEmailsDto() => Value = new List<OutlookEmailResponseDto>();
    }
}
