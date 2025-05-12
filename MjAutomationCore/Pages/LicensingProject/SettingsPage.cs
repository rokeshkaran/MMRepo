using System;
using System.Collections.Generic;
using SeleniumAutomationUtils.SeleniumExtensions;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MjAutomationCore.Base;
using OpenQA.Selenium;
using SeleniumExtras.PageObjects;

namespace MjAutomationCore.Pages.LicensingProject
{
    class SettingsPage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'admin-panel')]")]
        public IWebElement AdminPanel { get; set; }

        public readonly string SectionContentTooltip = ".//span[contains(@class,'section-content-tooltip')]";

        public readonly string SectionContentDetails = ".//parent::div//div[contains(@class,'{0}')]";

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By> { };
        }

        public IWebElement GetSectionTitleByName(string headerTitle)
        {
            var selector = By.XPath($".//h3[text()='{headerTitle}']");
            if (!Driver.IsElementInElementDisplayed(AdminPanel, selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Header '{headerTitle}' is not displayed in Admin Panel section");
            }
            return AdminPanel.FindElement(selector);
        }

        public IWebElement GetSectionContentGroupByHeaderTitle(string headerTitle)
        {
            var selector = By.XPath($".//following::div[@class='section-content-group'][1]");
            if (!Driver.IsElementInElementDisplayed(GetSectionTitleByName(headerTitle), selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Header '{headerTitle}' for section content group is not displayed in Admin Panel section");
            }
            return GetSectionTitleByName(headerTitle).FindElement(selector);
        }

        public IList<IWebElement> GetSectionContentGroupItems(string headerTitle)
        {
            var selector = By.XPath($".//div[@class='checkbox-wrapper']");
            if (!Driver.IsElementInElementDisplayed(GetSectionContentGroupByHeaderTitle(headerTitle), selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Section content group items is not displayed in admin panel for Header Title '{headerTitle}'");
            }
            return GetSectionContentGroupByHeaderTitle(headerTitle).FindElements(selector).ToList();
        }

        public IWebElement GetSectionContentDetailByLabelName(string headerTitle, string labelName)
        {
            var selector = By.XPath($".//label[text()='{labelName}']");
            if (GetSectionContentGroupItems(headerTitle).Any(x => x.FindElements(selector).Any()))
            {
                return GetSectionContentGroupItems(headerTitle)
               .SelectMany(x => x.FindElements(selector))
               .First();
            }
            throw new Exception($"Label '{labelName}' is not displayed for section group items in admin panel in header title '{headerTitle}' section ");
        }
    }
}
