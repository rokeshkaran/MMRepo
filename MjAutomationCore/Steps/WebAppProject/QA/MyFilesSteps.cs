using System.Linq;
using SeleniumAutomationUtils.SeleniumExtensions;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.QA;
using MjAutomationCore.Utils;
using NUnit.Framework;
using Reqnroll;
using OpenQA.Selenium;
using AutomationUtils.Utils;

namespace MjAutomationCore.Steps.WebAppProject.QA
{
    [Binding]
    class MyFilesSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly BrowsersList _browsers;

        public MyFilesSteps(WebDriver driver, BrowsersList browsersList)
        {
            _driver = browsersList.GetBrowser();
            _browsers = browsersList;
        }

        [Then(@"following cloud items are displayed to the User:")]
        public void ThenFollowingCloudItemsAreDisplayedToTheUser(Table table)
        {
            var page = _driver.NowAt<MyFilesPage>();
            var cloudsList = page.CloudItemsList.Select(column => column.Text).ToList();
            var expectedCloudsList = table.Rows.SelectMany(row => row.Values).ToList();
            foreach (string content in cloudsList)
            {
                Assert.IsTrue(expectedCloudsList.Contains(content),
                    $"'{content}' content is not displayed in the browser");
            }
        }

        [Then(@"title Save Changes To displayed on Base page to the User")]
        public void ThenTitleSaveChangesToDisplayedOnBasePageToTheUser()
        {
            var title = _driver.NowAt<MyFilesPage>();
            _driver.WaitForElementToBeDisplayed(title.SaveChangesToPageTitle);
            Assert.IsTrue(title.SaveChangesToPageTitle.Displayed(), "Title is not displayed");
        }

        [When(@"User clicks Back button on the Base page")]
        public void WhenUserClicksBackButtonOnTheBasePage()
        {
            var button = _driver.NowAt<MyFilesPage>();
            button.BackButtonOnBasePage.Click();
        }

        [When(@"User selects ""(.*)"" cloud on the My Files page")]
        public void WhenUserSelectsCloudOnTheMyFilesPage(string cloudName)
        {
            var page = _browsers.Active.NowAt<MyFilesPage>();
            _browsers.Active.ExecuteAction(() => page.GetCloudByName(cloudName).Click());
            page.LoginCloudPoint(cloudName);
        }

        [Then(@"on the page exist '(.*)' content item with '(.*)' description")]
        public void ThenOnThePageExistContentItemWithDescription(string item, string description)
        {
            var page = _browsers.Active.NowAt<MyFilesPage>();
            Verify.IsTrue(_browsers.Active.IsElementExists(page.GetContentItemWithDescription(item, description)), $"Content item '{item}' with '{description}' description is not displayed to User");
        }

        [Then(@"Close button is displayed in the top right corner of the screen")]
        public void ThenCloseButtonIsDisplayedInTheTopRightCornerOfTheScreen()
        {
            var button = _driver.NowAt<MyFilesPage>();
            Assert.IsTrue(button.CloseButton.Displayed(), "Close button is not displayed");
        }

        [When(@"User select '(.*)' content item with '(.*)' description")]
        public void WhenUserSelectContentItemWithDescription(string item, string description)
        {
            var page = _browsers.Active.NowAt<MyFilesPage>();
            var element = page.GetContentItemWithDescription(item, description);
            _browsers.Active.MoveToElement(element);
            element.Click();
        }

        [When(@"User clicks on Save In This Folder button on content manager cloud")]
        public void WhenUserClicksOnSaveInThisFolderButtonInContentManagerCloud()
        {
            var page = _browsers.Active.NowAt<MyFilesPage>();
            _driver.WaitForElementToBeDisplayed(page.SaveInThisFolderButton);
            page.SaveInThisFolderButton.Click();
        }
    }
}