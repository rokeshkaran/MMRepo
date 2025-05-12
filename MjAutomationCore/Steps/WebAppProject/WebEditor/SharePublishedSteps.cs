using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.MindManagerFiles;
using MjAutomationCore.Pages.WebAppProject.QA;
using MjAutomationCore.Utils;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.WebEditor
{
    [Binding]
    class SharePublishedSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly BrowsersList _browsers;

        public SharePublishedSteps(WebDriver driver, BrowsersList browsersList)
        {
            _driver = browsersList.GetBrowser();
            _browsers = browsersList;
        }

        [When(@"User clicks '(.*)' icon in '(.*)' section")]
        public void WhenUserClicksIconInSection(string iconName, string title)
        {
            var icon = _browsers.Active.NowAt<SharePublishedPage>();
            var page = _browsers.Active.NowAt<BaseExtensionsPage>();
            page.GetTitleOnPage(title).FindElement(By.XPath(icon.GetSocialIconByName(iconName))).Click();
        }
    }
}

