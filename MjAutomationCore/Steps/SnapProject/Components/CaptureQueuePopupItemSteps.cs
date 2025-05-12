using AutomationUtils.Utils;
using MjAutomationCore.Components.Snap;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using Reqnroll;

namespace MjAutomationCore.Steps.SnapProject
{
    [Binding]
    class CaptureQueuePopupItemSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;

        public CaptureQueuePopupItemSteps(WebDriver driver)
        {
            _driver = driver;
        }

        [Then(@"'(.*)' popup is displayed to User")]
        public void ThenPopupIsDisplayedToUser(string popup)
        {
            Verify.IsTrue(_driver.ComponentDisplayedState<CaptureQueuePopupItem>(popup), $"'{popup}' popup is displayed to User");
        }

        [When(@"User clicks '(.*)' item in '(.*)' popup")]
        public void WhenUserClicksItemInPopup(string itemName, string popup)
        {
            _driver.Component<CaptureQueuePopupItem>(popup).GetItemByName(itemName).Click();
        }
    }
}