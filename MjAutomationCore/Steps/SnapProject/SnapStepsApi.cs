using AutomationUtils.Extensions;
using MjAutomationCore.DTO.BaseDto.RunTimeVariables.Account;
using MjAutomationCore.DTO.SnapDTO.RunTimeVariables;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Extensions;
using MjAutomationCore.General.Api.Snap;
using MjAutomationCore.Providers.Base;
using MjAutomationCore.Providers.UserProvider;
using OpenQA.Selenium;
using Reqnroll;
using Reqnroll.Assist;

namespace MjAutomationCore.Steps.SnapProject
{
    [Binding]
    class SnapStepsApi : ReqnrollContext
    {
        private readonly WebDriver _driver;
        protected readonly RestWebClient _restClient;
        protected readonly SnapDto _snap;
        protected readonly SnapsDto _snaps;
        private readonly SessionRandomValue _sessionRandom;
        protected UserDataList _userDataList;
        protected readonly SnapTeamsDto _snapTeams;

        public SnapStepsApi(WebDriver driver, RestWebClient restClient, SnapDto snap,
            SnapsDto snaps, SessionRandomValue sessionRandom, UserDataList userDataList, SnapTeamsDto snapTeams)
        {
            _driver = driver;
            _restClient = restClient;
            _snap = snap;
            _snaps = snaps;
            _sessionRandom = sessionRandom;
            _userDataList = userDataList;
            _snapTeams = snapTeams;
        }

        [When(@"User upload capture item via Api")]
        public void WhenUserUploadCaptureItemViaApi(Table table)
        {
            var snaps = table.CreateSet<SnapDto>();
            var token = _userDataList.GetTokenFromUserDataList(RegularUserProvider.Email, RegularUserProvider.Password);
            foreach (SnapDto snap in snaps)
            {
                snap.Text = (snap.Text).AddRandom(_sessionRandom);
                snap.Id = _restClient.FrontendV1Client.InitApiMethods<SnapApi>().
                    UploadCapture(snap, token);
                snap.Token = token;
                _snaps.Value.Add(snap);
            }
        }

        [When(@"'(.*)' User upload capture item via Api")]
        public void WhenUserUploadCaptureItemViaApi(string userIndex, Table table)
        {
            var snaps = table.CreateSet<SnapDto>();
            var token = _userDataList.GetTokenFromUserDataList(MetaUaAccountProvider.GetFormattedLoginString(userIndex), MetaUaAccountProvider.Password);
            foreach (SnapDto snap in snaps)
            {
                snap.Text = (snap.Text).AddRandom(_sessionRandom);
                snap.Id = _restClient.FrontendV1Client.InitApiMethods<SnapApi>().
                    UploadCapture(snap, token);
                snap.Token = token;

                _snaps.Value.Add(snap);
            }
        }

        [When(@"'([^']*)' User upload capture item to '([^']*)' team via Api")]
        public void WhenUserUploadCaptureItemToTeamViaApi(string userIndex, string teamName, Table table)
        {
            var snaps = table.CreateSet<SnapDto>();
            var token = _userDataList.GetTokenFromUserDataList(MetaUaAccountProvider.GetFormattedLoginString(userIndex), MetaUaAccountProvider.Password);
            foreach (SnapDto snap in snaps)
            {
                snap.Text = (snap.Text).AddRandom(_sessionRandom);
                snap.Id = _restClient.FrontendV1Client.InitApiMethods<SnapTeamApi>().UploadCaptureToTeam(snap, teamName.AddRandom(_sessionRandom), _snapTeams, token);
                snap.Token = token;

                _snaps.Value.Add(snap);
            }
        }

        [When(@"User with '([^']*)' email and '([^']*)' password upload capture item via Api")]
        public void WhenUserWithEmailAndPasswordUploadCaptureItemViaApi(string email, string password, Table table)
        {
            var snaps = table.CreateSet<SnapDto>();
            email = email.AddRandom(_sessionRandom);
            password = password.AddRandom(_sessionRandom);
            var token = _userDataList.GetTokenFromUserDataList(email, password);
            foreach (SnapDto snap in snaps)
            {
                snap.Text = (snap.Text).AddRandom(_sessionRandom);
                snap.Id = _restClient.FrontendV1Client.InitApiMethods<SnapApi>().
                    UploadCapture(snap, token);
                snap.Token = token;

                _snaps.Value.Add(snap);
            }
        }
    }
}