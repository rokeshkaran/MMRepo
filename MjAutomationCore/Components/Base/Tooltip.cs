using MjAutomationCore.Extensions;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumExtras.PageObjects;

namespace MjAutomationCore.Components.Base
{
    class Tooltip : BaseWebComponent, IWebComponent
    {
        public By Container => By.XPath($".//div[contains(@class,'joint-tooltip')]");

        protected override By Construct()
        {
            return Container;
        }

        public string GetTooltipContent()
        {
            var selector = By.XPath($".//div[@class='tooltip-content']");

           return Instance.FindElement(selector).Text.RemoveLineBreakes();
        }

        public IWebElement GetText(string value)
        {
            var selector = By.XPath($".//*[text()='{value}']");

            return Instance.FindElement(selector);
        }
    }
}
