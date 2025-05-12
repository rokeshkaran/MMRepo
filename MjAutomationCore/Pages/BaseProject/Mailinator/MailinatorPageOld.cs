using System.Collections.Generic;
using SeleniumAutomationUtils.Pages;
using OpenQA.Selenium;
using SeleniumExtras.PageObjects;

namespace MjAutomationCore.Pages.BaseProject.Mailinator
{
    class MailinatorPageOld : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//input[@type='text'][1]")]
        public IWebElement EmailTextbox { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'top-bar-item')]//button[contains(@onclick,'changeInbox')]")]
        public IWebElement GoButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div/a[contains(text(),'Verify My Account')]")]
        public IWebElement VerifyMyAccountButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//table[contains(@class,'table')]//td[3]")]
        public IWebElement TableContent { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@id='pills-html']")]
        public IWebElement IframeContent { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By> 
            { };
        }
    }
}