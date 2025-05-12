using AutomationUtils.Utils;
using MjAutomationCore.Components.Base;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.SideToolbox;
using MjAutomationCore.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using System.Linq;
using System.Threading;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.SideToolbox
{
    [Binding]
    class SideToolboxSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly BrowsersList _browsers;

        public SideToolboxSteps(WebDriver driver, BrowsersList browsersList)
        {
            _driver = browsersList.GetBrowser();
            _browsers = browsersList;
        }

        [Then(@"User set zoom level to '([^']*)' via the side tool bar")]
        public void ThenUserSetZoomLevelToViaTheSideToolBar(string zoomLevel)
        {
            var zoom = _browsers.Active.NowAt<SideToolboxPage>();
            var zoomValue = zoom.GetZoomPercentage();
            if (!string.IsNullOrEmpty(zoomValue))
            {
                zoom.ZoomPercentage.Click();
                _browsers.Active.SendKeysByActions(zoomLevel);
                _browsers.Active.ActionsSendKeys("Enter");
                //Wait for zoom changes
                Thread.Sleep(300);
            }
        }

        [Then(@"following templates on Side menu panel are displayed to the User:")]
        public void ThenFollowingTemplatesOnSideMenuPanelAreDisplayedToTheUser(Table table)
        {
            var toolbox = _browsers.Active.NowAt<SideToolboxPage>();
            Thread.Sleep(300);
            var templatesList = toolbox.SidePanelTemplatesList.Select(column => column.GetAttribute("data-tooltip")).ToList();
            var expectedTemplatesList = table.Rows.SelectMany(row => row.Values).ToList();
            Thread.Sleep(300);
            Assert.AreEqual(templatesList, expectedTemplatesList, "Sidebar hasn't the follow content the correct");
        }

        [Then(@"'(.*)' button is displayed on side toolbox")]
        public void ThenButtonIsDisplayedOnSideToolbox(string button)
        {
            var sideToolbox = _browsers.Active.NowAt<SideToolboxPage>();
            Verify.IsTrue(sideToolbox.DisplayedButton(button), $"Button '{button}' is not displayed on side panel");
        }

        [Then(@"'(.*)' button is not displayed on side toolbox")]
        public void ThenButtonIsNotDisplayedOnSideToolbox(string button)
        {
            var sideToolbox = _browsers.Active.NowAt<SideToolboxPage>();
            Verify.IsFalse(sideToolbox.DisplayedButton(button), $"Button '{button}' is displayed on side panel");
        }

        [When(@"User clicks Ellipsis button of side toolbox")]
        public void WhenUserClicksEllipsisButtonOfSideToolbox()
        {
            var toolbox = _browsers.Active.NowAt<SideToolboxPage>();
            _browsers.Active.HoverAndClick(toolbox.EllipsisButton);
        }

        [Then(@"Snap button is displayed on Side menu panel")]
        public void ThenSnapButtonIsDisplayedOnSideMenuPanel()
        {
            var toolbox = _browsers.Active.NowAt<SideToolboxPage>();
            Assert.IsTrue(toolbox.SnapButton.Displayed(), "Snap button is not displayed on Side menu panel");
        }

        [When(@"User clicks '(.*)' button of side Toolbox")]
        public void WhenUserClicksButtonOfSideToolbox(string buttonName)
        {
            var toolbox = _browsers.Active.NowAt<SideToolboxPage>();
            if (!toolbox.DisplayedButton(buttonName))
            {
                toolbox.EllipsisButton.Click();
                _browsers.Active.Component<ScrollContent>().GetItemByName(buttonName).Click();
            }
            else
            {
                _browsers.Active.ClickByActions(toolbox.GetButtonByName(buttonName));
            }
        }

        [When(@"User clicks Zoom Out button on zoom bar of side toolbox")]
        public void WhenUserClicksZoomOutButtonOnZoomBarOfSideToolbox()
        {
            var zoombar = _driver.NowAt<SideToolboxPage>();
            zoombar.ZoomOutButtonOnZoomBar.Click();
        }

        [When(@"User clicks Zoom In button on zoom bar of side toolbox")]
        public void WhenUserClicksZoomInButtonOnZoomBarOfSideToolbox()
        {
            var zoombar = _driver.NowAt<SideToolboxPage>();
            zoombar.ZoomInButtonOnZoomBar.Click();
        }

        [Then(@"map zoom is '([^']*)' on the side tool box")]
        public void ThenMapZoomIsOnTheSideToolBox(string zoomLevel)
        {
            var zoom = _driver.NowAt<SideToolboxPage>();
            var actualZoomValue = zoom.GetZoomPercentage();
            Verify.AreEqual(zoomLevel, actualZoomValue, $"Zoom level is not as expected: '{zoomLevel}'.Actual '{actualZoomValue}'");
        }

        [Then(@"'(.*)' button is displayed in '(.*)' state on side Toolbar")]
        public void ThenButtonIsDisplayedInStateOnSideToolbar(string button, string state)
        {
            var toolbox = _browsers.Active.NowAt<SideToolboxPage>();
            Verify.IsTrue(toolbox.DisplayedStateButton(button, state), $"Button '{button}' is not displayed in '{state}' state on side Toolbar");
        }

        [When(@"User mouse over on '(.*)' button of side toolbox")]
        public void WhenUserMouseOverOnButtonOfSideToolbox(string buttonName)
        {
            var toolbox = _browsers.Active.NowAt<SideToolboxPage>();
            _browsers.Active.WaitForElementToBeDisplayed(toolbox.GetButtonByName(buttonName));
            _browsers.Active.MoveToElement(toolbox.GetButtonByName(buttonName));
        }

        [Then(@"'(.*)' editors is displayed on '(.*)' button")]
        public void ThenEditorsIsDisplayedOnButton(string numberOfEditors, string buttonName)
        {
            var toolbox = _browsers.Active.NowAt<SideToolboxPage>();
            Assert.IsTrue(toolbox.GetNumberOfEditorsOnButton(numberOfEditors, buttonName).Displayed());
        }

        [Then(@"Side panel is displayed on the page")]
        public void ThenSideToolboxButtonIsDisplayed()
        {
            var sideToolbox = _browsers.Active.NowAt<SideToolboxPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(sideToolbox.SideToolbox), $"Side panel is not displayed");
        }
    }
}