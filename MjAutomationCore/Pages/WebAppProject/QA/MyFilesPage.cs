using OpenQA.Selenium;
using SeleniumAutomationUtils.Pages;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MjAutomationCore.Pages.WebAppProject.QA
{
    class MyFilesPage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[contains(@class, 'remote-service')]//div[@class='title']")]
        public IList<IWebElement> CloudItemsList { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@id='fileManagerHeader']//h4[text()='Save Changes To']")]
        public IWebElement SaveChangesToPageTitle { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@id='fileManagerHeader']//h4[text()='Back']")]
        public IWebElement BackButtonOnBasePage { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'content-manager')]/button[@class='button btn-settings']")]
        public IWebElement SettingsButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@id='contentManager']//div[text()='File Options']")]
        public IWebElement FileOptionsTitle { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='service-info']/div[text()='SharePoint']/following-sibling::*")]
        public IWebElement SharePointSyncAccountElement { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'content-manager cloud breadcrumbs-visible')]")]
        public IWebElement ContentManagerCloud { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='top-bar']//button[@class='button close']")]
        public IWebElement CloseButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'content-manager')]//button[contains(@class,'btn-primary')][text()='Save In This Folder']")]
        public IWebElement SaveInThisFolderButton { get; set; }

        public bool SharePointSyncAccount()
        {
            return Driver.IsElementDisplayed(SharePointSyncAccountElement, WebDriverExtensions.WaitTime.Medium);
        }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By> { };
        }

        public IWebElement GetContentItemWithDescription(string item, string description)
        {
            var selector = By.XPath($".//div[contains(@class,'content-manager')]//div[text()='{item}']/following-sibling::*[text()='{description}']/parent::div");
            Driver.WaitForElementsToBeDisplayed(selector, WebDriverExtensions.WaitTime.Long, false);
            return Driver.FindElements(selector).First(x => x.Displayed);
        }

        public IWebElement GetCloudByName(string cloud)
        {
            var selector = By.XPath($".//div[contains(@class, 'remote-service')]//div[text()='{cloud}']");
            return Driver.FindElement(selector);
        }

        public bool DisplayedSyncAccountByCloudName(string cloudName)
        {
            var selector = By.XPath($".//div[@class='service-info']/div[text()='{cloudName}']/following-sibling::*");
            return Driver.IsElementDisplayed(selector);
        }

        public void GetFileOptionsByName(string cloudName)
        {
            var selector = By.XPath($".//div[@class='main']/div[contains(text(),'{cloudName}')]");
            Driver.WaitForElementToBeDisplayed(selector);
            Driver.FindElement(selector).Click();
        }

        public void LoginCloudPoint(string cloudName)
        {
            if (DisplayedSyncAccountByCloudName(cloudName))
            {
                SettingsButton.Click();
                Driver.WaitForElementToBeDisplayed(FileOptionsTitle);
                GetFileOptionsByName(cloudName);
                Driver.ExecuteAction(() => GetCloudByName(cloudName).Click());
            }
        }
    }
}
