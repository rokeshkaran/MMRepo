using System.Collections.Generic;
using SeleniumAutomationUtils.Pages;
using OpenQA.Selenium;
using SeleniumExtras.PageObjects;

namespace MjAutomationCore.Pages.WebAppProject.CloudsLogin
{
    class LoginDropbox : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//input[contains(@type,'email')]")]
        public IWebElement EmailField { get; set; }

        [FindsBy(How = How.XPath, Using = ".//input[@name='login_password']")]
        public IWebElement PasswordField { get; set; }

        [FindsBy(How = How.XPath, Using = ".//button[contains(@class,'login-button')]/div[contains(@class,'signin')]")]
        public IWebElement SignInButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@id='auth']")]
        public IWebElement FileAccessPermissionWindowDropbox { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@id='auth']//button[@name='allow_access']")]
        public IWebElement AllowAccessButtonFileAccessPermissionWindowDropbox { get; set; }

        [FindsBy(How = How.XPath, Using = ".//button[@type='submit']/div[contains(@class, 'sign-in')]/parent::button[@disabled]")]
        public IWebElement SingInDropboxButtonDisable { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            {};
        }
    }
}