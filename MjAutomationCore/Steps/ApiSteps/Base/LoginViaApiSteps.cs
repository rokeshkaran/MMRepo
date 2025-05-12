using AutomationUtils.Extensions;
using MjAutomationCore.DTO.BaseDto.AccountDTO;
using MjAutomationCore.DTO.BaseDto.RunTimeVariables.Account;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Extensions;
using MjAutomationCore.General.Api.Account;
using MjAutomationCore.Helpers;
using MjAutomationCore.Providers;
using MjAutomationCore.Providers.Base;
using MjAutomationCore.Providers.UserProvider;
using MjAutomationCore.Utils;
using Reqnroll;
using System.Linq;

namespace MjAutomationCore.Steps.ApiSteps.Base
{
    [Binding]
    public class LoginViaApiSteps : ReqnrollContext
    {
        protected readonly RestWebClient _restClient;
        private readonly BrowsersList _browsersList;
        private readonly UserDataDto _userData;
        private readonly UserDataList _userDataList;
        private readonly SessionRandomValue _sessionRandom;

        public LoginViaApiSteps(RestWebClient restClient, BrowsersList browsersList, UserDataDto userData, UserDataList userDataList, SessionRandomValue sessionRandom)
        {
            _restClient = restClient;
            _browsersList = browsersList;
            _userData = userData;
            _userDataList = userDataList;
            _sessionRandom = sessionRandom;
        }

        [Given(@"User is logged in newly created account via Api")]
        public void GivenUserIsLoggedInNewlyCreatedAccountViaApi()
        {
            CloseSystemMessageViaAPI(_userData.IdToken);
            _browsersList.Active.Navigate().GoToUrl(UrlProvider.Url + $"#id_token={_userData.IdToken}");
        }

        [Given(@"User is logged into '(.*)' newly created account of MindManager web app via Api")]
        public void GivenUserIsLoggedIntoNewlyCreatedAccountOfMindManagerWebAppViaApi(string email)
        {
            email = email.AddRandom(_sessionRandom);
            var userData = _userDataList.Value.First(x => x.Email.Equals(email));
            if (string.IsNullOrEmpty(userData.RefreshToken) && string.IsNullOrEmpty(userData.IdToken))
            {
                var signInResponse = _restClient.FrontendV1Client.InitApiMethods<SignInApiMethods>().SignInUser(userData.Email, userData.Password);
                _userData.SetTokens(signInResponse.IdToken, signInResponse.RefreshToken);
            }
            CloseSystemMessageViaAPI(userData.IdToken);
            _browsersList.Active.Navigate().GoToUrl(UrlProvider.Url + $"#id_token={userData.IdToken}&refresh_token={userData.RefreshToken}");
            _browsersList.Active.WaitForDataLoading();
            //Set upsellDialogDontShowAgain off
            _browsersList.Active.SetItemInLocalStorage("upsellDialogDontShowAgain", "true");
            if (Browser.BrowserType.Equals("remote"))
            {
                CookieHelper.SetOptanonCookies(_browsersList.Active);
                _browsersList.Active.Navigate().Refresh();
            }
        }

        [Given(@"User is logged into MindManager web app via Api")]
        public void GivenUserIsLoggedIntoMindManagerWebAppViaApi()
        {
            AuthorizationViaApi(RegularUserProvider.Email, RegularUserProvider.Password);
        }

        [Given(@"'([^']*)' User is logged into MindManager web app via Api")]
        public void GivenUserIsLoggedIntoMindManagerWebAppViaApi(string сount)
        {
            AuthorizationViaApi(MetaUaAccountProvider.GetFormattedLoginString(сount), MetaUaAccountProvider.Password);
        }

        [Given(@"User with '([^']*)' email and '([^']*)' password is logged into MindManager web app via Api")]
        public void GivenUserWithEmailAndPasswordIsLoggedIntoMindManagerWebAppViaApi(string email, string password)
        {
            email = email.AddRandom(_sessionRandom);
            password = password.AddRandom(_sessionRandom);
            AuthorizationViaApi(email, password);
        }

        public void AuthorizationViaApi(string login, string password)
        {
            var signInResponse = _restClient.FrontendV1Client.InitApiMethods<SignInApiMethods>().SignInUser(login, password);
            //Close system message before navigate to mm with token
            CloseSystemMessageViaAPI(signInResponse.IdToken);
            //Close system message before navigate to mm with token
            CloseShowEditorsViaAPI(signInResponse.IdToken);
            _browsersList.Active.Navigate().GoToUrl(UrlProvider.Url + $"#id_token={signInResponse.IdToken}&refresh_token={signInResponse.RefreshToken}");
            _userData.SetCredentials(login, password);
            _userData.SetTokens(signInResponse.IdToken, signInResponse.RefreshToken);
            if (_userDataList.Value.Any(x => x.Email.Equals(login)))
            {
                _userDataList.Value.Where(x => x.Email.Equals(login)).FirstOrDefault().SetTokens(signInResponse.IdToken, signInResponse.RefreshToken);
            }
            else
            {
                _userDataList.Value.Add(_userData);
            }
            if (Browser.BrowserType.Equals("remote"))
            {
                CookieHelper.SetOptanonCookies(_browsersList.Active);
                _browsersList.Active.Navigate().Refresh();
            }
            _browsersList.Active.WaitForDocumentReadyState();
            _browsersList.Active.WaitForDataLoading();

            //Set upsellDialogDontShowAgain off
            _browsersList.Active.SetItemInLocalStorage("upsellDialogDontShowAgain", "true");
        }

        [When(@"User close Admin System Message for User '([^']*)' and Password '([^']*)' via API")]
        public void WhenUserCloseAdminSystemMessageForUserAndPasswordViaAPI(string User, string Password)
        {
            var signInResponse = _restClient.FrontendV1Client.InitApiMethods<SignInApiMethods>().SignInUser(User.AddRandom(_sessionRandom), Password.AddRandom(_sessionRandom));
            CloseSystemMessageViaAPI(signInResponse.IdToken);
        }

        public void CloseSystemMessageViaAPI(string token)
        {
            _restClient.FrontendV1Client.InitApiMethods<AccountApiMethods>().CloseSystemMessage(token);
        }

        public void CloseShowEditorsViaAPI(string token)
        {
            _restClient.FrontendV1Client.InitApiMethods<AccountApiMethods>().CloseShowEditorMessage(token);
        }
    }
}