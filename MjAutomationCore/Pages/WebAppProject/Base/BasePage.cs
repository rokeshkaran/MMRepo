using SeleniumAutomationUtils.SeleniumExtensions;
using OpenQA.Selenium;
using SeleniumExtras.PageObjects;
using System.Collections.Generic;
using System.Linq;
using SeleniumAutomationUtils.Pages;

namespace MjAutomationCore.Pages.WebAppProject.Base
{
    public class BasePage : SeleniumBasePage
    {
        private const string HeaderSelector = ".//h2[contains(@class,'section-header')]";

        [FindsBy(How = How.XPath, Using = HeaderSelector)]
        private IList<IWebElement> HeaderList { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            //Driver.WaitForDataLoading();
            return new List<By>
            {
                SelectorFor(this, p => p.HeaderList)
            };
        }

        public bool DisplayedHeader(string header)
        {
            Driver.WaitForElementsToBeDisplayed(HeaderList, WebDriverExtensions.WaitTime.Medium, false);
            return HeaderList.Any(x => x.Text.Equals(header));
        }
    }
}
