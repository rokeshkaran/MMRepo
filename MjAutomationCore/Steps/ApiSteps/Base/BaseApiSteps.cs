using AutomationUtils.Utils;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Utils;
using Reqnroll;

namespace MjAutomationCore.Steps.ApiSteps.Base
{
    [Binding]
    public class BaseApiSteps : ReqnrollContext
    {
        protected readonly RestWebClient _restClient;
        private readonly ApiResponseHelper _apiResponseHelper;
        public BaseApiSteps(RestWebClient restClient, ApiResponseHelper apiResponseHelper)
        {
            _restClient = restClient;
            _apiResponseHelper = apiResponseHelper;
        }

        [Then(@"response status code should be '([^']*)'")]
        public void ThenResponseStatusCodeShouldBe(int expectedStatusCode)
        {
            var response = _apiResponseHelper.GetResponse();
            int statusCode = (int)response.StatusCode;
            Verify.IsTrue(statusCode.Equals(expectedStatusCode),
                    $"Invalid status code. Expected status code: {expectedStatusCode}. Actual status code: {statusCode}");
        }

        [Then(@"response content should be '([^']*)'")]
        public void ThenResponseContentShouldBe(string expectedContent)
        {
            var response = _apiResponseHelper.GetResponse();
            Verify.IsTrue(response.Content.Contains(expectedContent),
                $"Invalid response content. Expected: {expectedContent}. Actual: {response.Content}");
        }
    }
}