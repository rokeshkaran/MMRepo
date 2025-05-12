using AutomationUtils.Utils;
using MjAutomationCore.Components.Base;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using Reqnroll;

namespace MjAutomationCore.Steps.Base.Components.Base
{
    [Binding]
    class ToastContainerSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        public ToastContainerSteps(WebDriver driver)
        {
            _driver = driver;
        }

        [Then(@"'(.*)' text message is displayed in toast container")]
        public void ThenTextMessageIsDisplayedInToastContainer(string message)
        {
            var container = _driver.Component<ToastContainer>();
            Verify.IsTrue(container.DisplayedToastMessage(message), $"Message '{message}' is not displayed in Toast Container");
        }

        [Then(@"'(.*)' title is displayed in toast container")]
        public void ThenTitleIsDisplayedInToastContainer(string title)
        {
            Verify.IsTrue(_driver.Component<ToastContainer>().DisplayedToastTitle(title), $"Title '{title}' is not displayed in Toast Container");
        }
    }
}