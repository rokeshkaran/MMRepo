using System.Linq;
using SeleniumAutomationUtils.SeleniumExtensions;
using MjAutomationCore.Components.Licensing;
using MjAutomationCore.DTO.LicensingDTO.RunTimeVariables.Salesportal;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Extensions;
using MjAutomationCore.General.Api.Salesportal;
using OpenQA.Selenium.Remote;
using Reqnroll;
using AutomationUtils.Extensions;
using OpenQA.Selenium;

namespace MjAutomationCore.Steps.LicensingProject.AdminHome
{
    [Binding]
    class AdminHomeSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        protected readonly RestWebClient _restClient;
        protected readonly PurchaseDto _purchaseDto;
        protected readonly CustomersDto _customers;
        private readonly SessionRandomValue _sessionRandom;
        public AdminHomeSteps(WebDriver driver, RestWebClient restClient, PurchaseDto purchaseDto, SessionRandomValue sessionRandom, CustomersDto customers)
        {
            _driver = driver;
            _restClient = restClient;
            _purchaseDto = purchaseDto;
            _sessionRandom = sessionRandom;
            _customers = customers;
        }

        [When(@"User find purchase ID for '(.*)' customer in '(.*)' column of '(.*)' table and clicks '(.*)' button")]
        public void WhenUserFindPurchaseIDForCustomerInColumnOfTableAndClicksButton(string value, string columnName, string tableName, string buttonName)
        {
            value = value.AddRandom(_sessionRandom);
            _purchaseDto.CustomerName = value;
            var purchaseId = _restClient.FrontendV1Client.InitApiMethods<PurchaseApi>().GetPurchase(_purchaseDto).PurchaseId;
            _driver.Component<Tables>(tableName).GetButtonByName(columnName, purchaseId, buttonName).Click();
        }

        [When(@"User finds '(.*)' purchase for '(.*)' product in '(.*)' column of '(.*)' table and clicks '(.*)' button")]
        public void WhenUserFindsPurchaseForProductInColumnOfTableAndClicksButton(int index, string productName, string columnName, string tableName, string buttonName)
        {
            var customer = _customers.Value.Select(x=>x.Purchases.Count());
        }
    }
}
