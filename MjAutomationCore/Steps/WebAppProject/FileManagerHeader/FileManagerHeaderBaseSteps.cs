using SeleniumAutomationUtils.SeleniumExtensions;
using AutomationUtils.Utils;
using MjAutomationCore.Pages.WebAppProject.FileManagerHeader;
using MjAutomationCore.Providers;
using MjAutomationCore.Utils;
using System;
using Reqnroll;
using MjAutomationCore.Helpers;
using MjAutomationCore.Extensions;

namespace MjAutomationCore.Steps.WebAppProject.FileManagerHeader
{
    [Binding]
    class FileManagerHeaderBaseSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsers;

        public FileManagerHeaderBaseSteps(BrowsersList browsers)
        {
            _browsers = browsers;
        }

        [Then(@"file manager header page is displayed to User")]
        public void ThenFileManagerHeaderPageIsDisplayedToUser()
        {
            var page = _browsers.Active.NowAt<FileManagerHeaderBasePage>();
            _browsers.Active.WaitForElementToBeDisplayed(page.GetTabByName("Published Files"), WebDriverExtensions.WaitTime.Long);
            if (EnvironmentProvider.Env.Equals("envappQA")
                || EnvironmentProvider.Env.Equals("envappStaging")
                || EnvironmentProvider.Env.Equals("envappProd"))
            {
                Verify.IsTrue(page.GetTabByName("New").Displayed(), "New tab is not displayed");
                Verify.IsTrue(page.GetTabByName("My Files").Displayed(), "My Files tab is not displayed");
                Verify.IsTrue(page.GetTabByName("Published Files").Displayed(), "Published Files tab is not displayed");
            }
            else if (EnvironmentProvider.Env.Equals("envQa")
                || EnvironmentProvider.Env.Equals("envStaging")
                || EnvironmentProvider.Env.Equals("envProd"))
            {
                Verify.IsTrue(page.GetTabByName("Published Files").Displayed(), "Published Files tab is not displayed");
            }
            else
            {
                throw new Exception("Environment was not identified");
            }
        }

        [Then(@"'([^']*)' tab is displayed on file manager header page")]
        public void ThenTabIsDisplayedOnFileManagerHeaderPage(string tabName)
        {
            var page = _browsers.Active.NowAt<FileManagerHeaderBasePage>();
            Verify.IsTrue(page.DisplayedTab(tabName), $"Tab '{tabName}' is displayed on file manager header page");
        }

        [Then(@"'([^']*)' tab is not displayed on file manager header page")]
        public void ThenTabIsNotDisplayedOnFileManagerHeaderPage(string tabName)
        {
            var page = _browsers.Active.NowAt<FileManagerHeaderBasePage>();
            Verify.IsFalse(page.DisplayedTab(tabName), $"Tab '{tabName}' is not displayed on file manager header page");
        }

        [When(@"User clicks '([^']*)' tab on file manager header page")]
        public void WhenUserClicksTabOnFileManagerHeaderPage(string tabName)
        {
            var page = _browsers.Active.NowAt<FileManagerHeaderBasePage>();
            _browsers.Active.ClickByJavascript(page.GetTabByName(tabName));
        }

        [Then(@"'([^']*)' tab is active on file manager header page")]
        public void ThenTabIsActiveOnFileManagerHeaderPage(string tabName)
        {
            var page = _browsers.Active.NowAt<FileManagerHeaderBasePage>();
            _browsers.Active.WaitForElementToContainsTextInAttribute(page.GetTabByName(tabName), "active", "class");
            Verify.IsTrue(page.GetTabByName(tabName).IsActive(), $"Tab '{tabName}' is not active on file manager header page");
        }

        [Then(@"Home page wordmark header is displayed in '([^']*)' color")]
        public void ThenHomePageWordmarkHeaderIsdisplayedInColor(string Color)
        {
            var page = _browsers.Active.NowAt<FileManagerHeaderBasePage>();
            _browsers.Active.WaitForElementToBeDisplayed(page.TopBar);
            var ImageDetails = page.TopBar.GetCssValue("background-image");
            var Decoded = BrandImageHelper.DecodeImage(ImageDetails);
            Verify.IsTrue(Decoded.Contains(Color), $"The Home Page Wordmark header is not displayed in the expected color '{Color}'");
        }
    }
}