using AutomationUtils.Extensions;
using AutomationUtils.Utils;
using MjAutomationCore.DTO.ApiRequestDto.CreateNewObject;
using MjAutomationCore.DTO.BaseDto.AccountDTO;
using MjAutomationCore.DTO.LicensingDTO.RunTimeVariables.ApiResponse;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.General.Api;
using MjAutomationCore.Utils;
using Newtonsoft.Json;
using System;
using Reqnroll;
using Reqnroll.Assist;

namespace MjAutomationCore.Steps.ApiSteps
{
    [Binding]
    public class LicenseManagerApiSteps : ReqnrollContext
    {
        protected readonly RestWebClient _restClient;
        private readonly ApiResponseHelper _apiResponseHelper;
        private readonly UserDataDto _userData;

        public LicenseManagerApiSteps(RestWebClient restClient,
            ApiResponseHelper apiResponseHelper, UserDataDto userData)
        {
            _restClient = restClient;
            _apiResponseHelper = apiResponseHelper;
            _userData = userData;
        }

        [When(@"newly created user performs request to activate trial license")]
        public void WhenNewlyCreatedUserPerformsRequestToActivateTrialLicense(Table table)
        {
            var trialLicenseRequest = table.CreateInstance<TrialLicenseApi>();
            var idToken = _userData.IdToken;
            var response = _restClient.BackendV1Client.InitApiMethods<LicenseManagerApi>().PostTrialLicenseActivationRequest(idToken, trialLicenseRequest);
            _apiResponseHelper.SetResponse(response);
        }

        [When(@"User performs license status verification request for product version '(.*)'")]
        public void WhenUserPerformsLicenseStatusVerificationRequestForProductVersion(string productVersion)
        {
            var idToken = _userData.IdToken;
            var response = _restClient.BackendV1Client.InitApiMethods<LicenseManagerApi>().PostLicenseVerificationRequest(idToken, productVersion);
            _apiResponseHelper.SetResponse(response);
        }

        [Then(@"'(.*)' license is active for newly created user")]
        public void ThenLicenseIsActiveForNewlyCreatedUser(string expectedProductId)
        {
            var response = _apiResponseHelper.GetResponse();
            SubscriptionResponse subscriptionResponse;
            try
            {
                subscriptionResponse = JsonConvert.DeserializeObject<SubscriptionResponse>(response.Content);
            }
            catch (JsonException ex)
            {
                throw new InvalidOperationException($"JSON deserialization failed. Please check the response format. Error: {ex.Message}");

            }
            if (!subscriptionResponse.Eligible)
                Verify.IsTrue(subscriptionResponse.Eligible, $"License is not assigned. Reason: {subscriptionResponse.Reason}");

            var subscription = subscriptionResponse.Subscription;
            if (subscriptionResponse.Subscription == null)
                Verify.That(subscription != null, $"Subscription data is missing in the response. Full response: {response.Content}");
            Verify.AreEqual(expectedProductId, subscription.ProductId, $"Product ID mismatch. Expected: '{expectedProductId}', but got: '{subscription.ProductId}");
            Verify.AreEqual("Active", subscription.Status, $"Expected license status to be 'Active', but the actual status was '{subscription.Status}'");
        }
    }
}