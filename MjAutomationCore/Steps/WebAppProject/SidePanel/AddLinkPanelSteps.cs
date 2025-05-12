using SeleniumAutomationUtils.SeleniumExtensions;
using AutomationUtils.Utils;
using MjAutomationCore.Pages.WebAppProject.SidePanel;
using MjAutomationCore.Utils;
using System;
using System.Collections.Generic;
using System.Text;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.SidePanelSteps
{
    [Binding]
    class AddLinkPanelSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsers;

        public AddLinkPanelSteps(BrowsersList browsersList)
        {
            _browsers = browsersList;
        }

        [Then(@"Add Link panel is displayed to the User")]
        public void ThenAddLinkPanelIsDisplayedToTheUser()
        {
            var panel = _browsers.Active.NowAtWithContext<AddLinkPanelPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(panel.Context), "Add Link panel is displayed to the User");
        }

        [When(@"User clicks '(.*)' footer button on Add Link panel")]
        public void WhenUserClicksFooterButtonOnAddLinkPanel(string button)
        {
            var panel = _browsers.Active.NowAtWithContext<AddLinkPanelPage>();
            panel.GetFooterButton(button).Click();
        }
    }
}