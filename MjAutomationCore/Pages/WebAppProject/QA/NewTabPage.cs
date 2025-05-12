using System.Collections.Generic;
using SeleniumAutomationUtils.Pages;
using OpenQA.Selenium;
using SeleniumExtras.PageObjects;

namespace MjAutomationCore.Pages.WebAppProject.QA
{
    class NewTabPage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[@class='footer-container']//button[@class='create']")]
        public IWebElement CreateButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'templates-container')]/div[contains(@class,'select-button-group-button')]")]
        public IList<IWebElement> TemplateList { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='theme-container']//img[@class='select-button-group-button-icon']")]
        public IList<IWebElement> ThemeList { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            {
            };
        }
    }
}