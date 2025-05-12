using MjAutomationCore.DTO.LicensingDTO.RunTimeVariables.Salesportal;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Providers;
using MjAutomationCore.Providers.Base;
using MjAutomationCore.Utils;
using OpenQA.Selenium;
using SeleniumAutomation.Framework;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject
{
    [Binding]
    class OpenWebsite : ReqnrollContext
    {
        private readonly ValuesText _valuesText;
        private readonly BrowsersList _browsersList;
        protected readonly CustomersDto _customers;
        protected readonly RestWebClient _restClient;
        private readonly LinkInviteOthersToEdit _linkToEdit;
        private readonly WebDriver _driver;

        public OpenWebsite(WebDriver driver, BrowsersList browsersList, ValuesText valuesText, CustomersDto customers, RestWebClient restClient, LinkInviteOthersToEdit linkToEdit)
        {
            _browsersList = browsersList;
            _valuesText = valuesText;
            _customers = customers;
            _restClient = restClient;
            _linkToEdit = linkToEdit;
            _driver = driver;
        }

        private static class Singleton
        {
            private static int iter = 0;
            public static string GetValue()
            {
                iter++;
                if (iter > GetUserFromFile().Count)
                {
                    iter = 0;
                }

                return GetUserFromFile()[0];
            }
        }

        public static List<string> GetUserFromFile()
        {
            return File.ReadAllLines(FileSystemHelper.GeneratePathToEmbedded("PerformanceUsers.csv")).ToList();
        }

        [Given(@"User is on the Mindmanager website without captcha key")]
        public void GivenUserIsOnTheMindmanagerWebsiteWithoutCaptchaKey()
        {
            _browsersList.Active.Navigate().GoToUrl(UrlProvider.Url);
        }

        [Given(@"User is on the Mindmanager website")]
        public void GivenUserIsOnTheMindmanagerWebsite()
        {
            var windowSize = _browsersList.Active.Manage().Window.Size;
            Logger.Write($"Browser window size: Width = {windowSize.Width}, Height = {windowSize.Height}");

            _browsersList.Active.Navigate().GoToUrl(UrlProvider.Url);

            for (int i = 0; i < 30; i++)
            {
                try
                {
                    var url = _browsersList.Active.Url;
                    if (url.Contains("authenticate"))
                    {
                        _browsersList.Active.Navigate().GoToUrl(url + $"&captcha-token={CaptchaTokenProvider.CaptchaToken}");
                        return;
                    }
                }
                finally { Thread.Sleep(200); }
            }
            throw new Exception($"URL has not been changed");
        }

        [Given(@"User is on the Mindjet Store page")]
        public void GivenUserIsOnTheMindjetStorePage()
        {
            _browsersList.Active.Navigate().GoToUrl(UrlProvider.UrlMindjetStore);
        }

        [When(@"'(.*)' User opens shared map link in browser")]
        public void WhenUserOpensSharedMapLinkInBrowser(int count)
        {
            _browsersList.Active.Navigate().GoToUrl(_linkToEdit.Value);
        }

        [When(@"User leaves a session")]
        public void WhenUserLeavesASession()
        {
            _browsersList.Active.Close();
        }
    }
}