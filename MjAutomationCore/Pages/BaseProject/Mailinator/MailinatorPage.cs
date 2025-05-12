using System;
using System.Collections.Generic;
using System.Threading;
using SeleniumAutomationUtils.SeleniumExtensions;
using MjAutomationCore.Base;
using OpenQA.Selenium;
using SeleniumExtras.PageObjects;

namespace MjAutomationCore.Pages.BaseProject.Mailinator
{
    class MailinatorPage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//input[@id='inbox_field']")]
        public IWebElement EmailTextbox { get; set; }

        [FindsBy(How = How.XPath, Using = ".//button[text()='Go!']")]
        public IWebElement GoButton { get; set; }

        private string EmailSubjectsSelector = ".//div[@id='inboxpane']//tbody/tr/td[4]";

        [FindsBy(How = How.XPath, Using = ".//iframe[@id='msg_body']")]
        public IWebElement EmailBody { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            {
                SelectorFor(this, p=> p.EmailTextbox)
            };
        }

        public void WaitForEmails()
        {
            for (int i = 0; i < 60; i++)
            {
                if (Driver.IsElementDisplayed(By.XPath(EmailSubjectsSelector)))
                    return;

                Thread.Sleep(1000);
            }
            throw new Exception("Mailbox was empty. No emails received");
        }

        public MailinatorMail GetLastEmail()
        {
            var result = new MailinatorMail() { Subject = Driver.FindElements(By.XPath(EmailSubjectsSelector))[0].Text };

            Driver.FindElements(By.XPath(EmailSubjectsSelector))[0].Click();

            Driver.WaitForElementToBeDisplayed(EmailBody);
            Thread.Sleep(900);

            Driver.SwitchTo().Frame(EmailBody);

            result.Body = Driver.FindElement(By.TagName("body")).GetAttribute("innerHTML");

            Driver.SwitchTo().DefaultContent();

            Driver.Navigate().Back();

            return result;
        }
    }
}
