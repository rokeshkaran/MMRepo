using System.Collections.Generic;
using SeleniumAutomationUtils.Pages;
using OpenQA.Selenium;
using SeleniumExtras.PageObjects;

namespace MjAutomationCore.Pages.WebAppProject.CloudsLogin
{
    class LoginMicrosoft : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//input[@type='email']")]
        public IWebElement EmailField { get; set; }

        [FindsBy(How = How.XPath, Using = ".//input[@type='password']")]
        public IWebElement PasswordField { get; set; }

        [FindsBy(How = How.XPath, Using = ".//input[@type='submit'][@data-report-value='Submit']")]
        public IWebElement NextSignInStaticButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//input[@type='button'][contains(@class,'secondary')]")]
        public IWebElement DontSaveStaticButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//*[text()='Pick an account']")]
        public IWebElement PickAnAccount{ get; set; }
        
        [FindsBy(How = How.XPath, Using = ".//*[text()='Signed in']")]
        public IWebElement SignedInAccount{ get; set; }

        [FindsBy(How = How.XPath, Using = ".//*[text()='Use another account']")]
        public IWebElement UseAnotherAccount { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            {};
        }
    }
}