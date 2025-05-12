using System.Collections.Generic;
using SeleniumAutomationUtils.Pages;
using OpenQA.Selenium;
using SeleniumExtras.PageObjects;

namespace MjAutomationCore.Pages.WebAppProject.CloudsLogin
{
    class LoginBox : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//input[@id='login']")]
        public IWebElement EmailField { get; set; }

        [FindsBy(How = How.XPath, Using = ".//input[@id='password']")]
        public IWebElement PasswordField { get; set; }

        [FindsBy(How = How.XPath, Using = ".//input[@type='submit']")]
        public IWebElement AuthorizeButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//button[@data-target-id='Button-grantAccessButtonLabel']")]
        public IWebElement GrantAccessToBoxButton { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            {};
        }
    }
}