using System;
using System.Collections.Generic;
using SeleniumAutomationUtils.SeleniumExtensions;
using MjAutomationCore.Base;
using OpenQA.Selenium;
using SeleniumExtras.PageObjects;

namespace MjAutomationCore.Pages.LicensingProject
{
     class SectionHeaderElement : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//h2[@class='section-header']")]
        public IWebElement SectionHeader { get; set; }

        [FindsBy(How = How.XPath, Using = ".//a[@class='button logout-url']")]
        public IWebElement SignOutButton { get; set; }

        private string HeaderPage = ".//b[@class='header-text'][text()='{0}']";

        private string Mark = ".//span[@class='readonly'][contains(text(),'{0}')]";
        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            {
                SelectorFor(this, e=> e.SectionHeader)
            };
        }

        public bool DisplayedHeaderPage(string header)
        {
            var selector = By.XPath(string.Format(HeaderPage, header));
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Header '{header}' is not displayed");
            }
            return Driver.IsElementDisplayed(selector);
        }

        public bool DisplayedMark(string value)
        {
            var selector = By.XPath(string.Format(Mark, value));
            if (!Driver.IsElementInElementDisplayed(SectionHeader,selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Mark '{value}' is not displayed");
            }
            return Driver.IsElementDisplayed(SectionHeader.FindElement(selector));
        }
    }
}
