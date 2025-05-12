using AutomationUtils.Utils;
using MjAutomationCore.Components.Buttons;
using MjAutomationCore.Utils;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using System.ComponentModel;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.Components.Button
{
    [Binding]
    public class ButtonByTypeSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsers;

        public ButtonByTypeSteps(BrowsersList browsers)
        {
            _browsers = browsers;
        }

        [When(@"User clicks button with '([^']*)' name in '([^']*)' container")]
        public void WhenUserClicksButtonWithNameInContainer(string button, string container)
        {
            var parent = WebContainer.GetContainerSelector(container);
            _browsers.Active.GetComponent<ButtonByType>(button, new Properties() { ParentSelector = parent }).Click();
        }

        [Then(@"button with '([^']*)' name is displayed in '([^']*)' container")]
        public void ThenButtonWithNameIsDisplayedInContainer(string button, string container)
        {
            var parent = WebContainer.GetContainerSelector(container);
            var isButtonDisplayed = _browsers.Active.ComponentDisplayedState<ButtonByType>(button, new Properties() { ParentSelector = parent });
            Verify.IsTrue(isButtonDisplayed, $"Button '{button}' is not displayed in '{container}' container");
        }
    }
}