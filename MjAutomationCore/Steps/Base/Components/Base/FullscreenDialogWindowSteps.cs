using SeleniumAutomationUtils.SeleniumExtensions;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.DialogWindow;
using MjAutomationCore.Utils;
using NUnit.Framework;
using OpenQA.Selenium.Remote;
using Reqnroll;
using OpenQA.Selenium;
using MjAutomationCore.Components.Base;
using AutomationUtils.Utils;

namespace MjAutomationCore.Steps.Base.Components.Base
{
    [Binding]
    class FullscreenDialogWindowSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly BrowsersList _browsers;

        public FullscreenDialogWindowSteps(WebDriver driver, BrowsersList browsersList)
        {
            _driver = browsersList.GetBrowser();
            _browsers = browsersList;
        }

        [Then(@"Fullscreen Dialog window is displayed to User")]
        public void ThenFullscreenDialogWindowIsDisplayedToUser()
        {
            Verify.IsTrue(_browsers.Active.ComponentDisplayedState<FullscreenDialog>(), "Fullscreen Dialog window is not displayed");
        }

        [Then(@"Fullscreen Dialog window is not displayed to User")]
        public void ThenFullscreenDialogWindowIsNotDisplayedToUser()
        {
            Verify.IsFalse(_browsers.Active.ComponentDisplayedState<FullscreenDialog>(), "Fullscreen Dialog window is displayed");
        }

        [Then(@"User sees '(.*)' title in Fullscreen Dialog window")]
        public void ThenUserSeesTitleInFullscreenDialogWindow(string title)
        {
            var fullscreenDialogWindow = _browsers.Active.Component<FullscreenDialog>();
            Verify.IsTrue(fullscreenDialogWindow.FullscreenDialogTitle.Text.Contains(title), $"'{title}' is not displayed in the Fullscreen Dialog window");
            Verify.IsTrue(fullscreenDialogWindow.FullscreenDialogTitle.Displayed(), $"Title is not displayed in the Fullscreen Dialog window");
        }

        [Then(@"User sees '(.*)' text messege in Fullscreen Dialog window")]
        public void ThenUserSeesTextMessegeInFullscreenDialogWindow(string textMessege)
        {
            var fullscreenDialogWindow = _browsers.Active.Component<FullscreenDialog>();
            Verify.IsTrue(fullscreenDialogWindow.FullscreenDialogMessage.Text.Contains(textMessege), $"'{textMessege}' is not displayed in the Fullscreen Dialog window");
            Verify.IsTrue(fullscreenDialogWindow.FullscreenDialogMessage.Displayed(), $"Message is not displayed in the Fullscreen Dialog window");
        }

        [Then(@"User sees '(.*)' text messege is highlighted '(.*)' color in Fullscreen Dialog window")]
        public void ThenUserSeesTextMessegeIsHighlightedColorInFullscreenDialogWindow(string textMessege, string color)
        {
            var fullscreenDialogWindowMessage = _browsers.Active.Component<FullscreenDialog>().FullscreenDialogMessage;
            Verify.IsTrue(fullscreenDialogWindowMessage.Displayed(), $"Message is not displayed in the Fullscreen Dialog window");
            var textColor = fullscreenDialogWindowMessage.GetCssValue("color");
            Verify.AreEqual(color, textColor, $"Text message '{textMessege}' is not highlighted in '{color}' color in the Fullscreen Dialog window");
        }

        [When(@"User clicks '(.*)' button in Fullscreen Dialog window")]
        public void WhenUserClicksButtonInFullscreenDialogWindow(string buttonName)
        {
            var fullscreenDialogWindow = _browsers.Active.Component<FullscreenDialog>();
            fullscreenDialogWindow.GetButtonByNameInFullscreenDialogWindow(buttonName).Click();
        }

        [When(@"User clicks close button in Fullscreen Dialog window")]
        public void WhenUserClicksCloseButtonInFullscreenDialogWindow()
        {
            var fullscreenDialogWindow = _browsers.Active.Component<FullscreenDialog>();
            fullscreenDialogWindow.FullscreenDialogCloseButton.Click();
        }

        [When(@"User clicks outside of Fullscreen Dialog")]
        public void WhenUserClicksOutsideOfFullscreenDialog()
        {
            var fullscreenDialogWindow = _browsers.Active.Component<FullscreenDialog>();
            var overlay = fullscreenDialogWindow.FullscreenDialogOverlay;
            var width = overlay.Size.Width;
            var height = overlay.Size.Height;
            _browsers.Active.ActionsMoveToElementAndClick(overlay, width / 2 - 5, height / 2 - 5);
        }
    }
}