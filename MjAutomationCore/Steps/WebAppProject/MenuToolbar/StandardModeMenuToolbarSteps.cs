using AutomationUtils.Utils;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.MenuToolbar;
using MjAutomationCore.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.Remote;
using SeleniumAutomationUtils.SeleniumExtensions;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.MenuToolbar
{
    [Binding]
    class StandardModeMenuToolbarSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly BrowsersList _browsers;

        public StandardModeMenuToolbarSteps(WebDriver driver, BrowsersList browsersList)
        {
            _driver = browsersList.GetBrowser();
            _browsers = browsersList;
        }

        #region SearchToolbar
        [When(@"User clicks Search button on Menu toolbar in Standard mode")]
        public void WhenUserClicksSearchButtonOnMenuToolbarInStandardMode()
        {
            var toolbar = _driver.NowAt<StandardModeMenuToolbarPage>();
            toolbar.SearchButton.Click();
        }

        [When(@"Search button is displayed on Menu toolbar in Standard mode")]
        public void WhenSearchButtonIsDisplayedOnMenuToolbarInStandardMode()
        {
            var toolbar = _browsers.Active.NowAt<StandardModeMenuToolbarPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(toolbar.SearchButton), "Search button is not displayed on topmenu");
        }

        [Then(@"Search toolbar is expanded in Standard mode")]
        public void ThenSearchToolbarIsExpandedInStandardMode()
        {
            var toolbar = _driver.NowAt<StandardModeMenuToolbarPage>();
            Verify.IsTrue(toolbar.GetSearchToolbarState(), "Search toolbar is collapsed in Standard mode");
        }

        [Then(@"Search toolbar is collapsed in Standard mode")]
        public void ThenSearchToolbarIsCollapsedInStandardMode()
        {
            var toolbar = _driver.NowAt<StandardModeMenuToolbarPage>();
            Assert.IsFalse(toolbar.GetSearchToolbarState(), "Search toolbar is expanded in Standard mode");
        }

        #endregion

        [Then(@"Menu toolbar is displayed to Standard mode in '(.*)' side on page")]
        public void ThenMenuToolbarIsDisplayedToStandardModeInSideOnPage(string position)
        {
            var panel = _driver.NowAt<StandardModeMenuToolbarPage>();
            Verify.IsTrue(panel.ToolbarPosition(position), "Menu toolbar is displayed in Presentation mode");
        }
    }
}