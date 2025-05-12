using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumExtras.PageObjects;

namespace MjAutomationCore.Components.Licensing
{
    class SectionContentGroupHeader : BaseWebComponent, IWebComponent
    {
        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'content-info')]")]
        public IWebElement ContentInfo { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'content-warning')]")]
        public IWebElement ContentWarning { get; set; }

        protected override By Construct()
        {
            return By.XPath($".//h3[contains(@class,'group-title')][text()='{Identifier}']/parent::div[contains(@class,'group-header')]");
        }
    }
}
