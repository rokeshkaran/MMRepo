using System.Collections.Generic;
using SeleniumAutomationUtils.SeleniumExtensions;
using MjAutomationCore.Base;
using OpenQA.Selenium;
using SeleniumExtras.PageObjects;

namespace MjAutomationCore.Pages.WebAppProject.QA
{
    class PrintAreaPage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//h3[text()='Print Preview']/parent::div[@class='print-page-settings']")]
        public IWebElement PrintPreviewHeader { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@data-type='basic.PrintArea']")]
        public IWebElement BasicPrintArea { get; set; }

        [FindsBy(How = How.XPath, Using = ".//*[@class='footer']/following-sibling::*[@stroke]")]
        public IWebElement PrintBorderColor { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            {
                SelectorFor(this, p => p.PrintPreviewHeader)
            };
        }

        public IWebElement GetColorBoxBySectionNameInPrintPreviewPopup(string sectionName)
        {
            var selector = By.XPath($".//*[text()='{sectionName}']/ancestor::*[contains(@class,'group-vertical')]//div[contains(@class,'select-box joint-color-palette')]");
            Driver.WaitForElementToBeDisplayed(selector);
            return Driver.FindElement(selector);
        }

        public IWebElement GetButtonByName(string buttonName)
        {
            var selector = By.XPath($"./following-sibling::div[@class='buttons']/button[text()='{buttonName}']");
            Driver.WaitForElementInElementToBeDisplayed(PrintPreviewHeader, selector);
            return PrintPreviewHeader.FindElement(selector);
        }
        public bool GetCheckedColorBoxBySectionName(string checkboxName)
        {
            var selector = By.XPath($".//*[text()='{checkboxName}']/ancestor::*[contains(@class,'group-vertical')]//div[@class='joint-select-box joint-color-palette joint-theme-default']");
            return Driver.IsElementDisplayed(selector);
        }

        public bool GetUncheckedColorBoxBySectionName(string checkboxName)
        {
            var selector = By.XPath($".//*[text()='{checkboxName}']/ancestor::*[contains(@class,'group-vertical')]//div[@class='joint-select-box joint-color-palette joint-theme-default disabled']");
            return Driver.IsElementDisplayed(selector);
        }

        public IWebElement GetCheckboxByName(string checkboxName)
        {
            var selector = By.XPath($".//label[text()='{checkboxName}']/preceding-sibling::div[contains(@class,'checkbox')]");
            Driver.WaitForElementToBeDisplayed(selector);
            return Driver.FindElement(selector);
        }

        public bool GetCheckedCheckboxByName(string checkboxName)
        {
            var selector = By.XPath($".//label[text()='{checkboxName}']/preceding-sibling::div[contains(@class,'selected btn-checkbox')]");
            Driver.IsElementExists(selector);
            return Driver.IsElementDisplayed(selector);
        }

        public bool GetUncheckedCheckboxByName(string checkboxName)
        {
            var selector = By.XPath($".//label[text()='{checkboxName}']/preceding-sibling::div[@class='btn-checkbox show-background']");
            Driver.WaitForElementToBeDisplayed(selector);
            return Driver.IsElementDisplayed(selector);
        }
    }
}

