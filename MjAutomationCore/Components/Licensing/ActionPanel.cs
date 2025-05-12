using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using System;

namespace MjAutomationCore.Components.Licensing
{
    class ActionPanel : BaseWebComponent, IWebComponent
    {
        public new By Context => By.XPath(".//div[contains(@class,'action-panel')]");

        protected override By Construct()
        {
            return Context;
        }

        public IWebElement GetSearchOption()
        {
            var selector = By.XPath($".//select[@class='search-option']");
            if (!Driver.IsElementInElementDisplayed(Instance, selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Search option is not displayed on Action panel");
            }
            return Instance.FindElement(selector);
        }

        public IWebElement GetActionButtonByName(string actionButtonName)
        {
            var selector = By.XPath($".//div[contains(@class,'admin-action-buttons')]//a[text()='{actionButtonName}']//parent::a");
            if (!Driver.IsElementInElementDisplayed(Instance, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Button '{actionButtonName}' is not displayed on Action panel");
            }
            return Instance.FindElement(selector);
        }
    }
}