using AutomationUtils.Utils;
using MjAutomationCore.Pages.WebAppProject.Toolbar;
using MjAutomationCore.Utils;
using SeleniumAutomationUtils.SeleniumExtensions;
using Reqnroll;
using System.Threading;

namespace MjAutomationCore.Steps.WebAppProject.Toolbar
{
    [Binding]
    class GanttToolbarSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsers;

        public GanttToolbarSteps(BrowsersList browsers)
        {
            _browsers = browsers;
        }

        [Then(@"Gantt toolbar is displayed to User")]
        public void ThenGanttToolbarIsDisplayedToUser()
        {
            var element = _browsers.Active.NowAt<GanttToolbarElement>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(element.GanttToolbar, WebDriverExtensions.WaitTime.Short), "Gantt toolbar is not displayed to User");
            Thread.Sleep(3000);
        }

        [When(@"User clicks '([^']*)' button on Gantt toolbar")]
        public void WhenUserClicksButtonOnGanttToolbar(string button)
        {
            var element = _browsers.Active.NowAt<GanttToolbarElement>();
            element.GetGanttToolbarButtonById(button).Click();
        }
    }
}