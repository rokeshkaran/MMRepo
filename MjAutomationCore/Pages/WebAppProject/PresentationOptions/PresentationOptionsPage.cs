using MjAutomationCore.Base;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using System;
using System.Collections.Generic;

namespace MjAutomationCore.Pages.WebAppProject.PresentationOptions
{
    class PresentationOptionsPage : SeleniumBasePage
    {
        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By> { };
        }
        public bool DisplayedScreenHeader(string header)
        {
            var selector = By.XPath($".//div[@class='presentation-options-body']/div[@class='header']/h2[text()='{header}']");
            return Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Second);
        }
        public void ScreenCloseButton(string headerScreen)
        {
            var selector = By.XPath($".//div[@class='presentation-options-body']//h2[text()='{headerScreen}']/following-sibling::button[contains(@class,'btn-icon close')]");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception("Screen Close button is not dipslayed");
            }
            Driver.FindElement(selector).Click();
        }
        public IWebElement GetHeaderScreen(string headerScreen)
        {
            var selector = By.XPath($".//div[@class='presentation-options-body']//h2[text()='{headerScreen}']/parent::div[@class='header']");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Header '{headerScreen}' not dipslayed");
            }
            return Driver.FindElement(selector);
        }
        public void ClickButtonByName(string buttonName, string headerScreen)
        {
            var selector = By.XPath($"./parent::div//button[@class='close-btn'][text()='{buttonName}']");
            Driver.WaitForElementInElementToBeDisplayed(GetHeaderScreen(headerScreen), selector, WebDriverExtensions.WaitTime.Medium);
            GetHeaderScreen(headerScreen).FindElement(selector).Click();
        }
        public IWebElement GetCheckboxInSectionName(string checkboxName, string sectionName, string headerScreen)
        {
            var selector = By.XPath($"./following-sibling::div//h4[text()='{sectionName}']/parent::div//parent::div[contains(@class,'group-body')]//label[text()='{checkboxName}']/preceding-sibling::div[contains(@class,'btn-checkbox')]");
            Driver.WaitForElementInElementToBeDisplayed(GetHeaderScreen(headerScreen), selector, WebDriverExtensions.WaitTime.Medium);
            return GetHeaderScreen(headerScreen).FindElement(selector);
        }

        public bool IsCheckboxDisabled(string checkboxName, string sectionName, string headerScreen)
        {
            var selector = By.XPath("./parent::div[contains(@class,'checkbox-wrapper disabled')]");
            return Driver.IsElementInElementDisplayed(GetCheckboxInSectionName(checkboxName, sectionName, headerScreen), selector, WebDriverExtensions.WaitTime.Medium);
        }

        public IWebElement GetInputFieldInSectionName(string inputFieldName, string sectionName, string headerScreen)
        {
            var selector = By.XPath($"./following-sibling::div//h4[text()='{sectionName}']/parent::div//parent::div[contains(@class,'group-body')]//p[text()='{inputFieldName}']/following-sibling::input");
            if (!Driver.IsElementInElementDisplayed(GetHeaderScreen(headerScreen), selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Input field '{inputFieldName}' in section '{sectionName}' with Header '{headerScreen}' is not displayed");
            };
            return GetHeaderScreen(headerScreen).FindElement(selector);
        }

        public bool GetCheckboxState(string checkboxName, string sectionName, string headerScreen)
        {
            var state = GetCheckboxInSectionName(checkboxName, sectionName, headerScreen).GetAttribute("class");
            return state.Contains("selected");
        }
        public void SetCheckboxState(string checkboxName, string sectionName, string headerScreen, bool desiredState)
        {
            if (desiredState)
            {
                if (!GetCheckboxState(checkboxName, sectionName, headerScreen))
                {
                    GetCheckboxInSectionName(checkboxName, sectionName, headerScreen).Click();
                }
            }
            else
            {
                if (GetCheckboxState(checkboxName, sectionName, headerScreen))
                {
                    GetCheckboxInSectionName(checkboxName, sectionName, headerScreen).Click();
                }
            }
        }
    }
}