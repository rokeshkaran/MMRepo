using MjAutomationCore.Base;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MjAutomationCore.Pages.MindmanagerOnlineHelp
{
    class MindmanagerOnlineHelpPage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'col-sm-6')]/p")]
        public IList<IWebElement> ProductNames { get; set; }

        private readonly string ProductLinkXPath = "./following-sibling::ul[1]/li/a";
        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By> { };
        }

        public bool DisplayedHeader(string header)
        {
            var headerSelector = By.XPath($".//body[contains(@class,'mm support responsive')]//section[@id='content']//h1[text()=\"{header}\"]");
            if (!Driver.IsElementDisplayed(headerSelector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Header '{header}' is not displayed on Mindmanager online help page");
            }
            return true;
        }

        public IWebElement GetProductByName(string productName)
        {
            Driver.WaitForElementsToBeDisplayed(ProductNames, WebDriverExtensions.WaitTime.Medium, false);
            return ProductNames.First(x => x.Text.Equals(productName));
        }

        public IList<IWebElement> GetProductLinks(string productName)
        {
            Driver.WaitForElementInElementToBeDisplayed(GetProductByName(productName),By.XPath(ProductLinkXPath), WebDriverExtensions.WaitTime.Medium);
            return GetProductByName(productName).FindElements(By.XPath(ProductLinkXPath)).ToList();
        }

        public IWebElement GetLinkByNameForProduct(string linkName, string productName)
        {
            return GetProductLinks(productName).First(x => x.Text.Equals(linkName));
        }
    }
}