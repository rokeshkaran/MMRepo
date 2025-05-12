using MjAutomationCore.Components.Base;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;

namespace MjAutomationCore.Components.SelectBox
{
    class SelectWithSearchInDropdown : BaseWebComponent, IWebComponent
    {
        public By Container => By.XPath(".//following-sibling::span[contains(@class,'select2-container')]");

        protected override By Construct()
        {
            return Container;
        }

        public IWebElement GetValueFromDropdownWithSearchField()
        {
            var selector = By.XPath(".//span[@role='textbox']");
            if (!Driver.IsElementInElementDisplayed(Instance, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Select with search field is not displayed");
            }

            return Instance.FindElement(selector);
        }

        public IWebElement DropdownWithSearch()
        {
            var selector = By.XPath(".//span[contains(@class,'select2-dropdown')]");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Dropdown with search is not displayed");
            }
            return Driver.FindElement(selector);
        }

        public IWebElement GetSearchField()
        {
            var searchField = Driver.GetComponent<InputByAttribute>("select2-search", new Properties());
            if (!Driver.IsElementDisplayed(searchField, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Search field is not displayed");
            }
            return searchField;
        }

        public List<IWebElement> GetValuesList()
        {
            var selector = By.XPath(".//span[@class='select2-results']/ul[contains(@class,'elect2-results')]/li");
            return DropdownWithSearch().FindElements(selector).ToList();
        }

        public IWebElement GetValueByName(string value)
        {
            for (int i = 0; i < 15; i++)
            {
                try
                {
                    var values = GetValuesList();
                    if (values.Any())
                    {
                        foreach (IWebElement dropdownValue in values)
                        {
                            if (dropdownValue.Text.Equals(value))
                            {
                                return dropdownValue;
                            }
                        }
                    }
                }
                catch { }

                Thread.Sleep(500);
            }

            throw new Exception($"Value '{value}' is not exist");
        }
    }
}
