using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;

namespace MjAutomationCore.Components.Base
{
    class InputByAttribute : BaseWebComponent, IWebComponent
    {
        public new By Context => By.XPath($".//input[contains(@class,'{Identifier}') or contains(@type,'{Identifier}') or contains(@placeholder,'{Identifier}') or contains(@name,'{Identifier}')]");

        protected override By Construct()
        {
            return Context;
        }
    }
}