using MjAutomationCore.Pages.WebAppProject.MenuToolbar;
using MjAutomationCore.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.MenuToolbar
{
    [Binding]
    class SlidesModeMenuToolbarSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly BrowsersList _browsers;

        public SlidesModeMenuToolbarSteps(WebDriver driver, BrowsersList browsersList)
        {
            _driver = browsersList.GetBrowser();
            _browsers = browsersList;
        }

        [Then(@"Menu toolbar is displayed to the Slide mode")]
        public void ThenMenuToolbarIsDisplayedToTheSlideMode()
        {
            var panel = _driver.NowAt<SlidesModeMenuToolbarPage>();
            Assert.IsTrue(panel.SlidesMenuToolbar.Displayed(), "Menu toolbar is not displayed to the Slide mode");
        }

        [When(@"User clicks '(.*)' button on the Slide toolbar")]
        public void WhenUserClicksButtonOnTheSlideToolbar(string buttonName)
        {
            var panel = _browsers.Active.NowAt<SlidesModeMenuToolbarPage>();
            _browsers.Active.ClickByActions(panel.GetButtonByNameInSlidesToolbarControl(buttonName));
        }

        [Then(@"'(.*)' button is displayed on the Slide toolbar")]
        public void ThenButtonIsDisplayedOnTheSlideToolbar(string buttonName)
        {
            var panel = _driver.NowAt<SlidesModeMenuToolbarPage>();
            Assert.IsTrue(panel.GetButtonByNameInSlidesToolbarControl(buttonName).Displayed(), $"'{buttonName}' button is not displayed on Slide toolbar");
        }

        [Then(@"'(.*)' logo is displayed on the Slide toolbar")]
        public void ThenLogoIsDisplayedOnTheSlideToolbar(string logo)
        {
            var panel = _driver.NowAt<SlidesModeMenuToolbarPage>();
            var actualLogo = panel.SlidesMenuToolbar.FindElement(By.XPath(panel.LogoOnSlidesToolbar)).GetAttribute("href");
            Assert.AreEqual(actualLogo, logo, $"{logo} logo is not displayed on Slide toolbar");
        }


        [Then(@"'(.*)' button displayed as disabled on the Slide toolbar")]
        public void ThenButtonDisplayedAsDisabledOnTheSlideToolbar(string buttonName)
        {
            var panel = _driver.NowAt<SlidesModeMenuToolbarPage>();
            Assert.AreEqual(panel.GetButtonByNameInSlidesToolbarControl(buttonName).GetAttribute("disabled"), "true");
        }

        [Then(@"'(.*)' label result is displayed on the Slide toolbar")]
        public void ThenLabelResultIsDisplayedOnTheSlideToolbar(string label)
        {
            var panel = _driver.NowAt<SlidesModeMenuToolbarPage>();
            Assert.IsTrue(panel.GetCounterLabelOnSlidesToolbar(label).Displayed(), $"label '{label}' result is displayed on the Slide toolbar");
        }
    }
}