using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.Extensions;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using Reqnroll;

namespace MjAutomationCore.Components.Licensing
{
    class Tables : BaseWebComponent, IWebComponent
    {
        public By Container => By.XPath($".//table[contains(@class,'table')][contains(@class,'{Identifier}')]");

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'section-content-tooltip')]")]
        public IWebElement SectionContentToolTip { get; set; }

        protected override By Construct()
        {
            return Container;
        }

        [FindsBy(How = How.XPath, Using = ".//thead//th")]
        public IList<IWebElement> TableColumns { get; set; }

        public bool DisplayedTextMessage(string textMessage)
        {
            var selector = By.XPath($".//tfoot[@class='no-results-found']//td[text()='{textMessage}']");
            if (!Driver.IsElementInElementDisplayed(Instance, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new NoSuchElementException($"Text message is not displayed");
            }
            return Driver.IsElementDisplayed(Instance.FindElement(selector));
        }

        public int GetColumIndex(string tableColumn)
        {
            var colums = Instance.FindElements(By.XPath(".//thead//th[not(contains(@style,'display: none;'))]")).ToList();
            var columIndex = colums.FindIndex(x => x.Text.Contains(tableColumn)) + 1;
            return columIndex;
        }

        public List<IWebElement> GetColumnContent(string tableColumn)
        {
            var selector = By.XPath($".//tbody//td[{GetColumIndex(tableColumn)}]");
            {
                if (!Driver.IsElementInElementDisplayed(Instance, selector, WebDriverExtensions.WaitTime.Short))
                {
                    throw new NoSuchElementException($"Column content is not displayed");
                }
            }

            return Instance.FindElements(selector).ToList();
        }

        public IWebElement GetRowForContent(string tableColumn, string content)
        {
            var columnContent = GetColumnContent(tableColumn);
            Driver.WaitForElementsToBeDisplayed(columnContent);
            Driver.WaitForSomeElementsToHaveText(columnContent, content);
            var elementInTable = columnContent.Where(x => x.Text.Equals(content));
            var DataTableRow = elementInTable.First().FindElement(By.XPath("./parent::tr"));
            return DataTableRow;
        }

        public IList<IWebElement> GetAllRows()
        {
            var selector = By.XPath(".//tbody/tr");
            return Instance.FindElements(selector);
        }

        public List<IWebElement> GetLicenseKeyList()
        {
            var selector = By.XPath($".//div[contains(@class,'section-content-tooltip')]//div[@class='stock-keys-row']//span[@class='key']");
            return Instance.FindElements(selector).ToList();
        }

        public List<IWebElement> GetDateAddedList()
        {
            var selector = By.XPath($".//div[contains(@class,'section-content-tooltip')]//div[@class='stock-keys-row']//span[@class='added']");
            return Instance.FindElements(selector).ToList();
        }

        public bool IsTableWithoutSelectElement()
        {
            var cellsWithSelect = Instance.FindElements(By.XPath(".//td[descendant::select]")).Any();
            return !cellsWithSelect;
        }

        public IWebElement GetOptionInColumn(string tableColumn, string content, string column)
        {
            var selector = By.XPath($".//td[{GetColumIndex(column)}]/select");
            if (!Driver.IsElementInElementExists(GetRowForContent(tableColumn, content), selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"The '{column}' column does not show the selection field");
            }

            return GetRowForContent(tableColumn, content).FindElement(selector);
        }

        public IWebElement GetButtonInColumn(string tableColumn, string content, string column)
        {
            var selector = By.XPath($".//td[{GetColumIndex(column)}]/button[@class='clipboard-copy'][1]");
            if (!Driver.IsElementInElementExists(GetRowForContent(tableColumn, content), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Clipboard copy button is not displayed in '{column}' in '{tableColumn}' table");
            }

            return GetRowForContent(tableColumn, content).FindElement(selector);
        }

        public IWebElement GetIconInColumn(string tableColumn, string content, string column)
        {
            var selector = By.XPath($".//span[contains(@class,'subscription-stock')]");
            if (!Driver.IsElementInElementDisplayed(GetRowForContent(tableColumn, content), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Eye icon is not displayed in '{column}' in '{tableColumn}' table");
            }

            return GetRowForContent(tableColumn, content).FindElement(selector);
        }

        public bool DisplayedIconInColumn(string tableColumn, string content, string column)
        {
            try
            {
                return Driver.IsElementDisplayed(GetIconInColumn(tableColumn, content, column), WebDriverExtensions.WaitTime.Medium);
            }
            catch
            {
                return false;
            }
        }

        public IWebElement GetButtonByName(string tableColumn, string content, string buttonName)
        {
            var row = GetRowForContent(tableColumn, content);
            return GetButtonByName(row, buttonName);
        }

        public IWebElement GetButtonByName(IWebElement row, string buttonName)
        {
            var selector = By.XPath($".//a[text()='{buttonName}']");
            Driver.WaitForElementsToBeDisplayed(selector);
            return row.FindElement(selector);
        }

        public IWebElement GetLicenseKeyField()
        {            
            var selector = By.XPath($".//button[@class='clipboard-copy']/preceding-sibling::span");
            Driver.WaitForElementsToBeDisplayed(selector);
            return Instance.FindElement(selector);
        }

        public IWebElement GetCheckboxForEligibility(string column, string tableColumn, string content)
        {
            var selector = By.XPath($".//td[{GetColumIndex(column)}]//*[text()='Eligibility']/following-sibling::label[@class='switch']/input[@type='checkbox']");
            if (!Driver.IsElementInElementExists(GetRowForContent(tableColumn, content), selector, WebDriverExtensions.WaitTime.Long))
            {
                throw new NoSuchElementException("Checkbox for eligibility is not displayed");
            }
            return GetRowForContent(tableColumn, content).FindElement(selector);
        }

        public IWebElement GetSpanSwitchSliderForEligibility(string column, string tableColumn, string content)
        {
            var selector = By.XPath($".//td[{GetColumIndex(column)}]//*[text()='Eligibility']/following-sibling::label[@class='switch']/span");
            if (!Driver.IsElementInElementDisplayed(GetRowForContent(tableColumn, content), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new NoSuchElementException("Span switch slider for eligibility is not displayed");
            }
            return GetRowForContent(tableColumn, content).FindElement(selector);
        }

        public bool IsCheckboxForEligibilitySelected(string column, string tableColumn, string content)
        {
            try
            {
                var checkbox = GetCheckboxForEligibility(column, tableColumn, content);
                return checkbox.Selected;
            }
            catch
            {
                return false;
            }
        }

        public List<IWebElement> GetDataTableRows(string tableName, Table table, SessionRandomValue sessionRandom)
        {
            var columns = table.Rows.Select(x => x.First().Value).ToList();
            var rowsToFind = new List<List<string>>();

            for (int j = 1; j < table.Header.Count; j++)
            {
                var values = table.Rows.Select(x => x[j].AddRandom(sessionRandom).Date()).ToList();
                rowsToFind.Add(values);
            }

            var grid = new List<List<string>>();

            foreach (string column in columns)
            {
                var columnElements = Driver.Component<Tables>(tableName)
                    .GetColumnContent(column);

                if (Driver.IsElementInElementExists(columnElements.First(), By.XPath(".//select")))
                {
                    grid.Add(columnElements.Select(x => x.FindElement(By.XPath(".//select")).GetSelectedValueFromSelectbox()).ToList());
                }
                else
                {
                    grid.Add(columnElements.Select(x => x.Text).ToList());
                }
            }
            var DataTableRowsElements = new List<IWebElement>();
            foreach (var rowToFInd in rowsToFind)
            {
                var isRowFound = false;

                for (int i = 0; i < grid.First().Count; i++)
                {
                    var row = grid.Select(r => r[i]).ToList();

                    var subset = rowToFInd.All(x => row.Contains(x));

                    if (subset)
                    {
                        isRowFound = true;
                        var element = GetRowForContent(columns.First(), grid.Select(r => r[i]).First());
                        DataTableRowsElements.Add(element);
                        break;
                    }
                }

                if (!isRowFound)
                {
                    throw new Exception($"Row with content {string.Join(',', rowToFInd)} is not present in the {tableName} table");
                }
            }

            return DataTableRowsElements;
        }
    }
}
