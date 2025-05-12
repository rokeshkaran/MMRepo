using System.Linq;
using SeleniumAutomationUtils.SeleniumExtensions;
using AutomationUtils.Utils;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.ToolPanel;
using MjAutomationCore.Utils;
using NUnit.Framework;
using Reqnroll;
using OpenQA.Selenium;
using System.Threading;
using MjAutomationCore.Pages.WebAppProject.QA;
using MjAutomationCore.Components.ToolbarLogo;
using SeleniumAutomationUtils.Components;
using MjAutomationCore.Pages.WebAppProject.Toolbar;

namespace MjAutomationCore.Steps.WebAppProject.WebEditor
{
    [Binding]
    class ToolPanelSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly BrowsersList _browsers;

        public ToolPanelSteps(WebDriver driver, BrowsersList browsersList)
        {
            _driver = browsersList.GetBrowser();
            _browsers = browsersList;
        }

        [Then(@"following buttons are displayed on the Top Toolbar:")]
        public void ThenFollowingButtonsAreDisplayedOnTheTopToolbar(Table table)
        {
            var page = _browsers.Active.NowAt<ToolPanelPage>();
            _driver.WaitForElementToBeDisplayed(page.ToolPanel);
            var buttons = page.ButtonsOnToolPanel.Select(x => x.GetAttribute("data-tooltip")).ToList();
            var expectedList = table.Rows.SelectMany(row => row.Values).ToList();
            Assert.AreEqual(expectedList, buttons, "Left side buttons are displayed incorrectly");
        }

        [When(@"User hover over '(.*)' button in Tools panel")]
        public void WhenUserHoverOverButtonInToolbar(string buttonName)
        {
            var button = _driver.NowAt<ToolPanelPage>();
            _driver.MoveToElement(button.GetButtonByNameOnToolsPanel(buttonName));
        }

        [Then(@"'(.*)' button is highlighted blue border on Tools panel")]
        public void ThenButtonIsHighlightedBlueBorderOnToolsPanel(string buttonName)
        {
            var toolPanel = _driver.NowAt<ToolPanelPage>();
            Verify.IsTrue(toolPanel.GetButtonByNameOnToolsPanel(buttonName).GetCssValue("border").Contains("rgb(57, 154, 233)"), $"Button '{buttonName}' is not  highlighted blue border");
        }

        [When(@"User drag and drop '(.*)' button to '(.*)' button of Tools panel")]
        public void WhenUserDragAndDropButtonToButtonOfToolsPanel(string buttonFrom, string buttonTo)
        {
            var icon = _driver.NowAt<ToolPanelPage>();
            _driver.DragAndDropByJavaScript(icon.GetButtonByNameOnToolsPanel(buttonFrom), icon.GetButtonByNameOnToolsPanel(buttonTo));
        }

        [When(@"User mouse over to the '(.*)' button on Tool panel")]
        public void WhenUserMouseOverToTheButtonOnToolPanel(string buttonName)
        {
            var page = _browsers.Active.NowAt<ToolPanelPage>();
            _browsers.Active.MoveToElement(page.GetButtonByNameOnToolsPanel(buttonName));
        }

        [When(@"User clicks '(.*)' button on Tools panel")]
        public void WhenUserClicksButtonOnToolsPanel(string buttonName)
        {
            var button = _browsers.Active.NowAt<ToolPanelPage>();
            button.GetButtonByNameOnToolsPanel(buttonName).Click();
        }

        [Then(@"Tools panel is displayed in '(.*)' side on page")]
        public void ThenToolsPanelIsDisplayedInSideOnPage(string side)
        {
            var panel = _driver.NowAt<ToolPanelPage>();
            Assert.IsTrue(panel.GetToolsPanelLocation(side));
        }

        [Then(@"Tools panel is not displayed on page")]
        public void ThenToolsPanelIsNotDisplayedOnPage()
        {
            var page = _browsers.Active.NowAt<ToolPanelPage>();
            Verify.IsFalse(_browsers.Active.IsElementDisplayed(page.ToolPanel), "Toolbar is not displayed to User");
        }

        [Then(@"'(.*)' button is displayed as disabled on the Tools panel")]
        public void ThenButtonIsDisplayedAsDisabledOnTheToolsPanel(string buttonName)
        {
            var toolsPanel = _driver.NowAt<ToolPanelPage>();
            Verify.IsTrue(toolsPanel.GetButtonByNameOnToolsPanel(buttonName).IsDisabledState(), $"Button '{buttonName}' is displayed as enabled on the Tools panel");
        }

        [Then(@"'(.*)' button is displayed as enabled on the Tools panel")]
        public void ThenButtonIsDisplayedAsEnabledOnTheToolsPanel(string buttonName)
        {
            var toolsPanel = _driver.NowAt<ToolPanelPage>();
            Verify.IsFalse(toolsPanel.GetButtonByNameOnToolsPanel(buttonName).IsDisabledState(), $"Button '{buttonName}' is displayed as disabled on the Tools panel");
        }

        [When(@"User clicks Add relationship button on the Toolbar")]
        public void WhenUserClicksAddRelationshipButtonOnTheToolbar()
        {
            var page = _browsers.Active.NowAt<ToolPanelPage>();
            page.GetButtonByNameOnToolsPanel("Add relationship").Click();
            _browsers.Active.MoveByOffset(3, 6, 6);
        }

        [When(@"User click ""(.*)"" button for moved on the View Map page")]
        public void WhenUserClickButtonForMovedOnTheViewMapPage(string buttonName)
        {
            var page = _driver.NowAt<ToolPanelPage>();
            page.GetButtonByNameOnToolsPanel(buttonName).Click();
            _driver.MoveToElement(page.BodyContainer);
        }

        [When(@"User clicks on the Add floating topic button on the toolbar")]
        public void WhenUserClicksOnTheAddFloatingTopicButtonOnTheToolbar()
        {
            var page = _browsers.Active.NowAt<ToolPanelPage>();
            _browsers.Active.HoverAndClick(page.GetButtonByNameOnToolsPanel("Add floating topic"));
            //page.GetButtonByNameOnToolsPanel("Add floating topic").Click();
            _driver.MoveByOffset(3, 4, 4);
        }

        [When(@"User add floating topic on the View Map page")]
        public void WhenUserAddFloatingTopicOnTheViewMapPage()
        {
            var page = _driver.NowAt<ToolPanelPage>();
            var elementSize = page.BodyContainer.Size;
            _driver.ActionsMoveToElementAndClick(page.BodyContainer,
                elementSize.Width - 1050, elementSize.Height - 700);
        }

        [When(@"User add floating topic by coordinates '(.*)', '(.*)' to the Canvas")]
        public void WhenUserAddFloatingTopicByCoordinatesToTheCanvas(int offsetX, int offsetY)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var canvas = page.PaperContainer;
            _browsers.Active.MoveToElement(canvas);
            _browsers.Active.MoveByOffset(5, -1, -1);
            //To ensure proper display of FloatingTopic cursor icon 
            Thread.Sleep(500);
            _browsers.Active.ActionMoveToElementAndMoveByOffsetClick(canvas, offsetX, offsetY);
        }

        [When(@"User clicks on the toolbar logo of Tools panel")]
        public void WhenUserClicksOnTheToolbarLogoOfToolsPanel()
        {
            var page = _browsers.Active.NowAt<ToolbarPageElement>();
            var toolbarElement = _browsers.Active.FindElement(page.Context);
            _browsers.Active.GetComponent<ToolbarLogoElement>(new Properties() { Parent = toolbarElement }).Click();
        }

        [When(@"User add sticky note by coordinates '([^']*)', '([^']*)' to the Canvas")]
        public void WhenUserAddStickyNoteByCoordinatesToTheCanvas(int offsetX, int offsetY)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var canvas = page.PaperContainer;
            _browsers.Active.MoveToElement(canvas);
            _browsers.Active.MoveByOffset(5, -1, -1);
            Thread.Sleep(500);
            _browsers.Active.ActionMoveToElementAndMoveByOffsetClick(canvas, offsetX, offsetY);
        }
    }
}