using MjAutomationCore.Components.Base;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.BaseProject;
using MjAutomationCore.Pages.WebAppProject.CloudsLogin;
using MjAutomationCore.Pages.WebAppProject.MainPage;
using MjAutomationCore.Providers;
using MjAutomationCore.Providers.Base;
using MjAutomationCore.Providers.Clouds.Google;
using MjAutomationCore.Providers.Clouds.SharePoint;
using MjAutomationCore.Utils;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using System.Drawing;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.Login
{
    [Binding]
    class LoginSteps : ReqnrollContext
    {
        protected readonly RestWebClient _restClient;
        private readonly BrowsersList _browsersList;
        private readonly LinkInviteOthersToEdit _linkToEdit;
        private WebDriver _driver;

        public LoginSteps(WebDriver driver, RestWebClient restClient, BrowsersList browsersList, LinkInviteOthersToEdit linkToEdit)
        {
            _restClient = restClient;
            _driver = browsersList.GetBrowser();
            _browsersList = browsersList;
            _linkToEdit = linkToEdit;
        }

        [Given(@"User '([^']*)'  opens shared map link in browser and logged into MindManager web app")]
        public void GivenUserOpensSharedMapLinkInBrowserAndLoggedIntoMindManagerWebApp(string user)
        {
            //Open Copied Link
            _browsersList.Active.Navigate().GoToUrl(_linkToEdit.Value);

            //Click Web option
            var page = _browsersList.Active.NowAt<UnifiedComponents>();
            _browsersList.Active.ClickByActions(page.GetButtonByNameBase("Web"));
            _browsersList.Active.SwitchTo().Window(_browsersList.Active.WindowHandles[1]);
            _browsersList.Active.WaitForDataLoading();

            //Sign Into MM cloud
            var mindmanagerPage = _browsersList.Active.NowAt<UnifiedComponents>();
            if(_browsersList.Active.IsElementDisplayed(mindmanagerPage.GetHyperlinkSelector("login-link"),WebDriverExtensions.WaitTime.Short))
            {
                mindmanagerPage.GetHyperlink("login-link").Click();
            }
            else
            {
                mindmanagerPage.GetButtonByNameBase("Sign In").Click();
            }
            _browsersList.Active.GetComponent<InputByAttribute>("email").SendKeys(MetaUaAccountProvider.GetFormattedLoginString(user));
            _browsersList.Active.GetComponent<InputByAttribute>("password").SendKeys(MetaUaAccountProvider.Password);
            mindmanagerPage.GetButtonByNameBase("Sign In").Click();
            _browsersList.Active.WaitForDataLoading();

            //Login to Sharepoint if needed
            var microsoftLogin = _browsersList.Active.NowAt<LoginMicrosoft>();
            if (_browsersList.Active.Url.Contains("microsoft"))
            {
                microsoftLogin.EmailField.SendKeys(SharePointProvider.GetSharepointLogin());
                microsoftLogin.NextSignInStaticButton.Click();
                _browsersList.Active.WaitForDataLoading();
                _browsersList.Active.WaitForElementToBeDisplayed(microsoftLogin.PasswordField);
                microsoftLogin.PasswordField.SendKeys(SharePointProvider.GetSharepointPassword());
                _browsersList.Active.WaitForElementToBeDisplayed(microsoftLogin.NextSignInStaticButton);
                microsoftLogin.NextSignInStaticButton.Click();
                _browsersList.Active.WaitForDataLoading();
                _browsersList.Active.WaitForElementToBeDisplayed(microsoftLogin.DontSaveStaticButton);
                microsoftLogin.DontSaveStaticButton.Click();
                _browsersList.Active.WaitForDataLoading();
            }
        }
    }
}