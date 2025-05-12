using System.Collections.Generic;

namespace MjAutomationCore.DTO.SnapDTO.RunTimeVariables
{
    class SnapsDto
    {
        public List<SnapDto> Value { get; set; }

        public SnapsDto()
        {
            Value = new List<SnapDto>();
        }
    }
}