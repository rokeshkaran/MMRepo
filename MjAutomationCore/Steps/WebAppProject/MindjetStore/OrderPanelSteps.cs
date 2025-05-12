using SeleniumAutomationUtils.SeleniumExtensions;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.MindjetStore;
using MjAutomationCore.Utils;
using NUnit.Framework;
using OpenQA.Selenium.Remote;
using Reqnroll;
using OpenQA.Selenium;

namespace MjAutomationCore.Steps.WebAppProject.MindjetStore
{
    [Binding]
    class OrderPanelSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly BrowsersList _browsers;

        public OrderPanelSteps(WebDriver driver, BrowsersList browsersList)
        {
            _driver = browsersList.GetBrowser();
            _browsers = browsersList;
        }

        [Then(@"order step panel is displayed to User")]
        public void ThenOrderStepPanelIsDisplayedToUser()
        {
            var panel = _browsers.Active.NowAt<OrderPanelElement>();
            _driver.WaitForElementToBeDisplayed(panel.OrderStepsPanel);
            Assert.IsTrue(panel.OrderStepsPanel.Displayed(), "Order step panel is not displayed");
        }

        [Then(@"'(.*)' step is displayed as Active on order steps panel")]
        public void ThenStepIsDisplayedAsActiveOnOrderStepsPanel(string stepName)
        {
            var panel = _browsers.Active.NowAt<OrderPanelElement>();
            Assert.IsTrue(panel.ActiveStepOrder(stepName));
        }

    }
}