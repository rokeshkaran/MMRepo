using AutomationUtils.Extensions;
using MjAutomationCore.DTO.BaseDto.AccountDTO;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.General.Api.Account;
using MjAutomationCore.Utils;
using Reqnroll;

namespace MjAutomationCore.Steps.ApiSteps
{
    [Binding]
    class UserInfoApiSteps : ReqnrollContext
    {
        protected readonly RestWebClient _restClient;
        private readonly ApiResponseHelper _apiResponseHelper;
        protected readonly UserDataDto _userData;
        public UserInfoApiSteps(RestWebClient restClient, ApiResponseHelper apiResponseHelper, UserDataDto userData)
        {
            _restClient = restClient;
            _apiResponseHelper = apiResponseHelper;
            _userData = userData;
        }

        [When(@"User performs request to get user info data of MindManager app")]
        public void WhenUserPerformsRequestToGetUserInfoDataOfMindManagerApp()
        {
            var response = _restClient.FrontendV1Client.InitApiMethods<AccountApiMethods>().GetUserData(_userData.IdToken);
            _apiResponseHelper.SetResponse(response);
        }
    }
}