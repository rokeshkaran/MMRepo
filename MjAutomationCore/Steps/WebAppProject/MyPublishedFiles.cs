using AutomationUtils.Utils;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.FileManagerHeader;
using MjAutomationCore.Pages.WebAppProject.MindManagerFiles;
using NUnit.Framework;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject
{
    [Binding]
    class MyPublishedFiles : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly CountOfViewDto _countOfView;
        private readonly SessionRandomValue _sessionRandom;

        public MyPublishedFiles(WebDriver driver, CountOfViewDto countOfView, SessionRandomValue sessionRandom)
        {
            _driver = driver;
            _countOfView = countOfView;
            _sessionRandom = sessionRandom;
        }

        [When(@"User clicks Select All button")]
        [When(@"User clicks Unselect All button")]
        public void WhenUserClicksSelectAllButton()
        {
            var page = _driver.NowAt<MyPublishedFilesPage>();
            _driver.WaitForElementToBeDisplayed(page.SelectAllCheckbox);
            //Delay for file loading
            Thread.Sleep(1000);
            _driver.ClickByActions(page.SelectAllCheckbox);
            _driver.WaitForDataLoading();
            //Delay after click
            Thread.Sleep(1000);
        }

        [When(@"User clicks Favorite button on the Action bar")]
        public void WhenUserClicksFavoriteButtonOnTheActionBar()
        {
            var page = _driver.NowAt<MyPublishedFilesPage>();
            page.FavoriteButton.Click();
            Thread.Sleep(1200);
        }

        [When(@"User clicks '(.*)' icon on the row '(.*)' in Published Files table")]
        public void WhenUserClicksIconOnTheRowInPublishedFilesTable(string fileName, string iconName)
        {
            var page = _driver.NowAt<MyPublishedFilesPage>();
            page.GetIconByNameInRow(iconName, fileName).Click();
        }

        [Then(@"'(.*)' icon is checked in row '(.*)' of Published Files table")]
        public void ThenIconIsCheckedInRowOfPublishedFilesTable(string fileName, string iconName)
        {
            var page = _driver.NowAt<MyPublishedFilesPage>();
            var iconStatus = page.GetIconByNameInRow(iconName, fileName).GetAttribute("class").Contains("on");
            Assert.IsTrue(iconStatus, $"'{iconName}' is not checked on '{fileName}' row");
        }

        [Then(@"checkbox is checked in row '(.*)' of Published Files table")]
        public void ThenCheckboxIsCheckedInRowOfPublishedFilesTable(string fileName)
        {
            fileName = fileName.AddRandom(_sessionRandom);
            var page = _driver.NowAt<MyPublishedFilesPage>();
            var checkbox = page.GetRowByFileNameInTablePublishedFiles(fileName).IsSelected();
            Verify.IsTrue(checkbox, $"Checkbox is not checked in '{fileName} 'row");
        }

        [Then(@"checkbox is unchecked in row '([^']*)' of Published Files table")]
        public void ThenCheckboxIsUncheckedInRowOfPublishedFilesTable(string fileName)
        {
            fileName = fileName.AddRandom(_sessionRandom);
            var page = _driver.NowAt<MyPublishedFilesPage>();
            var checkbox = page.GetRowByFileNameInTablePublishedFiles(fileName).IsSelected();
            Verify.IsFalse(checkbox, $"Checkbox is checked in '{fileName} 'row");
        }

        [When(@"User clicks Actions button for ""(.*)"" file")]
        public void WhenUserClicksActionsButtonForFile(string fileName)
        {
            var page = _driver.NowAt<MyPublishedFilesPage>();
            page.GetArrowIconInRow(fileName).Click();
        }

        [When(@"User clicks '(.*)' button in the '(.*)' row of Published Files table")]
        public void WhenUserClicksButtonInTheRowOfPublishedFilesTable(string buttonName, string fileName)
        {
            var page = _driver.NowAt<MyPublishedFilesPage>();
            page.GetButtonByNameInRow(fileName, buttonName).Click();
        }

        [When(@"User checks checkbox in '(.*)' row of Published Files table")]
        public void WhenUserChecksCheckboxInRowOfPublishedFilesTable(string fileName)
        {
            fileName = fileName.AddRandom(_sessionRandom);
            var page = _driver.NowAt<MyPublishedFilesPage>();
            page.GetCheckboxInRow(fileName).Click();
        }

        [Then(@"User remembers amount of View by '(.*)' file")]
        public void ThenUserRemembersAmountOfViewByFile(string fileName)
        {
            var page = _driver.NowAt<MyPublishedFilesPage>();
            var viewCount = page.GetMapViewsCount(fileName).Text;
            _countOfView.Value = Convert.ToInt32(viewCount);
        }

        [Then(@"count of view for '(.*)' file has changed")]
        public void ThenCountOfViewForFileHasChanged(string fileName)
        {
            var page = _driver.NowAt<MyPublishedFilesPage>();
            _driver.WaitForElementToBeDisplayed(page.PublishedFilesContainer);
            var viewCount = page.GetMapViewsCount(fileName).Text;
            int view = Convert.ToInt32(viewCount);
            Assert.AreEqual(view, _countOfView.Value + 1, $"{fileName} count of view is incorrect");
        }

        [Then(@"map is opened in the new tab in Presentation mode")]
        public void ThenMapIsOpenedInTheNewTabInPresentationMode()
        {
            _driver.SwitchTo().Window(_driver.WindowHandles.Last());
            _driver.WaitForDataLoading();
            var page = _driver.NowAt<ViewPublishedFilePage>();
            _driver.WaitForElementToBeDisplayed(page.MenuButtonInPresentationViewMode);
            Assert.IsTrue(page.MenuButtonInPresentationViewMode.Displayed());
        }

        [When(@"User clicks Sort button")]
        public void WhenUserClicksSortButton()
        {
            var page = _driver.NowAt<MyPublishedFilesPage>();
            page.SortButton.Click();
        }

        [When(@"User switches On Show Favorites only in the Filter")]
        public void WhenUserSwitchesOnShowFavoritesOnlyInTheFilter()
        {
            var page = _driver.NowAt<MyPublishedFilesPage>();
            page.FilterButton.Click();
            _driver.ClickByJavascript(page.SwitchOnInFilter);
            page.FilterButton.Click();
        }

        [When(@"User switches Off Show Favorites only in the Filter")]
        public void WhenUserSwitchesOffShowFavoritesOnlyInTheFilter()
        {
            var page = _driver.NowAt<MyPublishedFilesPage>();
            page.FilterButton.Click();
            _driver.ClickByJavascript(page.SwitchOffInFilter);
        }

        [Then(@"""(.*)"" file is selected")]
        public void ThenFileIsSelected(string fileName)
        {
            var page = _driver.NowAt<MyPublishedFilesPage>();
            Assert.IsTrue(page.GetSelectedFileByName(fileName).Displayed(), $"{fileName} file is not selected");
        }

        [Then(@"All files are selected")]
        public void ThenAllFilesAreSelected()
        {
            var page = _driver.NowAt<MyPublishedFilesPage>();
            var filesNames = page.PublishedFiles.Count();
            var selectedFiles = page.SelectedFiles.Count();
            Assert.AreEqual(filesNames, selectedFiles, "All files are not selected");
        }

        [Then(@"'([^']*)' is displayed in the Published Files tab")]
        public void ThenIsDisplayedOnTheMyPublishedFilesPage(string text)
        {
            var page = _driver.NowAt<MyPublishedFilesPage>();
            _driver.WaitForElementToBeDisplayed(page.GetSelectedFileText(text));
            Assert.IsTrue(page.GetSelectedFileText(text).Displayed(), $"{text} is not displayed");
        }

        [When(@"User reverts Advanced Options to default")]
        public void WhenUserRevertsAdvancedOptionsToDefault()
        {
            _driver.SwitchTo().Window(_driver.WindowHandles.First());
            var page = _driver.NowAt<MyPublishedFilesPage>();
        }

        [When(@"User clicks '([^']*)' option on map toolbur")]
        public void WhenUserClicksOptionOnMapToolbur(string name)
        {
            var page = _driver.NowAt<FileManagerHeaderPublishedFilesPage>();
            page.GetButtonIconOnMapToolbar(name).Click();
        }

    }
}