using System;
using System.Collections.Generic;
using System.Linq;
using SeleniumAutomationUtils.SeleniumExtensions;
using MjAutomationCore.Base;
using OpenQA.Selenium;
using SeleniumExtras.PageObjects;

namespace MjAutomationCore.Pages.WebAppProject.QA
{
    class TagViewPage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//*[contains(@class,'paper-header-colum')]/span[@class='paper-header-column-name']")]
        public IList<IWebElement> ColumnsList { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            {};
        }

        public IWebElement GetTitleOnTagView(string title)
        {
            var selector = By.XPath($".//div[@class='paper-header-name'][text()='{title}']");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"'{title}' title is not displayed in table");
            }
            return Driver.FindElement(selector);
        }

        public IWebElement GetColumByName(string columName)
        {
            var selector = By.XPath($".//div[contains(@class,'paper-header-column')]/span[text()='{columName}']");
            if(!Driver.IsElementExists(selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"'{columName}' colum is not displayed in table");
            }
            return Driver.FindElement(selector);
        }

        public bool CollapsedColum(string columName)
        {
            var collapsedColum = GetColumByName(columName).FindElement(By.XPath("./parent::div")).GetAttribute("class").Contains("collapsed");
            return collapsedColum;
        }

        public IWebElement GetExpandOrCollapseButtonInColum(string columName)
        {
            var selector = By.XPath($"./following-sibling::span[@class='paper-header-column-count']");
            if (!Driver.IsElementInElementExists(GetColumByName(columName), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"'{columName}' colum is not displayed in table");
            }
            return GetColumByName(columName).FindElement(selector);
        }

        public List<string> GetTagsGroupList(string group)
        {
            var by = By.XPath($".//div[@class='joint-paper-header joint-theme-default']/div[contains(text(),'{group}')]/following::div[@class='paper-header-column']/span[contains(@class,'column-name')]");
            return Driver.FindElements(by).Select(x => x.Text).ToList();
        }
    }
}