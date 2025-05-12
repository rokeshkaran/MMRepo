using MjAutomationCore.Extensions;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Pages;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;

namespace MjAutomationCore.Pages.WebAppProject.FileManagerHeader
{
    class FileManagerHeaderBasePage : SeleniumBasePage, IContextContainer
    {
        private const string FileManagerHeaderSelector = ".//div[@id='fileManagerHeader']";
        public new By Context => By.XPath(FileManagerHeaderSelector);

        [FindsBy(How = How.XPath, Using = FileManagerHeaderSelector)]
        public IWebElement FileManagerHeader { get; set; }

        [FindsBy(How = How.XPath, Using = ".//h4[contains(@class,'menu-action')]")]
        public IList<IWebElement> TabList { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='user-panel']/img[@class='user-avatar']")]
        public IWebElement UserAvatar { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='top-bar']")]
        public IWebElement TopBar { get; set; }

        public const string TabSelector = ".//h4[contains(@class,'menu-action')][text()='{0}']";
        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            {
              SelectorFor(this, p => p.FileManagerHeader)
            };
        }

        public IWebElement GetTabByName(string tabName)
        {
            var selector = By.XPath(string.Format(TabSelector, tabName));
            if (!Driver.IsElementInElementDisplayed(FileManagerHeader, selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Tab with '{tabName}' name is not displayed on file manager header page");
            }

            return FileManagerHeader.FindElement(selector);
        }

        public bool DisplayedTab(string tabName)
        {
            try
            {
                return GetTabByName(tabName).Displayed();
            }
            catch
            {
                return false;
            }
        }
    }
}
