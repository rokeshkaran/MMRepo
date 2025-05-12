using AutomationUtils.Utils;
using SeleniumAutomationUtils.SeleniumExtensions;
using MjAutomationCore.Pages.WebAppProject.SidePanel;
using OpenQA.Selenium;
using Reqnroll;
using MjAutomationCore.Providers;

namespace MjAutomationCore.Steps.WebAppProject.SidePanelSteps
{
    [Binding]
    class CaptureQueueButtonsWrapperSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;

        public CaptureQueueButtonsWrapperSteps(WebDriver driver)
        {
            _driver = driver;
        }

        [Then(@"capture queue buttons wrapper is displayed to User")]
        public void ThenCaptureQueueButtonsWrapperIsDisplayedToUser()
        {
            var dropdown = _driver.NowAt<CaptureQueueButtonsWrapperElement>();
            Verify.IsTrue(dropdown.DisplayedCaptureQueueButtonsWrapper(), "Capture queue buttons wrapper is not displayed");
        }

        [Then(@"'([^']*)' number of '([^']*)' items is displayed on '([^']*)' button in capture queue buttons dropdown")]
        public void ThenNumberOfItemsIsDisplayedOnButtonInCaptureQueueButtonsDropdown(string numberOfItems, string itemType, string button)
        {
            var dropdown = _driver.NowAt<CaptureQueueButtonsWrapperElement>();
            Verify.IsTrue(dropdown.DisplayedCounter(numberOfItems, itemType, button), $"'{numberOfItems}' Number of '{itemType}' items is not displayed or displayed incorrectly on '{button}' button");
        }

        [Then(@"'([^']*)' type of '([^']*)' items is displayed on '([^']*)' button in capture queue buttons dropdown")]
        public void ThenTypeOfItemsIsDisplayedOnButtonInCaptureQueueButtonsDropdown(string numberOfTypes, string itemType, string button)
        {
            var dropdown = _driver.NowAt<CaptureQueueButtonsWrapperElement>();
            Verify.IsTrue(dropdown.DisplayedCounter(numberOfTypes, itemType, button), $"'{numberOfTypes}' type of '{itemType}' items is not displayed or displayed incorrectly on '{button}' button"); ;
        }
    }
}