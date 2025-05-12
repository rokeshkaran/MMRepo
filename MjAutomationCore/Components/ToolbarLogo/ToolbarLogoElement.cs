using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;

namespace MjAutomationCore.Components.ToolbarLogo
{
    class ToolbarLogoElement : BaseWebComponent, IWebComponent
    {
        public new By Context => By.XPath(".//a[@class='logo-icon'] | .//a[@class='toolbar-logo']");

        protected override By Construct()
        {
            return Context;
        }
    }
}