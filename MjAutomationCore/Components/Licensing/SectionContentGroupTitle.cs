using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;

namespace MjAutomationCore.Components.Licensing
{
    class SectionContentGroupTitle : BaseWebComponent, IWebComponent
    {
        public By Container => By.XPath($".//h3[text()='{Identifier}']/following::div[@class='section-content-group'][1]");

        protected override By Construct()
        {
            return Container;
        }
    }
}
