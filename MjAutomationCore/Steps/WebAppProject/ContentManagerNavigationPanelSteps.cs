using AutomationUtils.Utils;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject;
using MjAutomationCore.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using System.Linq;
using System.Threading;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject
{
    [Binding]
    class ContentManagerNavigationPanelSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly BrowsersList _browsers;

        public ContentManagerNavigationPanelSteps(WebDriver driver, BrowsersList browsersList)
        {
            _driver = browsersList.GetBrowser();
            _browsers = browsersList;
        }

        [Then(@"'(.*)' cloud with '(.*)' user is displayed on navigation panel")]
        public void ThenCloudWithUserIsDisplayedOnNavigationPanel(string cloudName, string userName)
        {
            var panel = _browsers.Active.NowAt<ContentManagerNavigationPanelElement>();
            for (int i = 0; i < 30; i++)
            {
                if (panel.GetCloudByNameOnNavigationPanel(cloudName).Any(x => panel.GetInfoDescription(x).Contains(userName)))
                {
                    break;
                }
                else
                {
                    Thread.Sleep(1000);
                }
            }
            Verify.IsTrue(panel.GetCloudByNameOnNavigationPanel(cloudName).Any(x => panel.GetInfoDescription(x).Contains(userName)), $"Cloud '{cloudName}' with '{userName}' user is not displayed on navigation panel");
        }

        [When(@"User clicks settings icon on content navigation panel")]
        public void WhenUserClicksSettingsIconOnContentNavigationPanel()
        {
            var panel = _browsers.Active.NowAt<ContentManagerNavigationPanelElement>();
            _driver.WaitForElementToBeDisplayed(panel.ManagerNavigationPanel);
            panel.ManagerNavigationPanel.FindElement(By.XPath(panel.SettingsIcon)).Click();
        }

        [When(@"User clicks Back button on content navigation panel")]
        public void WhenUserClicksBackButtonOnContentNavigationPanel()
        {
            var panel = _browsers.Active.NowAt<ContentManagerNavigationPanelElement>();
            _driver.WaitForElementToBeDisplayed(panel.BackButtonOnManagerNavigationPanel, WebDriverExtensions.WaitTime.Long);
            panel.BackButtonOnManagerNavigationPanel.Click();
        }


        [Then(@"'(.*)' title is displayed on navigation panel")]
        public void ThenTitleIsDisplayedOnNavigationPanel(string title)
        {
            var panel = _browsers.Active.NowAt<ContentManagerNavigationPanelElement>();
            _driver.WaitForElementToBeDisplayed(panel.ManagerNavigationPanel.FindElement(By.XPath(panel.GetTitleOnPanel(title))));
            var titleOnPanel = panel.ManagerNavigationPanel.FindElement(By.XPath(panel.GetTitleOnPanel(title))).Displayed();
            Assert.IsTrue(titleOnPanel, $"{title} title is not displayed");
        }

        [When(@"User clicks Clear button in search field on navigation panel")]
        public void WhenUserClicksClearButtonInSearchFieldOnNavigationPanel()
        {
            var panel = _browsers.Active.NowAt<ContentManagerNavigationPanelElement>();
            panel.ButtonClearSearch.Click();
        }

        [When(@"User delete value via the key Beckspace in search field on navigation panel")]
        public void WhenUserDeleteValueViaTheKeyBeckspaceInSearchFieldOnNavigationPanel()
        {
            for (int j = 0; j < 5; j++)
            {
                _browsers.Active.ActionsSendKeys("Backspace");
                Thread.Sleep(300);
            }
        }

        [When(@"User clicks on Create New Folder button on content navigation panel")]
        public void WhenUserClicksOnCreateNewFolderButtonOnContentNavigationPanel()
        {
            var panel = _browsers.Active.NowAt<ContentManagerNavigationPanelElement>();
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementToContainsTextInAttribute(page.ProgressBarIcon, "display: none;", "style", WebDriverExtensions.WaitTime.Medium);
            panel.CreateNewFolderButton.Click();
        }

        [Then(@"'([^']*)' button is displayed on navigation panel")]
        public void ThenButtonIsDisplayedOnNavigationPanel(string button)
        {
            var panel = _browsers.Active.NowAt<ContentManagerNavigationPanelElement>();
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementToContainsTextInAttribute(page.ProgressBarIcon, "display: none;", "style", WebDriverExtensions.WaitTime.Medium);
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(panel.GetButtonByName(button)),$"Button '{button}' is not displayed on the navigation panel");
        }

        [Then(@"'([^']*)' filter is displayed on navigation panel")]
        public void ThenFilterIsDisplayedOnNavigationPanel(string filterName)
        {
            var panel = _browsers.Active.NowAt<ContentManagerNavigationPanelElement>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(panel.GetFilterByName(filterName)), $"'{filterName}' filter is not displayed on the navigation panel");
        }
    }
}