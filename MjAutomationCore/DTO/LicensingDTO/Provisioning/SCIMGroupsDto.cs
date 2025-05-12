using System.Collections.Generic;

namespace MjAutomationCore.DTO.LicensingDTO.Provisioning
{
    class SCIMGroupsDto
    {
        public List<SCIMGroupDto> Value { get; set; }

        public SCIMGroupsDto()
        {
            Value = new List<SCIMGroupDto>();
        }
    }
}