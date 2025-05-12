using SeleniumAutomationUtils.SeleniumExtensions;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.BaseProject;
using MjAutomationCore.Pages.WebAppProject.MainPage;
using MjAutomationCore.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.Remote;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.MainPageSteps
{
    [Binding]
    class LeftPanelSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly BrowsersList _browsers;

        public LeftPanelSteps(WebDriver driver, BrowsersList browsersList)
        {
            _driver = browsersList.GetBrowser();
            _browsers = browsersList;
        }

        [Then(@"Left side panel is displayed")]
        public void ThenLeftSidePanelIsDisplayed()
        {
            var panel = _browsers.Active.NowAt<LeftPanelPage>();
            Assert.IsTrue(panel.LeftPanelMainPage(), "Left panel is not displayed on main page");
        }

        [Then(@"'(.*)' button is displayed on Left side panel of main page")]
        public void ThenButtonIsDisplayedOnLeftSidePanelOfMainPage(string buttonName)
        {
            var panel = _browsers.Active.NowAt<LeftPanelPage>();
            var button = _browsers.Active.NowAt<UnifiedComponents>();
            Assert.IsTrue(panel.LeftPanel.FindElement(By.XPath(button.GetButtonByNameBase(buttonName).ToString())).Displayed());
        }
    }
}