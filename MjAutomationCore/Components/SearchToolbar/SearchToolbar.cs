using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;

namespace MjAutomationCore.Components.SearchToolbar
{
    class SearchToolbar : BaseWebComponent, IWebComponent
    {
        public new By Context => By.XPath(".//div[contains(@class,'search toolbar-component')]");

        protected override By Construct()
        {
            return Context;
        }
    }
}
