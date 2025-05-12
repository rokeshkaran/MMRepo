using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using System;

namespace MjAutomationCore.Components.Licensing
{
    class Pagination : BaseWebComponent, IWebComponent
    {
        public By Container => By.XPath($".//div[@class='pagination']");

        protected override By Construct()
        {
            return Container;
        }

        public IWebElement GetOptionInMenu(string menu)
        {
            var selector = By.XPath($".//label[text()='{menu}']/following-sibling::select[@class='limit']");
            if (!Driver.IsElementInElementExists(Instance, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Option is not displayed in '{menu}' menu");
            }

            return Instance.FindElement(selector);
        }

        public IWebElement GetButtonByName(string button)
        {
            var selector = By.XPath($".//button[contains(@class,'{button}')]");
            if (!Driver.IsElementInElementExists(Instance, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Column content is not displayed in Dialog");
            }

            return Instance.FindElement(selector);
        }
    }
}
