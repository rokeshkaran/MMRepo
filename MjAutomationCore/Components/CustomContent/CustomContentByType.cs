using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;

namespace MjAutomationCore.Components.CustomContent
{
    class CustomContentByType : BaseWebComponent, IWebComponent
    {
        public new By Context => By.XPath($".//div[@data-type='customContentDiv'][contains(@class,'{Identifier}')]");

        protected override By Construct()
        {
            return Context;
        }
    }
}