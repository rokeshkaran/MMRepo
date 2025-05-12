using SeleniumAutomationUtils.SeleniumExtensions;
using MjAutomationCore.DTO.LicensingDTO.RunTimeVariables;
using MjAutomationCore.DTO.LicensingDTO.RunTimeVariables.Salesportal;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Extensions;
using MjAutomationCore.General.Api.Salesportal;
using MjAutomationCore.Providers;
using MjAutomationCore.Utils;
using OpenQA.Selenium.Remote;
using System;
using System.Linq;
using System.Threading;
using Reqnroll;
using AutomationUtils.Extensions;
using OpenQA.Selenium;
using MjAutomationCore.Providers.Base;

namespace MjAutomationCore.Steps.LicensingProject.Base
{
    [Binding]
    class OpenWebsite : ReqnrollContext
    {
        private WebDriver _driver;
        private readonly BrowsersList _browsersList;
        private readonly SessionRandomValue _sessionRandom;
        protected readonly RestWebClient _restClient;
        protected readonly CustomersDto _customers;

        public OpenWebsite(WebDriver driver, SessionRandomValue sessionRandom, RestWebClient restClient,
            BrowsersList browsersList, CustomersDto customers)
        {
            _driver = driver;
            _browsersList = browsersList;
            _sessionRandom = sessionRandom;
            _restClient = restClient;
            _customers = customers;
        }

        [Given(@"User is on the Mindmanager Sales portal website")]
        public void GivenUserIsOnTheMindmanagerSalesPortalWebsite()
        {
            _driver.Navigate().GoToUrl(UrlProvider.SalesPortalUrl);
        }

        [Given(@"User is on Customer Admin Portal website")]
        public void GivenUserIsOnCustomerAdminPortalWebsite()
        {
            var env = EnvironmentProvider.Env.Equals("envappQA") || EnvironmentProvider.Env.Equals("envQa")
                || EnvironmentProvider.Env.Equals("envStaging") || EnvironmentProvider.Env.Equals("envappStaging");
            var token = env ? $"?captcha-token={CaptchaTokenProvider.CaptchaToken}" : string.Empty;
            _driver.Navigate().GoToUrl(UrlProvider.CustomerAdminPortalUrl + token);
        }

        [Given(@"User is on the Mindmanager License support website")]
        public void GivenUserIsOnTheMindmanagerLicenseSupportWebsite()
        {
            _driver.Navigate().GoToUrl(UrlProvider.LicenseSupportUrl);
        }

        [When(@"User redirect by reglink for '(.*)' customer")]
        public void WhenUserRedirectByReglinkForCustomer(string customerName)
        {
            customerName = customerName.AddRandom(_sessionRandom);
            var env = EnvironmentProvider.Env.Equals("envappQA") || EnvironmentProvider.Env.Equals("envQa")
                || EnvironmentProvider.Env.Equals("envStaging") || EnvironmentProvider.Env.Equals("envappStaging");
            var token = env ? $"&captcha-token={CaptchaTokenProvider.CaptchaToken}" : string.Empty;

            if (_customers.Value.Any(x => x.Name.Equals(customerName)))
            {
                _browsersList.Active.Navigate().GoToUrl(_customers.Value.First(x => x.Name.Equals(customerName)).Reglink + token);
            }
            else
            {
                var customer = _restClient.FrontendV1Client.InitApiMethods<CustomerApi>().GetCustomerDetailsByName(customerName);
                _browsersList.Active.Navigate().GoToUrl(customer.Reglink + token);
            }
            _browsersList.Active.WaitForDataLoading();
        }

        [When(@"User redirect by reglink '(.*)'")]
        public void WhenUserRedirectByReglink(string link)
        {
            _browsersList.Active.Navigate().GoToUrl(link);
        }
    }
}