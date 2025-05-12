using AutomationUtils.Extensions;
using Microsoft.IdentityModel.Tokens;
using MjAutomationCore.DTO.BaseDto.AccountDTO;
using MjAutomationCore.DTO.BaseDto.RunTimeVariables.Account;
using MjAutomationCore.DTO.LicensingDTO.RunTimeVariables.Salesportal;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Extensions;
using MjAutomationCore.General.Api.Account;
using MjAutomationCore.Helpers;
using MjAutomationCore.Providers;
using MjAutomationCore.Providers.Licensing;
using MjAutomationCore.Utils;
using System;
using System.Linq;
using Reqnroll;

namespace MjAutomationCore.Steps.LicensingProject.Account
{
    [Binding]
    class AccountLicensingStepsApi : ReqnrollContext
    {
        private readonly BrowsersList _browsersList;
        protected readonly RestWebClient _restClient;
        protected readonly CustomersDto _customers;
        private readonly SessionRandomValue _sessionRandom;
        private readonly UserDataDto _userData;
        private readonly UserDataList _userDataList;

        public AccountLicensingStepsApi(BrowsersList browsersList, RestWebClient restClient, CustomersDto customers, SessionRandomValue sessionRandom, UserDataDto userData, UserDataList userDataList)
        {
            _browsersList = browsersList;
            _restClient = restClient;
            _customers = customers;
            _sessionRandom = sessionRandom;
            _userData = userData;
            _userDataList = userDataList;
        }

        [When(@"User is logged in to '(.*)' customer on Admin portal via Api")]
        public void WhenUserIsLoggedInToCustomerOnAdminPortalViaApi(string customerName)
        {
            UserLoggedInToCustomerOnAdminPortalViaApi(customerName);
        }

        [When(@"User '([^']*)' is logged in to '([^']*)' customer on Admin portal via Api")]
        public void WhenUserIsLoggedInToCustomerOnAdminPortalViaApi(string admin, string customerName)
        {
            UserLoggedInToCustomerOnAdminPortalViaApi(customerName, admin);
        }

        public void UserLoggedInToCustomerOnAdminPortalViaApi(string customerName, string admin = null)
        {
            var login = admin.IsNullOrEmpty() ? AdminPortalCredentialsProvider.Login : MultipleAdminPortalCredentialsHelper.GetFormattedLoginString(admin);
            var password = admin.IsNullOrEmpty() ? AdminPortalCredentialsProvider.Password : MultipleAdminPortalCredentialsHelper.Password;
            customerName = customerName.AddRandom(_sessionRandom);
            var tenant = _customers.Value.First(x => x.Name.Equals(customerName));
            var signInResponse = _restClient.FrontendV1Client.InitApiMethods<SignInApiMethods>().SignInUser(login, password);

            // Saved Admin details into userDataList
            if (!_userDataList.Value.Any(x => x.Email.Equals(login)))
            {
                var userdata = new UserDataDto();
                userdata.SetCredentials(login, password);
                userdata.SetTokens(signInResponse.IdToken, signInResponse.RefreshToken);
                _userDataList.Value.Add(userdata);
            }

            _browsersList.Active.Navigate().GoToUrl(tenant.Reglink + $"#adminChoose?id_token={signInResponse.IdToken}");
            _browsersList.Active.WaitForDataLoading();

            if (Browser.BrowserType.Equals("remote"))
            {
                CookieHelper.SetOptanonCookies(_browsersList.Active);
                _browsersList.Active.Navigate().Refresh();
            }
            _browsersList.Active.WaitForDataLoading();
        }

        [When(@"admin '([^']*)' accepts BULA terms via API")]
        public void WhenAdminAcceptsBULATermsViaAPI(string customerName)
        {
            AdminAcceptsBULATermsViaAPI(customerName);
        }

        [When(@"'([^']*)' admin '([^']*)' accepts BULA terms via API")]
        public void WhenAdminAcceptsBULATermsViaAPI(string index, string customerName)
        {
            AdminAcceptsBULATermsViaAPI(customerName, index);
        }

        [When(@"admin '([^']*)' accepts BULA Addendum terms via API")]
        public void WhenAdminAcceptsBULAAddendumTermsViaAPI(string customerName)
        {
            AdminAcceptsBULAAddendumTermsViaAPI(customerName);
        }

        private void AdminAcceptsBULATermsCommon(string customerName, string index, Action<string, string> acceptBulaMethod)
        {
            var login = index.IsNullOrEmpty() ? AdminPortalCredentialsProvider.Login : MultipleAdminPortalCredentialsHelper.GetFormattedLoginString(index);
            var password = index.IsNullOrEmpty() ? AdminPortalCredentialsProvider.Password : MultipleAdminPortalCredentialsHelper.Password;
            customerName = customerName.AddRandom(_sessionRandom);
            var tenant = _customers.Value.First(x => x.Name.Equals(customerName));
            var token = _userDataList.GetTokenFromUserDataList(login, password);
            acceptBulaMethod(token, tenant.Id); 
        }

        public void AdminAcceptsBULAAddendumTermsViaAPI(string customerName, string index = null)
        {
            AdminAcceptsBULATermsCommon(customerName, index, (token, tenantId) =>
            {
              _restClient.FrontendV1Client.InitApiMethods<BulaApiMethods>().ProcessBulaAddendum(token, tenantId);
            });
        }

        public void AdminAcceptsBULATermsViaAPI(string customerName, string index = null)
        {
            AdminAcceptsBULATermsCommon(customerName, index, (token, tenantId) =>
            {
                _restClient.FrontendV1Client.InitApiMethods<BulaApiMethods>().AcceptBula(token, tenantId);
            });
        }
    }
}