using OpenQA.Selenium;
using SeleniumAutomationUtils.Pages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MjAutomationCore.Pages.SnapProject
{
    public class FilterMenuElement : SeleniumBasePage, IContextContainer
    {
        public new By Context => By.XPath(".//div[@class='filter-by-type-container']");

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By> { };
        }
    }
}