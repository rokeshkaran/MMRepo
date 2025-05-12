using AutomationUtils.Utils;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.LicensingProject.AdminPortal;
using MjAutomationCore.Utils;
using OpenQA.Selenium;
using Reqnroll;
using SeleniumAutomationUtils.SeleniumExtensions;
using System.Collections.Generic;
using System.Linq;

namespace MjAutomationCore.Steps.LicensingProject.AdminPortal
{
    [Binding]
    class SetupSSOSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsers;
        public SetupSSOSteps(BrowsersList browsers)
        {
            _browsers = browsers;
        }

        [Then(@"Folowing SSO steps have Done status:")]
        public void ThenFolowingSSOStepsHaveDoneStatus(Table table)
        {
            var parent = _browsers.Active.NowAt<SetupSSOPage>();
            var allRequestStates = parent.GetSSORequestStates();
            var expectedRequests = table.Rows.SelectMany(row => row.Values).ToList();
            var actualRequests = allRequestStates
                .Where(element =>
                {
                    var stateIcons = element.FindElements(By.ClassName("sso-request-state-icon"));
                    return stateIcons.Any(icon =>
                    {
                        string classAttribute = icon.GetAttribute("class");
                        return classAttribute.Contains("done") && !classAttribute.Contains("not-done");
                    });
                })
                .Select(element => element.GetAttribute("data-step")).ToList();
            Verify.AreEqual(expectedRequests, actualRequests, $"SSO requests doesn't have done status");
        }

        [Then(@"SSO step button '([^']*)' is Active on left panel")]
        public void ThenSsoStepButtonIsActiveOnLeftPanel(string requestName)
        {
            var parent = _browsers.Active.NowAt<SetupSSOPage>();
            var allRequestStates = parent.GetSSORequestStates();
            var expectedRequest = new List<string> { requestName };
            var actualVisibleRequests = allRequestStates
                .Where(element => element.Displayed)
                .Where(element => element.IsActive())
                .Select(element => element.GetAttribute("data-step"))
                .ToList();
            Verify.AreEqual(expectedRequest, actualVisibleRequests, $"SSO step '{requestName}' is not Active or found multiple Active steps on Left panel");
        }

        [Then(@"Following SSO steps are displayed:")]
        public void ThenFollowingSsoStepsAreDisplayed(Table table)
        {
            var page = _browsers.Active.NowAt<SetupSSOPage>();
            var allRequestStates = page.GetSSORequestStates();
            var expectedVisibleRequests = table.Rows.SelectMany(row => row.Values).ToList();
            var actualVisibleRequests = allRequestStates
                .Where(element => element.Displayed)
                .Select(element => element.GetAttribute("data-step"))
                .ToList();
            Verify.AreEqual(expectedVisibleRequests, actualVisibleRequests, $"List of visible SSO steps does not correspond to what is expected");
        }

        [Then(@"'(.*)' button is disabled on setup SSO page")]
        public void ThenButtonIsDisabledOnSetupSSO(string buttonName)
        {
            var page = _browsers.Active.NowAt<SetupSSOPage>();
            var button = page.GetButtonByNameOnSetupSSOPage(buttonName);
            Verify.IsTrue(button.IsDisabledState(), $"Button '{buttonName}' is displayed enabled");
        }

        [Then(@"'(.*)' button is enabled on setup SSO page")]
        public void ThenButtonIsEnabledOnSetupSSOPage(string buttonName)
        {
            var page = _browsers.Active.NowAt<SetupSSOPage>();
            var button = page.GetButtonByNameOnSetupSSOPage(buttonName);
            Verify.IsFalse(button.IsDisabledState(), $"Button '{buttonName}' is displayed disabled");
        }

        [When(@"User clicks '(.*)' button on setup SSO page")]
        public void WhenUserClicksButtonOnSetupSSOPage(string buttonName)
        {
            var page = _browsers.Active.NowAt<SetupSSOPage>();
            page.GetButtonByNameOnSetupSSOPage(buttonName).Click();
        }

        [When(@"User clicks '(.*)' SSO step button on Left SSO panel")]
        public void WhenUserClicksSSOStepButtonOnLeftSSOpanel(string buttonName)
        {
            var page = _browsers.Active.NowAt<SetupSSOPage>();
            var allRequestStates = page.GetSSORequestStates();
            var leftPanelButton = allRequestStates.First(element => element.GetAttribute("data-step").Equals(buttonName));
            leftPanelButton.Click();
        }
    }
}