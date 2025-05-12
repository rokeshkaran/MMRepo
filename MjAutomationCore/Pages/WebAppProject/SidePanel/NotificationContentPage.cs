using OpenQA.Selenium;
using SeleniumAutomationUtils.Pages;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;

namespace MjAutomationCore.Pages.WebAppProject.SidePanel
{
    class NotificationContentPage : SeleniumBasePage, IContextContainer
    {
        public new By Context => By.XPath(".//div[contains(@class,'notification content')]");

        [FindsBy(How = How.XPath, Using = ".//button[contains(@class,'header-close')]")]
        public IWebElement CloseButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='mm-capture-queue-page-back']//span[text()='Back']")]
        public IWebElement BackButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div/h2")]
        public IWebElement ContentTitle { get; set; }

        [FindsBy(How = How.XPath, Using = ".//p[@class='sub-title']")]
        public IWebElement ContentSubtitle { get; set; }

        [FindsBy(How = How.XPath, Using = ".//p[@class='message']")]
        public IWebElement TextMessage { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By> { };
        }

        public IWebElement GetFooterButtonByName(string buttonName)
        {
            var selector = By.XPath($".//div[@class='mm-capture-queue-footer']//span[text()='{buttonName}']");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Button '{buttonName}' is not displayed in footer on Notification content panel");
            }

            return Driver.FindElement(selector);
        }
    }
}