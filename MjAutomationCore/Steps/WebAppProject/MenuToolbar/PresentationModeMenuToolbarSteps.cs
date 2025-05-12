using AutomationUtils.Utils;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.MenuToolbar;
using MjAutomationCore.Utils;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.MenuToolbar
{
    [Binding]
    class PresentationModeMenuToolbarSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly BrowsersList _browsers;

        public PresentationModeMenuToolbarSteps(WebDriver driver, BrowsersList browsersList)
        {
            _driver = browsersList.GetBrowser();
            _browsers = browsersList;
        }

        [Then(@"Menu toolbar is displayed to Presentation mode")]
        public void ThenMenuToolbarIsDisplayedToPresentationMode()
        {
            var page = _browsers.Active.NowAt<PresentationModeMenuToolbarPage>();
            Verify.IsTrue(page.MenuToolbar(), "Menu toolbar is not displayed to Presentation mode");
        }

        [When(@"User clicks Zoom In button on Main navigation panel of Presentation mode")]
        public void WhenUserClicksZoomInButtonOnMainNavigationPanelOfPresentationMode()
        {
            var panel = _browsers.Active.NowAt<PresentationModeMenuToolbarPage>();
            panel.ZoomInButtonOnPresentationModeMenuToolbar.Click();
        }

        [Then(@"Zoom In button is displayed on Presentation toolbar")]
        public void ThenZoomInButtonIsDisplayedOnPresentationToolbar()
        {
            var panel = _browsers.Active.NowAt<PresentationModeMenuToolbarPage>();
            Verify.IsTrue(panel.ZoomInButtonOnPresentationModeMenuToolbar.Displayed(), "Zoom In button is not displayed on Presentation toolbar");
        }

        [When(@"User clicks Zoom Out button on Main navigation panel of Presentation mode")]
        public void WhenUserClicksZoomOutButtonOnMainNavigationPanelOfPresentationMode()
        {
            var panel = _browsers.Active.NowAt<PresentationModeMenuToolbarPage>();
            panel.ZoomOutButtonOnPresentationModeMenuToolbar.Click();
        }

        [Then(@"Zoom Out button is displayed on Presentation toolbar")]
        public void ThenZoomOutButtonIsDisplayedOnPresentationToolbar()
        {
            var panel = _browsers.Active.NowAt<PresentationModeMenuToolbarPage>();
            Verify.IsTrue(panel.ZoomOutButtonOnPresentationModeMenuToolbar.Displayed(), "Zoom Out button is not displayed on Presentation toolbar");
        }

        #region SearchToolbar

        [Then(@"Search toolbar is expanded in Presentation mode")]
        public void ThenSearchToolbarIsExpandedInPresentationMode()
        {
            var toolbar = _driver.NowAt<PresentationModeMenuToolbarPage>();
            Verify.IsTrue(toolbar.GetSearchToolbarState(), "Search toolbar is collapsed in Presentation mode");
        }

        [Then(@"Search toolbar is collapsed in Presentation mode")]
        public void ThenSearchToolbarIsCollapsedInPresentationMode()
        {
            var toolbar = _driver.NowAt<PresentationModeMenuToolbarPage>();
            Verify.IsFalse(toolbar.GetSearchToolbarState(), "Search toolbar is expanded in Presentation mode");
        }

        #endregion
    }
}