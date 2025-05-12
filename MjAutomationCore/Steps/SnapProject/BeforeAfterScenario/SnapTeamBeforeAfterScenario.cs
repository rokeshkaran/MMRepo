using SeleniumAutomationUtils.SeleniumExtensions;
using AutomationUtils.Utils;
using MjAutomationCore.DTO.SnapDTO.RunTimeVariables;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.General.Api.Snap;
using System;
using System.Linq;
using Reqnroll;
using AutomationUtils.Extensions;

namespace MjAutomationCore.Steps.SnapProject.BeforeAfterScenario
{
    [Binding]
    class SnapTeamBeforeAfterScenario : ReqnrollContext
    {
        protected readonly RestWebClient _restClient;
        protected readonly SnapTeamsDto _teams;
        public SnapTeamBeforeAfterScenario(RestWebClient restClient, SnapTeamsDto teams)
        {
            _restClient = restClient;
            _teams = teams;
        }

        [AfterScenario("SnapTeamCleanup")]
        public void DeleteCustomerByName()
        {
            if (!_teams.Value.Any())
                return;

            foreach (SnapTeamDto.Team team in _teams.Value)
            {
                try
                {
                    _restClient.FrontendV1Client.InitApiMethods<SnapTeamApi>()
                        .DeleteTeam(team, _teams.Value.Find(x=>x.TeamId.Equals(team.TeamId)).Token);
                }
                catch (Exception e)
                {
                    Logger.Write($"Unable to delete Snap team via API: {e}", Logger.LogLevel.Error);
                }
            }
        }
    }
}