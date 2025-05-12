using AutomationUtils.Utils;
using MjAutomationCore.Components.Buttons;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.OverlayPanel;
using MjAutomationCore.Utils;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using System.Threading;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.OverlayPanel
{
    [Binding]
    class OverlayPanelSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsers;

        public OverlayPanelSteps(BrowsersList browsersList)
        {
            _browsers = browsersList;
        }

        [Then(@"menu button with '([^']*)' name is displayed in '([^']*)' state on Overlay panel")]
        public void ThenMenuButtonWithNameIsDisplayedInStateOnOverlayPanel(string menuButton, string state)
        {
            _browsers.Active.WaitForElementToContainsTextInAttribute(_browsers.Active.GetComponent<MenuButtonByType>(menuButton, new Properties() { ParentSelector = WebContainer.GetContainerSelector("OverlayPanelPageElement") }), state, "data-group-type", WebDriverExtensions.WaitTime.Long);
            Verify.IsTrue(_browsers.Active.GetComponent<MenuButtonByType>(menuButton, new Properties() { ParentSelector = WebContainer.GetContainerSelector("OverlayPanelPageElement") }).GetAttribute("data-group-type").Equals(state),
                $"Menu button with '{menuButton}' name is not displayed in '{state}' on Overlay panel");
        }

        [When(@"User clicks on '([^']*)' button on the Overlay panel")]
        public void WhenUserClicksOnButtonOnTheOverlayPanel(string menuButton)
        {
            var parent = WebContainer.GetContainerSelector("OverlayPanelPageElement");
            _browsers.Active.GetComponent<MenuButtonByType>(menuButton, new Properties() { ParentSelector = parent }).Click();
        }

        [Then(@"toast notification is displayed on Overlay panel")]
        public void ThenToastNotificationIsDisplayedOnOverlayPanel()
        {
            var overlayPanel = _browsers.Active.NowAt<OverlayPanelPageElement>();
            Verify.IsTrue(overlayPanel.DisplayedToastNotification(), "Toast notification is displayed on Overlay panel");
        }

        [Then(@"text '([^']*)' is displayed in toast notification on Overlay panel")]
        public void ThenTextIsDisplayedInToastNotificationOnOverlayPanel(string value)
        {
            var overlayPanel = _browsers.Active.NowAt<OverlayPanelPageElement>();
            _browsers.Active.WaitForElementToContainsTextInAttribute(overlayPanel.ToastNotification, "show", "class", WebDriverExtensions.WaitTime.Short);
            var actualValues = overlayPanel.ToastNotification.Text.RemoveLineBreakes();
            Verify.AreEqual(value, actualValues, $"Text '{value}' is not displayed in toast notification on Overlay panel");
        }

        [When(@"User left click on the Overlay panel")]
        public void WhenUserLeftClickOnTheStatusOverlayBackground()
        {
            var overlayPanel = _browsers.Active.NowAt<OverlayPanelPageElement>();
            _browsers.Active.ActionsLeftClickElementByOffSet(overlayPanel.OverlayPanel, 45, 0);
        }

        [When(@"User left click on the Overlay panel by offset '([^']*)' X and '([^']*)' Y")]
        public void WhenUserLeftClickOnTheOverlayPanelByOffsetXAndY(int x, int y)
        {
            var overlayPanel = _browsers.Active.NowAt<OverlayPanelPageElement>();
            _browsers.Active.ActionsLeftClickElementByOffSet(overlayPanel.OverlayPanel, x, y);
        }

        [Then(@"Overlay panel is located by approximate '([^']*)' X axis and approximate '([^']*)' Y axis")]
        public void ThenOverlayIsLocatedByXAxisAndYAxis(int X, int Y)
        {
            var rangeValue = 400;
            var overlayPanel = _browsers.Active.NowAt<OverlayPanelPageElement>();
            var overlayLocation = overlayPanel.OverlayPanel.Location;
            Verify.IsTrue(overlayLocation.X - rangeValue <= X && X <= overlayLocation.X + rangeValue, $"Overlay X axis is not as expected: {X}. Actual: {overlayLocation.X}");
            Verify.IsTrue(overlayLocation.Y - rangeValue <= Y && Y <= overlayLocation.Y + rangeValue, $"Overlay Y axis is not as expected: {Y}. Actual: {overlayLocation.Y}");
        }

        [Then(@"Overlay panel is not displayed")]
        public void ThenStatusOverlayIsNotDisplayed()
        {
            var overlayPanel = _browsers.Active.NowAt<OverlayPanelPageElement>();
            Verify.IsFalse(_browsers.Active.IsElementDisplayed(overlayPanel.OverlayPanel), "Overlay panel is displayed");
        }

        [Then(@"Overlay panel is displayed")]
        public void ThenOverlayPanelIsDisplayed()
        {
            var overlayPanel = _browsers.Active.NowAt<OverlayPanelPageElement>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(overlayPanel.OverlayPanel), "Overlay panel is not displayed");
        }
    }
}