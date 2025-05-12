using System.Collections.Generic;
using SeleniumAutomationUtils.Pages;
using OpenQA.Selenium;
using SeleniumExtras.PageObjects;

namespace MjAutomationCore.Pages.WebAppProject.CloudsLogin
{
    class LoginGoogle : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//input[@type='email']")]
        public IWebElement EmailField { get; set; }

        [FindsBy(How = How.XPath, Using = ".//input[@type='password']")]
        public IWebElement PasswordField { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@id,'Next')]")]
        public IWebElement NextButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//input[@value='Next']")]
        public IWebElement RemoteNextButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//input[@value='Sign in']")]
        public IWebElement SignInButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='VfPpkd-RLmnJb']")]
        public IWebElement AllowButtonInGoogle2 { get; set; }

        [FindsBy(How = How.XPath, Using = ".//*[@id='submit_approve_access']")]
        public IWebElement AllowButtonInGoogle { get; set; }

        [FindsBy(How = How.XPath, Using = ".//input[@id='totpPin']")]
        public IWebElement GetVerificationCodeField { get; set; }

        [FindsBy(How = How.XPath, Using = ".//*[text()='Send']")]
        public IWebElement SendVerificationCodeButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//input[@type='tel']")]
        public IWebElement PhoneVerificationCodeTextbox { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            {};
        }
    }
}