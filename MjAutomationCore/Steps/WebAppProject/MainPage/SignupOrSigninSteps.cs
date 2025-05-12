using AutomationUtils.Utils;
using Microsoft.Graph.Models;
using MjAutomationCore.Components.Base;
using MjAutomationCore.DTO.SnapDTO.RunTimeVariables;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.BaseProject;
using MjAutomationCore.Pages.WebAppProject.MainPage;
using MjAutomationCore.Providers.Base;
using MjAutomationCore.Providers.Licensing;
using MjAutomationCore.Providers.UserProvider;
using MjAutomationCore.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using SeleniumAutomation.Framework;
using SeleniumAutomationUtils.SeleniumExtensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.MainPageSteps
{
    [Binding]
    class SignupOrSigninSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsers;
        private readonly SessionRandomValue _sessionRandom;
        protected readonly UserTokenDto _token;

        public SignupOrSigninSteps(BrowsersList browsersList, SessionRandomValue sessionRandom, UserTokenDto token)
        {
            _browsers = browsersList;
            _sessionRandom = sessionRandom;
            _token = token;
        }

        [Then(@"Right Side panel is displayed")]
        public void ThenRightSidePanelIsDisplayed()
        {
            //Wait for 200 ms for stability before starting the waiting loop
            Thread.Sleep(200);
            for (int i = 0; i < 60; i++)
            {
                try
                {
                    var page = _browsers.Active.NowAt<RightPanelPage>();
                    if (page.Iframe.Any())
                    {
                        _browsers.Active.SwitchToSpecificFrame(page.Iframe[0]);
                    }

                    if (_browsers.Active.IsElementExists(page.RightPanel))
                    {
                        Verify.IsTrue(page.RightPanel.Displayed(), "Right side panel is not displayed");
                        _browsers.Active.SwitchTo().DefaultContent();
                        return;
                    }
                }
                finally { Thread.Sleep(500); }
            }

            _browsers.Active.SwitchTo().DefaultContent();
            throw new Exception($"Right side panel is not displayed");

        }

        [Then(@"User sees '(.*)' header on Right Side panel")]
        public void ThenUserSeesHeaderOnRightSidePanel(string header)
        {
            //Wait for 200 ms for stability before starting the waiting loop
            Thread.Sleep(200);
            for (int i = 0; i < 60; i++)
            {
                var page = _browsers.Active.NowAt<RightPanelPage>();
                try
                {
                    if (page.Iframe.Any())
                    {
                        _browsers.Active.SwitchToSpecificFrame(page.Iframe[0]);
                    }
                    if (_browsers.Active.IsElementDisplayed(page.RightPanel))
                    {
                        Verify.IsTrue(page.DisplayedHeader(header),
                            $"Header '{header}' is not displayed on Right Side panel");
                        _browsers.Active.SwitchTo().DefaultContent();
                        return;
                    }
                }
                finally { Thread.Sleep(500); }
            }

            _browsers.Active.SwitchTo().DefaultContent();
            throw new Exception("Right side panel is not displayed");
        }

        [Then(@"User sees '(.*)' subheader on Right Side panel")]
        public void ThenUserSeesSubheaderOnRightSidePanel(string subheader)
        {
            for (int i = 0; i < 30; i++)
            {
                var page = _browsers.Active.NowAt<RightPanelPage>();
                try
                {
                    if (page.Iframe.Any())
                    {
                        _browsers.Active.SwitchToSpecificFrame(page.Iframe[0]);
                    }

                    if (_browsers.Active.IsElementExists(page.RightPanel))
                    {
                        Verify.IsTrue(page.DisplayedSubheader(subheader),
                            $"Subheader '{subheader}' is not displayed on Right Side panel");
                        _browsers.Active.SwitchTo().DefaultContent();
                        return;
                    }
                }
                finally { Thread.Sleep(500); }
            }

            _browsers.Active.SwitchTo().DefaultContent();
            throw new Exception("Right side panel is not displayed");
        }

        [Then(@"User sees folowing subheaders on Right Side panel")]
        public void ThenUserSeesSubheadersOnRightSidePanel(Table table)
        {
            var expectedSubheader = table.Rows.SelectMany(row => row.Values).ToList();
            for (int i = 0; i < 60; i++)
            {
                var page = _browsers.Active.NowAt<RightPanelPage>();
                try
                {
                    if (page.Iframe.Any())
                    {
                        _browsers.Active.SwitchToSpecificFrame(page.Iframe[0]);
                    }
                    if (_browsers.Active.IsElementExists(page.RightPanel))
                    {
                        var actualSubheader = page.GetSubheaderOnRightPanel().Select(element => element.Text).ToList();
                        Verify.AreEqual(expectedSubheader, actualSubheader, $"One or more expected subheader are not displayed on Right Side panel");
                        _browsers.Active.SwitchTo().DefaultContent();
                        return;
                    }
                }
                finally { Thread.Sleep(500); }
            }
            _browsers.Active.SwitchTo().DefaultContent();
            throw new Exception("Right side panel is not displayed");
        }

        [When(@"User clicks Change email link")]
        public void WhenUserClicksChangeEmailLink()
        {
            var page = _browsers.Active.NowAt<RightPanelPage>();
            page.СhangeEmailLabel.Click();
        }

        [Then(@"User sees '(.*)' hyperlink on Right Side panel")]
        public void ThenUserSeesHyperLink(string hyperlinkText)
        {
            for (int i = 0; i < 30; i++)
            {
                var page = _browsers.Active.NowAt<RightPanelPage>();
                try
                {
                    if (page.Iframe.Any())
                    {
                        _browsers.Active.SwitchToSpecificFrame(page.Iframe[0]);
                    }
                    if (_browsers.Active.IsElementExists(page.RightPanel))
                    {
                        var hyperlink = page.GetHyperlinkOnRightPanel(hyperlinkText);
                        Verify.IsTrue(hyperlink.Displayed(),
                            $"Hyperlink '{hyperlinkText}' is not displayed on Right Side panel");
                        _browsers.Active.SwitchTo().DefaultContent();
                        return;
                    }
                }
                finally { Thread.Sleep(500); }
            }
            _browsers.Active.SwitchTo().DefaultContent();
            throw new Exception("Right side panel is not displayed");
        }

        [When(@"User click '(.*)' hyperlink on Right Side panel")]
        public void WhenUserclicksHyperLinkonRightSidePanel(string hyperlinkText)
        {
            var page = _browsers.Active.NowAt<RightPanelPage>();
            page.GetHyperlinkOnRightPanel(hyperlinkText).Click();
        }

        [When(@"User clicks '(.*)' hyperlink in '(.*)' text on Right Side panel")]
        public void WhenUserClicksHyperlinkInTextOnRightSidePanel(string hyperlinkText, string text)
        {
            var page = _browsers.Active.NowAt<RightPanelPage>();
            if (page.Iframe.Any())
            {
                _browsers.Active.SwitchToSpecificFrame(page.Iframe[0]);
            }
            var textWithLink = page.GetTextOnRightPanel().FirstOrDefault(element => element.Text.Contains(text));
            page.GetHyperlinkInTextOnRightPanel(hyperlinkText, textWithLink).Click();
            _browsers.Active.SwitchTo().DefaultContent();
        }

        [Then(@"User sees '(.*)' text messege on Right Side panel")]
        public void ThenUserSeesTextMessegeOnRightSidePanel(string text)
        {
            text = text.AddRandom(_sessionRandom);
            for (int i = 0; i < 60; i++)
            {
                var page = _browsers.Active.NowAt<RightPanelPage>();
                try
                {
                    if (page.Iframe.Any())
                    {
                        _browsers.Active.SwitchToSpecificFrame(page.Iframe[0]);
                    }

                    if (_browsers.Active.IsElementExists(page.RightPanel))
                    {
                        Verify.IsTrue(page.DisplayedText(text),
                            $"Text '{text}' is not displayed on Right Side panel");
                        _browsers.Active.SwitchTo().DefaultContent();
                        return;
                    }
                }
                finally { Thread.Sleep(500); }
            }

            _browsers.Active.SwitchTo().DefaultContent();
            throw new Exception("Right side panel is not displayed");
        }


        [Then(@"User sees folowing text on Right Side panel")]
        public void ThenUserSeesTextOnRightSidePanel(Table table)
        {
            var expectedText = table.Rows.SelectMany(row => row.Values).ToList();
            for (int i = 0; i < 60; i++)
            {
                var page = _browsers.Active.NowAt<RightPanelPage>();
                try
                {
                    if (page.Iframe.Any())
                    {
                        _browsers.Active.SwitchToSpecificFrame(page.Iframe[0]);
                    }
                    if (_browsers.Active.IsElementExists(page.RightPanel))
                    {
                        var actualText = page.GetTextOnRightPanel().Select(element => element.Text.Replace("\n", "").Replace("\r", "").Replace("<br>", "").Trim()).ToList();
                        Verify.AreEqual(expectedText, actualText, $"One or more expected texts are not displayed on Right Side panel");
                        _browsers.Active.SwitchTo().DefaultContent();
                        return;
                    }
                }
                finally { Thread.Sleep(500); }
            }
            _browsers.Active.SwitchTo().DefaultContent();
            throw new Exception("Right side panel is not displayed");
        }

        [Then(@"Following text is displayed under each header:")]
        public void FollowingTextIsDisplayedUnderEachHeader(Table table)
        {
            var page = _browsers.Active.NowAt<RightPanelPage>();
            var headers = page.GetHeaderOnRightPanel();
            var paragraphs = page.GetTextOnRightPanel();
            var expectedHeaderTextPairs = table.Rows.ToDictionary(
                row => row["Header"],
                row => row["ExpectedText"]
            );
            Verify.AreEqual(headers.Count, paragraphs.Count, "The number of headers and paragraphs does not match.");
            page.VerifyTextUnderHeaders(headers, paragraphs, expectedHeaderTextPairs);
        }

        [Then(@"header '(.*)' is displayed on Right side panel of main page")]
        public void ThenHeaderIsDisplayedOnRightSidePanelOfMainPage(string textHheader)
        {
            var centralPanel = _browsers.Active.NowAt<RightPanelPage>();
            var headerPanel = _browsers.Active.NowAt<UnifiedComponents>();
            var header = centralPanel.RightPanel.FindElement(By.XPath(headerPanel.HeaderPage)).Text.RemoveLineBreakes();
            Assert.AreEqual(header, textHheader, $"{textHheader} is not displayed on Right side panel of main page");
        }

        [Then(@"Error message with text '(.*)' is displayed to the User")]
        public void ThenErrorMessageWithTextIsDisplayedToTheUser(string text)
        {
            var accountPage = _browsers.Active.NowAt<RightPanelPage>();
            for (int i = 0; i < 10; i++)
            {
                if (accountPage.ErrorMessage.Text.Equals(String.Empty))
                {
                    Thread.Sleep(1000);
                }
                else
                {
                    break;
                }
            }
            var errorText = accountPage.ErrorMessage.Text.RemoveLineBreakes();
            Verify.IsTrue(errorText.Contains(text), $"{text} message is incorrect");
        }

        [When(@"User provides the Login and Password and clicks on the Sign In button")]
        public void WhenUserProvidesTheLoginAndPasswordAndClicksOnTheSignInButton()
        {
            var signIn = "Sign In";
            string language = (string)((IJavaScriptExecutor)_browsers.Active).ExecuteScript("return (navigator.language);");
            if (language.Equals("fr-FR") || language.Equals("fr"))
            {
                signIn = "Se connecter";
            }
            else if(language.Equals("de-DE") || language.Equals("de"))
            {
                signIn = "Anmelden";
            }
            var page = _browsers.Active.NowAt<UnifiedComponents>();
            page.GetButtonByNameBase(signIn).Click();
            _browsers.Active.GetComponent<InputByAttribute>("email").SendKeys(RegularUserProvider.Email);
            _browsers.Active.GetComponent<InputByAttribute>("password").SendKeys(RegularUserProvider.Password);
            page.GetButtonByNameBase(signIn).Click();

            _browsers.Active.WaitForDataLoading();
            var idToken = Regex.Match(_browsers.Active.Url, @"(?<=\=)(.*?)(?=\&)").Value;
            _token.UserTokens.Add(new KeyValuePair<string, string>(RegularUserProvider.Email, idToken));
        }

        [When(@"'(.*)' User provides the Login and Password and clicks Sign In button")]
        public void WhenUserProvidesTheLoginAndPasswordAndClicksSignInButton(string count)
        {
            var page = _browsers.Active.NowAt<UnifiedComponents>();
            page.GetButtonByNameBase("Sign In").Click();
            _browsers.Active.GetComponent<InputByAttribute>("email").SendKeys(MetaUaAccountProvider.GetFormattedLoginString(count));
            _browsers.Active.GetComponent<InputByAttribute>("password").SendKeys(MetaUaAccountProvider.Password);
            page.GetButtonByNameBase("Sign In").Click();
            _browsers.Active.WaitForDataLoading();
            var idToken = Regex.Match(_browsers.Active.Url, @"(?<=\=)(.*?)(?=\&)").Value;
            _token.UserTokens.Add(new KeyValuePair<string, string>($"automationtestmm{count}@meta.ua", idToken));
        }

        [When(@"'(.*)' User provides the Login and Password")]
        public void WhenUserProvidesTheLoginAndPassword(string count)
        {
            var page = _browsers.Active.NowAt<UnifiedComponents>();
            page.GetButtonByNameBase("Sign In").Click();
            _browsers.Active.GetComponent<InputByAttribute>("email").SendKeys(MetaUaAccountProvider.GetFormattedLoginString(count));
            _browsers.Active.GetComponent<InputByAttribute>("password").SendKeys(MetaUaAccountProvider.Password);
            page.GetButtonByNameBase("Sign In").Click();
        }

        [When(@"User clicks Visit Store button")]
        public void WhenUserClicksVisitStoreButton()
        {
            var page = _browsers.Active.NowAt<RightPanelPage>();
            _browsers.Active.WaitForElementToBeDisplayed(page.VisitStoreButton, WebDriverExtensions.WaitTime.Long);
            page.VisitStoreButton.Click();
        }

        [When(@"User provides the Login and Password of Customer Admin Portal and clicks on the Sign In button")]
        public void WhenUserProvidesTheLoginAndPasswordOfCustomerAdminPortalAndClicksOnTheSignInButton()
        {
            var page = _browsers.Active.NowAt<UnifiedComponents>();
            page.GetButtonByNameBase("Sign In").Click();
            _browsers.Active.GetComponent<InputByAttribute>("email").SendKeys(AdminPortalCredentialsProvider.Login);
            _browsers.Active.GetComponent<InputByAttribute>("password").SendKeys(AdminPortalCredentialsProvider.Password);

            page.GetButtonByNameBase("Sign In").Click();
        }

        [When(@"User provides the Login and Password from provisioning SCIM Groups load test of Customer Admin Portal and clicks on the Sign In button")]
        public void WhenUserProvidesTheLoginAndPasswordFromProvisioningSCIMGroupsLoadTestOfCustomerAdminPortalAndClicksOnTheSignInButton()
        {
            var page = _browsers.Active.NowAt<UnifiedComponents>();
            page.GetButtonByNameBase("Sign In").Click();
            _browsers.Active.GetComponent<InputByAttribute>("email").SendKeys("automationtestmj.licens@gmail.com");
            _browsers.Active.GetComponent<InputByAttribute>("password").SendKeys("Testautomation0378");
            page.GetButtonByNameBase("Sign In").Click();
        }

        [Then(@"license key error message with text '([^']*)' is displayed to the User")]
        public void ThenLicenseKeyErrorMessageWithTextIsDisplayedToTheUser(string errorMessage)
        {
            var el = _browsers.Active.NowAt<RightPanelPage>();
            _browsers.Active.WaitForElementToBeDisplayed(el.ErrorMessageAlreadyUseLicenseKey);
            Verify.AreEqual(errorMessage, el.ErrorMessageAlreadyUseLicenseKey.GetText(), "License key error message with the text '{errorMessage}' is not displayed to the user");
        }

        [Then(@"license key invalid message with text '([^']*)' is displayed to the User")]
        public void ThenLicenseKeyInvalidMessageWithTextIsDisplayedToTheUser(string errorMessage)
        {
            var el = _browsers.Active.NowAt<RightPanelPage>();
            _browsers.Active.WaitForElementToBeDisplayed(el.ErrorMessageInvalidLicenseKey);
            Verify.AreEqual(errorMessage, el.ErrorMessageInvalidLicenseKey.GetText(), "License key error message with the text '{errorMessage}' is not displayed to the user");
        }

        [When(@"User clicks '([^']*)' button for use case options on Right Side panel")]
        public void WhenUserClicksButtonForUseCaseOptionsOnRightSidePanel(string buttonName)
        {
            var el = _browsers.Active.NowAt<RightPanelPage>();
            _browsers.Active.WaitForElementToBeDisplayed(el.GetButtonByNameBase(buttonName));
            el.GetButtonByNameBase(buttonName).Click();
        }

        //Sign out button located on the right side panel in mm application
        [When(@"User clicks on sign out button on right side panel")]
        public void WhenUserClicksOnSignOutButtonOnRightSidePanel()
        {
            var el = _browsers.Active.NowAt<RightPanelPage>();
            _browsers.Active.ClickByJavascript(el.SignOutButton);
        }
    }
}