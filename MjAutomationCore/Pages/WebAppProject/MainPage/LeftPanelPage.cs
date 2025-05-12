using System.Collections.Generic;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumAutomationUtils.Pages;
using OpenQA.Selenium;
using SeleniumExtras.PageObjects;

namespace MjAutomationCore.Pages.WebAppProject.MainPage
{
    class LeftPanelPage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'section-left')]")]
        public IWebElement LeftPanel { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            {
                SelectorFor(this, p => p. LeftPanel)
            };
        }

        public bool LeftPanelMainPage()
        {
            return Driver.IsElementDisplayed(LeftPanel, WebDriverExtensions.WaitTime.Short);
        }
    }
}