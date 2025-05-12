using AutomationUtils.Utils;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.PresentationOptions;
using MjAutomationCore.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.PresentationOptions
{
    [Binding]
    class PresentationOptionsSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly BrowsersList _browsers;

        public PresentationOptionsSteps(WebDriver driver, BrowsersList browsersList)
        {
            _driver = browsersList.GetBrowser();
            _browsers = browsersList;
        }

        [Then(@"'(.*)' screen is displayed to User")]
        public void ThenScreenIsDisplayedToUser(string header)
        {
            var page = _browsers.Active.NowAt<PresentationOptionsPage>();
            Assert.IsTrue(page.DisplayedScreenHeader(header), $"Screen '{header}' is not displayed");
        }

        [Then(@"'(.*)' screen is not displayed to User")]
        public void ThenScreenIsNotDisplayedToUser(string header)
        {
            var page = _browsers.Active.NowAt<PresentationOptionsPage>();
            Assert.IsFalse(page.DisplayedScreenHeader(header), $"Screen '{header}' is displayed");
        }

        [When(@"User clicks Close button in the top right corner on '(.*)' screen")]
        public void WhenUserClicksCloseButtonInTheTopRightCornerOnScreen(string headerScreen)
        {
            var page = _browsers.Active.NowAt<PresentationOptionsPage>();
            page.ScreenCloseButton(headerScreen);
        }

        [When(@"User checks '(.*)' checkbox in the '(.*)' section of '(.*)' screen")]
        public void WhenUserChecksCheckboxInTheSectionOfScreen(string checkboxName, string sectionName, string headerScreen)
        {
            var page = _browsers.Active.NowAt<PresentationOptionsPage>();
            page.SetCheckboxState(checkboxName, sectionName, headerScreen, true);
        }

        [When(@"User unchecks '(.*)' checkbox in the '(.*)' section of '(.*)' screen")]
        public void WhenUserUnchecksCheckboxInTheSectionOfScreen(string checkboxName, string sectionName, string headerScreen)
        {
            var page = _browsers.Active.NowAt<PresentationOptionsPage>();
            page.SetCheckboxState(checkboxName, sectionName, headerScreen, false);
        }

        [Then(@"'(.*)' checkbox is checked in the '(.*)' section of '(.*)' screen")]
        public void ThenCheckboxIsCheckedInTheSectionOfScreen(string checkboxName, string sectionName, string headerScreen)
        {
            var page = _browsers.Active.NowAt<PresentationOptionsPage>();
            Assert.IsTrue(page.GetCheckboxState(checkboxName, sectionName, headerScreen), $"Checkbox '{checkboxName}' is unchecked in '{sectionName}' section of '{headerScreen}' screen");
        }

        [When(@"User enter '([^']*)' value in '([^']*)' input field in the '([^']*)' section of '([^']*)' screen")]
        public void WhenUserEnterValueInInputFieldInTheSectionOfScreen(string textValue, string inputFieldName, string sectionName, string headerScreen)
        {
            var page = _browsers.Active.NowAt<PresentationOptionsPage>();
            page.GetInputFieldInSectionName(inputFieldName, sectionName, headerScreen).ClearSendKeys(textValue);
        }

        [Then(@"'(.*)' checkbox is unchecked in the '(.*)' section of '(.*)' screen")]
        public void ThenCheckboxIsUncheckedInTheSectionOfScreen(string checkboxName, string sectionName, string headerScreen)
        {
            var page = _browsers.Active.NowAt<PresentationOptionsPage>();
            Assert.IsFalse(page.GetCheckboxState(checkboxName, sectionName, headerScreen), $"Checkbox '{checkboxName}' is checked in '{sectionName}' section of '{headerScreen}' screen");
        }

        [Then(@"'([^']*)' checkbox is disable in the '([^']*)' section of '([^']*)' screen")]
        public void ThenCheckboxIsDisableInTheSectionOfScreen(string checkboxName, string sectionName, string headerScreen)
        {
            var page = _browsers.Active.NowAt<PresentationOptionsPage>();
            Verify.IsTrue(page.IsCheckboxDisabled(checkboxName, sectionName, headerScreen), $"Checkbox '{checkboxName}' is not disabled in '{sectionName}' section of '{headerScreen}' screen");
        }

        [When(@"User clicks '(.*)' button on '(.*)' screen")]
        public void WhenUserClicksButtonOnScreen(string buttonName, string headerScreen)
        {
            var page = _browsers.Active.NowAt<PresentationOptionsPage>();
            page.ClickButtonByName(buttonName, headerScreen);
        }

    }
}