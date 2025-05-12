using AutomationUtils.Utils;
using MjAutomationCore.Components.Base;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Extensions;
using MjAutomationCore.Helpers;
using MjAutomationCore.Pages.BaseProject;
using MjAutomationCore.Pages.WebAppProject.MindManagerFiles;
using MjAutomationCore.Providers;
using MjAutomationCore.Providers.Base;
using MjAutomationCore.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using System;
using System.Drawing;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading;
using Reqnroll;

namespace MjAutomationCore.Steps.Base.UnifiedSteps
{
    [Binding]
    class UnifiedSteps : ReqnrollContext
    {
        private WebDriver _driver;
        private readonly BrowsersList _browsers;
        private readonly SessionRandomValue _sessionRandom;
        private readonly LocationWebDto _locWeb;
        private readonly Transform _transform;
        private readonly ValuesText _valuesText;
        private readonly LinkInviteOthersToEdit _linkToEdit;

        public UnifiedSteps(WebDriver driver, BrowsersList browsersList, SessionRandomValue sessionRandom, Transform transform, LocationWebDto locWeb, ValuesText valuesText, LinkInviteOthersToEdit linkToEdit)
        {
            _driver = browsersList.GetBrowser();
            _browsers = browsersList;
            _sessionRandom = sessionRandom;
            _transform = transform;
            _locWeb = locWeb;
            _valuesText = valuesText;
            _linkToEdit = linkToEdit;
        }

        [When(@"User accepts Optanon cookies")]
        public void WhenUserAcceptCookies()
        {
            CookieHelper.SetOptanonCookies(_browsers.Active);
            _browsers.Active.Navigate().Refresh();
            _browsers.Active.WaitForDataLoading();
        }

        [When(@"User clicks '(.*)' button")]
        public void WhenUserClicksButton(string buttonName)
        {
            var iframe = _browsers.Active.FindElements(By.XPath(".//iframe[not(@title='reCAPTCHA' or @title='onetrust-text-resize') and not(contains(@style,'display: none;'))]"));
            if (iframe.Any())
            {
                _browsers.Active.SwitchToSpecificFrame(iframe[0]);
            }
            var page = _browsers.Active.NowAt<UnifiedComponents>();
            _browsers.Active.WaitForElementToBeDisplayed(page.GetButtonByNameBase(buttonName));
            if (buttonName.Equals("Change User Info"))
            {
                Thread.Sleep(1000);
                _browsers.Active.ClickByJavascript(page.GetButtonByNameBase(buttonName));
            }
            else if(buttonName == "Save")
            {
                _browsers.Active.ClickByJavascript(page.GetButtonByNameBase(buttonName));
            }
            else
            {
                _browsers.Active.ClickByActions(page.GetButtonByNameBase(buttonName));
            }
            _browsers.Active.WaitForDataLoading();
            _browsers.Active.SwitchTo().DefaultContent();
        }

        [Then(@"'(.*)' button is displayed")]
        public void ThenButtonIsDisplayed(string buttonName)
        {
            var iframe = _browsers.Active.FindElements(By.XPath(".//iframe[not(@title='reCAPTCHA') and not(contains(@style,'display: none;')) and not (contains(@title,'onetrust'))]"));
            if (iframe.Any())
            {
                _browsers.Active.SwitchToFrame(0);
            }
            var page = _browsers.Active.NowAt<UnifiedComponents>();
            _browsers.Active.WaitForElementToBeDisplayed(page.GetButtonByNameBase(buttonName), WebDriverExtensions.WaitTime.Medium);
            Verify.IsTrue(page.DisplayedButtonByName(buttonName), $"{buttonName} button is not displayed");
            _browsers.Active.SwitchTo().DefaultContent();
        }

        [Then(@"text '([^']*)' is displayed on the SignUp from Shared File page")]
        public void ThenTextIsDisplayedOnTheSignUpFromSharedFilePage(string text)
        {
            text = text.AddRandom(_sessionRandom);
            var page = _browsers.Active.NowAt<UnifiedComponents>();
            _browsers.Active.WaitForElementToBeDisplayed(page.SignUpFromSharedFileTitle, WebDriverExtensions.WaitTime.Medium);
            var title = page.SignUpFromSharedFileTitle.Text;
            Verify.AreEqual(text, title, $"'{text}' is not displayed on SignUp from Shared File page. Actual: '{title}'");
        }

        [Then(@"'([^']*)' email is displayed in the SignUp from Shared File email field")]
        public void ThenEmailIsDisplayedInTheSignUpFromSharedFileEmailField(string email)
        {
            email = email.AddRandom(_sessionRandom);
            var page = _browsers.Active.NowAt<UnifiedComponents>();
            var prefilledEmail = page.SignUpFromSharedFileEmail.Text;
            Verify.AreEqual(email, prefilledEmail, $"'{email}' is not displayed on SignUp from Shared File page. Actual: '{email}'");
        }

        [Then(@"'([^']*)' button is not displayed")]
        public void ThenButtonIsNotDisplayed(string buttonName)
        {
            var iframe = _browsers.Active.FindElements(By.XPath(".//iframe[not(@title='reCAPTCHA') and not(contains(@style,'display: none;')) and not (contains(@title,'onetrust'))]"));
            if (iframe.Any())
            {
                _browsers.Active.SwitchToFrame(0);
            }
            var page = _browsers.Active.NowAt<UnifiedComponents>();
            Verify.IsFalse(page.DisplayedButtonByName(buttonName, WebDriverExtensions.WaitTime.Second), $"{buttonName} button is displayed");
            _browsers.Active.SwitchTo().DefaultContent();
        }

        [Then(@"User sees '(.*)' page header")]
        public void ThenUserSeesPageHeader(string headerText)
        {
            headerText = headerText.AddRandom(_sessionRandom);
            var page = _browsers.Active.NowAt<UnifiedComponents>();
            Verify.IsTrue(page.GetHeaderPage(headerText).Displayed(), $"Header '{headerText}' is not displayed on page");
        }

        [Then(@"MindManager '([^']*)' brand image is displayed on page in '([^']*)' color")]
        public void ThenAccountDetailsMMWordmarkIsIdpslayedInColor(string BrandImage, string Color)
        {
            var page = _browsers.Active.NowAt<BrandImageElement>();
            var Image = page.GetBrandImage(_browsers, BrandImage);
            var response = BrandImageHelper.DecodeSRCImage(Image);
            Verify.IsTrue(response.Contains($"fill=\"{Color}\""), $"The logo is not displayed in the expected color '{Color}'");
        }

        [Then(@"User sees '(.*)' messege on page")]
        public void ThenUserSeesMessegeOnPage(string messege)
        {
            var page = _browsers.Active.NowAt<UnifiedComponents>();
            Verify.IsTrue(page.GetMessegeOnPage(messege), $"Text '{messege}' is not displayed on page");
        }

        [Then(@"User sees Error message '(.*)' page content")]
        public void ThenUserSeesErrorMessagePageContent(string text)
        {
            var page = _driver.NowAt<UnifiedComponents>();
            Verify.IsTrue(page.GetSectionContentPage(text).Displayed(), $"Content message {text} is not displayed on page");
        }

        [When(@"User enters '(.*)' in the '(.*)' textarea")]
        public void WhenUserEntersInTheTextArea(string value, string TextAreaName)
        {
            value = value.AddRandom(_sessionRandom);
            var field = _browsers.Active.NowAt<UnifiedComponents>();
            _browsers.Active.WaitForElementToBeDisplayed(field.GetTextAreaByClass(TextAreaName));
            value = value.AddRandom(_sessionRandom);
            field.GetTextAreaByClass(TextAreaName).ClearSendKeys(value);
        }

        [Then(@"'(.*)' text area is not displayed to User")]
        public void ThenTextAreaIsNotDisplayedToUser(string textArea)
        {
            var page = _browsers.Active.NowAt<UnifiedComponents>();
            Verify.IsFalse(page.GetTextAreaByClass(textArea).Displayed(), $"Text are '{textArea}' is displayed to User");
        }

        [Then(@"'(.*)' text area is disabled on the page")]
        public void ThenInputFieldIsDisabledOnThePage(string textArea)
        {
            var page = _browsers.Active.NowAt<UnifiedComponents>();
            Verify.IsTrue(page.GetTextAreaByClass(textArea).IsDisabledState(), $"Text area '{textArea}' is enabled on the page");
        }

        [When(@"User refresh page")]
        public void WhenUserRefreshPage()
        {
            _browsers.Active.Navigate().Refresh();
            _browsers.Active.WaitForDataLoading();
            Thread.Sleep(1000);
        }

        [When(@"User releases all pressed keys")]
        public void WhenUserReleasesAllPressedKeys()
        {
            _driver.ActionsRelease();
        }


        [Then(@"page url is '(.*)'")]
        public void ThenPageUrlIs(string url)
        {
            bool isUrlMatched = false;
            for (int i = 0; i < 45; i++)
            {
                try
                {
                    if (_browsers.Active.Url.Contains(url))
                    {
                        Verify.IsTrue(_browsers.Active.Url.Contains(url), $"The page URL should be '{url}', but the actual URL is '{_browsers.Active.Url}'");
                        isUrlMatched = true;
                        break;
                    }
                }
                catch { }

                Thread.Sleep(500);
            }
            if (!isUrlMatched)
            {
                throw new Exception($"The page URL is not '{url}', the actual URL is '{_browsers.Active.Url}'");
            }
        }

        [Then(@"notification message with text '(.*)' is displayed to User")]
        public void ThenNotificationMessageWithTextIsDisplayedToUser(string textMessage)
        {
            textMessage = textMessage.AddRandom(_sessionRandom);
            var page = _browsers.Active.NowAt<UnifiedComponents>();
            Assert.IsTrue(page.GetNotificationMessages(textMessage).Displayed());
        }

        [When(@"User waits '(.*)' miliseconds")]
        public void WhenUserWaitsMiliseconds(int time)
        {
            Thread.Sleep(time);
        }

        [When(@"User waits '(.*)' minutes")]
        public void WhenUserWaitsMinutes(int time)
        {
            var page = _browsers.Active.NowAt<UnifiedComponents>();
            _driver.SetTimeForAutoSaveDialogWithJavascript(time);
        }

        [When(@"User clicks '(.*)' item in '(.*)' section on Menu list")]
        public void WhenUserClicksItemInSectionOnMenuList(string item, string sectionName)
        {
            UserClicksItemInSectionOnMenuList(item, sectionName);
        }

        private void UserClicksItemInSectionOnMenuList(string item, string sectionName = "")
        {
            var page = _browsers.Active.NowAt<UnifiedComponents>();
            page.GetItemByNameOnMenuList(item).Click();
        }

        [When(@"User enters '(.*)' symbol")]
        public void WhenUserEntersSymbol(string value)
        {
            _browsers.Active.SendKeysByActions(value);
        }

        [Then(@"'(.*)' icon is displayed beside cursor")]
        public void ThenIconIsDisplayedBesideCursor(string icon)
        {
            var page = _browsers.Active.NowAt<UnifiedComponents>();
            Assert.IsTrue(page.DisplayedIconNearCursor(icon), $"'{icon}' icon is not displayed beside cursor");
        }

        [Then(@"'(.*)' icon is not displayed beside cursor")]
        public void ThenIconIsNotDisplayedBesideCursor(string icon)
        {
            var page = _browsers.Active.NowAt<UnifiedComponents>();
            Assert.IsFalse(page.DisplayedIconNearCursor(icon), $"'{icon}' icon is displayed beside cursor");
        }

        [When(@"User remembers the map location on Canvas")]
        public void WhenUserRemembersTheMapLocationOnCanvas()
        {
            var selector = By.XPath(".//*[@joint-selector='layers'][1]");
            var loc = _driver.FindElement(selector).Location;
            Point point = new Point(loc.X, loc.Y);
            _locWeb.Location = point;
        }

        [Then(@"map has changed location by X axis on Canvas")]
        public void ThenMapHasChangedLocationByXAxisOnCanvas()
        {
            //Delay to change map location
            Thread.Sleep(1000);
            var selector = By.XPath(".//*[@joint-selector='layers'][1]");
            var loc = _driver.FindElement(selector).Location;
            Assert.AreNotEqual(_locWeb.Location.X, loc.X, "Map has not changed location by X axis");
        }

        [Then(@"map has not changed location by X axis on Canvas")]
        public void ThenMapHasNotChangedLocationByXAxisOnCanvas()
        {
            var selector = By.XPath(".//*[@joint-selector='layers'][1]");
            var loc = _driver.FindElement(selector).Location;
            Assert.AreEqual(_locWeb.Location.X, loc.X, "Map has changed location by X axis");
        }

        [Then(@"map has changed location by Y axis on Canvas")]
        public void ThenMapHasChangedLocationByYAxisOnCanvas()
        {
            var selector = By.XPath(".//*[@joint-selector='layers'][1]");
            var loc = _driver.FindElement(selector).Location;
            Assert.AreNotEqual(_locWeb.Location.Y, loc.Y, "Map has not changed location by Y axis");
        }

        [When(@"User remembers map size")]
        public void WhenUserRemembersMapSize()
        {
            var selector = By.XPath(".//*[@joint-selector='layers'][1]");
            var size = _driver.FindElement(selector).GetAttribute("transform");
            var matches = Regex.Matches(size, @"(?<=\().*?(?=\))", RegexOptions.IgnoreCase);
            var coordinates = matches[0].Value.Split(',');
            _transform.Size = coordinates;
        }

        [Then(@"map is Zoomed in")]
        public void ThenMapIsZoomedIn()
        {
            Thread.Sleep(1000);
            var selector = By.XPath(".//*[@joint-selector='layers'][1]");
            var size = _driver.FindElement(selector).GetAttribute("transform");
            var matches = Regex.Matches(size, @"(?<=\().*?(?=\))", RegexOptions.IgnoreCase);
            var coordinates = matches[0].Value.Split(',');
            Assert.IsTrue(double.Parse(_transform.Size[0]) < double.Parse(coordinates[0]), "Map has not changed in size");
            Assert.IsTrue(double.Parse(_transform.Size[3]) < double.Parse(coordinates[3]), "Map has not changed in size");
        }

        [Then(@"map is Zoomed out")]
        public void ThenMapIsZoomedOut()
        {
            Thread.Sleep(1000);
            var selector = By.XPath(".//*[@joint-selector='layers'][1]");
            var size = _driver.FindElement(selector).GetAttribute("transform");
            var matches = Regex.Matches(size, @"(?<=\().*?(?=\))", RegexOptions.IgnoreCase);
            var coordinates = matches[0].Value.Split(',');
            Assert.IsTrue(double.Parse(_transform.Size[0]) > double.Parse(coordinates[0]), "Map has not changed in size");
            Assert.IsTrue(double.Parse(_transform.Size[3]) > double.Parse(coordinates[3]), "Map has not changed in size");
        }

        [Then(@"value is copied to the clipboard")]
        public void ThenValueIsCopiedToTheClipboard()
        {
            var page = _browsers.Active.NowAt<BaseExtensionsPage>();
            _browsers.Active.AddedFieldByJavascript();
            _browsers.Active.InsertFromClipboard(page.GetCopyText);
            var getText = page.GetCopyText.GetAttribute("value");
            _valuesText.Value = getText;
            Verify.IsNotEmpty(_valuesText.Value, "Value is not copied to the clipboard");
        }

        [Then(@"integrated links is copied to the clipboard")]
        public void ThenIntegratedLinksIsCopiedToTheClipboard()
        {
            _driver.AddedFieldByJavascript();
            IJavaScriptExecutor js = (IJavaScriptExecutor)_driver;
            //Building the dom tags and its text
            var param = "here are my <a href=\"https://www.google.com/\" >Google</a> and <a href =\"http://www.microsoft.com/\">Microsoft</a> links to be copied to Cloud";
            //adding the dom tags and respective text in a <p> tag
            js.ExecuteScript($"var elemDiv = document.querySelector(\"[clipboard='cb_text']\").insertAdjacentHTML('beforebegin', '<p id=\"pTagId\">{param}</p>');");
            var selector = By.XPath(".//p[@id = 'pTagId']");
            //Finding the <p> tag by its respective id
            var element = _driver.FindElement(selector);
            //Triple click on the element
            _driver.ConsecutiveTripleClick(element);
            //Copying the value
            _driver.ActionKeysCombinationControlAndKeyboardButton("c");
        }

        [Then(@"'([^']*)' text is copied to the clipboard")]
        public void ThenTextIsCopiedToTheClipboard(string text)
        {
            _driver.AddedFieldByJavascript();
            IJavaScriptExecutor js = (IJavaScriptExecutor)_driver;
            //adding the dom tags and respective text in a <p> tag
            js.ExecuteScript($"var elemDiv = document.querySelector(\"[clipboard='cb_text']\").insertAdjacentHTML('beforebegin', '<p id=\"pTagId\">{text}</p>');");
            var selector = By.XPath(".//p[@id = 'pTagId']");
            //Finding the <p> tag by its respective id
            var element = _driver.FindElement(selector);
            //Triple click on the element
            _driver.ConsecutiveTripleClick(element);
            //Copying the value
            _driver.ActionKeysCombinationControlAndKeyboardButton("c");
        }

        [Then(@"Invite others to edit link is copied to clipboard")]
        public void ThenInviteOthersToEditLinkIsCopiedToClipboard()
        {
            var page = _browsers.Active.NowAt<BaseExtensionsPage>();
            _driver.AddedFieldByJavascript();
            _driver.InsertFromClipboard(page.GetCopyText);
            var getText = page.GetCopyText.GetAttribute("value");
            _linkToEdit.Value = getText;
            Verify.IsNotEmpty(_linkToEdit.Value, "Invite others to edit link is not copied to clipboard");
        }


        [When(@"User opens link from clipboard in new browser tab")]
        public void WhenUserOpensLinkFromClipboardInNewBrowserTab()
        {
            _browsers.Active.OpenInNewTab(_valuesText.Value);
            if (EnvironmentProvider.Env.Equals("envappQA") || EnvironmentProvider.Env.Equals("envQa") || EnvironmentProvider.Env.Equals("envStaging") || EnvironmentProvider.Env.Equals("envappStaging"))
            {
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
            }
        }

        [When(@"User switches to iframe")]
        public void WhenUserSwitchesToIframe()
        {
            var page = _browsers.Active.NowAt<BaseExtensionsPage>();
            if (page.Iframe.Any())
            {
                _browsers.Active.SwitchToSpecificFrame(page.Iframe[0]);
            }
        }

        [When(@"User switches to default content")]
        public void WhenUserSwitchesToDefaultContent()
        {
            _driver.SwitchTo().DefaultContent();
        }

        [When(@"User clicks '([^']*)' hyperlink")]
        public void WhenUserClicksHyperlink(string link)
        {
            var page = _browsers.Active.NowAt<UnifiedComponents>();
            page.GetHyperlink(link).Click();
        }

        [Then(@"hyperlink '([^']*)' is displayed")]
        public void ThenHyperlinkIsDisplayed(string link)
        {
            var page = _browsers.Active.NowAt<UnifiedComponents>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetHyperlink(link)), $"'{link}' hyperlink is not displayed");
        }

        [Then(@"hyperlink '([^']*)' is disabled")]
        public void ThenHyperlinkIsDisabled(string link)
        {
            var page = _browsers.Active.NowAt<UnifiedComponents>();
            Verify.IsTrue(page.GetHyperlink(link).IsDisabledState(), $"'{link}' hyperlink is enabled");
        }

        [Then(@"compare content displayed in '([^']*)' dialog with content from URL '([^']*)'")]
        public void ThenCompareContentDisplayedInDialogWithContentFromURL(string dialogName, string URL)
        {
            var dialogContent = _driver.Component<Dialog>(dialogName).GetContent().Text;
            dialogContent = Regex.Replace(Regex.Replace(dialogContent, @"\b\d+\.\s*|[-]", ""), @"\s+", " ").Trim().ToLower();
            _browsers.Active.OpenInNewTab(URL);
            _browsers.Active.SwitchTo().Window(_driver.WindowHandles.Last());
            Thread.Sleep(2000);
            var urlElements = _browsers.Active.FindElements(By.XPath(".//section[@class='intro']//div[@class='col-12']"));
            string urlContent = string.Join(" ", urlElements.Select(p => p.Text));
            string formattedURLContent = Regex.Replace(Regex.Replace(urlContent, @"\b\d+\.\s*|[-]", ""), @"\s+", " ").Trim().ToLower();
            Verify.AreEqual(dialogContent, formattedURLContent, "Text content is not the same");
            _browsers.Active.SwitchTo().DefaultContent();
        }

        [When(@"the user sets the window size to width '([^']*)' and height '([^']*)'")]
        public void WhenTheUserSetsTheWindowSizeToWidthAndHeight(int width, int height)
        {
            _browsers.Active.Manage().Window.Size = new Size(width, height);
        }

        [Then(@"browser has width '([^']*)' and height '([^']*)'")]
        public void ThenBrowserHasWidthAndHeight(int expectedWidth, int expectedHeight)
        {
            Size actualSize = _browsers.Active.Manage().Window.Size;
            Verify.AreEqual(expectedWidth, actualSize.Width, $"Actual Width is '{actualSize.Width}' and Expected Width is '{expectedWidth}'");
            Verify.AreEqual(expectedHeight, actualSize.Height, $"Actual Height is '{actualSize.Height}' and Expected Height is '{expectedHeight}'");
        }
    }
}