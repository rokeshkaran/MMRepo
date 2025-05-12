using OpenQA.Selenium;
using SeleniumAutomationUtils.Pages;
using SeleniumExtras.PageObjects;
using System.Collections.Generic;

namespace MjAutomationCore.Pages.WebAppProject.NavigationPanel
{
    class NavigationPanel : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'navigation-panel')]")]
        public IWebElement Panel { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By> { };
        }
    }
}
