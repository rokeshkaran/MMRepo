using SeleniumAutomationUtils.SeleniumExtensions;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.LeftSideMenuPanel;
using MjAutomationCore.Utils;
using NUnit.Framework;
using Reqnroll;
using OpenQA.Selenium;
using AutomationUtils.Utils;
using MjAutomationCore.DTO.WebAppDTO;
using System.Linq;

namespace MjAutomationCore.Steps.WebAppProject.WebEditor
{
    [Binding]
    class LeftSideMenuPanelSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly BrowsersList _browsers;
        private readonly SessionRandomValue _sessionRandom;

        public LeftSideMenuPanelSteps(WebDriver driver, BrowsersList browsersList, SessionRandomValue sessionRandom)
        {
            _driver = browsersList.GetBrowser();
            _browsers = browsersList;
            _sessionRandom = sessionRandom;
        }

        [Then(@"Left side menu panel is displayed to the User")]
        public void ThenLeftSideMenuPanelIsDisplayedToTheUser()
        {
            var page = _browsers.Active.NowAt<LeftSideMenuPanelPage>();
            _browsers.Active.WaitForElementToContainsTextInAttribute(page.MenuPanel, "visible", "style", WebDriverExtensions.WaitTime.Short);
            Assert.IsTrue(page.GetMenuPanelState(), "Left side menu panel is not displayed");
        }

        [Then(@"Left side menu panel is not displayed to the User")]
        public void ThenLeftSideMenuPanelIsNotDisplayedToTheUser()
        {
            var page = _browsers.Active.NowAt<LeftSideMenuPanelPage>();
            _browsers.Active.WaitForElementToNotContainsTextInAttribute(page.MenuPanel, "visible", "style", WebDriverExtensions.WaitTime.Short);
            _browsers.Active.WaitForElementToContainsTextInAttribute(page.MenuPanel, "hidden", "style", WebDriverExtensions.WaitTime.Short);
            Assert.IsFalse(page.GetMenuPanelState(), "Left side menu panel is displayed");
        }

        [When(@"User clicks Close button in the top right corner on Left side menu panel")]
        public void WhenUserClicksCloseButtonInTheTopRightCornerOnLeftSideMenuPanel()
        {
            var panel = _browsers.Active.NowAt<LeftSideMenuPanelPage>();
            _browsers.Active.WaitForElementToBeDisplayed(panel.CloseMenuButton);
            panel.CloseMenuButton.Click();
        }

        [Then(@"app version is displayed on the left side menu panel")]
        public void ThenAppVersionIsDisplayedOnTheLeftSideMenuPanel()
        {
            var panel = _browsers.Active.NowAt<LeftSideMenuPanelPage>();
            var versionCheck = panel.MenuVersion.GetText();
            Verify.IsTrue(!string.IsNullOrEmpty(versionCheck) && versionCheck.Length > 1, "App version is not displayed on Left side menu panel");
        }

        [Then(@"The following button is displayed on the left side menu panel")]
        public void ThenTheFollowingButtonIsDisplayedOnTheLeftSideMenuPanel(Table table)
        {
            var panel = _browsers.Active.NowAt<LeftSideMenuPanelPage>();
            _browsers.Active.WaitForElementsToBeDisplayed(panel.LeftMenuButtonLists, WebDriverExtensions.WaitTime.Medium, false);
            var listItems = panel.LeftMenuButtonLists.Select(x => x.Text).ToList();
            var expectedTemplatesList = table.Rows.SelectMany(row => row.Values).ToList();
            Verify.AreEqual(listItems, expectedTemplatesList, "The buttons list is not displayed correctly on left side menu panel");
        }

        [Then(@"Left side menu panel has '([^']*)' sub title with '([^']*)' title header")]
        public void ThenLeftSideMenuPanelHasSubTitleWithTitleHeader(string subTitle, string headTitle)
        {
            subTitle = subTitle.AddRandom(_sessionRandom);
            var panel = _browsers.Active.NowAt<LeftSideMenuPanelPage>();
            Verify.IsTrue(panel.GetSubTitleByTitleHeader(subTitle, headTitle).Displayed(), $"Left side menu panel has '{subTitle}' subtitle with '{headTitle}' title header is not displayed");
        }

        [When(@"User clicks '(.*)' button on Left side menu panel")]
        public void WhenUserClicksButtonOnLeftSideMenuPanel(string buttonName)
        {
            var button = _browsers.Active.NowAt<LeftSideMenuPanelPage>();
            button.GetButtonByName(buttonName).Click();
        }

        [Then(@"'(.*)' version is displayed to Left side menu panel")]
        public void ThenVersionIsDisplayedToLeftSideMenuPanel(string value)
        {
            var page = _browsers.Active.NowAt<LeftSideMenuPanelPage>();
            _browsers.Active.WaitForElementToBeDisplayed(page.MenuVersion);
            var version = page.MenuVersion.Text.Contains(value);
            Assert.IsTrue(version, $"Version '{value}' is not displayed or incorrect");
        }
    }
}