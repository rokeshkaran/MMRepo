using AutomationUtils.Utils;
using Microsoft.Graph.Models;
using MjAutomationCore.Components.Base;
using MjAutomationCore.Components.Buttons;
using MjAutomationCore.Components.Licensing;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.DTO.WebAppDTO.Publish;
using MjAutomationCore.Extensions;
using MjAutomationCore.Providers;
using MjAutomationCore.Utils;
using OpenQA.Selenium;
using OpenQA.Selenium.Remote;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.IO;
using System.Linq;
using System.Threading;
using Reqnroll;

namespace MjAutomationCore.Steps.LicensingProject.Base
{
    [Binding]
    class TablesSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly SessionRandomValue _sessionRandom;

        public TablesSteps(WebDriver driver, SessionRandomValue sessionRandom)
        {
            _driver = driver;
            _sessionRandom = sessionRandom;
        }

        [Then(@"following columns are displayed in '(.*)' table:")]
        public void ThenFollowingColumnsAreDisplayedInTable(string tableName, Table table)
        {
            _driver.WaitForElementToBeDisplayed(_driver.GetComponent<Tables>(tableName));
            var columns = _driver.Component<Tables>(tableName).TableColumns.Where(x => !string.IsNullOrEmpty(x.Text));
            var expectedColumns = table.Rows.SelectMany(x => x.Values).ToList();
            foreach (string column in expectedColumns)
            {
                Verify.IsTrue(columns.Any(x => x.Text.Contains(column)), $"'{column}' column does not appear in '{tableName}' table");
            }
        }

        [Then(@"Rows with following values is displayed in '(.*)' table:")]
        public void ThenRowsWithFollowingValuesIsDisplayedInTable(string tableName, Table table)
        {
            _driver.WaitForDataLoading();
            _driver.WaitForElementToNotContainsTextInAttribute(_driver.GetComponent<Tables>(tableName), "display: none;", "style", WebDriverExtensions.WaitTime.Long);
            _driver.WaitForElementToContainsTextInAttribute(_driver.GetComponent<Tables>(tableName), "", "style", WebDriverExtensions.WaitTime.Short);
            _driver.WaitForElementToBeDisplayed(_driver.GetComponent<Tables>(tableName), WebDriverExtensions.WaitTime.Long);
            var rows = _driver.Component<Tables>(tableName).GetDataTableRows(tableName, table, _sessionRandom);
            Verify.AreEqual(table.Header.Count - 1, rows.Count, "Tables is incorrect");
        }

        [Then(@"'(.*)' table is displayed to User")]
        public void ThenTableIsDisplayedToUser(string tableName)
        {
            Verify.IsTrue(_driver.ComponentDisplayedState<Tables>(tableName), $"'{tableName}' table is not displayed to User");
        }

        [Then(@"'(.*)' table is not displayed to User")]
        public void ThenTableIsNotDisplayedToUser(string tableName)
        {
            Verify.IsFalse(_driver.ComponentDisplayedState<Tables>(tableName, new Properties { WaitTime = WebDriverExtensions.WaitTime.Second }), $"'{tableName}' table is displayed to User");
        }

        [Then(@"'(.*)' table does not have values")]
        public void ThenTableDoesNotHaveValues(string tableName)
        {
            _driver.WaitForElementsToBeNotDisplayed(_driver.Component<Tables>(tableName).GetAllRows());
            var DataTableRows = _driver.Component<Tables>(tableName).GetAllRows().Any();
            Verify.IsFalse(DataTableRows, $"Table '{tableName}' have values");
        }

        [Then(@"text message '(.*)' is displayed in '(.*)' table")]
        public void ThenTextMessageIsDisplayedInTable(string textMessage, string tableName)
        {
            Verify.IsTrue(_driver.Component<Tables>(tableName).DisplayedTextMessage(textMessage),
                $"Text message is not displayed in '{tableName}' table");
        }

        [Then(@"'(.*)' value is displayed in the '(.*)' column of '(.*)' table")]
        public void ThenValueIsDisplayedInTheColumnOfTable(string value, string tableColumn, string tableName)
        {
            value = value.AddRandom(_sessionRandom);
            Verify.IsTrue(_driver.Component<Tables>(tableName).GetColumnContent(tableColumn).Any(x => x.Text.Equals(value)),
                $"'{value}' value is not displayed in '{tableColumn}' column of '{tableName}' table");
        }

        [Then(@"'(.*)' value is not displayed in the '(.*)' column of '(.*)' table")]
        public void ThenValueIsNotDisplayedInTheColumnOfTable(string value, string tableColumn, string tableName)
        {
            value = value.AddRandom(_sessionRandom);
            _driver.WaitForDataLoading();
            Verify.IsFalse(_driver.Component<Tables>(tableName).GetColumnContent(tableColumn).Any(x => x.Text.Equals(value)),
                $"'{value}' value is displayed in '{tableColumn}' column of '{tableName}' table");
        }

        [When(@"User find '(.*)' value in '(.*)' column of '(.*)' table and clicks '(.*)' button")]
        public void WhenUserFindValueInColumnOfTableAndClicksButton(string value, string tableColumn, string tableName, string buttonName)
        {
            value = value.AddRandom(_sessionRandom);
            _driver.WaitForElementToNotContainsTextInAttribute(_driver.GetComponent<Tables>(tableName),
                "display: none;", "style", WebDriverExtensions.WaitTime.Long);
            _driver.WaitForElementToBeDisplayed(_driver.Component<Tables>(tableName).GetButtonByName(tableColumn, value, buttonName), WebDriverExtensions.WaitTime.Long);
            _driver.MoveToElement(_driver.Component<Tables>(tableName).GetButtonByName(tableColumn, value, buttonName));
            _driver.ClickByActions(_driver.Component<Tables>(tableName).GetButtonByName(tableColumn, value, buttonName));
        }

        [Then(@"'([^']*)' button is disabled in '([^']*)' row of '([^']*)' column of '([^']*)' table")]
        public void ThenButtonIsDisabledInRowOfColumnOfTable(string buttonName, string row, string tableColumn, string tableName)
        {
            Verify.IsTrue(_driver.Component<Tables>(tableName).GetButtonByName(tableColumn, row, buttonName).IsDisabledState(), $"Button is enabled in '{row}' row of '{tableColumn}' of '{tableName}' table");
        }

        [Then(@"'([^']*)' table has not any dropdown menus")]
        public void ThenTableHasNotAnyDropdownMenus(string tableName)
        {
            Verify.IsTrue(_driver.Component<Tables>(tableName).IsTableWithoutSelectElement(), $"Table '{tableName}' contains dropdown menus");
        }

        [When(@"User find '(.*)' value in '(.*)' column of '(.*)' table and clicks clipboard copy button in '(.*)' column")]
        public void WhenUserFindValueInColumnOfTableAndClicksClipboardCopyButtonInColumn(string value, string tableColumn, string tableName, string column)
        {
            value = value.AddRandom(_sessionRandom);
            _driver.Component<Tables>(tableName).GetButtonInColumn(tableColumn, value, column).Click();
        }

        [When(@"User find '(.*)' value of '(.*)' column of '(.*)' table and select '(.*)' value in '(.*)' column")]
        public void WhenUserFindValueOfColumnOfTableAndSelectValueInColumn(string value, string tableColumn, string tableName, string option, string column)
        {
            value = value.AddRandom(_sessionRandom);
            _driver.WaitForElementToBeDisplayed(_driver.GetComponent<Tables>(tableName));
            _driver.Component<Tables>(tableName).GetOptionInColumn(tableColumn, value, column).SelectboxSelect(option);
            _driver.WaitForDataLoading();
        }

        [Then(@"'([^']*)' row of '([^']*)' column of '([^']*)' table has '([^']*)' value highlighted red color in '([^']*)' column")]
        public void ThenRowOfColumnOfTableHasValueHighlightedRedColorInColumn(string value, string tableColumn, string tableName, string valueDate, string column)
        {
            value = value.AddRandom(_sessionRandom);
            valueDate = valueDate.AddRandom(_sessionRandom).Date();
            _driver.WaitForElementToBeDisplayed(_driver.GetComponent<Tables>(tableName));
            _driver.Component<Tables>(tableName).GetOptionInColumn(tableColumn, value, column).GetSelectedValueFromSelectbox().Equals(valueDate);
            var statusRow = _driver.Component<Tables>(tableName).GetOptionInColumn(tableColumn, value, column).GetCssValue("color");
            Verify.IsTrue(statusRow.Equals("rgba(205, 42, 34, 1)"), $" Date '{valueDate}' in column '{column}' of '{tableColumn}' column of '{tableName}' table is not highlighted in red color");
        }

        [Then(@"'(.*)' row of '(.*)' column of '(.*)' table has '(.*)' status")]
        public void ThenRowOfColumnOfTableHasStatus(string value, string tableColumn, string tableName, string status)
        {
            value = value.AddRandom(_sessionRandom);
            for (int i = 0; i < 30; i++)
            {
                try
                {
                    var statusRow = _driver.Component<Tables>(tableName).GetRowForContent(tableColumn, value).GetAttribute("class").Equals(status);
                    if (statusRow)
                    {
                        return;
                    }
                }
                catch { }

                Thread.Sleep(500);
            }

            throw new Exception($"Row '{value}' of '{tableColumn}' column of '{tableColumn}' tableis not '{status}' status");
        }

        [Then(@"Users from the '(.*)' file are displayed in the '(.*)' column of the '(.*)' table")]
        public void ThenUsersFromTheFileAreDisplayedInTheColumnOfTheTable(string pathfile, string columnName, string tableName)
        {
            _driver.MoveToElement(_driver.Component<Pagination>().GetOptionInMenu("Rows per page:"));
            _driver.WaitForDataLoading();
            var valueList = new List<List<string>>();
            var content = _driver.Component<Tables>(tableName).GetColumnContent(columnName);
            valueList.Add(content.Select(x => x.Text).ToList());
            while (!_driver.Component<Pagination>().GetButtonByName("next").GetCssValue("opacity").Equals("0.3"))
            {
                _driver.HoverAndClick(_driver.Component<Pagination>().GetButtonByName("next"));
                _driver.WaitForDataLoading();

                try
                {
                    var columnElement = _driver.Component<Tables>(tableName).GetColumnContent(columnName).Select(x => x.Text).ToList();
                    valueList.Add(columnElement);
                }
                catch (NoSuchElementException)
                {
                    break;
                }
            }

            Utils.FileSystemHelper.GeneratePathToEmbedded(pathfile);
            var fileContent = File.ReadAllLines(Utils.FileSystemHelper.GeneratePathToEmbedded(pathfile));
            var emailsList = fileContent.Where((item, index) => index != 0).ToList();

            foreach (string email in emailsList)
            {
                Verify.IsTrue(valueList.SelectMany(list => list).ToList().Any(x => x.Equals(email.Replace(",", ""))),
                    $"'{email}' User is not displayed in the '{columnName}' column of the '{tableName}' table");
            }
        }

        [Then(@"'(.*)' rows are displayed in '(.*)' table")]
        public void ThenRowsAreDisplayedInTable(int rows, string tableName)
        {
            _driver.WaitForDataLoading();
            var rowCount = _driver.Component<Tables>(tableName).GetAllRows().Count();
            Verify.AreEqual(rows, rowCount, $"'{rows}' rows are not displayed in the '{tableName}' table");
        }

        [Then(@"eye icon is displayed in '([^']*)' column for '([^']*)' value in '([^']*)' column of '([^']*)' table")]
        public void ThenEyeIconIsDisplayedInColumnForValueInColumnOfTable(string column, string product, string tableColumn, string tableName)
        {
            _driver.WaitForElementToBeDisplayed(_driver.GetComponent<Tables>(tableName));
            Verify.IsTrue(_driver.Component<Tables>(tableName).DisplayedIconInColumn(tableColumn, product, column), $"Eye icon is not displayed in '{column}' in '{tableColumn}' table");
        }

        [When(@"User hover on eye icon in '([^']*)' column for '([^']*)' value in '([^']*)' column of '([^']*)' table")]
        public void WhenUserHoverOnEyeIconInColumnForValueInColumnOfTable(string column, string product, string tableColumn, string tableName)
        {
            _driver.WaitForElementToBeDisplayed(_driver.GetComponent<Tables>(tableName));
            _driver.MoveToElement(_driver.Component<Tables>(tableName).GetIconInColumn(tableColumn, product, column));
        }

        [Then(@"tooltip stock keys is displayed to the User in '([^']*)' table")]
        public void ThenTooltipStockKeysIsDisplayedToTheUserInTable(string tableName)
        {
            Verify.IsTrue(_driver.Component<Tables>(tableName).SectionContentToolTip.Displayed(), $"Section Content Tooltip is not displayed in '{tableName}'");
        }

        [Then(@"License key details is displayed in tooltip section of '([^']*)' table")]
        public void ThenLicenseKeyDetailsIsDisplayedInTooltipSectionOfTable(string tableName)
        {
            Verify.IsTrue(_driver.Component<Tables>(tableName).GetLicenseKeyList().Any(), $"License key details is not displayed in tooltip section of '{tableName}'");
        }

        [Then(@"Date details is displayed in tooltip section of '([^']*)' table")]
        public void ThenDateDetailsIsDisplayedInTooltipSectionOfTable(string tableName)
        {
            Verify.IsTrue(_driver.Component<Tables>(tableName).GetDateAddedList().Any(), $"Date details is not displayed in tooltip section of '{tableName}'");
        }

        [Then(@"license key and date details are displayed to users in '([^']*)' table sorted by date added")]
        public void ThenLicenseKeyAndDateDetailsAreDisplayedToUsersInTableSortedByDateAdded(string tableName)
        {
            var dataList = new List<KeyValuePair<string, string>>();
            List<string> licenseKeyList = _driver.Component<Tables>(tableName).GetLicenseKeyList().Select(x => x.Text).ToList();
            List<string> dateList = _driver.Component<Tables>(tableName).GetDateAddedList().Select(x => x.Text).ToList();
            List<string> orderedDateList = _driver.Component<Tables>(tableName).GetDateAddedList().OrderBy(x => x.Text).Select(x => x.Text).ToList();

            var actualList = licenseKeyList.ToDictionary(x => x, x => dateList[licenseKeyList.IndexOf(x)]).ToList();
            var orderByDateList = licenseKeyList.ToDictionary(x => x, x => orderedDateList[licenseKeyList.IndexOf(x)]).ToList();
            Verify.AreEqual(actualList, orderByDateList, "List is not sorted by date");
        }

        [Then(@"'([^']*)' checkbox for eligibility is checked in '([^']*)' column for '([^']*)' value '([^']*)' table")]
        public void ThenCheckboxForEligibilityIsCheckedInColumnForValueTable(string column, string tableColumn, string value, string tableName)
        {
            value = value.AddRandom(_sessionRandom);
            _driver.WaitForElementToNotContainsTextInAttribute(_driver.GetComponent<Tables>(tableName),
        "display: none;", "style", WebDriverExtensions.WaitTime.Medium);
            Verify.IsTrue(_driver.Component<Tables>(tableName).IsCheckboxForEligibilitySelected(column, tableColumn, value), $"Checkbox for eligibility is unchecked in '{tableColumn}' column for '{value}' value in '{tableName}' table");
        }

        [Then(@"'([^']*)' checkbox for eligibility is unchecked in '([^']*)' column for '([^']*)' value '([^']*)' table")]
        public void ThenCheckboxForEligibilityIsUncheckedInColumnForValueTable(string column, string tableColumn, string value, string tableName)
        {
            value = value.AddRandom(_sessionRandom);
            _driver.WaitForElementToNotContainsTextInAttribute(_driver.GetComponent<Tables>(tableName),
        "display: none;", "style", WebDriverExtensions.WaitTime.Medium);
            Verify.IsFalse(_driver.Component<Tables>(tableName).IsCheckboxForEligibilitySelected(column, tableColumn, value), $"Checkbox for eligibility is checked in '{tableColumn}' column for '{value}' value in '{tableName}' table");
        }

        [When(@"User find '([^']*)' value in '([^']*)' column of '([^']*)' table and change '([^']*)' eligibility checkbox details")]
        public void WhenUserFindValueInColumnOfTableAndChangeEligibilityCheckboxDetails(string value, string tableColumn, string tableName, string column)
        {
            value = value.AddRandom(_sessionRandom);
            _driver.WaitForElementToNotContainsTextInAttribute(_driver.GetComponent<Tables>(tableName),
        "display: none;", "style", WebDriverExtensions.WaitTime.Medium);
            _driver.MoveToElement(_driver.Component<Tables>(tableName).GetSpanSwitchSliderForEligibility(column, tableColumn, value));
            _driver.ClickByActions(_driver.Component<Tables>(tableName).GetSpanSwitchSliderForEligibility(column, tableColumn, value));
        }

        [Then(@"License key field is not editable in Admin panel table")]
        public void ThenLicenseKeyFieldIsNotEditable()
        {
            var keyAttribute = _driver.Component<Tables>("admin-panel-table").GetLicenseKeyField();
            Verify.IsFalse(keyAttribute.IsAttributePresent("contenteditable"), "License Key is editable.");
        }
    }
}