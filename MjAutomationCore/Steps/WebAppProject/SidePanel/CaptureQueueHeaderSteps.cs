using SeleniumAutomationUtils.SeleniumExtensions;
using AutomationUtils.Utils;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.SidePanel;
using MjAutomationCore.Utils;
using Reqnroll;
using OpenQA.Selenium;
using MjAutomationCore.Helpers;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.Components.Base;
using SeleniumAutomationUtils.Components;

namespace MjAutomationCore.Steps.WebAppProject.SidePanelSteps
{
    [Binding]
    class CaptureQueueHeaderSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsers;
        private readonly SessionRandomValue _sessionRandom;

        public CaptureQueueHeaderSteps(BrowsersList browsersList, SessionRandomValue sessionRandom)
        {
            _browsers = browsersList;
            _sessionRandom = sessionRandom;
        }

        [Then(@"'(.*)' header is displayed on panel")]
        public void ThenHeaderIsDisplayedOnPanel(string header)
        {
            var element = _browsers.Active.NowAtWithContext<CaptureQueueHeaderElement>();
            Verify.IsTrue(element.DisplayedCaptureQueueHeader(header), $"'{header}' capture queue header is not displayed");
        }

        [Then(@"Snap side panel '([^']*)' header is displayed in '([^']*)' color")]
        public void ThenSnapSidePanelHeaderIsdisplayedInColor(string Header, string Color)
        {
            var toolbox = _browsers.Active.NowAt<SnapPanelPage>();
            var ImageDetails = toolbox.SnapHeader.FindElement(By.ClassName(Header)).GetCssValue("background-image");
            var Decoded = BrandImageHelper.DecodeImage(ImageDetails);
            Verify.IsTrue(Decoded.Contains(Color), $"The '{Header}' header of Snap side panel is not displayed in the expected color '{Color}'");
        }

        [When(@"User clicks Ellipsis button on Snap panel")]
        public void WhenUserClicksEllipsisButtonOnSnapPanel()
        {
            var panel = _browsers.Active.NowAtWithContext<CaptureQueueHeaderElement>();
            panel.EllipsisButton.Click();
        }

        [When(@"User clicks Ellipsis button on Snap panel and click '(.*)' button in capture queue buttons dropdown")]
        public void WhenUserClicksEllipsisButtonOnSnapPanelAndClickButtonInCaptureQueueButtonsDropdown(string button)
        {
            var panel = _browsers.Active.NowAtWithContext<CaptureQueueHeaderElement>();
            panel.EllipsisButton.Click();
            var dropdown = _browsers.Active.NowAt<CaptureQueueButtonsWrapperElement>();
            dropdown.GetButtonByNameInCaptureQueueButtons(button).Click();
        }

        [Then(@"clear button is visible in '(.*)' field on Snap panel")]
        public void ThenClearButtonIsVisibleInFieldOnSnapPanel(string fieldName)
        {
            var panel = _browsers.Active.NowAtWithContext<CaptureQueueHeaderElement>();
            Verify.IsTrue(panel.SearchClearButton.Displayed(), $"Clear button is not visible in '{fieldName}' field on Snap panel");
        }

        [Then(@"search icon is not displayed in Search field on Span panel")]
        public void ThenSearchIconIsNotDisplayedInSearchFieldOnSpanPanel()
        {
            var element = _browsers.Active.NowAt<CaptureQueueHeaderElement>();
            Verify.IsFalse(element.DisplayedSearchIconInFiled(), "Search icon is displayed in field");
        }

        [When(@"User clicks '(.*)' menu button on Snap panel")]
        public void WhenUserClicksMenuButtonOnSnapPanel(string menuButton)
        {
            var element = _browsers.Active.NowAtWithContext<CaptureQueueHeaderElement>();
            element.GetMenuButtonByName(menuButton).Click();
        }

        [Then(@"'([^']*)' menu button is displayed in Snap Panel")]
        public void ThenMenuButtonIsDisplayedInSnapPanel(string menuButton)
        {
            var element = _browsers.Active.NowAtWithContext<CaptureQueueHeaderElement>();
            menuButton = menuButton.AddRandom(_sessionRandom);
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(element.GetMenuButtonByName(menuButton)), $"'{menuButton}' menu button is not displayed in Snap Panel");
        }

        [When(@"User clicks on clear button on Snap panel")]
        public void WhenUserClicksClearButtonOnSnapPanel()
        {
            var panel = _browsers.Active.NowAtWithContext<CaptureQueueHeaderElement>();
            panel.SearchClearButton.Click();
        }
    }
}