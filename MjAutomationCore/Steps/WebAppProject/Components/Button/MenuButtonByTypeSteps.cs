using AutomationUtils.Utils;
using MjAutomationCore.Components.Buttons;
using MjAutomationCore.Utils;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.Components.Button
{
    [Binding]
    class MenuButtonByTypeSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsers;

        public MenuButtonByTypeSteps(BrowsersList browsers)
        {
            _browsers = browsers;
        }

        [When(@"User clicks menu button with '([^']*)' name in '([^']*)' container")]
        public void WhenUserClicksMenuButtonWithNameInContainer(string menuButton, string container)
        {
            var parent = WebContainer.GetContainerSelector(container);
            _browsers.Active.GetComponent<MenuButtonByType>(menuButton, new Properties() { ParentSelector = parent }).Click();
        }

        [When(@"User mouse hovers menu button with '([^']*)' name in '([^']*)' container")]
        public void WhenUserMouseHoversMenuButtonWithNameInContainer(string menuButton, string container)
        {
            var parent = WebContainer.GetContainerSelector(container);
            _browsers.Active.MoveToElement(_browsers.Active.GetComponent<MenuButtonByType>(menuButton, new Properties() { ParentSelector = parent }));
        }

        [Then(@"menu button with '([^']*)' name is displayed in '([^']*)' container")]
        public void ThenMenuButtonWithNameIsDisplayedInContainer(string menuButton, string container)
        {
            var parent = WebContainer.GetContainerSelector(container);
            Verify.IsTrue(_browsers.Active.ComponentDisplayedState<MenuButtonByType>(menuButton, new Properties() { ParentSelector = parent, WaitTime = WebDriverExtensions.WaitTime.Short }),
                $"Menu button with '{menuButton}' name is displayed in '{container}' container");
        }

        [Then(@"menu button with '([^']*)' name is not displayed on '([^']*)' container")]
        public void ThenMenuButtonWithNameIsNotDisplayedOnContainer(string menuButton, string container)
        {
            var parent = WebContainer.GetContainerSelector(container);
            Verify.IsFalse(_browsers.Active.ComponentDisplayedState<MenuButtonByType>(menuButton, new Properties() { ParentSelector = parent, WaitTime = WebDriverExtensions.WaitTime.Short }),
                $"Menu button with '{menuButton}' name is displayed in '{container}' container");
        }
    }
}