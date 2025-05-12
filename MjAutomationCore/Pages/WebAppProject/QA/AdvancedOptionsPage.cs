using System;
using System.Collections.Generic;
using SeleniumAutomationUtils.SeleniumExtensions;
using MjAutomationCore.Base;
using OpenQA.Selenium;
using SeleniumExtras.PageObjects;
using System.Linq;

namespace MjAutomationCore.Pages.WebAppProject.QA
{
    class AdvancedOptionsPage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//h2[@class='section-header']/b[text()='Advanced Options']")]
        public IWebElement AdvancedOptionsTitle { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='form-row password']/input[@id='password']")]
        public IWebElement PasswordField { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class, 'publishing')]/label[text()='Choose Image']")]
        public IWebElement ChooseImageButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//input[@id='branding-logo']")]
        public IWebElement InputImage { get; set; }

        [FindsBy(How = How.XPath, Using = ".//img[@class='branding-logo-preview'][@src]")]
        public IWebElement ImageLogo { get; set; }

        [FindsBy(How = How.XPath, Using = ".//button[@class='branding-logo-remove']")]
        public IWebElement BrandingLogoRemoveButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//select[@name='file-region']")]
        public IWebElement StorageLocationField { get; set; }
                
        [FindsBy(How = How.XPath, Using = ".//div[@class='view-options-menu-context']")]
        public IWebElement PublishedViewDropdownField { get; set; }
        
        [FindsBy(How = How.XPath, Using = ".//div[@id='publish-view-options']//*[@class='view-options-selected']")]
        public IList<IWebElement> PublishedViewDropdownOptions { get; set; }
        
        [FindsBy(How = How.XPath, Using = ".//*[@name='file-region']/*[@value]")]
        public IList<IWebElement> StorageLocationTemplatesList { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            Driver.WaitForElementToContainsTextInAttribute(By.XPath(".//div[@id='loading']"), "display: none", "style", WebDriverExtensions.WaitTime.Medium);
            return new List<By>
            {
            SelectorFor(this, p => p.AdvancedOptionsTitle)
            };
        }

        public bool DisplayedPasswordCharacters()
        {
            var shown = PasswordField.GetAttribute("type").Equals("text");
            return shown;
        }

        public IWebElement GetButtonByNameInPasswordField(string buttonName)
        {
            var selector = By.XPath($".//div[@class='form-row password']//span[text()='{buttonName}']");
            return Driver.FindElement(selector);
        }

        public IWebElement GetPublishedViewOptionByNameFromDropdown(string optionName)
        {
            var selector = By.XPath($".//p[@class='view-options-selection-context']");
            var options = PublishedViewDropdownOptions;
            if (options.Any(x => x.FindElement(selector).Text.Equals(optionName)))
            {
                return options.First(x => x.FindElement(selector).Text.Equals(optionName));
            }
            throw new Exception($"Published View Option '{optionName}' is not displayed in Publish View Dropdown");
        }
        
        public IWebElement GetPublishedViewSelectedOption()
        {
            var selector = By.XPath($".//p[@class='view-options-menu-context']");
            if (!Driver.IsElementInElementDisplayed(PublishedViewDropdownField, selector ,WebDriverExtensions.WaitTime.Second))
            {
                throw new Exception($"Published View selected Option is not displayed in Publish View Dropdown field");
            }
            return PublishedViewDropdownField.FindElement(selector);
        }

        public IWebElement GetValueInDropdown(string dropdown)
        {
            var selector = By.XPath($".//p[@class='form-row form-text'][text()='{dropdown}']/following-sibling::select[@class='form-input select-input long'][1]");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Medium))
                throw new Exception($"Dropdown '{dropdown}' is not displayed on Advanced Options page");

            return Driver.FindElement(selector);
        }
    }
}