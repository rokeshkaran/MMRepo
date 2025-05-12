using SeleniumAutomationUtils.SeleniumExtensions;
using MjAutomationCore.Pages.WebAppProject.SidePanel;
using MjAutomationCore.Utils;
using OpenQA.Selenium;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.SidePanelSteps
{
    [Binding]
    class BaseSidePanelSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsers;

        public BaseSidePanelSteps(BrowsersList browsersList)
        {
            _browsers = browsersList;
        }

        [When(@"User clicks Close button of '(.*)' side panel with '(.*)' header")]
        public void WhenUserClicksCloseButtonOfSidePanelWithHeader(string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            panel.GetSidePanel(panelName, header).FindElement(By.XPath(panel.CloseButton)).Click();
        }
    }
}