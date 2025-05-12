using System.Collections.Generic;

namespace MjAutomationCore.DTO.SnapDTO.RunTimeVariables
{
    class SnapTeamsDto
    {
        public List<SnapTeamDto.Team> Value { get; set; }

        public SnapTeamsDto()
        {
            Value = new List<SnapTeamDto.Team>();
        }
    }
}