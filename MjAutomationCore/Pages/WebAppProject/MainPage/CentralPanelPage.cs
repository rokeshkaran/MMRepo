using System.Collections.Generic;
using SeleniumAutomationUtils.SeleniumExtensions;
using MjAutomationCore.Base;
using OpenQA.Selenium;
using SeleniumExtras.PageObjects;

namespace MjAutomationCore.Pages.WebAppProject.MainPage
{
    class CentralPanelPage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'middle')]")]
        public IWebElement CentralPanel { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            {
                SelectorFor(this, p => p. CentralPanel)
            };
        }

        public bool CentralPanelMainPage()
        {
            return Driver.IsElementDisplayed(CentralPanel, WebDriverExtensions.WaitTime.Long);
        }
    }
}