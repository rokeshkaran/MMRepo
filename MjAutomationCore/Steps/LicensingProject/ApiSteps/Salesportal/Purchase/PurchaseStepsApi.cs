using System;
using System.Linq;
using SeleniumAutomationUtils.SeleniumExtensions;
using AutomationUtils.Utils;
using MjAutomationCore.DTO.LicensingDTO.RunTimeVariables.Salesportal;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Extensions;
using MjAutomationCore.General.Api.Salesportal;
using Reqnroll;
using Reqnroll.Assist;
using AutomationUtils.Extensions;

namespace MjAutomationCore.Steps.LicensingProject.Salesportal
{
    [Binding]
    class PurchaseStepsApi : ReqnrollContext
    {
        protected readonly RestWebClient _restClient;
        protected readonly CustomersDto _customers;
        protected readonly PurchasesDto _purchases;
        private readonly SessionRandomValue _sessionRandom;

        public PurchaseStepsApi(RestWebClient restClient, CustomersDto customers, PurchasesDto purchases, SessionRandomValue sessionRandom)
        {
            _restClient = restClient;
            _customers = customers;
            _purchases = purchases;
            _sessionRandom = sessionRandom;
        }

        [When(@"User creates new Purchase on Sales portal via Api")]
        public void WhenUserCreatesNewPurchaseOnSalesPortalViaApi(Table table)
        {
            var purchases = table.CreateSet<PurchaseDto>();
            foreach (PurchaseDto purchase in purchases)
            {
                purchase.CustomerName = purchase.CustomerName.AddRandom(_sessionRandom);
                var tenantId = _customers.Value.First(x => x.Name.Equals(purchase.CustomerName)).Id;
                var purchaseCodeID = _restClient.FrontendV1Client.InitApiMethods<PurchaseApi>().AddNewPurchase(purchase, tenantId);
                purchase.PurchaseId = purchaseCodeID;
                var customer = _customers.Value.First(x => x.Name.Equals(purchase.CustomerName));
                customer.Purchases.Add(purchase);
            }
        }

        [When(@"User creates new Promo Purchase on Sales portal via Api")]
        public void WhenUserCreatesNewPromoPurchaseOnSalesPortalViaApi(Table table)
        {
            var purchases = table.CreateSet<PurchaseDto>();
            foreach (PurchaseDto purchase in purchases)
            {
                purchase.CustomerName = purchase.CustomerName.AddRandom(_sessionRandom);
                purchase.ProductLabel = purchase.ProductLabel.AddRandom(_sessionRandom);
                var tenantId = _customers.Value.First(x => x.Name.Equals(purchase.CustomerName)).Id;
                var purchaseCodeID = _restClient.FrontendV1Client.InitApiMethods<PurchaseApi>().AddPromoPurchase(purchase, tenantId);
                purchase.PurchaseId = purchaseCodeID;
                var customer = _customers.Value.First(x => x.Name.Equals(purchase.CustomerName));
                customer.Purchases.Add(purchase);
            }
        }

        [When(@"User updates '(.*)' purchase data for '(.*)' customer in Sales portal via Api")]
        public void WhenUserUpdatesPurchaseDataForCustomerInSalesPortalViaApi(string purchaseName, string customerName, Table table)
        {
            var purchase = table.CreateInstance<PurchaseDto>();
            customerName = customerName.AddRandom(_sessionRandom);
            var purchaseId = _customers.Value.First(x => x.Name.Equals(customerName)).Purchases.First(x => x.ProductId.Equals(purchaseName)).PurchaseId;
            _restClient.FrontendV1Client.InitApiMethods<PurchaseApi>().ChangePurchaseInformation(purchase, purchaseId);
        }

        [When(@"User remove '(.*)' Purchase for '(.*)' Customer in Sales portal via Api")]
        public void WhenUserRemovePurchaseForCustomerInSalesPortalViaApi(string purchaseName, string customerName)
        {
            customerName = customerName.AddRandom(_sessionRandom);
            var getPurchases = _restClient.FrontendV1Client.InitApiMethods<PurchaseApi>().
            GetPurchasesFromCustomer(customerName);
            var purchaseId = getPurchases.First(x => x.ProductId.Equals(purchaseName)).PurchaseId;
            _restClient.FrontendV1Client.InitApiMethods<PurchaseApi>().DeletePurchaseById(purchaseId);
        }

        [Then(@"all Purchases have been saved")]
        public void ThenAllPurchasesHaveBeenSaved()
        {
            foreach (PurchaseDto purchase in _purchases.Value)
            {
                var getPurchaseResponse = _restClient.FrontendV1Client.InitApiMethods<PurchaseApi>().GetPurchaseDetails(purchase);
                var purchaseValue = _purchases.Value.First(x => x.PurchaseId.Equals(getPurchaseResponse.PurchaseId));
                if (!string.IsNullOrEmpty(purchaseValue.CustomerName))
                {
                    Verify.AreEqual(getPurchaseResponse.CustomerName, purchaseValue.CustomerName, "Customer name is not exists");
                }
                if (!string.IsNullOrEmpty(purchaseValue.ProductId))
                {
                    Verify.AreEqual(getPurchaseResponse.ProductId, purchaseValue.ProductId, "Product Id is not exists");
                }
                if (!string.IsNullOrEmpty(purchaseValue.Seats))
                {
                    Verify.AreEqual(getPurchaseResponse.Seats, purchaseValue.Seats, "Seats is not exists");
                }
                //if (!string.IsNullOrEmpty(purchaseValue.TenantId))
                //{
                //    Verify.AreEqual(getPurchaseResponse.TenantId, purchaseValue.TenantId, "Tenant Id is not exists");
                //}
            }
        }

        [Then(@"'(.*)' purchase has exist for '(.*)' customer on Sales portal")]
        public void ThenPurchaseHasExistForCustomerOnSalesPortal(string purchaseName, string customerName)
        {
            customerName = customerName.AddRandom(_sessionRandom);
            Verify.IsTrue(_restClient.FrontendV1Client.InitApiMethods<PurchaseApi>().PurchaseByNameExists(purchaseName, customerName),
                $"'{customerName}' сustomer has not '{purchaseName}' purchase on Sales portal");
        }

        [Then(@"'(.*)' purchase has not exist for '(.*)' customer on Sales portal")]
        public void ThenPurchaseHasNotExistForCustomerOnSalesPortal(string purchaseName, string customerName)
        {
            customerName = customerName.AddRandom(_sessionRandom);
            Verify.IsFalse(_restClient.FrontendV1Client.InitApiMethods<PurchaseApi>().PurchaseByNameExists(purchaseName, customerName),
                $"'{customerName}' сustomer has '{purchaseName}' purchase on Sales portal");
        }

        [Then(@"following information about '(.*)' purchase for customer '(.*)' is displayed in Sales portal via Api")]
        public void ThenFollowingInformationAboutPurchaseForCustomerIsDisplayedInSalesPortalViaApi(string purchaseName, string customerName, Table table)
        {
            var purchase = table.CreateInstance<PurchaseDto>();
            customerName = customerName.AddRandom(_sessionRandom);
            var getPurchases = _restClient.FrontendV1Client.InitApiMethods<PurchaseApi>().
            GetPurchasesFromCustomer(customerName);
            if (!getPurchases.Any(x=>x.ProductId.Equals(purchaseName)))
            {
                throw new Exception($"'{customerName}' сustomer has not '{purchaseName}' purchase");
            }

            var response = getPurchases.First(x => x.ProductId.Equals(purchaseName));
            if (!string.IsNullOrEmpty(purchase.Seats))
            {
                Verify.AreEqual(response.Seats, purchase.Seats, "Number of seats is displayed incorrectly");
            }
            if (!string.IsNullOrEmpty(purchase.UsedSeats))
            {
                Verify.AreEqual(response.UsedSeats, purchase.UsedSeats, "Number of used seats is displayed incorrectly");
            }
            if (!string.IsNullOrEmpty(purchase.EndDateIso))
            {
                Verify.AreEqual(response.EndDateIso.DateIso().DateFormat(), purchase.EndDateIso.Date().
                DateIso().DateFormat(), "Date is displayed incorrectly");
            }
        }
    }
}