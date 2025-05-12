using AutomationUtils.Utils;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.LicensingProject.AdminPortal;
using MjAutomationCore.Utils;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using System.Linq;
using Reqnroll;
using Logger = AutomationUtils.Utils.Logger;

namespace MjAutomationCore.Steps.LicensingProject.AdminPortal
{
    [Binding]
    class AdminDownloadsSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsers;
        public AdminDownloadsSteps(BrowsersList browsers)
        {
            _browsers = browsers;
        }

        [Then(@"following download sections are displayed on the Downloads page:")]
        public void ThenFollowingDownloadSectionsAreDisplayedOnTheDownloadsPage(Table table)
        {
            var downloadsPage = _browsers.Active.NowAt<AdminDownloadsPage>();
            var actualSectionTitles = downloadsPage.GetSectionTitles();
            var expectedSectionTitles = table.Rows.SelectMany(row => row.Values).ToList();
            Verify.AreEqual(actualSectionTitles, expectedSectionTitles, "The displayed download sections on the Downloads page do not match the expected sections");
        }

        [Then(@"logo '([^']*)' is displayed in the '([^']*)' section title")]
        public void ThenLogoIsDisplayedInTheSectionTitle(string logo, string sectionTitle)
        {
            var downloadsPage = _browsers.Active.NowAt<AdminDownloadsPage>();
            Verify.IsTrue(downloadsPage.IsLogoImageDisplayedInSectionTitle(logo, sectionTitle), $"Logo '{logo}' is not displayed in the '{sectionTitle}' section title");
        }

        [When(@"User clicks on '([^']*)' installer button in the '([^']*)' section")]
        public void WhenUserClicksOnInstallerButtonInTheSection(string installerButton, string sectionTitle)
        {
            var downloadsPage = _browsers.Active.NowAt<AdminDownloadsPage>();
            downloadsPage.GetInstallerButtonInSection(installerButton, sectionTitle).Click();
        }

        [Then(@"following installers are displayed in the '([^']*)' section:")]
        public void ThenFollowingInstallersAreDisplayedInTheSection(string sectionTitle, Table table)
        {
            var downloadsPage = _browsers.Active.NowAt<AdminDownloadsPage>();
            var actualInstallerTitles = downloadsPage.GetInstallerTitlesInSection(sectionTitle);
            var expectedInstallerTitles = table.Rows.SelectMany(row => row.Values).ToList();
            Verify.AreEqual(actualInstallerTitles, expectedInstallerTitles, $"Installers in '{sectionTitle}' section do not match the expected installers");
        }

        [Then(@"following documentation links are displayed in the '([^']*)' section:")]
        public void ThenFollowingDocumentationLinksAreDisplayedInTheSection(string sectionTitle, Table table)
        {
            var downloadsPage = _browsers.Active.NowAt<AdminDownloadsPage>();
            var actualLinkTexts = downloadsPage.GetDocumentationLinkTextsInSection(sectionTitle);
            var expectedLinkTexts = table.Rows.SelectMany(row => row.Values).ToList();
            Verify.AreEqual(actualLinkTexts, expectedLinkTexts, $"Documentation links in section '{sectionTitle}' do not match the expected links");
        }

        [When(@"User clicks on '([^']*)' link in '([^']*)' section")]
        public void WhenUserClicksOnLinkInSection(string linkName, string sectionTitle)
        {
            var downloadsPage = _browsers.Active.NowAt<AdminDownloadsPage>();
            downloadsPage.ClickLinkInSection(linkName, sectionTitle);
        }
    }
}