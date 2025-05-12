using SeleniumAutomationUtils.SeleniumExtensions;
using MjAutomationCore.Components.UserPanel;
using MjAutomationCore.Utils;
using System;
using System.Collections.Generic;
using System.Text;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.UserPanel
{
    [Binding]
     class UserPanelSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsers;

        public UserPanelSteps(BrowsersList browsers)
        {
            _browsers = browsers;
        }

        [When(@"User clicks arrow down on '([^']*)' user panel")]
        public void WhenUserClicksArrowDownOnUserPanel(string panel)
        {
            _browsers.Active.Component<UserPanelById>(panel).ArrowDown.Click();
        }
    }
}
