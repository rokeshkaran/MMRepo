using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;

namespace MjAutomationCore.Components.Buttons
{
    class MenuButtonByType : BaseWebComponent, IWebComponent
    {
        public new By Context => By.XPath($".//button[@data-type='menuButton'][contains(@data-name,'{Identifier}') or contains(.,'{Identifier}')]");

        protected override By Construct()
        {
            return Context;
        }
    }
}