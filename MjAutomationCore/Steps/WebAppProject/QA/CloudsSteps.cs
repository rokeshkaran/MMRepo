using AutomationUtils.Utils;
using SeleniumAutomationUtils.SeleniumExtensions;
using MjAutomationCore.Pages.BaseProject.Mailinator;
using MjAutomationCore.Pages.WebAppProject;
using MjAutomationCore.Pages.WebAppProject.CloudsLogin;
using MjAutomationCore.Providers;
using MjAutomationCore.Utils;
using OpenQA.Selenium;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading;
using Reqnroll;
using MjAutomationCore.Extensions;
using MjAutomationCore.Components.Base;
using System;
using MjAutomationCore.Providers.Clouds.SharePoint;
using MjAutomationCore.Providers.Clouds.Google;
using MjAutomationCore.Providers.Clouds.OneDrive;
using MjAutomationCore.Providers.Clouds.Box;
using MjAutomationCore.Providers.Clouds.Dropbox;
using MjAutomationCore.Providers.Base;

namespace MjAutomationCore.Steps.WebAppProject.QA
{
    [Binding]
    class CloudsSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly BrowsersList _browsers;

        public CloudsSteps(WebDriver driver, BrowsersList browsersList)
        {
            _driver = browsersList.GetBrowser();
            _browsers = browsersList;
        }

        private void VerifyByPhone()
        {
            var page = _driver.NowAt<LoginGoogle>();

            if (_driver.IsElementDisplayed(page.SendVerificationCodeButton, WebDriverExtensions.WaitTime.Medium))
            {
                page.SendVerificationCodeButton.Click();

                var mailinator = new Mailinator(_driver, MailinatorEmailsProvider.SmsForwarding);
                var email = mailinator.GetLastEmail();
                var phoneVerificationCode = 0;
                Regex urlRx = new Regex(@"(\w+ *\w+).*?(\d+)");
                MatchCollection matches = urlRx.Matches(email.Body);
                foreach (Match match in matches)
                {
                    foreach (Group matchGroup in match.Groups)
                    {
                        int number = 0;
                        AutomationUtils.Utils.Logger.Write($"Match: {matchGroup.Value}");
                        if (matchGroup.Value.Length.Equals(6) && int.TryParse(matchGroup.Value, out number))
                        {
                            phoneVerificationCode = number;
                            break;
                        }
                    }

                    AutomationUtils.Utils.Logger.Write("Password entered. Navigating next");
                    Thread.Sleep(5000);
                    if (_driver.IsElementDisplayed(By.XPath(".//*[text()='Send']")))
                    {
                        AutomationUtils.Utils.Logger.Write("More ways to verify WAS DISPLAYED");
                        _driver.FindElement(By.XPath(".//*[text()='Send']")).Click();
                        AutomationUtils.Utils.Logger.Write("More ways to verify WAS CLICKED");
                    }

                }

                _driver.WaitForElementToBeDisplayed(page.PhoneVerificationCodeTextbox);
                page.PhoneVerificationCodeTextbox.SendKeys(phoneVerificationCode.ToString());
                page.PhoneVerificationCodeTextbox.SendKeys(OpenQA.Selenium.Keys.Enter);
                Thread.Sleep(1000);
            }
        }
        private void VerifyByAuthenticator()
        {
            var page = _driver.NowAt<LoginGoogle>();

            if (_driver.IsElementDisplayed(page.GetVerificationCodeField, WebDriverExtensions.WaitTime.Medium))
            {
                var code = TwoFaCodeGenerator.Get(GoogleProvider.VerificationKeyForGoogle);
                page.GetVerificationCodeField.SendKeys(code);
                page.GetVerificationCodeField.SendKeys(OpenQA.Selenium.Keys.Enter);
                Thread.Sleep(500);
            }
        }

        #region Google

        [When(@"User login to Google cloud")]
        public void WhenUserLoginToGoogleCloud()
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementToBeDisplayed(page.ManagerContent);
            if (page.IsContentItemDisplayed("Google"))
            {
                var loggedInUserSelector = page.ContentItemSelectorWithTitleAndInfo("Google", "automationtestmj@gmail.com");
                var cloudWithoutUserSelector = page.ContentItemSelectorWithTitleAndInfo("Google", "Tap to Sign in");
                if (_browsers.Active.IsElementDisplayed(loggedInUserSelector, WebDriverExtensions.WaitTime.Medium))
                {
                    _browsers.Active.WaitForElementToNotContainsTextInAttribute(loggedInUserSelector, "signing-in", "class", WebDriverExtensions.WaitTime.Long);

                    _browsers.Active.FindElement(loggedInUserSelector).Click();
                }
                else
                    if (_browsers.Active.IsElementDisplayed(cloudWithoutUserSelector, WebDriverExtensions.WaitTime.Short))
                {
                    page.GetContentItem("Google").Click();
                    //login to Google cloud
                    LoginToGoogle();
                }
                else
                {
                    page.GetContentItem("Add Place").Click();
                    page.GetContentItem("Google").Click();
                    //login to Google cloud
                    LoginToGoogle();
                }
            }
            else
            {
                page.GetContentItem("Add Place").Click();
                page.GetContentItem("Google").Click();
                //login to Google cloud
                LoginToGoogle();
            }
        }
        public void LoginToGoogle()
        {
            var page = _driver.NowAt<LoginGoogle>();
            _driver.WaitForElementToBeDisplayed(page.EmailField);
            page.EmailField.SendKeys(GoogleProvider.GoogleEmail);
            if (_driver.IsElementDisplayed(page.NextButton, WebDriverExtensions.WaitTime.Short))
            {
                page.NextButton.Click();
            }
            else if (_driver.IsElementDisplayed(page.RemoteNextButton, WebDriverExtensions.WaitTime.Short))
            {
                page.RemoteNextButton.Click();
            }

            _driver.WaitForElementToBeDisplayed(page.PasswordField);
            //page.PasswordField.SendKeys(UsedUsers.GooglePassword);
            page.PasswordField.SendKeys("ghjtsssujiljhrxk");

            if (_driver.IsElementDisplayed(page.NextButton, WebDriverExtensions.WaitTime.Short))
            {
                page.NextButton.Click();
            }
            else if (_driver.IsElementDisplayed(page.SignInButton, WebDriverExtensions.WaitTime.Short))
            {
                page.SignInButton.Click();
            }

            VerifyByPhone();
            VerifyByAuthenticator();
            VerifyByPhone();
            _driver.WaitForDataLoading();
            _driver.WaitForElementToBeDisplayed(page.AllowButtonInGoogle);
            page.AllowButtonInGoogle.Click();
            _driver.WaitForDataLoading();
        }
        #endregion

        #region SharePoint

        [When(@"User login to SharePoint")]
        public void WhenUserLoginToSharePoint()
        {
            var page = _browsers.Active.NowAt<LoginMicrosoft>();
            if(_browsers.Active.IsElementDisplayed(page.EmailField, WebDriverExtensions.WaitTime.Long))
            {
                LoginToSharepoint(SharePointProvider.GetSharepointLogin(), SharePointProvider.GetSharepointPassword());
            }
            else
            {
                _browsers.Active.IsElementDisplayed(page.PickAnAccount, WebDriverExtensions.WaitTime.Short);
                page.SignedInAccount.Click();
            }
        }

        [When(@"User '([^']*)' login to SharePoint cloud")]
        public void WhenUserLoginToSharePointCloud(string userId)
        {
            bool allSites = false;
            var sharePointContent = "";
            var addPlaceButton = "";
            var sharePointAddress = "";
            var skipButton = "";
            AddSharepointCloud(allSites, sharePointContent, addPlaceButton, sharePointAddress, skipButton, userId);
        }

        [When(@"User login to SharePoint cloud with all sites")]
        public void WhenUserLoginToBaseSharePointCloud()
        {
            bool allSites = true;
            var sharePointContent = "";
            var addPlaceButton = "";
            var sharePointAddress = "";
            var skipButton = "";
            var userId = "";
            AddSharepointCloud(allSites, sharePointContent, addPlaceButton, sharePointAddress, skipButton, userId);
        }

        [When(@"User login to SharePoint cloud")]
        public void WhenUserLoginToSharePointCloud()
        {
            bool allSites = false;
            var sharePointContent = "";
            var addPlaceButton = "";
            var sharePointAddress = "";
            var skipButton = "";
            var userId = "";
            AddSharepointCloud(allSites, sharePointContent, addPlaceButton, sharePointAddress, skipButton, userId);
        }

        [When(@"User login to SharePoint cloud for German locale")]
        public void WhenUserLoginToSharePointCloudForGermanLocale()
        {
            bool allSites = false;
            var sharePointContent = "SharePoint";
            var addPlaceButton = "Ort hinzufügen";
            var sharePointAddress = "Geben Sie eine neue SharePoint-Site-Adresse ein:";
            var skipButton = "Überspringen";
            var userId = "";
            AddSharepointCloud(allSites, sharePointContent, addPlaceButton, sharePointAddress, skipButton, userId);
        }

        [When(@"User login to SharePoint cloud for French locale")]
        public void WhenUserLoginToSharePointCloudForFrenchLocale()
        {
            bool allSites = false;
            var sharePointContent = "SharePoint";
            var addPlaceButton = "Ajouter un emplacement";
            var sharePointAddress = "Entrer une nouvelle adresse de site SharePoint :";
            var skipButton = "Ignorer";
            var userId = "";
            AddSharepointCloud(allSites, sharePointContent, addPlaceButton, sharePointAddress, skipButton, userId);
        }

        [When(@"User '([^']*)' login to SharePoint")]
        public void WhenUserLoginToSharePoint(string userId)
        {
            var page = _browsers.Active.NowAt<LoginMicrosoft>();
            _browsers.Active.WaitForElementToBeDisplayed(page.EmailField, WebDriverExtensions.WaitTime.Long);
            LoginToSharepoint(SharePointProvider.GetSharepointLogin(userId), SharePointProvider.GetSharepointPassword(userId));
        }

        [When(@"User login to SharePoint with SignedIn account")]
        public void WhenUserLoginToSharePointWithSignedInAccount()
        {
            var page = _browsers.Active.NowAt<LoginMicrosoft>();
            _browsers.Active.IsElementDisplayed(page.PickAnAccount, WebDriverExtensions.WaitTime.Short);
            page.SignedInAccount.Click();
        }

        public void AddSharePointLibrary(bool allSites, string sharePointAddress, string buttonName)
        {
            if (allSites)
            {
                _browsers.Active.Component<Dialog>("sharepoint-url").GetButtonByNameInDialog(buttonName).Click();
            }
            else
            {
                buttonName = "OK";
                _browsers.Active.Component<Dialog>("sharepoint-url").GetInputFiled(sharePointAddress).
                SendKeys(UrlProvider.SharepoinUrl);
                Verify.IsTrue(_browsers.Active.Component<Dialog>("sharepoint-url").
                    GetInputFiled(sharePointAddress).
                    GetAttribute("value").Length > 0, "Link was not entered in the field");
                _browsers.Active.Component<Dialog>("sharepoint-url").GetButtonByNameInDialog(buttonName).Click();
            }
        }

        public void AddSharepointCloud(bool allSites, string sharePointContent, string addPlaceButton, string sharePointAddress, string skipButton, string userId)
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            sharePointContent = string.IsNullOrEmpty(sharePointContent) ? "SharePoint" : sharePointContent;
            addPlaceButton = string.IsNullOrEmpty(addPlaceButton) ? "Add Place" : addPlaceButton;
            sharePointAddress = string.IsNullOrEmpty(sharePointAddress) ? "Enter a new SharePoint site address:" : sharePointAddress;
            skipButton = string.IsNullOrEmpty(skipButton) ? "Skip" : skipButton;
            userId = string.IsNullOrEmpty(userId) ? "1" : userId;
            By loggedInUserSelector;
            if (allSites)
            {
                loggedInUserSelector = page.ContentItemSelectorWithTitleAndInfo(sharePointContent, SharePointProvider.GetSharepointLogin(userId));
            }
            else
            {
                loggedInUserSelector = page.ContentItemSelectorWithTitleAndInfo(sharePointContent, $"{SharePointProvider.GetSharepointLogin(userId)} (https://mindmanager.sharepoint.com/sites/milan)");
            }

            //Wait for all Remote Service to finish logging
            WaitForRemoteServicesToBeReady(addPlaceButton);

            if (page.IsContentItemDisplayed(sharePointContent, WebDriverExtensions.WaitTime.Medium))
            {
                var cloudWithoutUserSelector = page.ContentItemSelectorWithTitleAndInfo(sharePointContent, "Tap to Sign in");
                if (_browsers.Active.IsElementDisplayed(loggedInUserSelector, WebDriverExtensions.WaitTime.Medium))
                {
                    _browsers.Active.FindElement(loggedInUserSelector).Click();
                    _browsers.Active.WaitForDataLoading();
                }
                else
                if (_browsers.Active.IsElementDisplayed(cloudWithoutUserSelector, WebDriverExtensions.WaitTime.Short))
                {
                    _browsers.Active.HoverAndClick(page.GetContentItem(sharePointContent));
                    //Dialog Window Add SharePoint Library
                    AddSharePointLibrary(allSites, sharePointAddress, skipButton);
                    //login to SharePoint cloud
                    LoginToSharepoint(SharePointProvider.GetSharepointLogin(userId), SharePointProvider.GetSharepointPassword(userId));
                }
                else
                {
                    _browsers.Active.HoverAndClick(page.GetContentItem(addPlaceButton));
                    page.GetContentItem(sharePointContent).Click();
                    //Dialog Window Add SharePoint Library
                    AddSharePointLibrary(allSites, sharePointAddress, skipButton);
                    //login to SharePoint cloud
                    LoginToSharepoint(SharePointProvider.GetSharepointLogin(userId), SharePointProvider.GetSharepointPassword(userId));
                }
            }
            else
            {
                _browsers.Active.HoverAndClick(page.GetContentItem(addPlaceButton));
                _browsers.Active.HoverAndClick(page.GetContentItem(sharePointContent));
                //Dialog Window Add SharePoint Library
                AddSharePointLibrary(allSites, sharePointAddress, skipButton);
                //login to SharePoint cloud
                LoginToSharepoint(SharePointProvider.GetSharepointLogin(userId), SharePointProvider.GetSharepointPassword(userId));
            }
        }

        public void LoginToSharepoint(string email, string password)
        {
            var page = _browsers.Active.NowAt<LoginMicrosoft>();
            _browsers.Active.WaitForElementToBeDisplayed(page.EmailField);
            page.EmailField.SendKeys(email);
            page.NextSignInStaticButton.Click();
            _browsers.Active.WaitForDataLoading();
            _browsers.Active.WaitForElementToBeDisplayed(page.PasswordField);
            page.PasswordField.SendKeys(password);
            _browsers.Active.WaitForElementToBeDisplayed(page.NextSignInStaticButton);
            page.NextSignInStaticButton.Click();
            _browsers.Active.WaitForDataLoading();
            _browsers.Active.WaitForElementToBeDisplayed(page.DontSaveStaticButton);
            page.DontSaveStaticButton.Click();
            _browsers.Active.WaitForDataLoading();
        }

        #endregion

        #region OneDrive

        [When(@"User login to OneDrive cloud")]
        public void WhenUserLoginToOneDriveCloud()
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementToBeDisplayed(page.ManagerContent);
            //Wait for all Remote Service to finish logging
            WaitForRemoteServicesToBeReady();
            Thread.Sleep(3000);
            if (page.IsContentItemDisplayed("OneDrive"))
            {
                var loggedInUserSelector = page.ContentItemSelectorWithTitleAndInfo("OneDrive", SharePointProvider.GetSharepointLogin("1"));
                var cloudWithoutUserSelector = page.ContentItemSelectorWithTitleAndInfo("OneDrive", "Tap to Sign in");
                if (_browsers.Active.IsElementDisplayed(loggedInUserSelector, WebDriverExtensions.WaitTime.Medium))
                {
                    _browsers.Active.WaitForElementToNotContainsTextInAttribute(loggedInUserSelector, "signing-in", "class", WebDriverExtensions.WaitTime.Long);
                    _browsers.Active.MoveToElement(_browsers.Active.FindElement(loggedInUserSelector));
                    _browsers.Active.FindElement(loggedInUserSelector).Click();
                }
                else
                    if (_browsers.Active.IsElementDisplayed(cloudWithoutUserSelector, WebDriverExtensions.WaitTime.Short))
                {
                    page.GetContentItem("OneDrive").Click();
                    //login to OneDrive cloud
                    LoginToOneDrive("1");
                }
                else
                {
                    var addPlace = page.GetContentItem("Add Place");
                    _browsers.Active.MoveToElement(addPlace);
                    addPlace.Click();
                    page.GetContentItem("OneDrive").Click();
                    //login to OneDrive cloud
                    LoginToOneDrive("1");
                }
            }
            else
            {
                var addPlace = page.GetContentItem("Add Place");
                _browsers.Active.MoveToElement(addPlace);
                addPlace.Click();
                _browsers.Active.WaitForElementToBeDisplayed(page.GetContentItem("OneDrive"));
                page.GetContentItem("OneDrive").Click();
                //login to OneDrive cloud
                LoginToOneDrive("1");
            }
        }

        [When(@"User '([^']*)' login to OneDrive cloud")]
        public void WhenUserLoginToOneDriveCloud(string userId)
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementToBeDisplayed(page.ManagerContent);
            Thread.Sleep(3000);
            if (page.IsContentItemDisplayed("OneDrive"))
            {
                var loggedInUserSelector = page.ContentItemSelectorWithTitleAndInfo("OneDrive", SharePointProvider.GetSharepointLogin(userId));
                var cloudWithoutUserSelector = page.ContentItemSelectorWithTitleAndInfo("OneDrive", "Tap to Sign in");
                if (_browsers.Active.IsElementDisplayed(loggedInUserSelector, WebDriverExtensions.WaitTime.Medium))
                {
                    _browsers.Active.WaitForElementToNotContainsTextInAttribute(loggedInUserSelector, "signing-in", "class", WebDriverExtensions.WaitTime.Long);
                    _browsers.Active.MoveToElement(_browsers.Active.FindElement(loggedInUserSelector));
                    _browsers.Active.FindElement(loggedInUserSelector).Click();
                }
                else
                    if (_browsers.Active.IsElementDisplayed(cloudWithoutUserSelector, WebDriverExtensions.WaitTime.Short))
                {
                    page.GetContentItem("OneDrive").Click();
                    //login to OneDrive cloud
                    LoginToOneDrive(userId);
                }
                else
                {
                    var addPlace = page.GetContentItem("Add Place");
                    _browsers.Active.MoveToElement(addPlace);
                    addPlace.Click();
                    page.GetContentItem("OneDrive").Click();
                    //login to OneDrive cloud
                    LoginToOneDrive(userId);
                }
            }
            else
            {
                var addPlace = page.GetContentItem("Add Place");
                _browsers.Active.MoveToElement(addPlace);
                addPlace.Click();
                _browsers.Active.WaitForElementToBeDisplayed(page.GetContentItem("OneDrive"));
                page.GetContentItem("OneDrive").Click();
                //login to OneDrive cloud
                LoginToOneDrive(userId);
            }
        }

        public void LoginToOneDrive(string userId)
        {
            var page = _browsers.Active.NowAt<LoginMicrosoft>();
            if (!_browsers.Active.IsElementDisplayed(page.EmailField, WebDriverExtensions.WaitTime.ExtraLong))
            {
                if (_browsers.Active.IsElementDisplayed(page.UseAnotherAccount, WebDriverExtensions.WaitTime.Short))
                {
                    page.UseAnotherAccount.Click();
                }
            }
            _browsers.Active.WaitForElementToBeDisplayed(page.EmailField, WebDriverExtensions.WaitTime.ExtraLong);
            page.EmailField.SendKeys(SharePointProvider.GetSharepointLogin(userId));
            page.NextSignInStaticButton.Click();
            _browsers.Active.WaitForDataLoading();
            _browsers.Active.WaitForElementToBeDisplayed(page.PasswordField);
            page.PasswordField.SendKeys(SharePointProvider.GetSharepointPassword(userId));
            page.NextSignInStaticButton.Click();
            _browsers.Active.WaitForDataLoading();
            if (_browsers.Active.IsElementDisplayed(page.DontSaveStaticButton, WebDriverExtensions.WaitTime.Medium))
            {
                page.DontSaveStaticButton.Click();
            }
            _browsers.Active.WaitForDataLoading();
        }
        #endregion

        #region Dropbox

        [When(@"User login to Dropbox cloud")]
        public void WhenUserLoginToDropboxCloud()
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementToBeDisplayed(page.ManagerContent);
            if (page.IsContentItemDisplayed("Dropbox"))
            {
                var loggedInUserSelector = page.ContentItemSelectorWithTitleAndInfo("Dropbox", "automationtestmj@gmail.com");
                var cloudWithoutUserSelector = page.ContentItemSelectorWithTitleAndInfo("Dropbox", "Tap to Sign in");
                if (_browsers.Active.IsElementDisplayed(loggedInUserSelector, WebDriverExtensions.WaitTime.Medium))
                {
                    _browsers.Active.WaitForElementToNotContainsTextInAttribute(loggedInUserSelector, "signing-in", "class", WebDriverExtensions.WaitTime.Long);
                    _browsers.Active.FindElement(loggedInUserSelector).Click();
                }
                else
                    if (_browsers.Active.IsElementDisplayed(cloudWithoutUserSelector, WebDriverExtensions.WaitTime.Short))
                {
                    page.GetContentItem("Dropbox").Click();
                    LoginDropboxWithGoogle();
                }
                else
                {
                    page.GetContentItem("Add Place").Click();
                    page.GetContentItem("Dropbox").Click();
                    LoginDropboxWithGoogle();
                }
            }
            else
            {
                page.GetContentItem("Add Place").Click();
                page.GetContentItem("Dropbox").Click();
                LoginDropboxWithGoogle();
            }
        }

        public void LoginDropboxWithGoogle()
        {
            Thread.Sleep(1000);
            var Iframe = _browsers.Active.FindElements(By.XPath(".//iframe[@title='Sign in with Google Button']"));
            if (Iframe.Any())
            {
                _driver.SwitchToSpecificFrame(_browsers.Active.FindElement(By.XPath(".//iframe[@title='Sign in with Google Button']")));
            }
            var selector = "(.//span[text() ='Continue with Google'])[1]";
            _browsers.Active.WaitForElementsToBeDisplayed(By.XPath(selector));
            _browsers.Active.FindElement(By.XPath(selector)).Click();

            _driver.SwitchTo().Window(_driver.WindowHandles.Last());

            var page = _driver.NowAt<LoginGoogle>();
            _driver.WaitForElementToBeDisplayed(page.EmailField);
            page.EmailField.SendKeys(DropboxProvider.GetDropboxLogin());
            if (_driver.IsElementDisplayed(page.NextButton, WebDriverExtensions.WaitTime.Short))
            {
                page.NextButton.Click();
            }
            else if (_driver.IsElementDisplayed(page.RemoteNextButton, WebDriverExtensions.WaitTime.Short))
            {
                page.RemoteNextButton.Click();
            }

            _driver.WaitForElementToBeDisplayed(page.PasswordField);
            page.PasswordField.SendKeys(DropboxProvider.GetDropboxPassword());

            if (_driver.IsElementDisplayed(page.NextButton, WebDriverExtensions.WaitTime.Short))
            {
                page.NextButton.Click();
            }
            else if (_driver.IsElementDisplayed(page.SignInButton, WebDriverExtensions.WaitTime.Short))
            {
                page.SignInButton.Click();
            }

            VerifyByPhone();
            VerifyByAuthenticator();
            VerifyByPhone();

            if (_driver.IsElementDisplayed(page.NextButton, WebDriverExtensions.WaitTime.Short))
            {
                _driver.WaitForElementToBeDisplayed(page.AllowButtonInGoogle);
            }
            _driver.SwitchTo().Window(_driver.WindowHandles.First());
        }

        public void LoginDropbox()
        {
            var page = _driver.NowAt<LoginDropbox>();
            _driver.WaitForElementToBeDisplayed(page.EmailField);
            page.EmailField.SendKeys(DropboxProvider.GetDropboxLogin());
            _driver.WaitForDataLoading();
            _driver.WaitForElementToBeDisplayed(page.PasswordField);
            page.PasswordField.SendKeys(DropboxProvider.GetDropboxPassword());
            page.SignInButton.Click();
            if (_driver.IsElementDisplayed(page.FileAccessPermissionWindowDropbox))
            {
                _driver.ClickByJavascript(page.AllowAccessButtonFileAccessPermissionWindowDropbox);
            }

            for (int i = 0; i < 60; i++)
            {
                try
                {
                    var selector = By.XPath(".//span[contains(@class,'login-loading')]");
                    if (!_browsers.Active.IsElementDisplayed(selector))
                    {
                        return;
                    }
                }
                catch { }
                Thread.Sleep(2000);
            }

            throw new Exception($"Failed to log in to the Dropbox cloud");
        }

        #endregion

        #region Box

        [When(@"User login to Box")]
        public void WhenUserLoginToBox()
        {
            var page = _browsers.Active.NowAt<LoginBox>();
            _browsers.Active.WaitForElementToBeDisplayed(page.EmailField, WebDriverExtensions.WaitTime.Long);
            LoginBox();
        }

        [When(@"User login to Box cloud")]
        public void WhenUserLoginToBoxCloud()
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            _browsers.Active.WaitForElementToBeDisplayed(page.ContentManager);
            //Wait for all Remote Service to finish logging
            WaitForRemoteServicesToBeReady();
            _browsers.Active.WaitForElementToNotContainsTextInAttribute(page.ContentManager, "display: none;", "style");
            _browsers.Active.ScrollGridToTheEnd(page.ContentManager);
            if (page.IsContentItemDisplayed("Box"))
            {
                var loggedInUserSelector = page.ContentItemSelectorWithTitleAndInfo("Box", "auto.test@mindmanagercloudqa.com");
                var cloudWithoutUserSelector = page.ContentItemSelectorWithTitleAndInfo("Box", "Tap to Sign in");
                if (_browsers.Active.IsElementDisplayed(loggedInUserSelector, WebDriverExtensions.WaitTime.Medium))
                {
                    _browsers.Active.WaitForElementToNotContainsTextInAttribute(loggedInUserSelector, "signing-in", "class", WebDriverExtensions.WaitTime.Long);

                    _browsers.Active.FindElement(loggedInUserSelector).Click();
                }
                else
                    if (_browsers.Active.IsElementDisplayed(cloudWithoutUserSelector, WebDriverExtensions.WaitTime.Short))
                {
                    _browsers.Active.HoverAndClick(page.GetContentItem("Box"));
                    //login to Box cloud
                    LoginBox();
                }
                else
                {
                    _browsers.Active.ActionsMoveToElementAndClick(page.GetContentItem("Add Place"), 0, 0);
                    _browsers.Active.HoverAndClick(page.GetContentItem("Box"));
                    //login to Box cloud
                    LoginBox();
                }
            }
            else
            {
                page.GetContentItem("Add Place").Click();
                page.GetContentItem("Box").Click();
                //login to Box cloud
                LoginBox();
            }
        }

        [When(@"User login to Box cloud with User '([^']*)'")]
        public void WhenUserLoginToBoxCloudWithUser(string user)
        {
            var page = _browsers.Active.NowAt<LoginBox>();
            _browsers.Active.WaitForElementToBeDisplayed(page.EmailField, WebDriverExtensions.WaitTime.Long);
            LoginBox(user);
        }

        public void LoginBox(string user = "1")
        {
            var email = BoxProvider.GetBoxLogin(user);
            var password = BoxProvider.GetBoxPassword(user);
            var page = _driver.NowAt<LoginBox>();
            _driver.WaitForElementToBeDisplayed(page.EmailField);
            page.EmailField.SendKeys(email);
            _driver.WaitForDataLoading();
            _driver.WaitForElementToBeDisplayed(page.PasswordField);
            page.PasswordField.SendKeys(password);
            page.AuthorizeButton.Click();
            _driver.WaitForElementToBeDisplayed(page.GrantAccessToBoxButton, WebDriverExtensions.WaitTime.Long);
            page.GrantAccessToBoxButton.Click();
            _driver.WaitForDataLoading();
        }
        #endregion

        [When(@"User provides the Password from company account and clicks on Sign In button")]
        public void WhenUserProvidesPasswordFromCompanyAccountAndClicksOnSignInButton()
        {
            var page = _browsers.Active.NowAt<LoginMicrosoft>();
            _browsers.Active.WaitForElementToBeDisplayed(page.PasswordField);
            page.PasswordField.SendKeys(BoxProvider.GetBoxPassword());
            _driver.WaitForElementToBeDisplayed(page.NextSignInStaticButton);
            page.NextSignInStaticButton.Click();
            _browsers.Active.WaitForElementToBeDisplayed(page.DontSaveStaticButton);
            page.DontSaveStaticButton.Click();
            _browsers.Active.WaitForDataLoading();
        }

        [When(@"User provides the Login and Password from company account and clicks on Sign In button")]
        public void WhenUserProvidesTheLoginAndPasswordFromCompanyAccountAndClicksOnSignInButton()
        {
            var page = _browsers.Active.NowAt<LoginMicrosoft>();
            _driver.WaitForElementToBeDisplayed(page.EmailField);
            _driver.WaitForElementToBeDisplayed(page.NextSignInStaticButton);
            page.EmailField.SendKeys(BoxProvider.GetBoxLogin());
            page.NextSignInStaticButton.Click();
            _browsers.Active.WaitForElementToBeDisplayed(page.PasswordField);
            page.PasswordField.SendKeys(BoxProvider.GetBoxPassword());
            _driver.WaitForElementToBeDisplayed(page.NextSignInStaticButton);
            page.NextSignInStaticButton.Click();
            _browsers.Active.WaitForElementToBeDisplayed(page.DontSaveStaticButton);
            page.DontSaveStaticButton.Click();
            _browsers.Active.WaitForDataLoading();
        }

        [When(@"User provides the Login and Password from Google Suite company account and clicks on Sign In button")]
        public void WhenUserProvidesTheLoginAndPasswordFromGoogleSuiteCompanyAccountAndClicksOnSignInButton()
        {
            {
                var page = _browsers.Active.NowAt<LoginGoogle>();
                _driver.WaitForElementToBeDisplayed(page.EmailField);
                _driver.WaitForElementToBeDisplayed(page.NextButton);
                page.EmailField.SendKeys("pavel@mindmanagergsqa.com");
                page.NextButton.Click();
                var t = _browsers.Active.IsElementDisplayed(page.NextButton);
                AutomationUtils.Utils.Logger.Write($"{t} displayed Next button");
                _browsers.Active.WaitForElementToBeDisplayed(page.PasswordField);
                page.PasswordField.SendKeys("Testautomation0378");
                page.NextButton.Click();

                Thread.Sleep(5000);
                var pageSourse = _browsers.Active.PageSource;
                AutomationUtils.Utils.Logger.Write($"{pageSourse} page sourse");
                _browsers.Active.WaitForDataLoading();
            }
        }

        [Then(@"following cloud items on content manager is displayed to the User:")]
        public void ThenFollowingCloudItemsOnContentManagerIsDisplayedToTheUser(Table table)
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            var cloudItemList = page.ContentItemRemoteServiceList.Select(x => x.FindElement(By.XPath(".//div[@class='main']/div[@class='title']")).Text).ToList();
            var expectedCloudItemList = table.Rows.SelectMany(row => row.Values).ToList();
            Verify.AreEqual(expectedCloudItemList, cloudItemList, "Cloud items is incorrect displayed");
        }

        public void WaitForRemoteServicesToBeReady(string addPlace = "Add Place")
        {
            var page = _browsers.Active.NowAt<ContentManagerPage>();
            //Wait for all Remote Service to finish logging
            _browsers.Active.WaitForElementToBeDisplayed(page.ContentManager);
            _browsers.Active.WaitForElementToNotContainsTextInAttribute(page.ContentManager, "display: none;", "style");
            for (var i = 0; i < 30; i++)
            {
                page = _browsers.Active.NowAt<ContentManagerPage>();
                if (!page.IsSavedRemoteServiceLoginInProcess())
                {
                    break;
                }
                Thread.Sleep(1000);
            }
            ((IJavaScriptExecutor)_browsers.Active).ExecuteScript("arguments[0].scrollIntoView();", page.GetContentItem(addPlace));
        }
    }
}