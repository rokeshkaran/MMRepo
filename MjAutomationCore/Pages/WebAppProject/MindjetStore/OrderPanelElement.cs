using System;
using System.Collections.Generic;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumAutomationUtils.Pages;
using OpenQA.Selenium;
using SeleniumExtras.PageObjects;

namespace MjAutomationCore.Pages.WebAppProject.MindjetStore
{
    class OrderPanelElement : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[@id='cleverOrderSteps']")]
        public IWebElement OrderStepsPanel { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            {
                SelectorFor(this, p => p. OrderStepsPanel)
            };
        }

        public bool ActiveStepOrder(string stepName)
        {
            var selector = By.XPath($".//span[text()='{stepName}']/parent::div[contains(@class,'orderStep active')]");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Short))
                throw new Exception($"Step {stepName} is not dispaleyd as Active on Order steps panel");
            return Driver.IsElementDisplayed(selector);
        }
    }
}