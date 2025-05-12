using MjAutomationCore.DTO.SnapDTO;
using MjAutomationCore.DTO.SnapDTO.RunTimeVariables;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Extensions;
using MjAutomationCore.General.Api.Snap;
using Reqnroll;
using Reqnroll.Assist;
using AutomationUtils.Extensions;
using MjAutomationCore.DTO.BaseDto.RunTimeVariables.Account;
using MjAutomationCore.Providers.Base;
using MjAutomationCore.Providers.UserProvider;

namespace MjAutomationCore.Steps.SnapProject
{
    [Binding]
    class SnapTeamStepsApi : ReqnrollContext
    {
        protected readonly RestWebClient _restClient;
        protected readonly ValueIdToken _idToken;
        protected readonly SnapTeamDto _team;
        protected readonly SnapTeamsDto _snapTeams;
        protected readonly TeamMembersDto _members;
        private readonly SessionRandomValue _sessionRandom;
        protected UserDataList _userDataList;

        public SnapTeamStepsApi(RestWebClient restClient, ValueIdToken idToken,
            SnapTeamDto team, SnapTeamsDto teams, SessionRandomValue sessionRandom,
            TeamMembersDto members, UserDataList userDataList)
        {
            _restClient = restClient;
            _idToken = idToken;
            _team = team;
            _snapTeams = teams;
            _sessionRandom = sessionRandom;
            _members = members;
            _userDataList = userDataList;
        }

        [When(@"User creates teams in Snap Queue via Api")]
        public void WhenUserCreatesTeamsInSnapQueueViaApi(Table table)
        {
            var teams = table.CreateSet<SnapTeamDto.Team>();
            var token = _userDataList.GetTokenFromUserDataList(RegularUserProvider.Email, RegularUserProvider.Password);
            foreach (SnapTeamDto.Team team in teams)
            {
                team.Name = team.Name.AddRandom(_sessionRandom);
                var teamID = _restClient.FrontendV1Client
                    .InitApiMethods<SnapTeamApi>()
                    .CreateTeam(team, token);
                team.TeamId = teamID;
                team.Token = token;
                _snapTeams.Value.Add(team);
            }
        }

        [When(@"'(.*)' User creates teams in Snap Queue via Api")]
        public void WhenUserCreatesTeamsInSnapQueueViaApi(string userIndex, Table table)
        {
            var teams = table.CreateSet<SnapTeamDto.Team>();
            var token = _userDataList.GetTokenFromUserDataList(MetaUaAccountProvider.GetFormattedLoginString(userIndex), MetaUaAccountProvider.Password);
            foreach (SnapTeamDto.Team team in teams)
            {
                team.Name = team.Name.AddRandom(_sessionRandom);
                var teamID = _restClient.FrontendV1Client
                    .InitApiMethods<SnapTeamApi>()
                    .CreateTeam(team, token);
                team.TeamId = teamID;
                team.Token = token;
            }
            _snapTeams.Value.AddRange(teams);
        }

        [When(@"User add members to team '(.*)' in Snap Queue via Api")]
        public void WhenUserAddMembersToTeamInSnapQueueViaApi(string teamName, Table table)
        {
            var members = table.CreateInstance<TeamMembersDto>();
            members.CopyPropertiesTo(_members);
            var token = _userDataList.GetTokenFromUserDataList(RegularUserProvider.Email, RegularUserProvider.Password);
            _restClient.FrontendV1Client.InitApiMethods<SnapTeamApi>()
                .AddMembersToTeam(teamName.AddRandom(_sessionRandom), _snapTeams, _members, token);
        }

        [When(@"'([^']*)' User add members to team '([^']*)' in Snap Queue via Api")]
        public void WhenUserAddMembersToTeamInSnapQueueViaApi(string userIndex, string teamName, Table table)
        {
            var members = table.CreateInstance<TeamMembersDto>();
            members.CopyPropertiesTo(_members);
            var token = _userDataList.GetTokenFromUserDataList(MetaUaAccountProvider.GetFormattedLoginString(userIndex), MetaUaAccountProvider.Password);
            _restClient.FrontendV1Client.InitApiMethods<SnapTeamApi>()
                .AddMembersToTeam(teamName.AddRandom(_sessionRandom), _snapTeams, _members, token);
        }


        [When(@"'(.*)' User accepts request to join '(.*)' team via Api")]
        public void WhenUserAcceptsRequestToJoinTeamViaApi(string userIndex, string team)
        {
            var token = _userDataList.GetTokenFromUserDataList(MetaUaAccountProvider.GetFormattedLoginString(userIndex), MetaUaAccountProvider.Password);
            _restClient.FrontendV1Client.InitApiMethods<SnapTeamApi>()
                .AcceptRequestToBecomeMemberOfTeam(token, team.AddRandom(_sessionRandom));
        }

        [When(@"'(.*)' User decline request to join '(.*)' team via Api")]
        public void WhenUserDeclineRequestToJoinTeamViaApi(string userIndex, string team)
        {
            var token = _userDataList.GetTokenFromUserDataList(MetaUaAccountProvider.GetFormattedLoginString(userIndex), MetaUaAccountProvider.Password);
            _restClient.FrontendV1Client.InitApiMethods<SnapTeamApi>()
                .DeclineRequestToBecomeMemberOfTeam(token, team.AddRandom(_sessionRandom));
        }
    }
}