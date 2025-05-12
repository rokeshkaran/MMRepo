using MjAutomationCore.Base;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;
namespace MjAutomationCore.Pages.WebAppProject.DialogWindow
{
    class MessageScreenPage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[@id='messageScreen']/div[@class='message-body']")]
        public IWebElement MessageScreen { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            {};
        }

        public bool DisplayedMessageScreen()
        {
            return Driver.IsElementDisplayed(MessageScreen, WebDriverExtensions.WaitTime.Medium);
        }

        public IWebElement GetHeaderOnMessageScreenPage(string header)
        {
            var selector = By.XPath($"./div[@class='header']/h3[text()='{header}']");
            if (!Driver.IsElementInElementDisplayed(MessageScreen, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Header '{header}' is not displayed on message screen page");
            }

            return MessageScreen.FindElement(selector);
        }
    }
}