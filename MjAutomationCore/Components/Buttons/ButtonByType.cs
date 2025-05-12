using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;

namespace MjAutomationCore.Components.Buttons
{
    class ButtonByType : BaseWebComponent, IWebComponent
    {
        public new By Context => By.XPath($".//button[@data-type='button'][contains(@data-name,'{Identifier}') or contains(.,'{Identifier}')]");
        protected override By Construct()
        {
            return Context;
        }
    }
}