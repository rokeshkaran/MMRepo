using AutomationUtils.Utils;
using MjAutomationCore.Components.Base;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.DTO.WebAppDTO.Clouds.MindManagerCloud.MindManagerStorageExplorer;
using MjAutomationCore.Extensions;
using MjAutomationCore.Helpers;
using MjAutomationCore.Pages.WebAppProject;
using MjAutomationCore.Utils;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using System.Linq;
using System.Threading;
using Reqnroll;
using Logger = AutomationUtils.Utils.Logger;
using MjAutomationCore.Providers;
using MjAutomationCore.Steps.WebAppProject.QA;

namespace MjAutomationCore.Steps.WebAppProject
{
    [Binding]
    class ContentManagerSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly BrowsersList _browsers;
        private readonly MindManagerCloudItemDto _mindmanagerfile;
        private readonly SessionRandomValue _sessionRandom;
        private ScenarioContext _scenarioContext;

        public ContentManagerSteps(WebDriver driver, BrowsersList browsersList, SessionRandomValue sessionRandom, MindManagerCloudItemDto mindManagerFileDto,ScenarioContext scenarioContext)
        {
            _driver = browsersList.GetBrowser();
            _browsers = browsersList;
            _sessionRandom = sessionRandom;
            _mindmanagerfile = mindManagerFileDto;
            _scenarioContext = scenarioContext;
        }

        [Then(@"content page is displayed to User")]
        public void ThenContentPageIsDisplayedToUser()
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementToBeDisplayed(page.ManagerContent);
            _browsers.Active.WaitForElementToContainsTextInAttribute(page.ManagerContent.FindElement(By.XPath(page.LoadingContent)), "display: none;", "style", WebDriverExtensions.WaitTime.Medium);
            Verify.IsTrue(page.ManagerContent.Displayed(), "Content page is not displayed");
        }

        [Then(@"'([^']*)' button is displayed on content manager page")]
        public void ThenButtonIsDisplayedOnContentManagerPage(string button)
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.ContentPageBackButton(button)), "Content page back button is not displayed");
        }

        [Then(@"Content Manager footer is displayed on content manager page")]
        public void ThenContentManagerFooterIsDisplayed()
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.ContentManagerFooterContainer), "Page footer is not displayedon content manager page");
        }

        [Then(@"Content Manager footer is not displayed")]
        public void ThenContentManagerFooterIsNotDisplayed()
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            Verify.IsFalse(_browsers.Active.IsElementDisplayed(page.ContentManagerFooterContainer,WebDriverExtensions.WaitTime.Short), "Page footer is not displayedon content manager page");
        }

        [Then(@"'([^']*)' item name is displayed on Content Manager footer")]
        public void ThenFileIsDisplayedOnContentManagerFooter(string item)
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            item = item.AddRandom(_sessionRandom);
            var fileName = page.FooterFileName.Text;
            Verify.IsTrue(fileName.Contains(item), $"'{item}' item name is not displayed on Content Manager footer");
        }

        [Then(@"'([^']*)' icon is displayed on Content Manager footer")]
        public void ThenIconIsDisplayedOnContentManagerFooter(string icon)
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetFooterIconByName(icon)), $"'{icon}' icon is not displayed on Content Manager footer");
        }

        [Then(@"button with '([^']*)' name is displayed on Content Manager footer")]
        public void ThenButtonWithNameIsDisplayedOnContentManagerFooter(string buttonName)
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetFooterButtonByName(buttonName),WebDriverExtensions.WaitTime.Short), $"button with '{buttonName}' name is not displayed on Content Manager footer");
        }

        [When(@"User clicks button with '([^']*)' name on Content Manager footer")]
        public void WhenUserClicksButtonWithNameOnContentManagerFooter(string buttonName)
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            page.GetFooterButtonByName(buttonName).Click();
        }

        [When(@"User clicks '([^']*)' content item")]
        public void WhenUserClicksContentItem(string item)
        {
            if(item.Equals("MindManager Files") | (item.Equals("Add Place")))
            {
                try
                {   
                    var CloudsStep = new CloudsSteps(_driver, _browsers);
                    CloudsStep.WaitForRemoteServicesToBeReady();
                }catch { Thread.Sleep(2000); }                              
            }
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementsToBeDisplayed(page.GetContentItems(item), WebDriverExtensions.WaitTime.Medium, false);
            var content = page.GetContentItem(item);
            _browsers.Active.WaitForElementToNotContainsTextInAttribute(content, "signing-in", "class", WebDriverExtensions.WaitTime.Long);
            _browsers.Active.MoveToElement(page.GetContentItem(item));
            ((IJavaScriptExecutor)_browsers.Active).ExecuteScript("arguments[0].scrollIntoView();", page.GetContentItem(item));
            _browsers.Active.ClickByActions(page.GetContentItem(item));            
            
            if (_browsers.Active.IsElementExists(page.ProgressBarIcon))
            {
                _browsers.Active.WaitForElementToContainsTextInAttribute(page.ProgressBarIcon, "display: none;", "style", WebDriverExtensions.WaitTime.Long);
            }
        }

        [Then(@"'([^']*)' item is displayed on content manager page")]
        public void ThenItemIsDisplayedOnContentManagerPage(string item)
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementToContainsTextInAttribute(page.ProgressBarIcon, "display: none;", "style", WebDriverExtensions.WaitTime.Medium);
            item = item.AddRandom(_sessionRandom);
            item = item.Replace(".mmap", "");
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetContentItem(item), WebDriverExtensions.WaitTime.Short), $"'{item}' content item is not displayed");
        }

        [When(@"User drags '([^']*)' item to '([^']*)' folder on the content manager page")]
        public void WhenUserDragsItemToFolderOnTheContentManagerPage(string itemName, string folderName)
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementToContainsTextInAttribute(page.ProgressBarIcon, "display: none;", "style", WebDriverExtensions.WaitTime.Medium);
            itemName = itemName.AddRandom(_sessionRandom).Replace(".mmap", "");
            var item = page.GetContentItems(itemName).FirstOrDefault(x => page.GetTitleFile(x).Equals(itemName));
            var folder = page.GetContentItems(folderName).FirstOrDefault(x => page.GetTitleFile(x).Equals(folderName));
            _browsers.Active.DragAndDrop(item,folder);
        }

        [Then(@"'([^']*)' content item is displayed on content manager page")]
        public void ThenContentItemIsDisplayedOnContentManagerPage(string item)
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementToContainsTextInAttribute(page.ProgressBarIcon, "display: none;", "style", WebDriverExtensions.WaitTime.Medium);
            Verify.IsTrue(page.IsContentItemDisplayed(item), $"'{item}' content item is not displayed on content manager page");
        }

        [Then(@"Recent Files Banner is displayed on Content Manager Page")]
        public void ThenRecentFilesBannerIsDisplayedOnContentManagerPage()
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.RecentFilesBanner, WebDriverExtensions.WaitTime.Medium), "Recent Files Banner is not displayed");
        }

        [Then(@"Recent Files Banner is NOT displayed on Content Manager Page")]
        public void ThenRecentFilesBannerIsNOTDisplayedOnContentManagerPage()
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            Verify.IsFalse(_browsers.Active.IsElementDisplayed(page.RecentFilesBanner), "Recent Files Banner is displayed");
        }

        [Then(@"'([^']*)' content item is not displayed on content manager page")]
        public void ThenContentItemIsNotDisplayedOnContentManagerPage(string item)
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementToContainsTextInAttribute(page.ProgressBarIcon, "display: none;", "style", WebDriverExtensions.WaitTime.Medium);
            Verify.IsFalse(page.IsContentItemDisplayed(item), $"Item '{item}' is displayed on content manager page");
        }

        [Then(@"'([^']*)' content item is selected")]
        public void ThenContentItemIsSelected(string item)
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            Verify.IsTrue(page.DisplayedContentItemState(item), $"Content item '{item}' is not selected");
        }

        [When(@"User clicks '(.*)' content item with '(.*)' description")]
        public void WhenUserClicksContentItemWithDescription(string item, string description)
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementsToBeDisplayed(page.GetContentItems(item), WebDriverExtensions.WaitTime.Medium, false);
            var content = page.GetContentItems(item).First(x => page.GetInfoDescription(x).Equals(description));
            content.Click();
        }

        [When(@"User clicks '(.*)' file")]
        public void WhenUserClicksFile(string fileName)
        {
            _browsers.Active.WaitForDocumentReadyState();
            fileName = fileName.AddRandom(_sessionRandom);
            fileName = fileName.Replace(".mmap", "");
            Logger.Write($"{fileName} file name");
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementToBeDisplayed(page.ManagerContent);
            
            try
            {
                _browsers.Active.WaitForElementsToBeDisplayed(page.GetContentItems(fileName, WebDriverExtensions.WaitTime.Long), WebDriverExtensions.WaitTime.Medium, false);
            }
            catch 
            {
                _browsers.Active.ScrollGridToTheEnd(page.ManagerContent);
                Thread.Sleep(1000);
                var parentSelector = WebContainer.GetContainerSelector("ContentManagerNavigationPanelElement");
                _browsers.Active.GetComponent<InputByAttribute>("service-search-input", new Properties() { ParentSelector = parentSelector }).ClearSendKeys(fileName);
                _browsers.Active.WaitForDataLoading();
            }

            var content = page.GetContentItems(fileName).First(x => page.GetTitleFile(x).Equals(fileName));
            _browsers.Active.HoverAndClick(content);
            _browsers.Active.WaitForElementToContainsTextInAttribute(page.ProgressBarIcon, "display: none;", "style", WebDriverExtensions.WaitTime.Long);
            AutomationUtils.Utils.Logger.Write($"File with name '{fileName}' opened for test: '{_scenarioContext.ScenarioInfo.Title}'", AutomationUtils.Utils.Logger.LogLevel.Info);
        }

        [When(@"User hovers on '([^']*)' file")]
        public void WhenUserHoversOnFile(string fileName)
        {
            fileName = fileName.AddRandom(_sessionRandom);
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementToBeDisplayed(page.ManagerContent);
            _browsers.Active.WaitForElementsToBeDisplayed(page.GetContentItems(fileName), WebDriverExtensions.WaitTime.Medium, false);
            var content = page.GetContentItems(fileName).First(x => page.GetTitleFile(x).Equals(fileName));
            _browsers.Active.MoveToElement(content);
        }

        [When(@"User hovers on '([^']*)' file and clicks on '([^']*)' action button")]
        public void WhenUserHoversOnFileAndClicksOnActionButton(string fileName, string actionButton)
        {
            fileName = fileName.AddRandom(_sessionRandom);
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            Thread.Sleep(1000); //Prevent stale error
            _browsers.Active.WaitForElementToBeDisplayed(page.ManagerContent);
            Thread.Sleep(1000); //Prevent stale error
            var file = page.GetContentItems(fileName).First(x => page.GetTitleFile(x).Equals(fileName));
            _browsers.Active.MoveToElement(file);
            page.GetFileActionButtonByName(file, actionButton).Click();
        }

        [Then(@"'([^']*)' action button is displayed for '([^']*)' file on content manager Page")]
        public void ThenButtonIsDisplayedForFileOnContentManagerPage(string actionButton, string fileName)
        {
            fileName = fileName.AddRandom(_sessionRandom);
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementToBeDisplayed(page.ManagerContent);
            var file = page.GetContentItems(fileName).First(x => page.GetTitleFile(x).Equals(fileName));
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetFileActionButtonByName(file, actionButton)), $"'{actionButton}' button is displayed for '{fileName}' file");
        }

        [When(@"User clicks '(.*)' folder")]
        public void WhenUserClicksFolder(string folderName)
        {        
            _browsers.Active.WaitForDataLoading();
            _browsers.Active.WaitForDocumentReadyState();
            folderName = folderName.AddRandom(_sessionRandom);
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementToBeDisplayed(page.ManagerContent);
            _browsers.Active.WaitForDocumentReadyState();
            _browsers.Active.WaitForElementsToBeDisplayed(page.GetContentItems(folderName), WebDriverExtensions.WaitTime.ExtraLong, true);
            page.GetContentItems(folderName).First(x => page.GetTitleFile(x).Equals(folderName) & x.Displayed.Equals(true)).Click();
            _browsers.Active.WaitForElementToContainsTextInAttribute(page.ProgressBarIcon, "display: none;", "style", WebDriverExtensions.WaitTime.Long);
        }

        [Then(@"'(.*)' file is exist on page")]
        public void ThenFileIsExistOnPage(string item)
        {
            item = item.AddRandom(_sessionRandom);
            item = item.Replace(".mmap", "").Replace(".mdeck", "");
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            for (int i = 0; i < 10; i++)
            {
                if (page.GetContentItems(item).Any(x => page.GetTitleFile(x).Equals(item)))
                {
                    break;
                }
                else
                {
                    Thread.Sleep(1000);
                }
            }
        }

        [Then(@"'(.*)' item with '(.*)' description is exist on page")]
        public void ThenItemWithDescriptionIsExistOnPage(string item, string description)
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            for (int i = 0; i < 10; i++)
            {
                if (page.GetContentItems(item).Any(x => page.GetInfoDescription(x).Contains(description)))
                {
                    break;
                }
                else
                {
                    Thread.Sleep(2000);
                }
            }

            var content = page.GetContentItems(item).Any(x => page.GetInfoDescription(x).Contains(description));
            Verify.IsTrue(content, $"{item} content with {description} description is not exist");
        }

        [Then(@"'(.*)' folder with '(.*)' description is exist on page")]
        public void ThenFolderWithDescriptionIsExistOnPage(string item, string description)
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            for (int i = 0; i < 30; i++)
            {
                if (page.GetContentItems(item).Any(x => page.GetInfoDescription(x).Equals(description)))
                {
                    break;
                }
                else
                {
                    Thread.Sleep(1000);
                }
            }

            var content = page.GetContentItems(item).Any(x => page.GetInfoDescription(x).Equals(description));
            Verify.IsTrue(content, $"{item} folder with {description} description is not Exist");
        }

        [Then(@"'([^']*)' item with '([^']*)' description is not dislayed on content manager page")]
        public void ThenItemWithDescriptionIsNotDislayedOnContentManagerPage(string item, string description)
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            Verify.IsFalse(page.IsContentItemWithDescriptionDisplayed(item, description), $"Content '{item}' with {description} description is exist on content manager page");
        }

        [Then(@"'([^']*)' item with '([^']*)' description is displayed on content manager page")]
        public void ThenItemWithDescriptionIsDislayedOnContentManagerPage(string item, string description)
        {
            if (item.Equals("OneDrive") | (item.Equals("Box")) | (item.Equals("SharePoint")))
            {
                try
                {
                    var CloudsStep = new CloudsSteps(_driver, _browsers);
                    CloudsStep.WaitForRemoteServicesToBeReady();
                }
                catch { }
            }
            item = item.AddRandom(_sessionRandom);
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementToContainsTextInAttribute(page.ProgressBarIcon, "display: none;", "style", WebDriverExtensions.WaitTime.Medium);
            Verify.IsTrue(page.IsContentItemWithDescriptionDisplayed(item, description), $"Content '{item}' with {description} description is not displayed on content manager page");
        }

        [Then(@"'([^']*)' item with '([^']*)' description is displayed '([^']*)' times on content manager page")]
        public void ThenItemWithDescriptionIsDisplayedTimesOnContentManagerPage(string item, string description, int Occurance)
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            ((IJavaScriptExecutor)_browsers.Active).ExecuteScript("arguments[0].scrollIntoView();", page.GetContentItem("Add Place"));
            Verify.IsTrue(page.ContentItemCount(item, description).Equals(Occurance), $"Content '{item}' with {description} description is not displayed on content manager page");
        }

        [Then(@"'(.*)' Folders is displayed on page")]
        public void ThenFoldersIsDisplayedOnPage(int count)
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            var folderIcon = page.FolderIcon.Count;
            AutomationUtils.Utils.Logger.Write($"{folderIcon} browser");
            Verify.AreEqual(folderIcon, count, "folders icon count is incorrect");
        }

        [Then(@"'(.*)' Files is displayed on page")]
        public void ThenFilesIsDisplayedOnPage(int count)
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementsToBeDisplayed(page.FileIcon, WebDriverExtensions.WaitTime.ExtraLong, false);
            var filesIcon = page.FileIcon.Count;
            Verify.AreEqual(filesIcon, count, "Files icon count is incorrect");
        }

        [Then(@"following folders are displayed on page to the User:")]
        public void ThenFollowingFoldersAreDisplayedOnPageToTheUser(Table table)
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementToContainsTextInAttribute(
                page.ManagerContent.FindElement(By.XPath(page.LoadingContent)), "display: none;", "style", WebDriverExtensions.WaitTime.Medium);
            _browsers.Active.WaitForElementsToBeDisplayed(page.FolderTitleList);
            var folderList = page.FolderTitleList.Select(x => x.Text).ToList();
            var expectedFolders = table.Rows.SelectMany(row => row.Values.Select(x => x.AddRandom(_sessionRandom))).ToList();
            foreach (string content in folderList)
            {
                Verify.IsTrue(expectedFolders.Contains(content),
                    $"'{content}' folders is not displayed on page");
            }
        }

        [Then(@"following files are displayed on page to the User:")]
        public void ThenFollowingFilesAreDisplayedOnPageToTheUser(Table table)
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementToContainsTextInAttribute(page.ManagerContent.FindElement(By.XPath(page.LoadingContent)), "display: none;", "style", WebDriverExtensions.WaitTime.Medium);
            _browsers.Active.WaitForElementsToBeDisplayed(page.FileTitleList);
            var filesList = page.FileTitleList.Select(x => x.Text).ToList();
            var expectedFiles = table.Rows.SelectMany(row => row.Values.Select(x => x.AddRandom(_sessionRandom))).ToList();
            Verify.IsTrue(expectedFiles.All(expectedFile => filesList.Contains(expectedFile)), $"One or more files are not in the Files List. Actual Files list: '{string.Join(", ", filesList)}'");
        }

        [Then(@"following sites are displayed on page to the User:")]
        public void ThenFollowingSitesAreDisplayedOnPageToTheUser(Table table)
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementToContainsTextInAttribute(page.ManagerContent.FindElement(By.XPath(page.LoadingContent)), "display: none;", "style", WebDriverExtensions.WaitTime.Medium);
            _browsers.Active.WaitForElementsToBeDisplayed(page.SiteTitleList);
            var sitesList = page.SiteTitleList.Select(x => x.Text).ToList();
            var expectedSites = table.Rows.SelectMany(row => row.Values.Select(x => x.AddRandom(_sessionRandom))).ToList();
            Verify.IsTrue(expectedSites.All(expectedSite => sitesList.Contains(expectedSite)), "One or more sites are not in the Sites List");
        }

        [Then(@"following sites are not displayed on page to the User:")]
        public void ThenFollowingSitesAreNotDisplayedOnPageToTheUser(Table table)
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementToContainsTextInAttribute(page.ManagerContent.FindElement(By.XPath(page.LoadingContent)), "display: none;", "style", WebDriverExtensions.WaitTime.Medium);
            var sitesList = page.SiteTitleList.Select(x => x.Text).ToList();
            var expectedSites = table.Rows.SelectMany(row => row.Values.Select(x => x.AddRandom(_sessionRandom))).ToList();
            Verify.IsTrue(expectedSites.All(expectedSite => !sitesList.Contains(expectedSite)), "One or more sites are not in the Sites List");
        }

        [Then(@"the files are sorted by alphabetical order")]
        public void ThenTheFilesAreSortedByAlphabeticalOrder()
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementToContainsTextInAttribute(page.ManagerContent.FindElement(By.XPath(page.LoadingContent)), "display: none;", "style", WebDriverExtensions.WaitTime.Medium);
            _browsers.Active.WaitForElementsToBeDisplayed(page.FileTitleList);
            var actualFilesList = page.FileTitleList.Select(x => x.Text).ToList();
            var sortedActualFilesList = page.FileTitleList.OrderBy(x => x.Text).Select(x => x.Text).ToList();
            Verify.AreEqual(sortedActualFilesList, actualFilesList, "Files are not sorted alphabetically");
        }

        [Then(@"the files are sorted by most recent")]
        public void ThenTheFilesAreSortedByMostRecent()
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementToContainsTextInAttribute(page.ManagerContent.FindElement(By.XPath(page.LoadingContent)), "display: none;", "style", WebDriverExtensions.WaitTime.Medium);
            _browsers.Active.WaitForElementsToBeDisplayed(page.FileInfoList);
            var actualFilesList = page.FileInfoList.Select(x => x.Text).ToList();
            var sortedActualFilesList = page.FileInfoList.OrderBy(x => x.Text).Select(x => x.Text).ToList();
            Verify.AreEqual(sortedActualFilesList, actualFilesList, "File list is not sorted");
        }

        [Then("The found files are located in the following clouds:")]
        public void TheFoundFilesAreLocatedInTheFollowingClouds(Table table)
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementToContainsTextInAttribute(page.ManagerContent.FindElement(By.XPath(page.LoadingContent)), "display: none;", "style", WebDriverExtensions.WaitTime.Medium);
            _browsers.Active.WaitForElementsToBeDisplayed(page.FileInfoList);
            var actualFileCloudsList = page.FileInfoList.Select(x => x.Text).ToList();
            var expectedValues = table.Rows.SelectMany(row => row.Values.Select(x => x.AddRandom(_sessionRandom))).ToList();
            foreach (var value in expectedValues)
            {
                Verify.IsTrue(actualFileCloudsList.Any(actualFile => actualFile.Contains(value)), $"Found files '{string.Join(", ", actualFileCloudsList)}' are not located in expected clouds");
            }
        }

        [Then(@"message '(.*)' is displayed on page")]
        public void ThenMessageIsDisplayedOnPage(string text)
        {            
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            var loading = page.ManagerContent.FindElement(By.XPath(page.LoadingContent));
            var message = page.ManagerContent.FindElement(By.XPath(page.InfoMessageContent));
            _browsers.Active.WaitForElementToContainsTextInAttribute(loading, "display: none;", "style", WebDriverExtensions.WaitTime.Medium);
            _browsers.Active.WaitForElementToNotContainsTextInAttribute(message, "display: none;", "style", WebDriverExtensions.WaitTime.Medium);
            var info = message.Text.Equals(text);
            var child = page.ManagerContent.FindElements(By.XPath(".//*"));
            Verify.IsTrue(info, $"{text} message is not displayed on page");
            Verify.IsTrue(child.Count == 0, $"Site list contains elements, but it was expected to have none.");
        }

        [Then(@"mindmanager cloud map is displayed on content page")]
        public void ThenNewlyCreatedMapIsDisplayedOnContentPage()
        {
            var newlyCreateFile = _mindmanagerfile.ItemName;
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementToContainsTextInAttribute(page.ManagerContent.FindElement(By.XPath(page.LoadingContent)), "display: none;", "style", WebDriverExtensions.WaitTime.Medium);
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetContentItem(newlyCreateFile.Replace(".mmap", "")), WebDriverExtensions.WaitTime.Medium), $"'{newlyCreateFile}' content item is not displayed");
        }

        [When(@"User scrolls down content manager files")]
        public void WhenUserScrollsDownContentManagerFiles()
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.ScrollGridToTheEnd(_browsers.Active.FindElement(By.XPath(page.ContentManagerFiles)));
            //wait for scoll to complete
            Thread.Sleep(3000);
        }
       
        [When(@"User clicks '([^']*)' tab on content page")]
        public void WhenUserClicksTabOnContentPage(string tabName)
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.ClickByJavascript(page.GetTabByName(tabName));
        }

        [Then(@"'([^']*)' tab is active on content page")]
        public void ThenTabIsActiveOnContentPage(string tabName)
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementToBeDisplayed(page.GetTabByName(tabName));
            Verify.IsTrue(page.GetTabByName(tabName).IsActive(), $"Tab '{tabName}' is not active on content page");
        }

        [When(@"User waits until search result loading icon is not displayed on content page")]
        public void WhenUserWaitsUntilSearchResultLoadingIconIsNotDisplayedOnContentPage()
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementToContainsTextInAttribute(page.SearchResultLoading, "display: none;", "style", WebDriverExtensions.WaitTime.ExtraLong);
            Verify.IsFalse(_browsers.Active.IsElementDisplayed(page.SearchResultLoading), $"Search result loading icon is displayed on content page");
        }

        [Then(@"No search result icon is displayed in color on content page")]
        public void ThenHomePageWordmarkHeaderIsdisplayedInColor(Table table)
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementToBeDisplayed(page.NoSearchResultIcon);
            var ImageDetails = page.NoSearchResultIcon.GetCssValue("background-image");
            var Decoded = BrandImageHelper.DecodeImage(ImageDetails);
            foreach (var row in table.Rows)
            {
                string Color = row["color"];
                Verify.IsTrue(Decoded.Contains(Color), $"'No search result' icon is not displayed in the expected color '{Color}'");
            }
        }

        [Then(@"No search result title '(.*)' is displayed on content page")]
        public void ThenNoSearchResultTitleIsDisplayedOnContentPage(string text)
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementToBeDisplayed(page.NoSearchResultTitle, WebDriverExtensions.WaitTime.Medium);
            var actualTitleText = page.NoSearchResultTitle.Text;
            Verify.IsTrue(actualTitleText.Equals(text), $"'{text}' title is not displayed on page");
        }

        [Then(@"No search result message '(.*)' is displayed on content page")]
        public void ThenNoSearchResultTextIsDisplayedOnContentPage(string text)
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementToBeDisplayed(page.NoSearchResultText, WebDriverExtensions.WaitTime.Medium);
            var actualText = page.NoSearchResultText.Text;
            Verify.IsTrue(actualText.Equals(text), $"'{text}' message is not displayed on page");
        }

        [Then(@"Search result count '(.*)' is displayed on content page")]
        public void ThenSearchResultCountIsDisplayedOnContentPage(string text)
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementToBeDisplayed(page.SearchResultCount, WebDriverExtensions.WaitTime.Medium);
            var actualResult = page.SearchResultCount.Text.Substring(2);
            Verify.IsTrue(actualResult.Equals(text), $"'{text}' search result count is not displayed on page");
        }
    }
}