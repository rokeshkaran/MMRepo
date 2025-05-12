using System;
using System.Linq;
using SeleniumAutomationUtils.SeleniumExtensions;
using AutomationUtils.Utils;
using MjAutomationCore.DTO.LicensingDTO.RunTimeVariables.Salesportal;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.General.Api.Salesportal;
using Reqnroll;
using AutomationUtils.Extensions;

namespace MjAutomationCore.Steps.LicensingProject.Salesportal.BeforeAfterScenario
{
    [Binding]
    class CustomeBeforeAfterScenario : ReqnrollContext
    {
        protected readonly RestWebClient _restClient;
        protected readonly CustomersDto _customers;

        public CustomeBeforeAfterScenario(RestWebClient restClient, CustomersDto customers)
        {
            _restClient = restClient;
            _customers = customers;
        }

        [AfterScenario("Cleanup")]
        public void DeleteCustomerByName()
        {
            if (!_customers.Value.Any())
                return;

            foreach (CustomerDto customer in _customers.Value)
            {
                try
                {
                    _restClient.FrontendV1Client.InitApiMethods<CustomerApi>().DeleteCustomer(customer);
                }
                catch (Exception e)
                {
                    Logger.Write($"Unable to delete customer view API: {e}", Logger.LogLevel.Error);
                }
            }
        }
    }
}