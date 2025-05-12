using SeleniumAutomationUtils.SeleniumExtensions;
using AutomationUtils.Utils;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.FileManager;
using MjAutomationCore.Utils;
using OpenQA.Selenium;
using System;
using System.Linq;
using Reqnroll;
using MjAutomationCore.DTO.BaseDto.RunTimeVariables;
using MjAutomationCore.Providers;
using System.Threading;

namespace MjAutomationCore.Steps.WebAppProject.FileManager
{
    [Binding]
    class FileManagerContentSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsers;
        private readonly SessionRandomValue _sessionRandom;

        public FileManagerContentSteps(BrowsersList browsers, SessionRandomValue sessionRandom)
        {
            _browsers = browsers;
            _sessionRandom = sessionRandom;
        }

        [Then(@"File manager content is displayed to User")]
        public void ThenFileManagerContentIsDisplayedToUser()
        {
            var page = _browsers.Active.NowAt<FileManagerContentPage>();
            Verify.IsTrue(page.FileManager.GetAttribute("style").Equals(String.Empty), "File manager content page is not displayed");
        }

        [When(@"User clicks '([^']*)' button in row with '([^']*)' file name of Published Files table")]
        public void WhenUserClicksButtonInRowWithFileNameOfPublishedFilesTable(string buttonName, string fileName)
        {
            fileName = fileName.AddRandom(_sessionRandom);
            var page = _browsers.Active.NowAt<FileManagerContentPage>();
            page.GetButtonByNameInRow(fileName, buttonName).Click();
        }

        [When(@"User clicks '([^']*)' button icon in row with '([^']*)' file name of Published Files table")]
        public void WhenUserClicksButtonIconInRowWithFileNameOfPublishedFilesTable(string buttonIcon, string fileName)
        {
            fileName = fileName.Replace(".mmap", "");
            fileName = fileName.AddRandom(_sessionRandom);
            var page = _browsers.Active.NowAt<FileManagerContentPage>();
            _browsers.Active.HoverAndClick(page.GetIconButtonInRow(fileName, buttonIcon));
        }

        [Then(@"'([^']*)' view is displayed in row with '([^']*)' file name of Published Files table")]
        public void ThenViewIsDisplayedInRowWithFileNameOfPublishedFilesTable(string viewCount, string fileName)
        {
            fileName = fileName.AddRandom(_sessionRandom);
            var page = _browsers.Active.NowAt<FileManagerContentPage>();
            Verify.IsTrue(page.GetViewCountByNameInRow(fileName, viewCount).Displayed(), $"View Count of '{viewCount}' is not displayed in row with '{fileName}' file name");
        }

        [When(@"User clicks down arrow in row with '([^']*)' file name of Published Files table")]
        public void WhenUserClicksDownArrowInRowWithFileNameOfPublishedFilesTable(string fileName)
        {
            fileName = fileName.AddRandom(_sessionRandom);
            var page = _browsers.Active.NowAt<FileManagerContentPage>();
            page.GetRowByName(fileName).FindElement(By.XPath(page.DownArrow)).Click();
        }

        [Then(@"following files are displayed in Published Files table")]
        public void ThenFollowingFilesAreDisplayedInPublishedFilesTable(Table table)
        {
            var page = _browsers.Active.NowAt<FileManagerContentPage>();
            _browsers.Active.WaitForElementsToBeDisplayed(page.PublishedFileList, WebDriverExtensions.WaitTime.Short, false);
            var files = page.PublishedFileList.Select(x => x.FindElement(By.XPath(page.MapNameSelector)).Text).ToList();
            var expectedFiles = table.Rows.SelectMany(row => row.Values).Select(x => x.AddRandom(_sessionRandom)).ToList();
            Verify.IsTrue(expectedFiles.All(expectedFile => files.Contains(expectedFile)), "Files are displayed incorrectly");
        }

        [Then(@"following files are displayed as selected in Published Files table")]
        public void ThenFollowingFilesAreDisplayedAsSelectedInPublishedFilesTable(Table table)
        {
            var page = _browsers.Active.NowAt<FileManagerContentPage>();
            _browsers.Active.WaitForElementsToBeDisplayed(page.PublishedFileList, WebDriverExtensions.WaitTime.Short, false);
            var filesSelected = page.PublishedFileList.Where(x => x.IsSelected()).ToList().Select(x => x.FindElement(By.XPath(page.MapNameSelector)).Text).ToList();
            var expectedFiles = table.Rows.SelectMany(row => row.Values).Select(x => x.AddRandom(_sessionRandom)).ToList();
            Verify.IsTrue(expectedFiles.All(expectedFile => filesSelected.Contains(expectedFile)), "One or more files are not selected in the Published Files table");
        }

        [Then(@"no file is displayed on Published Files table")]
        public void ThenNoFileIsDisplayedOnPublishedFilesTable()
        {
            var page = _browsers.Active.NowAt<FileManagerContentPage>();
            _browsers.Active.WaitForElementToBeDisplayed(page.MatchingFiles, WebDriverExtensions.WaitTime.Short);
            Verify.IsTrue(page.MatchingFiles.Displayed(), "File is displayed on Published Files table");
        }

        [Then(@"'([^']*)' message is displayed to User")]
        public void ThenMessageIsDisplayedToUser(string message)
        {
            var page = _browsers.Active.NowAt<FileManagerContentPage>();
            _browsers.Active.WaitForElementToBeDisplayed(page.MatchingFiles, WebDriverExtensions.WaitTime.Short);
            Verify.AreEqual(page.MatchingFiles.GetAttribute("data-no-matching-files"), message, $"Message '{message}' is displayed to User");
        }

        [When(@"User clicks published files delete button")]
        public void WhenUserClicksPublishedFilesDeleteButton()
        {
            var page = _browsers.Active.NowAt<FileManagerContentPage>();
            page.MapsDeleteButton.Click();
        }

        [Then(@"'([^']*)' button is enabled in the Published Files tab")]
        public void ThenButtonIsEnabledInThePublishedFilesTab(string button)
        {
            var page = _browsers.Active.NowAt<FileManagerContentPage>();
            Verify.IsTrue(page.IsButtonEnabled(button), $"Button '{button}' is disabled in the Published Files tab");
        }

        [Then(@"'([^']*)' button is disabled in the Published Files tab")]
        public void ThenButtonIsDisabledInThePublishedFilesTab(string button)
        {
            var page = _browsers.Active.NowAt<FileManagerContentPage>();
            Verify.IsFalse(page.IsButtonEnabled(button), $"Button '{button}' is enabled in the Published Files tab");
        }

        [Then(@"'([^']*)' button icon in row with '([^']*)' file name of Published Files table is displayed as marked")]
        public void ThenButtonIconInRowWithFileNameOfPublishedFilesTableIsDisplayedAsMarked(string buttonIcon, string fileName)
        {
            fileName = fileName.AddRandom(_sessionRandom);
            var page = _browsers.Active.NowAt<FileManagerContentPage>();
            Verify.IsTrue(page.IsMarkedAsFavourite(buttonIcon, fileName), $"'{buttonIcon}' button icon in row with '{fileName}' file name of Published Files table is not displayed as marked");
        }
    }
}