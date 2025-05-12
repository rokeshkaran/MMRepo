using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using System;
using System.Linq;
using System.Text.RegularExpressions;

namespace MjAutomationCore.Components.Base
{
    class ToastContainer : BaseWebComponent, IWebComponent
    {
        public By Container => By.XPath(".//div[@id='toast-container']");

        protected override By Construct()
        {
            return Container;
        }

        public bool DisplayedToastMessage(string toastMessage)
        {
            var selector = By.XPath($".//div[@class='toast-message'][text()='{toastMessage}']");
            if (!Driver.IsElementInElementDisplayed(Instance, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"'{toastMessage}' message is not displayed in Toast Container");
            }

            return Driver.IsElementDisplayed(Instance.FindElement(selector));
        }

        public bool DisplayedToastTitle(string toastTitle)
        {
            var text = Regex.Split(toastTitle, "\\. ").Aggregate(string.Empty, (current, s) => current + $"[contains(text(),'{s}')]");
            var selector = By.XPath($".//div[@class='toast-title']{text}");
            if (!Driver.IsElementInElementDisplayed(Instance, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"'{toastTitle}' title is not displayed in Toast Container");
            }

            return Driver.IsElementDisplayed(Instance.FindElement(selector));
        }
    }
}
