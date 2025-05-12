using System;
using System.Collections.Generic;
using System.Linq;
using SeleniumAutomationUtils.SeleniumExtensions;
using MjAutomationCore.Base;
using OpenQA.Selenium;
using SeleniumExtras.PageObjects;
using AutomationUtils.Utils;
using MjAutomationCore.Providers;

namespace MjAutomationCore.Pages.WebAppProject.MindManagerFiles
{
    class MyPublishedFilesPage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[@class='breadcrumb-container']//h4[contains(text(), 'Published Files')]")]
        public IWebElement MyPublishedFilesTitle { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class, 'btn-select-all')]")]
        public IWebElement SelectAllCheckbox { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='map map-file selected']")]
        public IList<IWebElement> SelectedFiles { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='maps-container']//div[@class='map-action map-favourite on']")]
        public IList<IWebElement> FavoriteFiles { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='maps']//div[contains(@class, 'map map-file')]")]
        public IList<IWebElement> PublishedFiles { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@data-tooltip='Favorite']")]
        public IWebElement FavoriteButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class, 'maps-toolbar-options filter-options')]")]
        public IWebElement FilterButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='filter-option']//div[@class='filter-option-switch']")]
        public IWebElement SwitchOnInFilter { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='filter-option']//div[@class='filter-option-switch on']")]
        public IWebElement SwitchOffInFilter { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='maps-container']//div[@class='map map-file']")]
        public IWebElement PublishedFilesContainer { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class, 'sort-options')]")]
        public IWebElement SortButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='popup-menu-item'][text()='Advanced Options']")]
        public IWebElement AdvancedOptions { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            {
              SelectorFor(this, p => p.MyPublishedFilesTitle)
            };
        }

        public List<string> GetPublishedFilesToList()
        {
            var by = By.XPath($".//div[@class='map map-file']/div[@class='map-name']");
            return Driver.FindElements(by).Select(x => x.Text).ToList();
        }

        #region PublishedFilesTable

        public IWebElement GetRowByFileNameInTablePublishedFiles(string fileName)
        {
            fileName = fileName.Replace(".mmap", "").Replace(".mdeck", "");
            var selector = By.XPath($".//div[contains(text(),'{fileName}')]/parent::div[contains(@class,'map map-file')]");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Short))
                throw new Exception($"{fileName} is not displayed in table");
            return Driver.FindElement(selector);
        }

        public IWebElement GetButtonByNameInRow(string fileName, string buttobName)
        {
            var selector = By.XPath($"./div[@class='map-actions']/div[text()='{buttobName}']");
            if (!Driver.IsElementInElementDisplayed(GetRowByFileNameInTablePublishedFiles(fileName), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Button {buttobName} is not displayed in '{fileName}' row");
            }

            return GetRowByFileNameInTablePublishedFiles(fileName).FindElement(selector);
        }

        public IWebElement GetCheckboxInRow(string fileName)
        {
            var selector = By.XPath($"./div[@class='map-select']");
            if (!Driver.IsElementInElementDisplayed(GetRowByFileNameInTablePublishedFiles(fileName), selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Checkbox is not displayed in '{fileName}' row");
            }

            return GetRowByFileNameInTablePublishedFiles(fileName).FindElement(selector);
        }

        public IWebElement GetMapViewsCount(string fileName)
        {
            var selector = By.XPath($".//div[contains(@class,'map-info map-views-count')]");
            if (!Driver.IsElementInElementDisplayed(GetRowByFileNameInTablePublishedFiles(fileName), selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Map '{fileName}' view is not displayed");
            }

            return GetRowByFileNameInTablePublishedFiles(fileName).FindElement(selector);
        }

        public IWebElement GetArrowIconInRow(string fileName)
        {
            var row = GetRowByFileNameInTablePublishedFiles(fileName);
            var selector = By.XPath("./div[@class='map-actions']/div[@class='map-action map-other']");
            Driver.WaitForElementInElementToBeExists(row, selector);
            var button = row.FindElement(selector);
            return button;
        }

        public IWebElement GetIconByNameInRow(string fileName, string iconName)
        {
            var row = GetRowByFileNameInTablePublishedFiles(fileName);
            var selector = By.XPath($"./div[@class='map-actions']/div[@data-tooltip='{iconName}']");
            Driver.WaitForElementInElementToBeExists(row, selector);
            var button = row.FindElement(selector);
            return button;
        }

        #endregion

        public IWebElement GetSelectedFileByName(string fileName)
        {
            var selector = By.XPath($".//div[@class='map map-file selected']/div[text()='{fileName}']");
            return Driver.FindElement(selector);
        }

        public IWebElement GetSelectedFileText(string text)
        {
            var selector = By.XPath($".//label[@class='btn-select-all-label'][text()='{text}']");
            return Driver.FindElement(selector);
        }

        public List<string> GetViewContentToList(string text)
        {
            var by = By.XPath($".//div[text()='{text}']//following-sibling::div[@class='map-actions']/div[@data-tooltip='Views']");
            var view = Driver.FindElements(by).Select(x => x.Text).ToList();
            return view;
        }
    }
}