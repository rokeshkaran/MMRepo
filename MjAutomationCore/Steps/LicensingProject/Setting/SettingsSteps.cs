using AutomationUtils.Utils;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.LicensingProject;
using MjAutomationCore.Utils;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using System.Reflection.PortableExecutable;
using Reqnroll;

namespace MjAutomationCore.Steps.LicensingProject.Setting
{
    [Binding]
    class SettingsSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsers;
        public SettingsSteps(BrowsersList browsers)
        {
            _browsers = browsers;
        }

        [When(@"User hover over '([^']*)' button on '([^']*)' label for '([^']*)' section")]
        public void WhenUserHoverOverButtonOnLabelForSection(string sectionName, string labelName, string sectionHeader)
        {
            var el = _browsers.Active.NowAt<SettingsPage> ();
            _browsers.Active.MoveToElement(el.GetSectionContentDetailByLabelName(sectionHeader, labelName).FindElement(By.XPath(string.Format(el.SectionContentDetails, sectionName))));
        }

        [Then(@"Tooltip '([^']*)' is displayed for '([^']*)' button on '([^']*)' label for '([^']*)' section")]
        public void ThenTooltipIsDisplayedForButtonOnLabelForSection(string value, string sectionName, string labelName, string sectionHeader)
        {
            var el = _browsers.Active.NowAt<SettingsPage>();
            var sectionContentByLabelName = el.GetSectionContentDetailByLabelName(sectionHeader, labelName).FindElement(By.XPath(string.Format(el.SectionContentDetails, sectionName)));
            var tooltipText = sectionContentByLabelName.FindElement(By.XPath(string.Format(el.SectionContentTooltip))).Text.RemoveLineBreakes();
            Verify.AreEqual(tooltipText, value, $"Tooltip '{value}' is not displayed for '{sectionName}' button on '{labelName}' label for '{sectionHeader}' section");
        }

        [When(@"User hover over '([^']*)' button on '([^']*)' section")]
        public void WhenUserHoverOverButtonOnSection(string sectionName, string sectionHeader)
        {
            var el = _browsers.Active.NowAt<SettingsPage>();
            _browsers.Active.MoveToElement(el.GetSectionTitleByName(sectionHeader).FindElement(By.XPath(string.Format(el.SectionContentDetails, sectionName))));
        }

        [Then(@"Tooltip '([^']*)' is displayed for '([^']*)' button in '([^']*)' section")]
        public void ThenTooltipIsDisplayedForButtonInSection(string value, string buttonName, string sectionHeader)
        {
            var el = _browsers.Active.NowAt<SettingsPage>();
            var sectionContentHeader = el.GetSectionTitleByName(sectionHeader).FindElement(By.XPath(string.Format(el.SectionContentDetails, buttonName)));
            var tooltipText = sectionContentHeader.FindElement(By.XPath(string.Format(el.SectionContentTooltip))).Text.RemoveLineBreakes();
            Verify.AreEqual(tooltipText, value, $"Tooltip '{value}' is not displayed for '{buttonName}' button in '{sectionHeader}' section");
        }
    }
}
