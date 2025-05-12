using AutomationUtils.Extensions;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.General.Api.ApplicationStatus;
using MjAutomationCore.Utils;
using Reqnroll;

namespace MjAutomationCore.Steps.ApiSteps
{
    [Binding]
    class ServerStatusApiSteps : ReqnrollContext
    {
        protected readonly RestWebClient _restClient;
        private readonly ApiResponseHelper _apiResponseHelper;
        public ServerStatusApiSteps(RestWebClient restClient, ApiResponseHelper apiResponseHelper)
        {
            _restClient = restClient;
            _apiResponseHelper = apiResponseHelper;
        }

        [When(@"User performs request to get application status of MindManager app")]
        public void WhenUserPerformsRequestToGetApplicationStatusOfMindManagerApp()
        {
            var response = _restClient.FrontendV1Client.InitApiMethods<ApplicationStatusApiMethods>().GetStatusV1();
            _apiResponseHelper.SetResponse(response);
        }
    }
}