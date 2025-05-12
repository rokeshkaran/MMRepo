using AutomationUtils.Utils;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.LicensingProject;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using Reqnroll;

namespace MjAutomationCore.Steps.LicensingProject.Base
{
    [Binding]
    class SectionHeaderSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;

        public SectionHeaderSteps(WebDriver driver)
        {
            _driver = driver;
        }

        [When(@"User clicks Sign Out button in section header")]
        public void WhenUserClicksSignOutButtonInSectionHeader()
        {
            var el = _driver.NowAt<SectionHeaderElement>();
            _driver.WaitForElementToBeDisplayed(el.SignOutButton);
            el.SignOutButton.Click();
        }

        [Then(@"'([^']*)' mark is displayed on section header")]
        public void ThenMarkIsDisplayedOnSectionHeader(string value)
        {
            var el = _driver.NowAt<SectionHeaderElement>();
            Verify.IsTrue(el.DisplayedMark(value), $"Mark '{value}'is not displayed on section header");
        }
    }
}
