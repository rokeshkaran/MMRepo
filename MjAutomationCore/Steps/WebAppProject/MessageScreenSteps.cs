using AutomationUtils.Utils;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.DialogWindow;
using MjAutomationCore.Pages.WebAppProject.MindManagerFiles;
using MjAutomationCore.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject
{
    [Binding]
    class MessageScreenSteps : ReqnrollContext
    {
        private WebDriver _driver;
        private readonly BrowsersList _browsers;

        public MessageScreenSteps(WebDriver driver, BrowsersList browsersList)
        {
            _driver = browsersList.GetBrowser();
            _browsers = browsersList;
        }

        [Then(@"User sees '(.*)' header on Message screen")]
        public void ThenUserSeesHeaderOnMessageScreen(string header)
        {
            var page = _browsers.Active.NowAt<MessageScreenPage>();
            Assert.IsTrue(page.GetHeaderOnMessageScreenPage(header).Displayed());
        }

        [Then(@"page with '(.*)' header is displayed to User")]
        public void ThenPageWithHeaderIsDisplayedToUser(string textHeader)
        {
            var header = _browsers.Active.NowAt<MessageScreenPage>();
            Verify.IsTrue(header.GetMessageHeader(textHeader), $"Header '{textHeader}' is not displayed on page");
        }

        [Then(@"message '(.*)' is displayed to User on page")]
        public void ThenMessageIsDisplayedToUserOnPage(string textContent)
        {
            var message = _browsers.Active.NowAt<BaseExtensionsPage>();
            Assert.IsTrue(message.GetMessageContent(textContent), $"{textContent} is not displayed on page");
        }
    }
}
