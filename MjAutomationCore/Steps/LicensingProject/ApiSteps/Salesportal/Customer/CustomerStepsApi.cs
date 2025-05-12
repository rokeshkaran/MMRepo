using AutomationUtils.Extensions;
using AutomationUtils.Utils;
using MjAutomationCore.DTO.LicensingDTO.RunTimeVariables.Salesportal;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Extensions;
using MjAutomationCore.General.Api.Salesportal;
using System.Linq;
using Reqnroll;

namespace MjAutomationCore.Steps.LicensingProject.Salesportal
{
    [Binding]
    class CustomerStepsApi : ReqnrollContext
    {
        protected readonly RestWebClient _restClient;
        protected readonly CustomersDto _customers;
        private readonly SessionRandomValue _sessionRandom;

        public CustomerStepsApi(RestWebClient restClient, CustomersDto customers, SessionRandomValue sessionRandom)
        {
            _restClient = restClient;
            _customers = customers;
            _sessionRandom = sessionRandom;
        }

        [When(@"User creates new Customer on Sales portal via Api")]
        public void WhenUserCreatesNewCustomerOnSalesPortalViaApi(Table table)
        {
            var customers = table.CreateSet<CustomerDto>();
            foreach (CustomerDto customer in customers)
            {
                customer.Name = customer.Name.AddRandom(_sessionRandom);
                var content = _restClient.FrontendV1Client.InitApiMethods<CustomerApi>()
                    .AddNewCustomer(customer);
                customer.Id = content.Id;
                customer.Reglink = content.Reglink;
            }

            _customers.Value.AddRange(customers);
        }

        [Then(@"customer with '(.*)' name has exist on Sales portal")]
        public void ThenCustomerWithNameHasExistOnSalesPortal(string customerName)
        {
            customerName = customerName.AddRandom(_sessionRandom);

            if (_customers.Value.Any(x => x.Name.Equals(customerName)))
            {
                Verify.IsTrue(_restClient.FrontendV1Client.InitApiMethods<CustomerApi>()
                    .CastomerExistesOnPortal(_customers.Value.First(x => x.Name.Equals(customerName)).Id),
                    $"Customer with name '{customerName}' is not exist on Sales portal");
            }
            else Verify.IsTrue(_restClient.FrontendV1Client.InitApiMethods<CustomerApi>().CastomerExistes(customerName),
                $"Customer with name '{customerName}' is not exist on Sales portal");
        }

        [Then(@"customer with '(.*)' name has not exist on Sales portal")]
        public void ThenCustomerWithNameHasNotExistOnSalesPortal(string customerName)
        {
            customerName = customerName.AddRandom(_sessionRandom);
            if (_customers.Value.Any(x => x.Name.Equals(customerName)))
            {
                Verify.IsFalse(_restClient.FrontendV1Client.InitApiMethods<CustomerApi>()
                    .CastomerExistesOnPortal(_customers.Value.First(x => x.Name.Equals(customerName)).Id),
                    $"Customer with name '{customerName}' is exist on Sales portal");
            }
            else Verify.IsFalse(_restClient.FrontendV1Client.InitApiMethods<CustomerApi>().CastomerExistes(customerName),
                $"Customer with name '{customerName}' is exist on Sales portal");
        }

        [Then(@"'(.*)' Customer has '(.*)' type in Sales portal via Api")]
        public void ThenCustomerHasTypeInSalesPortalViaApi(string customerName, string type)
        {
            customerName = customerName.AddRandom(_sessionRandom);
            if (_customers.Value.Any(x => x.Name.Equals(customerName)))
            {
                Verify.AreEqual(_restClient.FrontendV1Client.InitApiMethods<CustomerApi>()
                    .GetCustomerById(_customers.Value.First(x => x.Name.Equals(customerName)).Id).Type, type, $"'{customerName}' customer has not '{type}' type");
            }
            else Verify.AreEqual(_restClient.FrontendV1Client.InitApiMethods<CustomerApi>()
                .GetCustomerDetailsByName(customerName).Type, type, $"'{customerName}' customer has not '{type}' type");
        }

        [When(@"User updates data for '(.*)' customer in Sales portal via Api")]
        public void WhenUserUpdatesDataForCustomerInSalesPortalViaApi(string customerName, Table table)
        {
            customerName = customerName.AddRandom(_sessionRandom);
            var customers = table.CreateInstance<CustomerDto>();
            if (_customers.Value.Any(x => x.Name.Equals(customerName)))
            {
                _restClient.FrontendV1Client.InitApiMethods<CustomerApi>().UpdatingExistingCustomer(customers, _customers.Value.First(x => x.Name.Equals(customerName)).Id);
            }
            else
            {
                var customerId = _restClient.FrontendV1Client.InitApiMethods<CustomerApi>().GetCustomerDetailsByName(customerName).Id;
                _restClient.FrontendV1Client.InitApiMethods<CustomerApi>().UpdatingExistingCustomer(customers, customerId);
            }
        }

        [When(@"User removes customer with '(.*)' name on Sales portal via Api")]
        public void WhenUserRemovesCustomerWithNameOnSalesPortalViaApi(string customerName)
        {
            customerName = customerName.AddRandom(_sessionRandom);
            if (_customers.Value.Any(x => x.Name.Equals(customerName)))
            {
                _restClient.FrontendV1Client.InitApiMethods<CustomerApi>().DeleteCustomer(_customers.Value.First(x => x.Name.Equals(customerName)));
            }
            else _restClient.FrontendV1Client.InitApiMethods<CustomerApi>().
                    DeleteCustomer(_restClient.FrontendV1Client.InitApiMethods<CustomerApi>().GetCustomerDetailsByName(customerName));
        }

        [When(@"'(.*)' Customer transfers '(.*)' purchases to '(.*)' Сustomer via Api")]
        public void WhenCustomerTransfersPurchasesToCustomerViaApi(string firstСustomerName, string purchaseName, string secondСustomerName)
        {
            firstСustomerName = firstСustomerName.AddRandom(_sessionRandom);
            secondСustomerName = secondСustomerName.AddRandom(_sessionRandom);
            var PurchaseID = _customers.Value.First(x => x.Name.Equals(firstСustomerName)).Purchases.First(x => x.ProductId.Equals(purchaseName)).PurchaseId;
            var customerID = _customers.Value.First(x => x.Name.Equals(secondСustomerName)).Id;
            _restClient.FrontendV1Client.InitApiMethods<CustomerApi>().TransferLicenses(PurchaseID, customerID);
        }
    }
}