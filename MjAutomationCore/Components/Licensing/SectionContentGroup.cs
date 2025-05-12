using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;

namespace MjAutomationCore.Components.Licensing
{
    class SectionContentGroup : BaseWebComponent, IWebComponent
    {
        protected override By Construct()
        {
            return By.XPath($".//following-sibling::div[@class='section-content-group'][1]");
        }
    }
}