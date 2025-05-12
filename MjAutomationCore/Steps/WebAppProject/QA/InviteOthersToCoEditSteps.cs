using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.QA;
using MjAutomationCore.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using System.Threading;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.QA
{
    [Binding]
    class InviteOthersToCoEditSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly BrowsersList _browsers;
        private readonly ValuesText _valuesText;

        public InviteOthersToCoEditSteps(WebDriver driver, BrowsersList browsersList, ValuesText valuesText)
        {
            _driver = browsersList.GetBrowser();
            _browsers = browsersList;
            _valuesText = valuesText;
        }

        [Then(@"header '(.*)' is displayed on SOME page")]
        public void ThenHeaderIsDisplayedOnSOMEPage(string title)
        {
            var page = _browsers.Active.NowAt<InviteOthersToCoEditPage>();
            Assert.IsTrue(page.GetTitleOnPage(title));
            _browsers.Active.SwitchTo().DefaultContent();
        }

        [Then(@"'(.*)' checkbox is checked on SOME page")]
        public void ThenCheckboxIsCheckedOnSOMEPage(string checkboxName)
        {
            var page = _browsers.Active.NowAt<InviteOthersToCoEditPage>();
            Assert.IsTrue(page.GetCheckboxState(checkboxName), $"Checkbox '{checkboxName}' is unchecked");
            _browsers.Active.SwitchTo().DefaultContent();
        }

        [When(@"User checks '(.*)' checkbox on SOME page")]
        public void WhenUserChecksCheckboxOnSOMEPage(string checkboxName)
        {
            var page = _browsers.Active.NowAt<InviteOthersToCoEditPage>();
            page.SetCheckboxState(checkboxName, true);
            Thread.Sleep(300);
            _browsers.Active.SwitchTo().DefaultContent();
        }

        [When(@"User clicks on the '(.*)' button and share with other users on SOME page")]
        public void WhenUserClicksOnTheButtonAndShareWithOtherUsersOnSOMEPage(string buttonName)
        {
            var button = _browsers.Active.NowAt<InviteOthersToCoEditPage>();
            _browsers.Active.AddedFieldByJavascript();
            button.GetButtonByNameBase(buttonName).Click();
            _browsers.Active.InsertFromClipboard(button.GetCopyText);
            var getText = button.GetCopyText.GetAttribute("value");
            _valuesText.Value = getText;
            _browsers.Active.SwitchTo().DefaultContent();
        }

        [When(@"User clicks '(.*)' button on SOME page")]
        public void WhenUserClicksButtonOnSOMEPage(string buttonName)
        {
            var page = _browsers.Active.NowAt<InviteOthersToCoEditPage>();
            _browsers.Active.ClickByJavascript(page.GetButtonByNameBase(buttonName));
            _browsers.Active.SwitchTo().DefaultContent();
        }

        [When(@"User clicks '(.*)' checkbox on the Invite Others to Co-Edit This File page")]
        public void WhenUserClicksCheckboxOnTheInviteOthersToCo_EditThisFilePage(string checkboxName)
        {
            var page = _browsers.Active.NowAt<InviteOthersToCoEditPage>();
            page.GetCheckboxByName(checkboxName).Click();
            _browsers.Active.WaitForDataLoading();
            _browsers.Active.SwitchTo().DefaultContent();
        }
    }
}