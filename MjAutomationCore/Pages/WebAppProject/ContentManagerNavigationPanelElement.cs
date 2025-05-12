using System;
using System.Collections.Generic;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumAutomationUtils.Pages;
using OpenQA.Selenium;
using SeleniumExtras.PageObjects;

namespace MjAutomationCore.Pages.WebAppProject
{
    class ContentManagerNavigationPanelElement : SeleniumBasePage
    {
        const string Selector = ".//div[@class='content-manager-navigation']";

        [FindsBy(How = How.XPath, Using = Selector)]
        public IWebElement ManagerNavigationPanel { get; set; }

        public new By Context => By.XPath(Selector);

        public string LeftArrowIcon = "./button[@class='button btn-back']";

        public string SettingsIcon = "./button[@class='button btn-settings']";

        [FindsBy(How = How.XPath, Using = ".//button[contains(@class,'button btn-clear-search')]")]
        public IWebElement ButtonClearSearch { get; set; }

        [FindsBy(How = How.XPath, Using = ".//button[@class='button btn-back']")]
        public IWebElement BackButtonOnManagerNavigationPanel { get; set; }

        [FindsBy(How = How.XPath, Using = ".//button[@class='button btn-new-folder']")]
        public IWebElement CreateNewFolderButton { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            Driver.WaitForElementToBeDisplayed(By.XPath(Selector));
            return new List<By>
            {
                SelectorFor(this, p=> p.ManagerNavigationPanel)
            };
        }

        public IList<IWebElement> GetCloudByNameOnNavigationPanel(string cloudName)
        {
            var selector = By.XPath($".//div[@class='service-name'][text()='{cloudName}']/ancestor::div[@class='content-manager-navigation']");
            Driver.WaitForElementToBeDisplayed(selector);
            return Driver.FindElements(selector);
        }

        public string GetInfoDescription(IWebElement userName)
        {
            var selector = By.XPath(".//span[@class='service-user']");
            if (!Driver.IsElementInElementDisplayed(userName, selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception("Description is not displayed on page");
            }

            return userName.FindElement(selector).Text;
        }

        public string GetTitleOnPanel(string title)
        {
            var selector = $".//div[@class='service-title'][text()='{title}']";
            return selector;
        }

        public IWebElement GetFilterByName(string filterName)
        {
            var selector = By.XPath($".//div[contains(@class,'filter-service-list {filterName}')]");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Filter '{filterName}' is not displayed on Navigation Panel");
            }

            return Driver.FindElement(selector);
        }

        public IWebElement GetButtonByName(string buttonName)
        {
            var selector = By.XPath($".//button[contains(@class,'{buttonName}')]");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Button '{buttonName}' is not displayed on Navigation Panel");
            }

            return Driver.FindElement(selector);
        }
    }
}