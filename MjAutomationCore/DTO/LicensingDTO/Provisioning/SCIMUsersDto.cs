using System.Collections.Generic;

namespace MjAutomationCore.DTO.LicensingDTO.Provisioning
{
    class SCIMUsersDto
    {
        public List<SCIMUserDto> Value { get; set; }

        public SCIMUsersDto()
        {
            Value = new List<SCIMUserDto>();
        }
    }
}