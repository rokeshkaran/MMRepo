using AutomationUtils.Extensions;
using AutomationUtils.Utils;
using MjAutomationCore.Components.Base;
using MjAutomationCore.DTO.BaseDto.AccountDTO;
using MjAutomationCore.DTO.BaseDto.EmailDetails;
using MjAutomationCore.DTO.BaseDto.RunTimeVariables.Account;
using MjAutomationCore.DTO.LicensingDTO.RunTimeVariables.Email;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Extensions;
using MjAutomationCore.General.Api.Email;
using MjAutomationCore.Helpers;
using MjAutomationCore.Pages.BaseProject;
using MjAutomationCore.Pages.BaseProject.Mailinator;
using MjAutomationCore.Pages.WebAppProject.MainPage;
using MjAutomationCore.Providers;
using MjAutomationCore.Providers.Base;
using MjAutomationCore.Providers.Email;
using MjAutomationCore.Providers.UserProvider;
using MjAutomationCore.Utils;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using System;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading;
using Reqnroll;
using Reqnroll.Assist;

namespace MjAutomationCore.Steps.WebAppProject
{
    [Binding]
    class MindManagerAccount : ReqnrollContext
    {
        protected readonly RestWebClient _restClient;
        private WebDriver _driver;
        private readonly BrowsersList _browsers;
        private readonly SessionRandomValue _sessionRandom;
        protected readonly EmailDetailsDto _emailDetails;
        private readonly UserDataDto _userData;
        private readonly UserDataList _userDataList;
        private readonly OutlookEmailResponseDto _outlookEmail;
        private readonly OutlookEmailsDto _outlookEmailList;


        public MindManagerAccount(SessionRandomValue sessionRandom, RestWebClient restClient, BrowsersList browsersList,
            EmailDetailsDto emailDetails, UserDataDto userData, UserDataList userDataList, OutlookEmailResponseDto outlookEmail, OutlookEmailsDto outlookEmailList)
        {
            _restClient = restClient;
            _driver = browsersList.GetBrowser();
            _sessionRandom = sessionRandom;
            _browsers = browsersList;
            _emailDetails = emailDetails;
            _userData = userData;
            _userDataList = userDataList;
            _outlookEmail = outlookEmail;
            _outlookEmailList = outlookEmailList;
        }

        [When(@"User activates newly created Mind Manager account")]
        public void WhenUserActivatesNewlyCreatedMindManagerAccount()
        {
            var email = EmailHelper.WaitForEmailWithSubject(AccountCreationProvider.EmailForAccountCreation, AccountCreationProvider.CodePasswordForAccountCreation,
                "Please verify your MindManager account");
            var accountConfirmationLink = Regex.Match(email.HtmlBody, "(?<=href=\")(.*?click.*?)(?=\")").Value;
            var useCaseButton = "Something Else";
            WaitForAuthenticationAndClose(accountConfirmationLink, useCaseButton);
        }

        [When(@"User activates newly created Mind Manager account in outlook for '([^']*)' email address with '([^']*)' email title header and '([^']*)' use case button")]
        public void WhenUserActivatesNewlyCreatedMindManagerAccountInOutlookForEmailAddressWithEmailTitleHeaderAndUseCaseButton(string mail, string emailTitle, string useCaseButton)
        {
            var aliasEmailAddress = "auto.test+" + _sessionRandom.RandomString + "@mindmanager.onmicrosoft.com";
            for (int j = 0; j <= 10; j++)
            {
                var emails = _restClient.BackendV1Client.InitApiMethods<OutlookGraphApi>().GetEmailsOutlookBySubject(mail, emailTitle);
                var matchingEmail = emails.FirstOrDefault(_outlookEmail => _outlookEmail.ToRecipients.Any(recipient => recipient.EmailAddress.Address == aliasEmailAddress));
                if (matchingEmail != null)
                {
                    var accountConfirmationLink = Regex.Match(matchingEmail.Body?.Content, "(?<=href=\")(.*?click.*?)(?=\")").Value;
                    WaitForAuthenticationAndClose(accountConfirmationLink, useCaseButton);
                    _restClient.BackendV1Client.InitApiMethods<OutlookGraphApi>().MarkEmailAsRead(mail, matchingEmail.Id);
                    _outlookEmailList.Value.Add(matchingEmail);
                    return;
                }

                if (j == 10) { break; }

                Thread.Sleep(5000);//wait 5 second before checking inbox again
            }
            throw new Exception($"Account activation email can not be found in '{mail}' inbox");
        }

        [When(@"User with '([^']*)' email address accept invite from user '([^']*)' for '([^']*)' snap team with email ""([^""]*)"" header and success message '([^']*)'")]
        public void WhenUserWithEmailAddressAcceptInviteFromUserForSnapTeamWithEmailHeaderAndSuccessMessage(string mail, string user, string snapTeam, string emailHeader, string successMessage)
        {
            var FromUser = MetaUaAccountProvider.GetFormattedLoginString(user);
            snapTeam = snapTeam.AddRandom(_sessionRandom);
            var aliasEmailAddress = "auto.test+" + _sessionRandom.RandomString + "@mindmanager.onmicrosoft.com";
            for (int j = 0; j <= 10; j++)
            {
                var emails = _restClient.BackendV1Client.InitApiMethods<OutlookGraphApi>().GetEmailsOutlookBySubject(mail, $"{FromUser} {emailHeader}: \"{snapTeam}\"");
                var matchingEmail = emails.FirstOrDefault(_outlookEmail => _outlookEmail.ToRecipients.Any(recipient => recipient.EmailAddress.Address == aliasEmailAddress));
                if (matchingEmail != null)
                {
                    var accountConfirmationLink = Regex.Match(matchingEmail.Body?.Content, "(?<=href=\")(.*?click.*?)(?=\")").Value;
                    _browsers.Active.OpenInNewTab(accountConfirmationLink);
                    for (int i = 0; i < 3; i++)
                    {
                        try
                        {
                            var url = _browsers.Active.Url;
                            if (url.Contains("authenticate"))
                            {
                                _browsers.Active.WaitForElementToBeDisplayed(By.XPath($".//div[@class='section']//b[text()='{successMessage}']"), WebDriverExtensions.WaitTime.Short);
                                _browsers.Active.Close();
                                break;
                            }
                        }
                        catch { }
                        // Wait for 500 milliseconds before the next iteration
                        Thread.Sleep(500);
                    }
                    _restClient.BackendV1Client.InitApiMethods<OutlookGraphApi>().MarkEmailAsRead(mail, matchingEmail.Id);
                    _outlookEmailList.Value.Add(matchingEmail);
                    return;
                }

                if (j == 10) { break; }

                Thread.Sleep(5000);//wait 5 second before checking inbox again
            }
            throw new Exception($"Account invitation email can not be found in '{mail}' inbox");
        }

        private void WaitForAuthenticationAndClose(string link, string useCaseButton)
        {
            _browsers.Active.OpenInNewTab(link);
            _browsers.Active.SwitchTo().Window(_browsers.Active.WindowHandles.Last());
            for (int i = 0; i < 60; i++)
            {
                try
                {
                    var url = _browsers.Active.Url;
                    if (url.Contains("authenticate"))
                    {
                        var page = _browsers.Active.NowAt<UnifiedComponents>();
                        var panel = _browsers.Active.NowAt<RightPanelPage>();
                        _browsers.Active.WaitForElementToBeDisplayed(panel.GetButtonByNameBase(useCaseButton), WebDriverExtensions.WaitTime.ExtraLong);
                        _browsers.Active.Close();
                        return;
                    }
                }
                catch { }
                // Wait for 500 milliseconds before the next iteration
                Thread.Sleep(500);
            }
            throw new Exception($"URL has not been changed. Success screen is not displayed");
        }

        [When(@"User navigates the password reset link in the newly received email with '([^']*)' email title header")]
        public void WhenUserNavigatesThePasswordResetLinkInTheNewlyReceivedEmail(string title)
        {
            var email = EmailHelper.WaitForEmailWithSubject(RecoveryPasswordAccountProvider.Login, RecoveryPasswordAccountProvider.GmailApiAccessPasswordCode, title);
            var emailBody = email.HtmlBody;
            var link = Regex.Match(emailBody, "(?<=href=\")(.*?click.*?)(?=\")").Value;
            _browsers.Active.Navigate().GoToUrl(link);
        }

        [When(@"User navigates on self registration link in the received email")]
        public void WhenUserNavigatesOnSelfRegistrationLinkInTheReceivedEmail()
        {
            var email = EmailHelper.WaitForEmailWithSubject(GmailProvider.EmailLC, GmailProvider.CodePasswordLC, "Manage your MindManager Licenses");
            var emailBody = email.HtmlBody;
            var link = Regex.Match(emailBody, "(?<=href=\")(.*?click.*?)(?=\")").Value;
            _browsers.Active.Navigate().GoToUrl(link);
            for (int i = 0; i < 15; i++)
            {
                try
                {
                    var url = _browsers.Active.Url;
                    if (url.Contains("admin") || url.Contains("authenticate"))
                    {
                        _browsers.Active.Navigate().GoToUrl(url + $"&captcha-token={CaptchaTokenProvider.CaptchaToken}");
                        return;
                    }
                }
                finally { Thread.Sleep(200); }
            }
            throw new Exception($"URL has not been changed");
        }

        [When(@"'([^']*)' User opens '([^']*)' shared link from outlook email inbox")]
        public void WhenUserOpenSharedEmailLink(string aliasMail, string mapName)
        {
            aliasMail = aliasMail.AddRandom(_sessionRandom);
            mapName = mapName.AddRandom(_sessionRandom);
            _browsers.PingDrivers();
            var emails = _restClient.OutlookGraphApi.InitApiMethods<OutlookGraphApi>().GetEmailsOutlookBySubject(OutlookGraphApiProvider.EmailAddress, $"{RegularUserProvider.Email} invited you to access {mapName}");
            var matchingEmail = emails.FirstOrDefault(_outlookEmail => _outlookEmail.ToRecipients.Any(recipient => recipient.EmailAddress.Address == aliasMail)).Body;
            var link = Regex.Match(matchingEmail.Content.ToString(), "(?<=href=\")(.*)(?=\">View)").Value;
            _browsers.Active.OpenInNewTab(link);
        }

        [When(@"User navigates on self registration link in the received email for email address '([^']*)'")]
        public void WhenUserNavigatesOnSelfRegistrationLinkInTheReceivedEmailForEmailAddress(string mail)
        {
            var aliasEmailAddress = "auto.test+" + _sessionRandom.RandomString + "@mindmanager.onmicrosoft.com";
            for (int j = 0; j <= 10; j++)
            {
                var emails = _restClient.BackendV1Client.InitApiMethods<OutlookGraphApi>().GetEmailsOutlookBySubject(mail, "Manage your MindManager Licenses");
                var matchingEmail = emails.FirstOrDefault(_outlookEmail => _outlookEmail.ToRecipients.Any(recipient => recipient.EmailAddress.Address == aliasEmailAddress));
                if (matchingEmail != null)
                {
                    var accountConfirmationLink = Regex.Match(matchingEmail.Body?.Content, "(?<=href=\")(.*?click.*?)(?=\")").Value;
                    _browsers.Active.Navigate().GoToUrl(accountConfirmationLink);
                    var captchaToken = CaptchaTokenProvider.CaptchaToken;
                    for (int i = 0; i < 15; i++)
                    {
                        try
                        {
                            var url = _browsers.Active.Url;
                            if (url.Contains("admin") || url.Contains("authenticate"))
                            {
                                _browsers.Active.Navigate().GoToUrl(url + $"&captcha-token={captchaToken}");
                                _restClient.BackendV1Client.InitApiMethods<OutlookGraphApi>().MarkEmailAsRead(mail, matchingEmail.Id);
                                _outlookEmailList.Value.Add(matchingEmail);
                                return;
                            }
                        }
                        finally
                        {
                            Thread.Sleep(200);
                        }
                    }
                    throw new Exception("URL has not been changed");
                }

                if (j == 10) { break; }

                Thread.Sleep(5000); // wait 5 seconds before checking inbox again
            }
            throw new Exception($"Account activation email can not be found in '{mail}' inbox");
        }

        [Then(@"User checks content of email sent to '(.*)' mail")]
        public void ThenUserChecksContentOfEmailSentToMail(string mail)
        {
            var email = EmailHelper.WaitForEmailWithSubject(mail, GmailProvider.CodePasswordEmail, "New MindManager License");
            Verify.IsNotEmpty(email.TextBody, "Email body doesn't contains text");
        }

        public void GetLetterInEmail(string email)
        {
            email = email.AddRandom(_sessionRandom);
            _browsers.Active.OpenInNewTab(UrlProvider.UrlMail);
            for (int i = 0; i < 30; i++)
            {
                try
                {
                    if (_browsers.Active.Url.Contains("https://www.mailinator.com/"))
                    {
                        Verify.IsTrue(_browsers.Active.Url.Contains("https://www.mailinator.com/"), "Incorrect page Url");
                        break;
                    }
                }
                catch { }
                Thread.Sleep(1000);
            }
            var page = _browsers.Active.NowAt<MailinatorPageOld>();
            page.EmailTextbox.SendKeys(email);
            page.GoButton.Click();
            _browsers.Active.WaitForElementToBeDisplayed(page.TableContent, WebDriverExtensions.WaitTime.ExtraLong);
            page.TableContent.Click();
            _browsers.Active.WaitForElementToContainsTextInAttribute(page.IframeContent, "active", "class");
        }

        [When(@"User fills account creation fields")]
        public void WhenUserFillsAccountCreationFields(Table table)
        {
            var createAccount = table.CreateInstance<UserDataDto>();
            createAccount.Email = createAccount.Email.AddRandom(_sessionRandom);
            createAccount.FirstName = createAccount.FirstName.AddRandom(_sessionRandom);
            createAccount.LastName = createAccount.LastName.AddRandom(_sessionRandom);
            createAccount.Password = createAccount.Password.AddRandom(_sessionRandom);
            createAccount.ConfirmPassword = createAccount.ConfirmPassword.AddRandom(_sessionRandom);
            _browsers.Active.GetComponent<InputByAttribute>("Email").ClearSendKeys(createAccount.Email);
            _browsers.Active.GetComponent<InputByAttribute>("First Name").ClearSendKeys(createAccount.FirstName);
            _browsers.Active.GetComponent<InputByAttribute>("Last Name").ClearSendKeys(createAccount.LastName);
            _browsers.Active.GetComponent<InputByAttribute>("Password").ClearSendKeys(createAccount.Password);
            _browsers.Active.GetComponent<InputByAttribute>("Confirm Password").ClearSendKeys(createAccount.ConfirmPassword);
            _userDataList.Value.Add(_userData);
        }

        [When(@"User fills account creation fields for new UI")]
        public void WhenUserFillsAccountCreationFieldsForNewUI(Table table)
        {
            var createAccount = table.CreateInstance<UserDataDto>();
            createAccount.Email = createAccount.Email.AddRandom(_sessionRandom);
            createAccount.FullName = createAccount.FullName.AddRandom(_sessionRandom);
            createAccount.Password = createAccount.Password.AddRandom(_sessionRandom);
            createAccount.IsNewUser = true;
            _browsers.Active.GetComponent<InputByAttribute>("email", new Properties()).ClearSendKeys(createAccount.Email);
            _browsers.Active.GetComponent<InputByAttribute>("full_name", new Properties()).ClearSendKeys(createAccount.FullName);
            _browsers.Active.GetComponent<InputByAttribute>("password", new Properties()).ClearSendKeys(createAccount.Password);
            _userDataList.Value.Add(createAccount);
        }

        [When(@"User openes '(.*)' browser")]
        public void WhenUserOpenesBrowser(string browser)
        {
            var driverInstance = BrowserFactory.CreateDriver(browser);
            BrowserHelper.SetBrowserWindowSize(driverInstance, Browser.Resolution);
            _browsers.AddDriver(driverInstance);
        }

        [When(@"User pings all browsers")]
        public void WhenUserPingsAllBrowsers()
        {
            _browsers.PingDrivers();
        }

        [When(@"User open new tab in browser")]
        public void WhenUserOpenNewTabInBrowser()
        {
            _browsers.Active.OpenInNewTab(null);
        }

        [When(@"User switches to '(.*)' browser")]
        public void WhenUserSwitchesToBrowser(int namber)
        {
            _driver = _browsers.GetBrowser(namber);
        }

        [When(@"User switches to '(.*)' tab")]
        public void WhenUserSwitchesToTab(int conut)
        {
            _browsers.Active.SwitchTo().Window(_browsers.Active.WindowHandles[conut]);
        }

        [Then(@"'([^']*)' count tab is open in browser")]
        public void ThenCountTabIsOpenInBrowser(int countTab)
        {
            Verify.AreEqual(_browsers.Active.WindowHandles.Count(), countTab, "The count of open tabs in the browser is displayed incorrectly");
        }

        [When(@"User close Active tab")]
        public void WhenUserCloseActiveTab()
        {
            _browsers.Active.Close();
        }
    }
}