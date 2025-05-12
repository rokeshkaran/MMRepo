using OpenQA.Selenium;
using SeleniumAutomationUtils.Pages;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;

namespace MjAutomationCore.Pages.WebAppProject.FileManagerHeader
{
    class FileManagerHeaderPublishedFilesPage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[@class='maps-toolbar']")]
        public IWebElement MapsToolbar { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            { };
        }

        public IWebElement GetButtonIconOnMapToolbar(string buttonIcon)
        {
            var selector = By.XPath($".//div[contains(@class,'{buttonIcon}')]");
            if (!Driver.IsElementInElementDisplayed(MapsToolbar, selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Button icon '{buttonIcon}' is not displayed on map toolbar");
            }
            return MapsToolbar.FindElement(selector);
        }
    }
}
