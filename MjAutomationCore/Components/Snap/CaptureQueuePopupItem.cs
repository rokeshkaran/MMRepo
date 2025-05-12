using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using System;

namespace MjAutomationCore.Components.Snap
{
    class CaptureQueuePopupItem : BaseWebComponent
    {
        protected override By Construct()
        {
            var selector = By.XPath($".//div[contains(@class,'semi-transparent')]//div[contains(@class,'mm-capture-queue')][contains(@class,'{Identifier}')]");
            return selector;
        }

        public IWebElement GetItemByName(string itemName)
        {
            var selector = By.XPath($".//div[contains(@class,'item')][text()='{itemName}']");
            if (!Driver.IsElementInElementDisplayed(Instance, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Item '{itemName}' is not displayed in '{Identifier}' popup");
            }

            return Instance.FindElement(selector);
        }
    }
}