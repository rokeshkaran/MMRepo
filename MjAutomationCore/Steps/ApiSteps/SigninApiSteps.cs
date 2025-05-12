using AutomationUtils.Extensions;
using MjAutomationCore.DTO.BaseDto.AccountDTO;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.General.Api.Account;
using MjAutomationCore.Providers.UserProvider;
using MjAutomationCore.Utils;
using Newtonsoft.Json;
using Reqnroll;

namespace MjAutomationCore.Steps.ApiSteps
{
    [Binding]
    class SigninApiSteps : ReqnrollContext
    {
        protected readonly RestWebClient _restClient;
        private readonly ApiResponseHelper _apiResponseHelper;
        private readonly UserDataDto _userData;
        public SigninApiSteps(RestWebClient restClient, ApiResponseHelper apiResponseHelper, UserDataDto userData)
        {
            _restClient = restClient;
            _apiResponseHelper = apiResponseHelper;
            _userData = userData;
        }

        [When(@"User performs signin request for MindManager app")]
        public void WhenUserPerformsSigninRequestForMindManagerApp()
        {
            var response = _restClient.FrontendV1Client.InitApiMethods<SignInApiMethods>().PostSignInRequest(RegularUserProvider.Email, RegularUserProvider.Password);
            _apiResponseHelper.SetResponse(response);
            var signInResponse = JsonConvert.DeserializeObject<SignInResponseDto>(response.Content);
            _userData.SetTokens(signInResponse.IdToken, signInResponse.RefreshToken);
        }

        [When(@"User performs signin request using newly created account for MindManager app")]
        public void WhenUserPerformsSigninRequestUsingNewlyCreatedAccountForMindManagerApp()
        {
            var response = _restClient.FrontendV1Client.InitApiMethods<SignInApiMethods>().PostSignInRequest(_userData.Email, _userData.Password);
            _apiResponseHelper.SetResponse(response);
        }
    }
}