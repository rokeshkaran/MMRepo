using System.Collections.Generic;
using MjAutomationCore.Base;
using OpenQA.Selenium;
using SeleniumExtras.PageObjects;

namespace MjAutomationCore.Pages.WebAppProject.PrintArea
{
    class PrintAreaElement : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//*[contains(@class,'joint-type-basic-printarea')]")]
        public IWebElement BasicPrintArea { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            {
                SelectorFor(this, p=> p.BasicPrintArea)
            };
        }
    }
}