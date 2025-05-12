using OpenQA.Selenium;
using SeleniumAutomationUtils.Pages;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MjAutomationCore.Pages.LicensingProject.AdminPortal
{
    class SetupSSOPage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[@class='sso-request-form']")]
        public IWebElement ssoRequestFormContainer { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='sso-request-states']")]
        public IWebElement ssoRequestStateContainer { get; set; }

        private readonly string ssoRequestStateXPath = "./div[contains(@class,'sso-request-state')][not(contains(@style, 'display: none'))]";
        public IWebElement GetSSORequestStateByDataStep(string dataStep)
        {
            return GetSSORequestStates().First(x => x.GetAttribute("data-step").Equals(dataStep));
        }

        public IList<IWebElement> GetSSORequestStates()
        {
            var selector = By.XPath(ssoRequestStateXPath);
            Driver.WaitForElementInElementToBeDisplayed(ssoRequestStateContainer, selector, WebDriverExtensions.WaitTime.Medium);
            IList<IWebElement> ssoRequestStates = ssoRequestStateContainer.FindElements(selector);
            return ssoRequestStates;
        }

        public IWebElement GetButtonByNameOnSetupSSOPage(string buttonName)
        {
            var selector = By.XPath($".//button[contains(@class,'form-button')][contains(text(),'{buttonName}')]");
            var visibleButton = ssoRequestFormContainer.FindElements(selector).FirstOrDefault(button => button.Displayed);
            if (visibleButton == null)
            {
                throw new Exception($"Button '{buttonName}' is not displayed on Setup SSO Page");
            }
            return visibleButton;
        }
    }
}