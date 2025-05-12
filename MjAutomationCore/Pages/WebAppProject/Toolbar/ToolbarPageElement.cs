using OpenQA.Selenium;
using SeleniumAutomationUtils.Pages;
using System.Collections.Generic;

namespace MjAutomationCore.Pages.WebAppProject.Toolbar
{
    public class ToolbarPageElement : SeleniumBasePage, IContextContainer
    {
        public new By Context => By.XPath(".//div[@id='toolbar']");

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By> { };
        }
    }
}