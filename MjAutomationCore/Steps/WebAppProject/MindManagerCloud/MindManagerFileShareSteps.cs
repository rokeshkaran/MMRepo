using AutomationUtils.Utils;
using MjAutomationCore.Components.Base;
using MjAutomationCore.Components.SelectBox;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.Extensions;
using MjAutomationCore.Utils;
using SeleniumAutomationUtils.SeleniumExtensions;
using System.Threading;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.MindManagerCloud
{
    [Binding]
     class MindManagerFileShareSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsers;
        private readonly SessionRandomValue _sessionRandom;

        public MindManagerFileShareSteps(BrowsersList browsers, SessionRandomValue sessionRandom)
        {
            _browsers = browsers;
            _sessionRandom = sessionRandom;
        }

        [When(@"User clicks selectbox by label '([^']*)' in '([^']*)' section of '([^']*)' dialog and selects '([^']*)' option from dropdown '([^']*)'")]
        public void WhenUserClicksSelectboxByLabelInSectionOfDialogAndSelectsOptionFromDropdown(string label, string section, string dialog, string option, string dropdown)
        {
            _browsers.Active.Component<Dialog>(dialog).GetSelectBoxByLabelInSection(section, label).Click();
            _browsers.Active.WaitForElementsToBeDisplayed(_browsers.Active.Component<SelectboxOptions>(dropdown).Container);
            Thread.Sleep(200);//Wait for option to be selected in selectbox
            _browsers.Active.Component<SelectboxOptions>(dropdown).GetOptionByName(option).Click();
        }

        [When(@"User clicks selectbox for user '([^']*)' of '([^']*)' dialog and selects '([^']*)' option from dropdown '([^']*)'")]
        public void WhenUserClicksSelectboxForUserOfDialogAndSelectsOptionFromDropdown(string user, string dialog, string option, string dropdown)
        {
            var page = _browsers.Active.Component<Dialog>(dialog);
            user = user.AddRandom(_sessionRandom);
            page.GetSelectBoxBySection(user).Click();
            _browsers.Active.Component<SelectboxOptions>(dropdown).GetOptionByName(option).Click();
        }
        [When(@"User clicks selectbox by text '([^']*)' in '([^']*)' dialog and selects '([^']*)' option from dropdown '([^']*)'")]
        public void WhenUserClicksSelectboxByTextOfDialogAndSelectsOptionFromDropdown(string text, string dialog, string option, string dropdown)
        {
            _browsers.Active.Component<Dialog>(dialog).GetSelectBoxByText(text).Click();
            _browsers.Active.WaitForElementsToBeDisplayed(_browsers.Active.Component<SelectboxOptions>(dropdown).Container);
            Thread.Sleep(200);//Wait for option to be selected in selectbox
            _browsers.Active.Component<SelectboxOptions>(dropdown).GetOptionByName(option).Click();
        }

        [Then(@"'([^']*)' option is chosen in dropdown '([^']*)' menu by text '([^']*)' in '([^']*)' dialog")]
        public void ThenOptionIsChosenInDropdownMenuByTextInDialog(string option, string dropdown, string text, string dialog)
        {
            var currentValue = _browsers.Active.Component<Dialog>(dialog).GetSelectBoxByText(text).GetText();
            Verify.AreEqual(currentValue, option, $"'{option}' option is not chosen. Current option is '{currentValue}' is not displayed");
        }
    }
}
