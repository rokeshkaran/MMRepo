using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using System;

namespace MjAutomationCore.Components.SelectBox
{
    class SelectboxOptions : BaseWebComponent
    {
        public By Container => By.XPath($".//div[contains(@class,'joint-select-box-options')][contains(@class,'{Identifier}')]");

        private string OptionSelector = ".//div//*[text()='{0}' or (contains(@src,'{0}'))]/parent::div[contains(@class,'select-box-option')] | .//div[text()='{0}']";
        protected override By Construct()
        {
            return Container;
        }

        public IWebElement GetOptionByName(string option)
        {
            var selector = By.XPath(string.Format(OptionSelector, option));
            if (!Driver.IsElementInElementExists(Instance, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Option '{option}' is not displayed in '{Identifier}' selectbox");
            }
            return Instance.FindElement(selector);
        }
    }
}
