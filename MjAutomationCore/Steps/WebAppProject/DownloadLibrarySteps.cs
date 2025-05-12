using AutomationUtils.Utils;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject;
using MjAutomationCore.Utils;
using Reqnroll;
using SeleniumAutomationUtils.SeleniumExtensions;
using System.Linq;
using OpenQA.Selenium;
using System.Collections.Generic;
using MjAutomationCore.Providers.Base;

namespace MjAutomationCore.Steps.WebAppProject
{
    [Binding]
    public class DownloadLibrarySteps : ReqnrollContext
    {

        private readonly BrowsersList _browsers;

        public DownloadLibrarySteps(BrowsersList browsersList)
        {
            _browsers = browsersList;
        }

        [Given(@"User navigate to MindManager Download Library web app")]
        public void GivenUserNavigateToMindManagerDownloadLibraryWebApp()
        {
            _browsers.Active.Navigate().GoToUrl(UrlProvider.DownloadLibraryURL);
            _browsers.Active.WaitForDataLoading();
        }

        [Then(@"'([^']*)' section header is displayed on Download Library page")]
        public void ThenSectionHeaderIsDisplayedOnDownloadLibraryPage(string sectionHeader)
        {
            var page = _browsers.Active.NowAt<DownloadLibraryPage>();
            Verify.IsTrue(page.DisplayedSectionHeader(sectionHeader), $"Section Header '{sectionHeader}' is not displayed on Download Library page");
        }

        [Then(@"'([^']*)' subsection is displayed in '([^']*)' header section on Download Library page")]
        public void ThenSubsectionIsDisplayedInHeaderSectionOnDownloadLibraryPage(string subSection, string sectionHeader)
        {
            var page = _browsers.Active.NowAt<DownloadLibraryPage>();
            Verify.IsTrue(page.GetSubSectionBySectionHeader(subSection, sectionHeader).Displayed(), $"Subsection '{subSection}' is not displayed in section header '{sectionHeader}' on Download Library page");
        }

        [Then(@"'([^']*)' Link is displayed under '([^']*)' subsection in '([^']*)' header section on Download Library page")]
        public void ThenLinkIsDisplayedUnderSubsectionInHeaderSectionOnDownloadLibraryPage(string subSectionLink, string subSection, string sectionHeader)
        {
            var page = _browsers.Active.NowAt<DownloadLibraryPage>();
            Verify.IsTrue(page.GetlinkOfSubSectionOfSectionHeader(subSectionLink, subSection, sectionHeader).Displayed, $"Subsection link '{subSectionLink}' is not displayed under SubSection '{subSection}' in section header '{sectionHeader}' on Download Library page");
        }

        [Then(@"User clicks on '([^']*)' Link under '([^']*)' subsection in '([^']*)' header section on Download Library page")]
        public void ThenUserClicksOnLinkUnderSubsectionInHeaderSectionOnDownloadLibraryPage(string subSectionLink, string subSection, string sectionHeader)
        {
            var page = _browsers.Active.NowAt<DownloadLibraryPage>();
            page.GetlinkOfSubSectionOfSectionHeader(subSectionLink, subSection, sectionHeader).Click();
        }

        [Then(@"following items is displayed under '([^']*)' subsection in '([^']*)' header section on Download Library page")]
        public void ThenFollowingItemsIsDisplayedUnderSubsectionInHeaderSectionOnDownloadLibraryPage(string subSection, string sectionHeader, Table table)
        {
            var page = _browsers.Active.NowAt<DownloadLibraryPage>();
            _browsers.Active.WaitForElementsToBeDisplayed(page.GetItemListInSubSection(subSection, sectionHeader), WebDriverExtensions.WaitTime.Medium, false);
            var listItems = page.GetItemListInSubSection(subSection, sectionHeader).Select(x => x.Text).ToList();
            var expectedTemplatesList = table.Rows.SelectMany(row => row.Values).ToList();
            Verify.AreEqual(listItems, expectedTemplatesList, $"Subsection link list is not displayed correctly under SubSection '{subSection}' in section header '{sectionHeader}' on Download Library page");
        }
    }
}
