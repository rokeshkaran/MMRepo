using AutomationUtils.Utils;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.MapMode;
using MjAutomationCore.Utils;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using Reqnroll;
using System.Threading;

namespace MjAutomationCore.Steps.WebAppProject.MapMode
{
    [Binding]
    class MapModeSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly BrowsersList _browsers;

        public MapModeSteps(WebDriver driver, BrowsersList browsersList)
        {
            _driver = browsersList.GetBrowser();
            _browsers = browsersList;
        }

        [Then(@"map is displayed in '(.*)' view mode")]
        public void ThenMapIsDisplayedInViewMode(string modeName)
        {
            var page = _browsers.Active.NowAt<MapModePage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetMapMode(modeName)), $"Map is not displayed in '{modeName}' mode");
        }

        [Then(@"map is existed in '(.*)' view mode")]
        public void ThenMapIsExistedInGanttViewMode(string modeName)
        {
            if(modeName.Equals("Gantt")){ Thread.Sleep(2000); }
            var page = _browsers.Active.NowAt<MapModePage>();
            Verify.IsTrue(_browsers.Active.IsElementExists(page.GetMapMode(modeName)), $"Map is not exist in '{modeName}' view mode");
        }
    }
}