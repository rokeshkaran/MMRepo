using MjAutomationCore.Pages.WebAppProject.QA;
using MjAutomationCore.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.WebEditor
{
    [Binding]
    class ContextFilterOptionSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly BrowsersList _browsers;

        public ContextFilterOptionSteps(BrowsersList browsersList)
        {
            _driver = browsersList.GetBrowser();
            _browsers = browsersList;
        }

        [Then(@"filter context menu is displayed to User")]
        public void ThenFilterContextMenuIsDisplayedToUser()
        {
            var contextMenu = _driver.NowAt<FilterContextMenuPage>();
            Assert.IsTrue(contextMenu.DisplayedFilterContextMenu(), "Filter context menu is not displayed to User");
        }

        [Then(@"filter context menu is not displayed to User")]
        public void ThenFilterContextMenuIsNotDisplayedToUser()
        {
            var contextMenu = _driver.NowAt<FilterContextMenuPage>();
            Assert.IsFalse(contextMenu.DisplayedFilterContextMenu(), "Filter context menu is displayed to User");
        }

        [When(@"User clicks '(.*)' icon in '(.*)' section of filter context menu")]
        public void WhenUserClicksIconInSectionOfFilterContextMenu(string iconName, string sectionName)
        {
            var contextMenu = _browsers.Active.NowAt<FilterContextMenuPage>();
            contextMenu.GetIconByNameInSectionOnFilterContextMenu(iconName, sectionName).Click();
        }

        [Then(@"popup context menu filter with '(.*)' title is displayed on page")]
        public void ThenPopupContextMenuFilterWithTitleIsDisplayedOnPage(string titlePopup)
        {
            var popup = _driver.NowAt<FilterContextMenuPage>();
            _driver.WaitForElementToBeDisplayed(popup.GetContextFilterOptionByTitle(titlePopup));
            Assert.IsTrue(popup.GetContextFilterOptionByTitle(titlePopup).Displayed(),
                $"{titlePopup} is not displayed in page");
        }
    }
}
