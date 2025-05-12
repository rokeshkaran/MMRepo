using OpenQA.Selenium;
using SeleniumAutomationUtils.Pages;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;

namespace MjAutomationCore.Pages.WebAppProject.SidePanel
{
    class BaseSidePanelPage : SeleniumBasePage, IContextContainer
    {
        //public new By Context => throw new NotImplementedException();

        [FindsBy(How = How.XPath, Using = ".//div[@class='header'][not(contains(@class,'mm-capture'))]")]
        public IWebElement Header { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'group-btn-inspector')]")]
        public IList<IWebElement> ButtonHeader { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@id='powerFilter']")]
        public IWebElement SidePanelFilter { get; set; }

        [FindsBy(How = How.XPath, Using = "./following-sibling::div[@class='content']//*[contains(@class,'group-header')]")]
        public IWebElement GroupHeader { get; set; }

        public string CloseButton = ".//*[contains(@class,'close-btn')]";
        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By> { };
        }

        public IWebElement GetFieldByNameOnPanel(string fieldName, string panelName, string sectionName = "")
        {
            var sectionSelector = string.IsNullOrEmpty(sectionName) ?
                String.Empty : $"//following-sibling::div[@class='content']//h5[contains(text(),'{sectionName}')]";
            var selector = By.XPath($".//div[text()='{panelName}']/parent::div[@class='header']{sectionSelector}//following-sibling::div[@class='content']//*[contains(text(),'{fieldName}')]//parent::div//following-sibling::div[@class='content']//div[contains(@class,'input')]");
            return Driver.FindElement(selector);
        }

        public string InputField = ".//input";

        public string GetValueOfTextArea = ".//textarea[@type='text']";

        public IWebElement GetFooterButton(string button)
        {
            var selector = By.XPath($".//div[@class='footer']/button[text()='{button}']");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"'{button}'footer button is not displayed");
            }

            return Driver.FindElement(selector);
        }
    }
}