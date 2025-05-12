using OpenQA.Selenium;
using SeleniumAutomationUtils.Pages;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;
using System.Threading;

namespace MjAutomationCore.Pages.WebAppProject.SidePanel
{
    class CaptureQueueHeaderElement : SeleniumBasePage, IContextContainer
    {
        public new By Context => By.XPath(".//div[@class='mm-capture-queue main']");

        [FindsBy(How = How.XPath, Using = ".//button[@class='mm-capture-queue-buttons-handle']")]
        public IWebElement EllipsisButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//label[contains(@class,'search-label')]")]
        public IWebElement SearchLabel { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='mm-capture-queue-search-clear-btn'][@style='visibility: visible;']")]
        public IWebElement SearchClearButton { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By> { };
        }

        public IWebElement GetMenuButtonByName(string buttonName)
        {
            var selector = By.XPath($".//div[@class='mm-capture-queue-selector']/div[contains(text(),'{buttonName}')]");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Menu button '{buttonName}' is not displayed on Snap panel");
            }

            return Driver.FindElement(selector);
        }

        public bool DisplayedHeader(string header)
        {
            var selector = By.XPath($".//label[contains(@class,'simple-header')][text()='{header}']");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Header '{header}' is not displayed");
            }

            return Driver.IsElementDisplayed(selector);
        }

        public bool DisplayedSearchIconInFiled()
        {
            for (int j = 0; j < 3; j++)
            {
                if (!SearchLabel.GetCssValue("display").Equals("none"))
                {
                    return true;
                }
                else
                {
                    Thread.Sleep(500);
                }
            }
            return false;
        }

        public bool DisplayedCaptureQueueHeader(string header)
        {
            var selector = By.XPath($".//div[@class='mm-capture-queue-page-title' and text()='{header}']");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"'{header}' header is not displayed in the queues dropdown");
            }
            return Driver.IsElementDisplayed(selector);
        }
    }
}