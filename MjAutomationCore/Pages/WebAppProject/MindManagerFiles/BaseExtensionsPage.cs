using MjAutomationCore.Base;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;

namespace MjAutomationCore.Pages.WebAppProject.MindManagerFiles
{
    class BaseExtensionsPage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//body[@class='context-wide context-publishing']")]
        public IWebElement Page { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By> { };
        }

        public IWebElement GetTitleOnPage(string title)
        {
            var selector = By.XPath($".//*[text()='{title}']");
            if (!Driver.IsElementInElementDisplayed(Page, selector, WebDriverExtensions.WaitTime.Long))
            {
                throw new Exception($"Title {title} is not displayed on page");
            }

            return Driver.FindElement(selector);
        }
    }
}
