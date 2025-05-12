using System;
using System.Collections.Generic;
using MjAutomationCore.Base;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;

namespace MjAutomationCore.Pages.WebAppProject.MapMode
{
    class MapModePage : SeleniumBasePage
    {
        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            { };
        }

        public IWebElement GetMapMode(string modeName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Medium)
        {
            var selector = By.XPath($".//div[@class='paper-container'][contains(@data-type,'{modeName}')]");
            if (!Driver.IsElementExists(selector, waitTime))
            {
                throw new Exception($"Map is not exist in '{modeName}' mode");
            }

            return Driver.FindElement(selector);
        }
    }
}