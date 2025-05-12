using AutomationUtils.Extensions;
using AutomationUtils.Utils;
using MjAutomationCore.DTO.BaseDto.AccountDTO;
using MjAutomationCore.DTO.BaseDto.RunTimeVariables.Account;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.General.Api.Account;
using MjAutomationCore.Providers.Licensing;
using System;
using System.Linq;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.Account
{
    [Binding]
    class AccountBeforeAfterScenario : ReqnrollContext
    {
        protected readonly RestWebClient _restClient;
        private readonly UserDataList _userDataList;


        public AccountBeforeAfterScenario(RestWebClient restClient, UserDataList userDataList)
        {
            _restClient = restClient;
            _userDataList = userDataList;
        }

        [AfterScenario("Cleanup")]
        public void DeleteUserByName()
        {
            var userList = _userDataList.Value.FindAll(x => x.IsNewUser);
            if (!userList.Any())
            {
                return;
            }
            foreach (UserDataDto user in userList)
            {
                try
                {   
                    if (string.IsNullOrEmpty(user.IdToken))
                    {
                        var userIdToken = _restClient.FrontendV1Client.InitApiMethods<SignInApiMethods>().SignInUser(user.Email, user.Password).IdToken;
                        user.IdToken = userIdToken;
                    }
                    if (string.IsNullOrEmpty(user.UserId))
                    {
                        var userId = _restClient.FrontendV1Client.InitApiMethods<AccountApiMethods>().GetSignupRequest(user.IdToken).Id;
                        user.UserId = userId;
                    }
                    var idAdminToken = _restClient.FrontendV1Client.InitApiMethods<SignInApiMethods>().ExtractIdToken(_restClient.FrontendV1Client.InitApiMethods<SignInApiMethods>()
                    .PostSignInRequest(UserAdminPortalProvider.AdminLogin, UserAdminPortalProvider.AdminPassword));
                    _restClient.FrontendV1Client.InitApiMethods<AccountApiMethods>().DeleteUserAccount(user.UserId, idAdminToken);
                }
                catch (Exception e)
                {
                    Logger.Write($"Unable to delete User account via API: {e}", Logger.LogLevel.Error);
                }
            }
        }
    }
}