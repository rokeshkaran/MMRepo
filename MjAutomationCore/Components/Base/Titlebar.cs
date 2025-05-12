using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;

namespace MjAutomationCore.Components.Base
{
    class Titlebar : BaseWebComponent, IWebComponent
    {
        public By Container => By.XPath($".//div[contains(@class,'titlebar')]");
        protected override By Construct()
        {
            return Container;
        }

        public IWebElement GetTitleBarCloseButton()
        {
            var selector = By.XPath($".//*[contains(@class,'close')]");
            if (!Driver.IsElementInElementDisplayed(Instance, selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Close button is not displayed in TitleBar");
            }
            return Instance.FindElement(selector);
        }
    }
}
