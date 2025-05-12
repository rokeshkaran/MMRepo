using AutomationUtils.Extensions;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Extensions;
using MjAutomationCore.General.Api.Account;
using MjAutomationCore.Utils;
using Reqnroll;

namespace MjAutomationCore.Steps.ApiSteps
{
    [Binding]
    class ForgotPasswordApiSteps : ReqnrollContext
    {
        protected readonly RestWebClient _restClient;
        private readonly SessionRandomValue _sessionRandom;
        private readonly ApiResponseHelper _apiResponseHelper;

        public ForgotPasswordApiSteps(RestWebClient restClient, SessionRandomValue sessionRandom,
            ApiResponseHelper apiResponseHelper)
        {
            _restClient = restClient;
            _sessionRandom = sessionRandom;
            _apiResponseHelper = apiResponseHelper;
        }

        [When(@"User performs password recovery request using email '([^']*)'")]
        public void WhenUserPerformsPasswordRecoveryRequestUsingEmail(string userEmail)
        {
            userEmail = userEmail.AddRandom(_sessionRandom);
            var apiResponse = _restClient.BackendV1Client.InitApiMethods<ForgotPasswordApiMethods>().PostForgotPasswordRequest(userEmail);
            _apiResponseHelper.SetResponse(apiResponse);
        }
    }
}