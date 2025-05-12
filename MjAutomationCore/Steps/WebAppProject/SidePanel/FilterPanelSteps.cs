using AutomationUtils.Utils;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.SidePanel;
using MjAutomationCore.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using System.Linq;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.SidePanelSteps
{
    [Binding]
    class FilterPanelSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly BrowsersList _browsers;

        public FilterPanelSteps(WebDriver driver, BrowsersList browsersList)
        {
            _driver = browsersList.GetBrowser();
            _browsers = browsersList;
        }

        [Then(@"radio button '(.*)' is checked on Filter popup")]
        public void ThenRadioButtonIsCheckedOnFilterPopup(string buttonName)
        {
            var popup = _driver.NowAt<FilterPanelPage>();
            Verify.IsTrue(popup.GetRadioButtonInFilterPopup(buttonName).IsActive(), $"{buttonName} radio button is not checked");
        }

        [When("User click on radio button {string} on Filter popup")]
        public void WhenUserClickOnRadioButtonOnFilterPopup(string buttonName)
        {
            var popup = _driver.NowAt<FilterPanelPage>();
            popup.GetRadioButtonInFilterPopup(buttonName).Click();
        }

        [Then(@"'(.*)' checkboxes are checked on the Filter Pop-up")]
        public void ThenCheckboxesAreCheckedOnTheFilterPop_Up(int value)
        {
            var button = _driver.NowAt<FilterPanelPage>();
            var el = button.CheckedCheckboxInFilterPopUp.Count;
            Assert.AreEqual(el, value, "Number of enabled checkboxes is displayed incorrectly");
        }

        [Then(@"all checkboxes are checked on Filter panel")]
        public void ThenAllCheckboxesAreCheckedOnFilterPanel()
        {
            var panel = _driver.NowAt<FilterPanelPage>();
            Verify.IsTrue(panel.AllCheckboxesChecked(), "Unchecked checkboxes are displayed on Filter panel");
        }

        [Then(@"all checkboxes are unchecked on Filter panel")]
        public void ThenAllCheckboxesAreUncheckedOnFilterPanel()
        {
            var panel = _driver.NowAt<FilterPanelPage>();
            Verify.IsFalse(panel.AllCheckboxesChecked(), "Checked checkboxes are displayed on Filter panel");
        }

        [Then(@"'(.*)' checkboxes are unchecked on the Filter Pop-up")]
        public void ThenCheckboxesAreUncheckedOnTheFilterPop_Up(int value)
        {
            var button = _driver.NowAt<FilterPanelPage>();
            var el = button.UncheckedCheckboxInFilterPopUp.ToList().Count;
            Assert.AreEqual(el, value);
        }

        [Then(@"following properties are displayed in '([^']*)' group in '([^']*)' section on Filter panel")]
        public void ThenFollowingPropertiesAreDisplayedInGroupInSectionOnFilterPanel(string group, string panelName, Table table)
        {
            var expectedItemList = table.Rows.SelectMany(row => row.Values).ToList();
            var panel = _browsers.Active.NowAt<SidePanel>();
            var actualItems = panel.GetAllGridItems(group, panelName, "PanelWithMenuButton", "Filter").Select(x => x.GetAttribute("data-tooltip")).ToList();
            Verify.AreEqual(actualItems, expectedItemList, $"Properties is not displayed correctly in '{group}' in '{panelName}' section on Filter panel.Expected:{expectedItemList}. Actual: {actualItems}");
        }

    }
}