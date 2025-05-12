using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.QA;
using NUnit.Framework;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using System.Linq;
using System.Threading;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.QA
{
    [Binding]
    class MyFilesCloudSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;

        public MyFilesCloudSteps(WebDriver driver)
        {
            _driver = driver;
        }

        [When(@"User types ""(.*)"" in the Search field on the Cloud page")]
        public void WhenUserTypesInTheSearchFieldOnTheCloudPage(string text)
        {
            var page = _driver.NowAt<MyFilesCloudPage>();
            page.SearchFieldOnCloudPage[1].SendKeys(text);
            _driver.WaitForDataLoading();
            _driver.WaitForElementToBeDisplayed(page.ButtonClearSearchField);
        }

        [Then(@"clear button is visible search field to User")]
        public void ThenClearButtonIsVisibleSearchFieldToUser()
        {
            var page = _driver.NowAt<MyFilesCloudPage>();
            Assert.IsTrue(page.ButtonClearSearchField.Displayed, "Clear button is not displayed");
        }

        [Then(@"following cloud files are displayed to the User")]
        public void ThenFollowingCloudFilesAreDisplayedToTheUser(Table table)
        {
            var page = _driver.NowAt<MyFilesCloudPage>();
            var expectedList = table.Rows.SelectMany(row => row.Values).ToList();
            Thread.Sleep(300);
            var filesNames = page.GetСloudsFilesFromList();
            Assert.AreEqual(expectedList, filesNames, "Cloud files are displayed incorrectly");
        }

        [When(@"User click on the clear button in the search field on the Cloud page")]
        public void WhenUserClickOnTheClearButtonInTheSearchFieldOnTheCloudPage()
        {
            var page = _driver.NowAt<MyFilesCloudPage>();
            page.ButtonClearSearchField.Click();
        }

        [Then(@"search field is displayed on the Cloud page")]
        public void ThenSearchFieldIsDisplayedOnTheCloudPage()
        {
            var page = _driver.NowAt<MyFilesCloudPage>();
            Assert.IsTrue(page.SearchFieldOnCloudPage[1].Displayed(), "Search field is not displayed");
        }

        [Then(@"display message No content found")]
        public void ThenDisplayMessageNoContentFound()
        {
            var page = _driver.NowAt<MyFilesCloudPage>();
            Assert.IsFalse(page.MessageTitleCloudPage.Displayed(), "Message is not displayed");
        }

        [When(@"User clicks the setting button on the Cloud page")]
        public void WhenUserClicksTheSettingButtonOnTheCloudPage()
        {
           var page = _driver.NowAt<MyFilesCloudPage>();
            page.SettingsButton.Click();
            _driver.WaitForElementToBeDisplayed(page.FileOptionsTitle);
        }

        [Then(@"File Options are displayed to User on the Cloud page")]
        public void ThenFileOptionsAreDisplayedToUserOnTheCloudPage()
        {
            var page = _driver.NowAt<MyFilesCloudPage>();
            Assert.IsTrue(page.FileOptionsTitle.Displayed);
        }

        [Then(@"Alphabetical sorting mark is displayed by default")]
        public void ThenAlphabeticalSortingMarkIsDisplayedByDefault()
        {
            var page = _driver.NowAt<MyFilesCloudPage>();
            Assert.IsTrue(page.CheckMarkIconOnCloudPage.Displayed, "Check mark is not displayed");
        }

        [When(@"User click Check mark on the Cloud page")]
        public void WhenUserClickCheckMarkOnTheCloudPage()
        {
            var page = _driver.NowAt<MyFilesCloudPage>();
            page.CheckMarkIconOnCloudPage.Click();
        }

        [When(@"User click Next button on the for cloud file")]
        public void WhenUserClickNextButtonOnTheForCloudFile()
        {
            var page = _driver.NowAt<MyFilesCloudPage>();
            page.NextButtonForCloudFile.Click();
        }

        [When(@"User clicks ""(.*)"" on the File Options screen")]
        public void WhenUserClicksOnTheFileOptionScreen(string tabName)
        {
            var page = _driver.NowAt<MyFilesCloudPage>();
            page.GetFileOptionsByName(tabName);
        }
    }
}