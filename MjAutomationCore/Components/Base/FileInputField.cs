using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;

namespace MjAutomationCore.Components.Base
{
    class FileInputField : BaseWebComponent, IWebComponent
    {
        public new By Context => By.XPath($".//input[@type='file'][contains(@class,'{Identifier}') or contains(@id,'{Identifier}')]");

        protected override By Construct()
        {
            return Context;
        }
    }
}