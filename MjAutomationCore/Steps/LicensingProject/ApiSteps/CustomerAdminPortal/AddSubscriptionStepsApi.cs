using AutomationUtils.Api;
using AutomationUtils.Extensions;
using Microsoft.IdentityModel.Tokens;
using MjAutomationCore.DTO.LicensingDTO.CustomerAdminPortal;
using MjAutomationCore.DTO.LicensingDTO.RunTimeVariables.Salesportal;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Extensions;
using MjAutomationCore.General.Api.Account;
using MjAutomationCore.General.Api.CustomerAdminPortal;
using MjAutomationCore.Providers.Licensing;
using System.Collections.Generic;
using Reqnroll;
using Reqnroll.Assist;

namespace MjAutomationCore.Steps.LicensingProject.CustomerAdminPortal
{
    [Binding]
    class AddSubscriptionStepsApi : BaseApiMethods
    {
        protected readonly RestWebClient _restClient;
        protected readonly CustomersDto _customers;
        protected readonly SubscriptionActionDTO _subscription;
        private readonly SessionRandomValue _sessionRandom;
        public AddSubscriptionStepsApi(RestWebClient restClient, CustomersDto customers, SubscriptionActionDTO subscription, SessionRandomValue sessionRandom)
        {
            _restClient = restClient;
            _customers = customers;
            _subscription = subscription;
            _sessionRandom = sessionRandom;
        }

        [When(@"'(.*)' Admin makes subscription action via API")]
        public void WhenAdminMakesSubscriptionActionViaAPI(string admin, Table table)
        {
            AdminMakesSubscriptionActionViaAPI(admin, table);
        }

        [When(@"'([^']*)' Admin '([^']*)' makes subscription action via API")]
        public void WhenAdminMakesSubscriptionActionViaAPI(string admin, string index, Table table)
        {
            AdminMakesSubscriptionActionViaAPI(admin, table, index);
        }

        public void AdminMakesSubscriptionActionViaAPI(string admin, Table table, string index = null)
        {
            var login = index.IsNullOrEmpty() ? AdminPortalCredentialsProvider.Login : MultipleAdminPortalCredentialsHelper.GetFormattedLoginString(index);
            var password = index.IsNullOrEmpty() ? AdminPortalCredentialsProvider.Password : MultipleAdminPortalCredentialsHelper.Password;

            var actions = table.CreateSet<SubscriptionActionDTO>();
            foreach (SubscriptionActionDTO action in actions)
            {
                admin = admin.AddRandom(_sessionRandom);
                List<string> emails = new List<string>();
                foreach (string email in action.Email)
                {
                    emails.Add(email.AddRandom(_sessionRandom));
                }
                action.Email = emails;
                action.CopyPropertiesTo(_subscription);
                var idToken = _restClient.FrontendV1Client.InitApiMethods<SignInApiMethods>().ExtractIdToken(_restClient.FrontendV1Client.InitApiMethods<SignInApiMethods>()
                .PostSignInRequest(login, password));
                _restClient.FrontendV1Client.InitApiMethods<SubscriptionActionApi>().SubscriptionAction(admin, _customers, idToken, _subscription);
            }
        }
   
    }
}