using SeleniumAutomationUtils.Pages;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;

namespace MjAutomationCore.Pages.WebAppProject.QA
{
    class FilterContextMenuPage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[@data-type='filter-options']")]
        public IWebElement FilterContextMenu { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            {};
        }

        public bool DisplayedFilterContextMenu()
        {
            return Driver.IsElementDisplayed(FilterContextMenu, WebDriverExtensions.WaitTime.Second);
        }

        public IWebElement GetSectionByNameInFilterContextMenu(string sectionName)
        {
            var selector = By.XPath($".//div[@class='popup-group-label'][text()='{sectionName}']");
            if (!Driver.IsElementInElementDisplayed(FilterContextMenu,selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Section '{sectionName}' is not displayed in Filter contex menu");
            }

            return FilterContextMenu.FindElement(selector);
        }

        public IWebElement GetIconByNameInSectionOnFilterContextMenu(string iconName, string sectionName)
        {
            var selector = By.XPath($"./parent::div[@class='popup-group']//span[text()='{iconName}']/parent::div[contains(@class,'select-button-group-button')]");
            if (!Driver.IsElementInElementDisplayed(GetSectionByNameInFilterContextMenu(sectionName), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Icon '{iconName}' is not displayed in '{sectionName}' section on Filter contex menu");
            }

            return GetSectionByNameInFilterContextMenu(sectionName).FindElement(selector);
        }

        public IWebElement GetContextFilterOptionByTitle(string titlePopup)
        {
            var selector = By.XPath($".//div[text()='{titlePopup}']/parent::div[@class='popup-group']");
            Driver.IsElementExists(selector);
            return Driver.FindElement(selector);
        }

        public string GetSectionInContextFilterQuickFilter(string text)
        {
            var selector = $"./div[text()='{text}']";
            return selector;
        }

        public string GetIconInContextFilterCycleIcon(string icon)
        {
            var selector = $".//div[contains(@class,'select-button-group')]/*[text()='{icon}']']";
            return selector;
        }
    }
}