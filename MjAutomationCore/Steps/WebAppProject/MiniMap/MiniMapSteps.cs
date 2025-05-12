using SeleniumAutomationUtils.SeleniumExtensions;
using AutomationUtils.Utils;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.MiniMap;
using MjAutomationCore.Utils;
using System;
using System.Threading;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.MiniMap
{
    [Binding]
    class MiniMapSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsers;
        private readonly MinimapFrameProperties _frameProperties;
        public MiniMapSteps(BrowsersList browsersList, MinimapFrameProperties frameProperties)
        {
            _browsers = browsersList;
            _frameProperties = frameProperties;
        }

        [When(@"User clicks mini map button")]
        public void WhenUserClicksMiniMapButton()
        {
            var page = _browsers.Active.NowAt<MiniMapPage>();
            page.MiniMapButton.Click();
        }

        [When(@"User click on Close button in '([^']*)' Navigation Panel Popup")]
        public void WhenUserClickOnCloseButtonInNavigationPanelPopup(string PanelName)
        {
            var page = _browsers.Active.NowAt<MiniMapPage>();
            page.GetCloseButtonByPanelName(PanelName).Click();
        }

        [When(@"tutorial card is set to '([^']*)' on navigation panel")]
        public void WhenTutorialCardIsSetToOnNavigationPanel(string status)
        {
            _browsers.Active.MinimizeMaximizeTutorialCard(status);
        }

        [Then(@"'([^']*)' icon is displayed on navigation panel")]
        public void ThenIconIsDisplayedOnNavigationPanel(string iconName)
        {
            var page = _browsers.Active.NowAt<MiniMapPage>();
            Verify.IsTrue(page.IsIconDisplayedInNavigationPanel(iconName), $"'{iconName}' Icon is not displayed in navigation panel");
        }

        [Then(@"mini map icon is disabled on navigation panel")]
        public void ThenMiniMapIconIsDisabledOnNavigationPanel()
        {
            var page = _browsers.Active.NowAt<MiniMapPage>();
            Verify.IsFalse(page.IsMiniMapButtonEnable(), "Mini map icon is enable in navigation panel");
        }

        [Then(@"mini map icon is enabled on navigation panel")]
        public void ThenMiniMapIconIsEnabledOnNavigationPanel()
        {
            var page = _browsers.Active.NowAt<MiniMapPage>();
            Verify.IsTrue(page.IsMiniMapButtonEnable(), "Mini map icon is disable in navigation panel");
        }

        [Then(@"'([^']*)' navigation panel is displayed to User")]
        public void ThenNavigationPanelIsDisplayedToUser(string navigationPanelName)
        {
            var page = _browsers.Active.NowAt<MiniMapPage>();
            Verify.IsTrue(page.DisplayedNavigationPanel(navigationPanelName), "Mini map is not displayed");
        }

        [Then(@"'([^']*)' navigation panel is not displayed to User")]
        public void ThenNavigationPanelIsNotDisplayedToUser(string navigationPanelName)
        {
            var page = _browsers.Active.NowAt<MiniMapPage>();
            Verify.IsFalse(page.DisplayedNavigationPanel(navigationPanelName), "Mini map is displayed");
        }

        [Then(@"Mini map navigation panel is located by approximate '([^']*)' X axis and approximate'([^']*)' Y axis")]
        public void ThenMiniMapNavigationPanelIsLocatedByApproximateXAxisAndApproxateYAxis(int X, int Y)
        {
            var rangeValue = 400;
            var page = _browsers.Active.NowAt<MiniMapPage>();
            var navigationPanelLocation = page.NavigationPanel.Location;
            Verify.IsTrue(navigationPanelLocation.X - rangeValue <= X && X <= navigationPanelLocation.X + rangeValue, $"Overlay X axis is not as expected: {X}. Actual: {navigationPanelLocation.X}");
            Verify.IsTrue(navigationPanelLocation.Y - rangeValue <= Y && Y <= navigationPanelLocation.Y + rangeValue, $"Overlay Y axis is not as expected: {Y}. Actual: {navigationPanelLocation.Y}");
        }

        [When(@"User remembers mini map frame size")]
        public void WhenUserRemembersMiniMapFrameSize()
        {
            var page = _browsers.Active.NowAt<MiniMapPage>();
            var top = Convert.ToDouble(page.CurrentView.GetCssValue("top").Replace("px", string.Empty));
            var left = Convert.ToDouble(page.CurrentView.GetCssValue("left").Replace("px", string.Empty));
            var height = Convert.ToDouble(page.CurrentView.GetCssValue("height").Replace("px", string.Empty));
            var width = Convert.ToDouble(page.CurrentView.GetCssValue("width").Replace("px", string.Empty));
            _frameProperties.Top = top;
            _frameProperties.Left = left;
            _frameProperties.Height = height;
            _frameProperties.Width = width;
        }

        [Then(@"mini map frame is increased")]
        public void ThenMiniMapFrameIsIncreased()
        {
            Thread.Sleep(500);
            var page = _browsers.Active.NowAt<MiniMapPage>();
            var top = Convert.ToDouble(page.CurrentView.GetCssValue("top").Replace("px", string.Empty));
            var left = Convert.ToDouble(page.CurrentView.GetCssValue("left").Replace("px", string.Empty));
            var height = Convert.ToDouble(page.CurrentView.GetCssValue("height").Replace("px", string.Empty));
            var width = Convert.ToDouble(page.CurrentView.GetCssValue("width").Replace("px", string.Empty));
            Verify.IsTrue(_frameProperties.Top > top, "Mini-map frame has not changed location by top");
            Verify.IsTrue(_frameProperties.Left > left, "Mini-map frame has not changed location by left");
            Verify.IsTrue(_frameProperties.Height < height, "Mini-map frame has not changed location by height");
            Verify.IsTrue(_frameProperties.Width < width, "Mini-map frame has not changed location by width");
        }

        [Then(@"mini map frame is decreased")]
        public void ThenMiniMapFrameIsDecreased()
        {
            Thread.Sleep(500);
            var page = _browsers.Active.NowAt<MiniMapPage>();
            var top = Convert.ToDouble(page.CurrentView.GetCssValue("top").Replace("px", string.Empty));
            var left = Convert.ToDouble(page.CurrentView.GetCssValue("left").Replace("px", string.Empty));
            var height = Convert.ToDouble(page.CurrentView.GetCssValue("height").Replace("px", string.Empty));
            var width = Convert.ToDouble(page.CurrentView.GetCssValue("width").Replace("px", string.Empty));
            Verify.IsTrue(_frameProperties.Top < top, "Mini-map frame has not changed location by top");
            Verify.IsTrue(_frameProperties.Left < left, "Mini-map frame has not changed location by left");
            Verify.IsTrue(_frameProperties.Height > height, "Mini-map frame has not changed location by height");
            Verify.IsTrue(_frameProperties.Width > width, "Mini-map frame has not changed location by width");
        }

        [When(@"User remembers mini map frame location")]
        public void WhenUserRemembersMiniMapFrameLocation()
        {
            var page = _browsers.Active.NowAt<MiniMapPage>();
            var top = Convert.ToDouble(page.CurrentView.GetCssValue("top").Replace("px", string.Empty));
            var left = Convert.ToDouble(page.CurrentView.GetCssValue("left").Replace("px", string.Empty));
            _frameProperties.Top = top;
            _frameProperties.Left = left;
        }

        [Then(@"mini map frame has changed location by X axis")]
        public void ThenMiniMapFrameHasChangedLocationByXAxis()
        {
            var page = _browsers.Active.NowAt<MiniMapPage>();
            var left = Convert.ToDouble(page.CurrentView.GetCssValue("left").Replace("px", string.Empty));
            Verify.AreNotEqual(_frameProperties.Left, left, "Mini-map frame has not changed location by X axis");
        }

        [Then(@"mini map frame has not changed location by X axis")]
        public void ThenMiniMapFrameHasNotChangedLocationByXAxis()
        {
            var page = _browsers.Active.NowAt<MiniMapPage>();
            var left = Convert.ToDouble(page.CurrentView.GetCssValue("left").Replace("px", string.Empty));
            Verify.AreEqual(_frameProperties.Left, left, "Mini-map frame has changed location by X axis");
        }

        [Then(@"mini map frame has changed location by Y axis")]
        public void ThenMiniMapFrameHasChangedLocationByYAxis()
        {
            var page = _browsers.Active.NowAt<MiniMapPage>();
            var top = Convert.ToDouble(page.CurrentView.GetCssValue("top").Replace("px", string.Empty));
            Verify.AreNotEqual(_frameProperties.Top, top, "Mini-map frame has not changed location by Y axis");
        }

        [Then(@"mini map frame has not changed location by Y axis")]
        public void ThenMiniMapFrameHasNotChangedLocationByYAxis()
        {
            var page = _browsers.Active.NowAt<MiniMapPage>();
            var top = Convert.ToDouble(page.CurrentView.GetCssValue("top").Replace("px", string.Empty));
            Verify.AreEqual(_frameProperties.Top, top, "Mini-map frame has changed location by Y axis");
        }

        [When(@"User moves mini map frame by '([^']*)' and '([^']*)' coordinates")]
        public void WhenUserMovesMiniMapFrameByAndCoordinates(int offSetX, int offSetY)
        {
            var page = _browsers.Active.NowAt<MiniMapPage>();
            _browsers.Active.ActionsClickAndHold(page.CurrentView);
            _browsers.Active.MoveByOffset(1, offSetX, offSetY);
        }

        [When(@"User clicks on mini map by '([^']*)' and '([^']*)' coordinates")]
        public void WhenUserClicksOnMiniMapByAndCoordinates(int offSetX, int offSetY)
        {
            var page = _browsers.Active.NowAt<MiniMapPage>();
            _browsers.Active.ActionMoveToElementAndMoveByOffsetClick(page.CurrentView, offSetX, offSetY);
        }
    }
}
