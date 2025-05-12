using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.BaseProject;
using MjAutomationCore.Pages.WebAppProject.MainPage;
using MjAutomationCore.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.MainPageSteps
{
    [Binding]
    class CentralPanelPageSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly BrowsersList _browsers;

        public CentralPanelPageSteps(WebDriver driver, BrowsersList browsersList)
        {
            _driver = browsersList.GetBrowser();
            _browsers = browsersList;
        }

        [Then(@"Central panel is displayed")]
        public void ThenCentralPanelIsDisplayed()
        {
            var centralPanel = _browsers.Active.NowAt<CentralPanelPage>();
            Assert.IsTrue(centralPanel.CentralPanelMainPage(), "Central panel is not displayed on main page");
        }

        [Then(@"header '(.*)' is displayed on Central panel in Main page")]
        public void ThenHeaderIsDisplayedOnCentralPanelInMainPage(string textHheader)
        {
            var centralPanel = _browsers.Active.NowAt<CentralPanelPage>();
            var headerPanel = _browsers.Active.NowAt<UnifiedComponents>();
            var header = centralPanel.CentralPanel.FindElement(By.XPath(headerPanel.HeaderPage)).Text.RemoveLineBreakes();
            Assert.AreEqual(header, textHheader, $"{textHheader} is not displayed on Central panel in Main page");
        }
    }
}