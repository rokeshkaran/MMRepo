using AutomationUtils.Utils;
using MjAutomationCore.Components.Base;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.BackgroundObjectLlist;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.Clouds.SharePoint;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.ShapesList;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.TopicsDetails;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.QA;
using MjAutomationCore.Pages.WebAppProject.SideToolbox;
using MjAutomationCore.Pages.WebAppProject.ToolPanel;
using MjAutomationCore.Utils;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading;
using Reqnroll;
using TestDataGenerator = MjAutomationCore.Utils.TestDataGenerator;

namespace MjAutomationCore.Steps.WebAppProject.WebEditor
{
    [Binding]
    class WebEditorSteps : ReqnrollContext
    {
        private readonly LocationWebDto _locWeb;
        private readonly ValuesText _valuesText;
        private readonly BrowsersList _browsers;
        protected readonly SharePointFileList _fileList;
        private readonly ShapesList _shapesList;
        private readonly SessionRandomValue _sessionRandom;
        private readonly TopicDetails _topicDetails;
        private readonly LocationWebDtoList _locWebList;
        private readonly BackgroundObjectList _backgroundObjectList;

        public WebEditorSteps(LocationWebDto locWeb, ValuesText valuesText,
            BrowsersList browsersList, SharePointFileList fileList
            , ShapesList shapesList, SessionRandomValue sessionRandom, TopicDetails topicDetails,
            LocationWebDtoList locWebList, BackgroundObjectList backgroundObjectList)
        {
            _browsers = browsersList;
            _locWeb = locWeb;
            _valuesText = valuesText;
            _fileList = fileList;
            _shapesList = shapesList;
            _sessionRandom = sessionRandom;
            _topicDetails = topicDetails;
            _locWebList = locWebList;
            _backgroundObjectList = backgroundObjectList;
        }

        #region Topics
        #region Drag Topics
        [When(@"User Drag '(.*)' topic on '(.*)' topic")]
        public void WhenUserDragTopicOnTopic(string topicName, string topicName2)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.ActionsDragElementAndDropOntoElement(page.GetTopicByName(topicName), page.GetTopicByName(topicName2));
        }

        [When(@"User Drag '(.*)' topic on '(.*)' topic and hold then release")]
        public void WhenUserDragTopicOnTopicAndHold(string topicName, string topicName2)
        {
            _browsers.Active.ActionsRelease();
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.ActionsDragElementToElement(page.GetTopicByName(topicName), page.GetTopicByName(topicName2));
            //Wait to perform the 'hold' part of this step
            Thread.Sleep(1000);
            _browsers.Active.ActionsRelease();
        }

        [When(@"User Drag '([^']*)' topic around Canvas then hold on '([^']*)' topic then release")]
        public void WhenUserDragTopicAroundCanvasThenHoldOnTopicThenRelease(string topicName, string topicName2)
        {
            _browsers.Active.ActionsRelease();
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.ActionsDragElementAroundThenMoveToSecondElement(page.GetTopicByName(topicName), page.GetTopicByName(topicName2));
            //Wait to perform the 'hold' part of this step
            Thread.Sleep(1000);
            _browsers.Active.ActionsRelease();
        }

        [When(@"User drags and hold '([^']*)' topic to '([^']*)' and '([^']*)' coordinates on Canvas")]
        public void WhenUserDragsAndHoldTopicToAndCoordinatesOnCanvas(string topicName, int offSetX, int offSetY)
        {
            try
            {
                var canvas = _browsers.Active.NowAt<WebEditorPage>();
                _browsers.Active.ActionsClickAndHoldElementToOffset(canvas.GetTopicByName(topicName), offSetX, offSetY);
                //Wait for move to occur
                Thread.Sleep(1000);
            }
            catch
            {
                throw new Exception($"Topic '{topicName}' can not be dragged to coordinates ('{offSetX}','{offSetY}')");
            }
        }

        [When(@"User drags '(.*)' topic by '(.*)' and '(.*)' coordinates on Canvas and holds")]
        public void WhenUserDragsTopicByAndCoordinatesOnCanvasAndHolds(string topicName, int offSetX, int offSetY)
        {
            var canvas = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.ActionsDragElementToOffset(canvas.GetTopicByName(topicName), offSetX, offSetY);
            //Wait for move to occur
            Thread.Sleep(1000);
        }
        #endregion

        [When(@"User selects first '([^']*)' and second '([^']*)' and third '([^']*)' topic on Canvas")]
        public void WhenUserSelectsFirstAndSecondAndThirdTopicOnCanvas(string firstTopic, string secondTopic, string thirdTopic)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.ActionsPressAndHoldAndThreeClicks(page.GetTopicByName(firstTopic), page.GetTopicByName(secondTopic), page.GetTopicByName(thirdTopic));
            _browsers.Active.ActionsRelease();
        }

        [Then(@"'(.*)' plus is displayed on border in topic")]
        public void ThenPlusIsDisplayedOnBorderInTopic(int Count)
        {
            var topic = _browsers.Active.NowAt<WebEditorPage>();
            var plusCount = topic.JoinBorder.Count;
            Verify.AreEqual(plusCount, Count, $"'{Count}' plus sign is displayed. Actual Number: '{plusCount}'");
        }

        [Then(@"'(.*)' topic has Fill Color '(.*)' on Canvas")]
        public void ThenTopicHasFillColorOnViewMapPage(string topicName, string fillColor)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topic = page.GetTopicByName(topicName);
            var color = topic.FindElement(By.XPath(page.FillColorInTopic)).GetCssValue("fill");
            Verify.AreEqual(color, fillColor, $"Color '{fillColor}' is not displayed in '{topicName}'");
        }

        [Then(@"'(.*)' topic border is highlighted '(.*)' color with no quick add buttons on Canvas")]
        public void ThenTopicBorderIsHighlightedColorWithNoQuickAddButtons(string topicName, string color)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var colorBorder = page.GetTopicByName(topicName).FindElement(By.XPath(page.BorderWithoutQuickAddButtonsOnTopic)).GetCssValue("stroke");
            Verify.AreEqual(color, colorBorder, $"Border is not highlighted '{color}' in '{topicName}' topic");
        }

        [Then(@"'([^']*)' collapsed subtopic of '([^']*)' topic are displayed to User")]
        public void ThenCollapsedSubtopicOfTopicAreDisplayedToUser(string expectedNumber, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var ActualCount = page.GetCollapseButtonByTopic(topicName).Text;
            Verify.IsTrue(ActualCount.Equals(expectedNumber), "Subtopic is not collapsed");
        }

        [When(@"User clicks '([^']*)' topic collapse button")]
        public void WhenUserClicksTopicCollapseButton(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.ClickByActions(page.GetCollapseButtonByTopic(topicName));
        }

        [Then(@"all subtopics are expanded on Canvas")]
        public void ThenAllSubtopicsAreExpandedOnCanvas()
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(page.TopicCollapseState.All(x => x.Text.Equals("-")), "All topics are collapsed");
        }

        [Then(@"all subtopics are collapsed on Canvas")]
        public void ThenAllSubtopicsAreCollapsedOnCanvas()
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(page.TopicCollapseState.All(x => x.Text.Equals("-")), "All topics are expanded");
        }

        [Then(@"""(.*)"" collapsed subtopic are displayed to User")]
        public void ThenCollapsedSubtopicAreDisplayedToUser(string number)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.WaitForElementToBeDisplayed(page.GetCountSubtopics(number));
            Verify.IsTrue(page.DisplayedCountSubtopics(number), $"{number} subtopics is not displayed");
        }

        [When(@"User clicks the value '(.*)' to expand subtopics")]
        public void WhenUserClicksTheValueToExpandSubtopics(string value)
        {
            var subtopic = _browsers.Active.NowAt<WebEditorPage>();
            subtopic.GetButtonExpandSubtopic(value).Click();
        }

        [Then(@"'(.*)' topic is assigned '(.*)' shape on Canvas")]
        public void ThenTopicIsAssignedShapeOnTheViewMapPage(string topicName, string shape)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topicShape = page.GetTopicShapeByTopicName(topicName);
            Verify.IsTrue(topicShape.Contains(shape), $"'{topicName}' topic is not assigned '{shape}' shape on Canvas");
        }

        [Then(@"'([^']*)' topics are displayed on Canvas")]
        public void ThenTopicsIsDispalyedOnCanvas(int topicCount)
        {
            var canvas = _browsers.Active.NowAt<WebEditorPage>();
            Verify.AreEqual(topicCount, canvas.TopicList.Count, $"Expected topic count'{topicCount}' doesnt displayed on the Canvas");
        }

        [Then(@"'(.*)' topics name '(.*)' are displayed on Canvas")]
        public void ThenTopicsNameAreDisplayedOnTheViewMapPage(int expectedCount, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var count = page.GetTopicCountByName(topicName).Count;
            Verify.AreEqual(expectedCount, count, $"'{expectedCount}' topics name '{topicName}' are not displayed on Canvas");
        }

        [Then(@"'(.*)' subtopics with the name '(.*)' are displayed on Canvas")]
        public void ThenSubtopicsWithTheNameAreDisplayedOnTheViewMapPage(int expectedCount, string subtopicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var count = page.GetSubtopicCountByName(subtopicName).Count;
            Verify.AreEqual(expectedCount, count, $"'{expectedCount}' subtopics name '{subtopicName}' are not displayed on Canvas");
        }

        [Then(@"'(.*)' subtopics are displayed on Canvas")]
        public void ThenSubtopicsAreDisplayedOnCanvas(int expectedCount)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.WaitForElementsToBeDisplayed(page.AddedSubtopics);
            Verify.AreEqual(expectedCount, page.AddedSubtopics.Count(), "Subtopics count is incorrect");
        }

        [Then(@"Topic Border is highlight blue color in '(.*)' topic on Canvas")]
        public void ThenBoundaryIsHighlightBlueColorInTopic(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(page.GetTopicByName(topicName).IsElementExists(By.XPath(page.BorderHighlight)), $"Boundary is not highlight in {topicName} topic");
        }

        [Then(@"'(.*)' topic is highlighted with '(.*)' color in '(.*)' opacity on Canvas")]
        public void ThenTopicIsHighlightedWithColorInTopicOnCanvas(string topicName, string color, string opacity)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            //Primary selected topic Border opacity=1, secondary selected topic and hoverBorder opacity =0.5. TC: WEB-427
            var topicId = _topicDetails.TopicModelIdList[topicName];
            var selector = opacity == "1" ? page.TopicBorderPrimaryHighlightedByTopicId(topicId) : page.TopicBorderSecondaryHighlightedByTopicId(topicId);
            var element = _browsers.Active.FindElement(By.XPath(selector));
            Verify.IsTrue(element.Displayed, $"{topicName} topic border is not visible on the Canvas");
            var stroke = element.GetCssValue("stroke");
            var strokeOpacity = element.GetAttribute("stroke-opacity");
            Verify.AreEqual(stroke, color, $"{topicName} topic is not highlighted with {color}. Actual:{stroke}");
            Verify.AreEqual(strokeOpacity, opacity, $"{topicName} topic highlighted boundary is not of {opacity} opacity. Actual:{strokeOpacity}");
        }

        [When(@"User clicks on '([^']*)' Plus button in '([^']*)' topic on Canvas")]
        public void WhenUserClicksOnButtonInTopicOnCanvas(string buttonName, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topicModelId = page.GetTopicIdByTopicName(topicName);
            page.GetPlusButtonOnSelectedTopicById(topicModelId, buttonName).Click();
        }

        [When(@"User hovers over '([^']*)' Plus button in '([^']*)' topic on Canvas")]
        public void WhenUserHoversOverButtonInTopicOnCanvas(string buttonName, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topicModelId = page.GetTopicIdByTopicName(topicName);
            _browsers.Active.MoveToElement(page.GetPlusButtonOnSelectedTopicById(topicModelId, buttonName));
        }

        [Then(@"'(.*)' topic is not displayed on Canvas")]
        public void ThenTopicIsNotDisplayedOnCanvas(string topicName)
        {
            var canvas = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(canvas.DisplayedTopicOnCanvas(topicName), $"Topic {topicName} is displayed on Canvas");
        }

        [Then(@"'(.*)' topic is displayed on Canvas")]
        public void ThenTopicIsDisplayedOnCanvas(string topicName)
        {
            var canvas = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(canvas.DisplayedTopicOnCanvas(topicName), $"Topic {topicName} is not displayed on Canvas");
        }

        [Then(@"'(.*)' subtopic is displayed on Canvas")]
        public void ThenSubtopicIsDisplayedOnCanvas(string subtopicName)
        {
            var canvas = _browsers.Active.NowAt<WebEditorPage>();
            subtopicName = subtopicName.AddRandom(_sessionRandom);
            Verify.IsTrue(canvas.DisplayedTopicOnCanvas(subtopicName), $"Topic {subtopicName} is not displayed on Canvas");
        }

        [Then(@"'([^']*)' is a subtopic of '([^']*)' topic on Canvas")]
        public void ThenIsASubtopicOfTopicOnCanvas(string subTopic, string topic)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(page.IsSubTopicOfTopic(subTopic, topic), $"Topic '{subTopic}' is not a subtopic of topic '{topic}'");
        }

        [Then(@"'(.*)' callout is displayed on Canvas")]
        public void ThenCalloutIsDisplayedOnCanvas(string calloutName)
        {
            var canvas = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(canvas.DisplayedTopicOnCanvas(calloutName), $"Topic {calloutName} is not displayed on Canvas");
        }

        [Then(@"'(.*)' subtopic is not displayed on Canvas")]
        public void ThenSubtopicIsNotDisplayedOnTheViewMapPage(string subtopicName)
        {
            var topic = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(topic.DisplayedTopicByName(subtopicName), $"'Subtopic '{subtopicName}' is displayed on the Canvas");
        }

        [Then(@"'(.*)' is outlined with a blue circuit")]
        public void ThenIsOutlinedWithABlueCircuit(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(page.IsBorderDisplayedInTopic(topicName), $"Border is not highlight in '{topicName}' topic");
        }

        [When(@"User clicks '(.*)' topic on Canvas")]
        public void WhenUserClicksTopicOnCanvas(string topicName)
        {
            var topic = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.MoveToElement(topic.GetTopicByName(topicName));
            _browsers.Active.ClickByActions(topic.GetTopicByName(topicName));
        }

        [Then(@"'([^']*)' Topic Center is not overlapped on Canvas")]
        public void ThenTopicCenterIsNotOverlappedOnCanvas(string front)
        {
            var topic = _browsers.Active.NowAt<WebEditorPage>();
            var IsFrontTopic = IsTopicOverlappedBy(topic.GetTopicByName(front).FindElement(By.XPath(topic.TopicParentClass)));
            Verify.IsFalse((bool)IsFrontTopic, $"Topic '{front}' is overlapped by another element'");
        }

        [When(@"User Right clicks on '(.*)' topic")]
        public void WhenUserRightClicksOnTopic(string topicName)
        {
            var topic = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.MoveToElement(topic.GetTopicByName(topicName));
            _browsers.Active.ContextClick(topic.GetTopicByName(topicName));
        }

        [When(@"User clicks to the '([^']*)' topic text on Canvas")]
        public void WhenUserClicksToTheTopicTextOnCanvas(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            page.GetTopicByName(topicName).Click();
        }

        [When(@"User double clicks to the '(.*)' topic text on Canvas")]
        public void WhenUserDoubleClicksToTheTopicTextOnCanvas(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.DoubleClick(page.GetTopicByName(topicName));
        }

        [When(@"User triple clicks to the '(.*)' topic text on Canvas")]
        public void WhenUserTripleClicksToTheTopicTextOnCanvas(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.ActionTripleClick(page.GetTopicByName(topicName));
        }

        [When(@"User remembers '([^']*)' topic model id and name")]
        public void WhenUserRemembersTopicModelId(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _topicDetails.TopicModelIdList.Add(topicName, page.GetTopicIdByTopicName(topicName));
        }

        [When(@"User remembers '([^']*)' topic width size")]
        public void WhenUserRemembersTopicWidthSize(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topicWidth = page.GetTopicByName(topicName).FindElement(By.XPath(page.FillColorInTopic)).GetCssValue("width");
            _topicDetails.TopicWidthSize.Add(new KeyValuePair<string, string>(topicName, topicWidth));
            _topicDetails.TopicWidthSize.Add(new KeyValuePair<string, string>(page.GetTopicIdByTopicName(topicName), topicWidth));
        }

        [Then(@"'([^']*)' topic width changed on Canvas")]
        public void ThenTopicWidthChangedOnCanvas(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topicWidth = page.GetTopicByName(topicName).FindElement(By.XPath(page.FillColorInTopic)).GetCssValue("width");
            var previousWidth = _topicDetails.TopicWidthSize.First(x => x.Key.Equals(topicName)).Value;
            Verify.AreNotEqual(topicWidth, previousWidth, $"'{topicName}' topic width has not changed on Canvas");
        }

        [Then(@"'([^']*)' topic width not changed on Canvas")]
        public void ThenTopicWidthNotChangedOnCanvas(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topicWidth = page.GetTopicByName(topicName).FindElement(By.XPath(page.FillColorInTopic)).GetCssValue("width");
            var topicId = page.GetTopicIdByTopicName(topicName);
            var previousWidth = _topicDetails.TopicWidthSize.First(x => x.Key.Equals(topicId) || x.Key.Equals(topicName)).Value;
            Verify.AreEqual(topicWidth, previousWidth, $"'{topicName}' topic width has not changed on Canvas");
        }

        [When(@"User right clicks '([^']*)' topic on Canvas and hold")]
        public void WhenUserRightClicksTopicOnCanvasAndHold(string topicName)
        {
            var topic = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.MoveToElement(topic.GetTopicByName(topicName));
            _browsers.Active.ActionsContextClickAndHold(topic.GetTopicByName(topicName));
        }

        [When(@"User selects first '([^']*)' and second '([^']*)' topic on Canvas")]
        public void WhenUserSelectsFirstAndSecondTopicOnCanvas(string firstTopic, string secondTopic)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.ActionsPressHoldAndClick(page.GetTopicByName(firstTopic), page.GetTopicByName(secondTopic));
            _browsers.Active.ActionsRelease();
        }

        [When(@"User remembers location of '(.*)' topic on Canvas")]
        public void WhenUserRemembersLocationOfTopicOnCanvas(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topicLocation = page.GetTopicByName(topicName).Location;
            Point point = new Point(topicLocation.X, topicLocation.Y);
            _locWeb.Location = point;
        }

        [Then(@"'(.*)' topic has changed location by X axis on Canvas")]
        public void ThenTopicHasChangedLocationByXAxisOnCanvas(string topicName)
        {
            //TODO waiting for offset
            Thread.Sleep(1000);
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.AreNotEqual(_locWeb.Location.X, page.GetTopicByName(topicName).Location.X, $"Topic '{topicName}' has not changed location by X axis");
        }

        [Then(@"'(.*)' topic has changed location by Y axis on Canvas")]
        public void ThenTopicHasChangedLocationByYAxisOnCanvas(string topicName)
        {
            //TODO waiting for offset
            Thread.Sleep(1000);
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.AreNotEqual(_locWeb.Location.Y, page.GetTopicByName(topicName).Location.Y, $"Topic '{topicName}' has not changed location by Y axis");
        }

        [Then(@"'(.*)' topic has not changed location by X axis on Canvas")]
        public void ThenTopicHasNotChangedLocationByXAxisOnCanvas(string topicName)
        {
            //TODO waiting for offset
            Thread.Sleep(1000);
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var rangeValue = 2;
            var locationXTopicWholeValue = (int)Convert.ToDecimal(page.GetTopicByName(topicName).Location.X);
            var locationXTopicRangeValue = locationXTopicWholeValue >= _locWeb.Location.X - rangeValue && locationXTopicWholeValue <= _locWeb.Location.X + rangeValue;
            Verify.IsTrue(locationXTopicRangeValue, $"Topic '{topicName}' has changed location by X axis");
        }

        [Then(@"'(.*)' topic has not changed location by Y axis on Canvas")]
        public void ThenTopicHasNotChangedLocationByYAxisOnCanvas(string topicName)
        {
            //TODO waiting for offset
            Thread.Sleep(1000);
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var rangeValue = 5;
            var locationYTopicWholeValue = (int)Convert.ToDecimal(page.GetTopicByName(topicName).Location.Y);
            var locationYTopicRangeValue = locationYTopicWholeValue >= _locWeb.Location.Y - rangeValue && locationYTopicWholeValue <= _locWeb.Location.Y + rangeValue;
            Verify.IsTrue(locationYTopicRangeValue, $"Topic '{topicName}' has changed location by Y axis");
        }

        [Then(@"'(.*)' callout is not displayed on Canvas")]
        public void ThenCalloutIsNotDisplayedOnTheViewMapPage(string calloutName)
        {
            var topic = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(topic.DisplayedTopicByName(calloutName), $"Callout '{calloutName}' is displayed on the Canvas");
        }

        [Then(@"focus is not displayed in '(.*)' topic")]
        public void ThenFocusIsNotDisplayedInTopic(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(page.IsBorderDisplayedInTopic(topicName), $"Border is highlight in '{topicName}' topic");
        }

        [Then(@"'(.*)' is displayed with at 50 percent opacity on Canvas")]
        public void ThenIsDisplayedWithAt50PercentOpacityOnTheViewMapPage(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(page.GetTopicByName(topicName).FindElement(By.XPath(page.ThemeTransparency)).GetCssValue("opacity").Equals("0.3"), $"Topic '{topicName}' is not displayed with at 50 percent opacity");
        }

        [Then(@"'([^']*)' topic is displayed with '([^']*)' opacity on Canvas")]
        public void ThenTopicIsDisplayedWithOpacityOnCanvas(string topicName, string opacity)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(page.GetTopicByName(topicName).FindElement(By.XPath(page.ThemeTransparency)).GetCssValue("opacity").Equals(opacity), $"Topic '{topicName}' is not displayed with '{opacity}' opacity");
        }

        [Then(@"Animation transition occurs when changing focus to another topic")]
        public void ThenAnimationTransitionOccursWhenChangingFocusToAnotherTopic()
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(page.TopicAnimationTransition.Displayed(), "Topic animation transition does not occur when changing focus");
        }

        [Then(@"Animation transition does not occur when changing focus to another topic")]
        public void ThenAnimationTransitionDoesNotOccurWhenChangingFocusToAnotherTopic()
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(page.TopicAnimationTransition.Displayed(), "Topic animation transition occurs when changing focus");
        }

        [When(@"User clicks '(.*)' subtopic on Canvas")]
        public void WhenUserClicksSubtopicOnViewMapPage(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.WaitForDataLoading();
            _browsers.Active.WaitForElementToBeDisplayed(page.GetTopicByName(topicName));
            page.GetTopicByName(topicName).Click();
        }

        [When(@"User clicks on Cost icon with value '([^']*)' is displayed on '([^']*)' topic on Canvas")]
        public void WhenUserClicksOnCostIconWithValueIsDisplayedOnTopicOnCanvas(string cost, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topicId = page.GetTopicIdByTopicName(topicName);
            page.GetTopicCostByTopicId(topicId, cost).Click();
        }

        [Then(@"Cost icon with value '([^']*)' is displayed on '([^']*)' topic on Canvas")]
        public void ThenCostIconWithValueIsDisplayedOnTopicOnCanvas(string cost, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topicId = page.GetTopicIdByTopicName(topicName);
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetTopicCostByTopicId(topicId, cost)), $"Topic '{topicName}' does not have cost value '{cost}'");
        }

        [When(@"User mouses over cost icon with value '([^']*)' is displayed on '([^']*)' topic on Canvas")]
        public void WhenUserMousesOverCostIconWithValueIsDisplayedOnTopicOnCanvas(string cost, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topicId = page.GetTopicIdByTopicName(topicName);
            _browsers.Active.MoveToElement(page.GetTopicCostByTopicId(topicId, cost));
        }

        [Then(@"Cost icon with value '([^']*)' is not displayed on '([^']*)' topic on Canvas")]
        public void ThenCostIconWithValueIsNotDisplayedOnTopicOnCanvas(string cost, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topicId = page.GetTopicIdByTopicName(topicName);
            Verify.IsFalse(page.IsCostDisplayedInTopic(topicId, cost), $"Topic '{topicName}' has cost value '{cost}'");
        }

        [Then(@"topic with name '([^']*)' is displayed in place of topic with name '([^']*)'")]
        public void ThenTopicWithNameIsDisplayedInPlaceOfTopicWithName(string firstTopic, string secondTopic)
        {
            var rangeValue = 5;
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var loc = page.GetTopicByName(firstTopic).Location;
            var resultX = loc.X;
            var resultY = loc.Y;
            Verify.IsTrue(_locWeb.Location.X - rangeValue <= resultX && resultX <= _locWeb.Location.X + rangeValue, $"Topic '{firstTopic}'X axis is not as expected");
            Verify.IsTrue(_locWeb.Location.Y - rangeValue <= resultY && resultY <= _locWeb.Location.Y + rangeValue, $"Topic '{firstTopic}'Y axis is not as expected");
        }

        [When(@"User drag the '([^']*)' edge of the '([^']*)' topic by '([^']*)' and '([^']*)' coordinates on Canvas")]
        public void WhenUserDragTheEdgeOfTheTopicByAndCoordinatesOnCanvas(string side, string topicName, int x, int y)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topicId = page.GetTopicIdByTopicName(topicName);
            var topicShape = _browsers.Active.FindElement(By.XPath(string.Format(page.TopicSelectedResizeBySide, topicId, side)));
            _browsers.Active.MoveToElement(topicShape);
            Thread.Sleep(200);//Wait for cursor to change to resize cursor
            _browsers.Active.ActionsClickAndHoldAndMoveToOffset(topicShape, x, y);
            _browsers.Active.MoveByOffset(5, x, y);
            _browsers.Active.ActionsRelease();
        }

        #endregion

        #region Images

        [Then(@"'([^']*)' uploaded image has been rotated by '([^']*)' degrees")]
        public void ThenUploadedImageHasBeenRotatedByDegrees(string imageName, string angleRotation)
        {
            var transformImage = GetBackgroundObjectByName(imageName).GetAttribute("transform");
            var matches = Regex.Matches(transformImage, @"(?<=\().*?(?=\))", RegexOptions.IgnoreCase);
            var coordinates = matches[0].Value.Split(',');
            var rotation = coordinates[0];
            Verify.AreEqual(angleRotation, rotation, $"'{imageName}' Image has not been rotated by '{angleRotation}' degrees");
        }

        [When(@"User clicks and holds '([^']*)' arrow on '([^']*)' image and drags mouse by '([^']*)' and '([^']*)' coordinates")]
        public void WhenUserClicksAndHoldsArrowOnImageAndDragsMouseByAndCoordinates(string arrowPosition, string imageName, int offsetX, int offsetY)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var rotationArrow = GetBackgroundObjectByName(imageName).FindElement(By.XPath(page.GetRotationArrowInShape(arrowPosition)));
            _browsers.Active.ActionsClickAndHold(rotationArrow);
            _browsers.Active.ActionsDragAndDropToOffset(rotationArrow, offsetX, offsetY);
            _browsers.Active.ActionsRelease();
        }

        [When(@"User drags image in '([^']*)' topic and drop to cordinates '([^']*)' x and '([^']*)' y on Canvas")]
        public void WhenUserDragsImageInTopicAndDropToCordinateXAndY(string topicName, int offSetX, int offSetY)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topicImage = page.GetImageInTopic(topicName);
            try
            {
                _browsers.Active.ActionsClickAndHoldElementToOffset(topicImage, 0, 0);
                //Wait for move to occur
                Thread.Sleep(1000);
                _browsers.Active.MoveByOffset(10, offSetX, offSetY);
                _browsers.Active.ActionsRelease();

            }
            catch
            {
                throw new Exception($"Topic '{topicName}' image can not be dragged to coordinates ('{offSetX}','{offSetY}')");
            }
        }

        [When(@"User drags image in '([^']*)' topic and drop onto '([^']*)' topic")]
        public void WhenUserDragsImageInTopicAndDropOntoTopic(string fromTopicName, string toTopicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topicImage = page.GetImageInTopic(fromTopicName);
            var toTopic = page.GetTopicByName(toTopicName);
            try
            {
                _browsers.Active.ActionsClickAndHoldElementToOffset(topicImage, 0, 0);
                //Wait for move to occur
                Thread.Sleep(500);
                _browsers.Active.MoveByOffset(10, 20, 20);
                _browsers.Active.MoveToElement(toTopic);
                _browsers.Active.ActionsRelease();
            }
            catch
            {
                throw new Exception($"Topic '{fromTopicName}' image can not be dragged to Topic '{toTopicName}'");
            }
        }

        [When(@"User drags image in '([^']*)' topic and drop on '([^']*)' side of '([^']*)' topic")]
        public void WhenUserDragsImageInTopicAndDropOnSideOfTopic(string firstTopic, string side, string secondTopic)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topicImage = page.GetImageInTopic(firstTopic);
            var secondTopicLocation = page.GetTopicByName(secondTopic);
            _browsers.Active.ActionsClickAndHoldElementToOffset(topicImage, 0, 0);
            _browsers.Active.MoveByOffset(10, 20, 20);
            _browsers.Active.MoveToElement(secondTopicLocation);
            //Wait for Movement
            Thread.Sleep(500);

            if (side.Equals("top"))
            {
                _browsers.Active.ActionsMoveToElementByOffset(secondTopicLocation, 20, 0);
            }

            if (side.Equals("bottom"))
            {
                _browsers.Active.ActionsMoveToElementByOffset(secondTopicLocation, 0, 20);
            }

            if (side.Equals("left"))
            {
                _browsers.Active.ActionsMoveToElementByOffset(secondTopicLocation, -30, 10);
            }

            if (side.Equals("right"))
            {
                _browsers.Active.ActionsMoveToElementByOffset(secondTopicLocation, 30, -10);
            }
            //Wait for topic drop point to appear
            Thread.Sleep(500);
            _browsers.Active.ActionsRelease();

        }

        [When(@"User drags image in '([^']*)' topic and drop on '([^']*)' topic on coordinates '([^']*)' '([^']*)'")]
        public void WhenUserDragsImageInTopicAndDropOnTopicOnCoordinates(string firstTopic, string secondTopic, int x, int y)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topicImage = page.GetImageInTopic(firstTopic);
            var secondTopicLocation = page.GetTopicByName(secondTopic);
            _browsers.Active.ActionsClickAndHoldElementToOffset(topicImage, 0, 0);
            _browsers.Active.MoveByOffset(10, 20, 20);
            _browsers.Active.MoveToElement(secondTopicLocation);
            //Wait for Movement
            Thread.Sleep(500);
            _browsers.Active.ActionsMoveToElementByOffset(secondTopicLocation, x, y);
            //Wait for topic drop point to appear
            Thread.Sleep(500);
            _browsers.Active.ActionsRelease();
        }

        [Then(@"image is located on '([^']*)' side in '([^']*)' topic on Canvas")]
        public void ThenImageIsLocatedOnSideInTopicOnCanvas(string side, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topicImageLocation = page.GetImageInTopic(topicName).Location;
            var topicLocation = page.GetTopicByName(topicName).Location;

            if (side.Equals("top"))
            {
                Verify.IsTrue(topicImageLocation.Y < topicLocation.Y, $"Image is not location on '{side}' side in '{topicName}' topic");
            }

            if (side.Equals("bottom"))
            {
                Verify.IsTrue(topicImageLocation.Y > topicLocation.Y, $"Image is not location on '{side}' side in '{topicName}' topic");
            }

            if (side.Equals("left"))
            {
                Verify.IsTrue(topicImageLocation.X < topicLocation.X, $"Image is not location on '{side}' side in '{topicName}' topic");
            }

            if (side.Equals("right"))
            {
                Verify.IsTrue(topicImageLocation.X > topicLocation.X, $"Image is not location on '{side}' side in '{topicName}' topic");
            }
        }

        [When(@"User remembers '([^']*)' topic image on Canvas")]
        public void WhenUserRemembersTopicImageOnCanvas(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topicImageRef = page.GetImageInTopic(topicName).GetAttribute("xlink:href");
            _topicDetails.TopicImageRef.Add(new KeyValuePair<string, string>(topicName, topicImageRef));
        }

        [Then(@"image from '([^']*)' topic is displayed in '([^']*)' topic")]
        public void ThenImageFromTopicIsDisplayedInTopic(string firsTopic, string secondTopic)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var secondtopicImageRef = page.GetImageInTopic(secondTopic).GetAttribute("xlink:href");
            Verify.AreEqual(secondtopicImageRef, _topicDetails.TopicImageRef.First(x => x.Key.Equals(firsTopic)).Value, $"image from '{firsTopic}' topic is not displayed in '{secondTopic}' topic");
        }

        [Then(@"image from '([^']*)' topic is displayed as background image on Canvas")]
        public void ThenImageFromTopicIsDisplayedAsBackgroundImageOnCanvas(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topicImageRef = _topicDetails.TopicImageRef.First(x => x.Key.Equals(topicName)).Value;
            var lastAddedImageOnCanvas = page.ImageOnCanvas.Last();
            var imageRef = lastAddedImageOnCanvas.GetAttribute("xlink:href");
            Verify.IsTrue(imageRef.Equals(topicImageRef), $"image from '{topicName}' topic is not displayed on Canvas background");
        }

        [When(@"User drags and drops '([^']*)' point on '([^']*)' image by coordinates '([^']*)' and '([^']*)'")]
        public void WhenUserDragsAndDropsPointOnImageByCoordinatesAnd(string pointPosition, string imageName, int offsetX, int offsetY)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var pointOnImage = GetBackgroundObjectByName(imageName).FindElement(By.XPath(page.GetPointPositionOnShape(pointPosition)));
            _browsers.Active.ActionMoveToElement(pointOnImage);
            _browsers.Active.ActionsClickAndHold(pointOnImage);
            _browsers.Active.ActionsDragAndDropToOffset(pointOnImage, offsetX, offsetY);
            _browsers.Active.ActionsReleaseElement(pointOnImage);
        }

        [When(@"User clicks on the '([^']*)' image and drags mouse by '([^']*)' and '([^']*)' coordinates")]
        public void WhenUserClicksOnTheImageAndDragsMouseByAndCoordinates(string imageName, int offsetX, int offsetY)
        {
            var image = GetBackgroundObjectByName(imageName);
            _browsers.Active.ActionsDragElementToOffset(image, offsetX, offsetY);
            _browsers.Active.ActionsRelease();
        }

        [Then(@"'([^']*)' Images with name '([^']*)' are displayed on Canvas")]
        public void ThenImagesWithNameAreDisplayedOnCanvas(int Count, string imageName)
        {
            var canvas = _browsers.Active.NowAt<WebEditorPage>();
            var selector = canvas.ImageOnCanvas;
            var backgroundObjectRef = _backgroundObjectList.ImageRef.First(x => x.Key.Equals(imageName)).Value;
            var imageCount = selector.Count(x => x.GetAttribute("xlink:href").Equals(backgroundObjectRef));
            Verify.AreEqual(Count, imageCount, $"Image count is '{imageCount}' rather than '{Count}'");
        }

        [Then(@"'([^']*)' image with approximate '([^']*)' width and approximate '([^']*)' height is displayed on page")]
        public void ThenImageWithApproximateWidthAndApproximateHeightIsDisplayedOnPage(string imageName, int shapeWidth, int shapeHeight)
        {
            var rangeValue = 5;
            var width = GetBackgroundObjectByName(imageName).FindElement(By.XPath("./*")).GetAttribute("width");
            var height = GetBackgroundObjectByName(imageName).FindElement(By.XPath("./*")).GetAttribute("height");
            var widthWholeValue = (int)Convert.ToDecimal(width);
            var heightWholeValue = (int)Convert.ToDecimal(height);
            Verify.IsTrue(Enumerable.Range(widthWholeValue - rangeValue, widthWholeValue + rangeValue).Contains(shapeWidth), $"Image '{imageName}' width is displayed incorrectly. Expected width:'{shapeWidth}' Actual Width: '{width}' ");
            Verify.IsTrue(Enumerable.Range(heightWholeValue - rangeValue, heightWholeValue + rangeValue).Contains(shapeHeight), $"Image '{imageName}' height is displayed incorrectly.Expected Height:'{shapeHeight}' Actual Height: '{height}'");
        }

        [Then(@"'([^']*)' image is displayed on Canvas")]
        public void ThenImageIsDisplayedOnCanvas(string image)
        {
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(GetBackgroundObjectByName(image)), $"Image '{image}' is not displayed on Canvas");
        }

        [Then(@"'([^']*)' image is highlighted in green frame on Canvas")]
        public void ThenImageIsHighlightedInGreenFrameOnCanva(string image)
        {
            var canvas = _browsers.Active.NowAt<WebEditorPage>();
            var backgroundImage = GetBackgroundObjectByName(image).GetAttribute("transform");
            Verify.IsTrue(canvas.IsGreenHighlightedFrameDisplayed(backgroundImage), $"Image '{image}' is not highlighted green frame");
        }

        [When(@"User selects images from first '([^']*)' and second '([^']*)' topic on Canvas")]
        public void WhenUserSelectsImagesFromFirstAndSecondTopicOnCanvas(string firstTopic, string secondTopic)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.ActionsPressHoldAndClick(page.GetImageInTopic(firstTopic), page.GetImageInTopic(secondTopic));
            _browsers.Active.ActionsRelease();
        }

        [When(@"User remembers location of image in '([^']*)' topic")]
        public void WhenUserRemembersLocationOfImageInTopic(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topicImageLocation = page.GetImageInTopic(topicName).Location;
            _locWebList.ListOfImageLocations[topicName] = topicImageLocation;
        }

        [Then(@"image in '([^']*)' topic has changed location by X axis on Canvas")]
        public void ThenImageInTopicHasChangedLocationByXAxisOnCanvas(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.AreNotEqual(_locWebList.ListOfImageLocations[topicName].X, page.GetImageInTopic(topicName).Location.X, $"Image in Topic '{topicName}' has not changed location by X axis");
        }

        [Then(@"image in '([^']*)' topic has changed location by Y axis on Canvas")]
        public void ThenImageInTopicHasChangedLocationByYAxisOnCanvas(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.AreNotEqual(_locWebList.ListOfImageLocations[topicName].Y, page.GetImageInTopic(topicName).Location.Y, $"Image in Topic '{topicName}' has not changed location by Y axis");
        }

        [Then(@"image in '([^']*)' topic has not changed location by X axis on Canvas")]
        public void ThenImageInTopicHasNotChangedLocationByXAxisOnCanvas(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.AreEqual(_locWebList.ListOfImageLocations[topicName].X, page.GetImageInTopic(topicName).Location.X, $"Image in Topic '{topicName}' has changed location by X axis");
        }

        [Then(@"image in '([^']*)' topic has not changed location by Y axis on Canvas")]
        public void ThenImageInTopicHasNotChangedLocationByYAxisOnCanvas(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.AreEqual(_locWebList.ListOfImageLocations[topicName].Y, page.GetImageInTopic(topicName).Location.Y, $"Image in Topic '{topicName}' has changed location by Y axis");
        }

        [Then(@"attached image with tooltip '(.*)' is displayed in '(.*)' topiс")]
        public void ThenAttachedImageWithTooltipIsDisplayedInTopiс(string tooltip, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.ActionsMoveToElementByOffset(page.GetAttachmentsIconInTopicInfobox(topicName), 1, 1);
            var content = _browsers.Active.Component<Tooltip>().GetTooltipContent();
            Verify.IsTrue(content.Contains(tooltip), $"{tooltip} is not displayed in attached image in {topicName} topic");
        }

        [Then(@"image is displayed in '([^']*)' topiс on Canvas")]
        public void ThenImageIsDisplayedInTopiс(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            topicName = topicName.AddRandom(_sessionRandom);
            Verify.IsTrue(page.IsImageDisplayedInTopic(topicName), $"Image is not displayed in {topicName}");
        }

        [Then(@"image is not displayed in '([^']*)' topiс on Canvas")]
        public void ThenImageIsNotDisplayedInTopiс(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(page.IsImageDisplayedInTopic(topicName), $"Image is displayed in {topicName}");
        }

        [When(@"User drops image on the ([^']*) side of '([^']*)' topic by '([^']*)' and '([^']*)' coordinates on Canvas")]
        public void WhenUserDropsImageOnTheSideOfTopicByAndCoordinatesOnCanvas(string side, string topicName, int offsetX, int offsetY)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            page.DropImageToTopicSideByTopicName(side, topicName, offsetX, offsetY);
        }

        [When(@"User clicks on thumbnail button on '([^']*)' topic image")]
        public void WhenUserClicksOnThumbnailButtonOnTopicImage(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            page.GetImageInTopic(topicName).FindElement(By.XPath(page.TopicThumbnailImageButton)).Click();
        }

        [When(@"User clicks on image in '([^']*)' topic")]
        public void WhenUserClicksOnImageInTopic(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            page.GetImageInTopic(topicName).Click();
        }

        [When(@"User clicks on '([^']*)' uploaded image on Canvas")]
        public void WhenUserClicksOnUploadedImageOnCanvas(string imageName)
        {
            GetBackgroundObjectByName(imageName).Click();
        }

        [Then(@"image in '([^']*)' topic is in '([^']*)' type")]
        public void ThenImageInTopicIsInType(string topicName, string imageType)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.AreEqual(imageType, page.GetImageTypeInTopic(topicName), $"Image in {topicName} topic is not in {imageType} mode");
        }

        [When(@"User hovers on image in '([^']*)' topic on Canvas")]
        public void WhenUserHoversOnImageInTopicOnCanvas(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.MoveToElement(page.GetImageInTopic(topicName));
        }

        [Then(@"image in '([^']*)' topic has approximate '([^']*)' width and approximate '([^']*)' height")]
        public void ThenImageInTopicHasWidthAndHeight(string topicName, int width, int height)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var rangeValue = 1;
            var widthWholeValue = (int)Convert.ToDecimal(page.GetImageInTopic(topicName).GetAttribute("width"));
            var heightWholeValue = (int)Convert.ToDecimal(page.GetImageInTopic(topicName).GetAttribute("height"));
            Verify.IsTrue(widthWholeValue - rangeValue <= width && width <= widthWholeValue + rangeValue, $"Image in topic {topicName} does not have width {width}. Actual Width: {widthWholeValue}");
            Verify.IsTrue(heightWholeValue - rangeValue <= height && height <= heightWholeValue + rangeValue, $"Image in topic {topicName} does not have width {height}. Actual Width: {heightWholeValue}");
        }

        [Then(@"image border is highlighted in '([^']*)' color with '([^']*)' opacity in '([^']*)' topic on Canvas")]
        public void ThenImageIsHighlightedInColorWithOpacityInTopic(string color, string opacity, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            //Primary selected Border opacity=1, secondary selected topic and hoverBorder opacity =0.5. TC: WEB-427
            var selector = opacity == "1" ? page.TopicImageSelectedBorder : page.TopicImageHoverBorder;
            var stroke = page.GetTopicByName(topicName).FindElement(By.XPath(selector)).GetCssValue("stroke");
            var strokeOpacity = page.GetTopicByName(topicName).FindElement(By.XPath(selector)).GetAttribute("stroke-opacity");
            Verify.AreEqual(stroke, color, $"{topicName} topic is not highlighted in {color} color. Actual:{stroke}");
            Verify.AreEqual(strokeOpacity, opacity, $"{topicName} topic highlighted boundary is not of {opacity} opacity. Actual:{strokeOpacity}");
        }

        [Then(@"image is highlighted in '([^']*)' color with '([^']*)' opacity in '([^']*)' topic on Canvas")]
        public void ThenImageIsHighlightedInColorWithOpacityInTopicOnCanvas(string color, string opacity, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topicId = _topicDetails.TopicModelIdList[topicName];
            //Primary selected Border opacity=1, secondary selected topic and hoverBorder opacity =0.5. TC: WEB-427
            var selector = opacity == "1" ? page.TopicImageSelectedBorderByTopicId(topicId) : page.TopicImageHoverBorderByTopicId(topicId);
            var element = _browsers.Active.FindElement(By.XPath(selector));
            Verify.IsTrue(element.Displayed, $"{topicName} topic-image border is not visible on the Canvas");
            var stroke = element.GetCssValue("stroke");
            var strokeOpacity = element.GetAttribute("stroke-opacity");
            Verify.AreEqual(stroke, color, $"{topicName} topic is not highlighted in {color} color. Actual:{stroke}");
            Verify.AreEqual(strokeOpacity, opacity, $"{topicName} topic highlighted boundary is not of {opacity} opacity. Actual:{strokeOpacity}");
        }

        [Then(@"Image is selected on '([^']*)' topic")]
        public void ThenImageIsSelectedTopic(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var SelectedBorder = page.GetTopicByName(topicName).FindElement(By.XPath(page.TopicImageSelectedBorder));
            Verify.IsTrue(SelectedBorder.Displayed, "Selected border is not displayed for topic image");
        }

        [When(@"User right clicks on image in '([^']*)' topic on Canvas")]
        public void WhenUserRightClicksOnImageInTopic(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.MoveToElement(page.GetImageInTopic(topicName));
            _browsers.Active.ContextClick(page.GetImageInTopic(topicName));
        }

        [Then(@"image in topiсs '([^']*)' and '([^']*)' are same")]
        public void ThenImageInTopiсsAndAreSame(string topic1, string topic2)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var imageInTopcic1 = page.GetImageInTopic(topic1).GetAttribute("xlink:href");
            var imageInTopcic2 = page.GetImageInTopic(topic2).GetAttribute("xlink:href");
            Verify.AreEqual(imageInTopcic1, imageInTopcic2, $"Image in topic {topic1} and {topic2} are not same");
        }

        [Then(@"Transparency of '([^']*)' image on Canvas is '([^']*)'")]
        public void WhenTransparencyOfImageOnCanvasIs(string imageName, string opacity)
        {
            var imageOpacity = GetBackgroundObjectByName(imageName).FindElement(By.XPath("./*")).GetAttribute("opacity");
            Verify.AreEqual(opacity, imageOpacity, $"Transparency of {imageName} is not {opacity})");
        }

        #endregion

        #region Topics Text

        [Then(@"User checks the text in the topic")]
        public void ThenUserChecksTheTextInTheTopic()
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            string textInTopic = page.SelectTextInTopic.Text.Replace("Test", "");
            string rememberеtext = _valuesText.Value;
            Verify.AreEqual(textInTopic, rememberеtext.Trim(), "Incorrect text format");
        }

        [Then(@"'([^']*)' topic text container width is '([^']*)'")]
        public void ThenTopicTextContainerWidthIs(string topicName, string width)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var containerWidth = page.GetTextContainerByTopicByName(topicName).GetAttribute("width");
            Verify.IsTrue(containerWidth.Contains(width), $"'{topicName}' topic text container width is not '{width}'. Actual: '{containerWidth}'");
        }

        [Then(@"text '(.*)' is displayed to the topic on Canvas")]
        public void ThenTextIsDisplayedToTheTopicOnCanvas(string text)
        {
            var topic = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(topic.DisplayedTextInTopic(text), $"Text '{text}' is not displayed in the topic on Canvas");
        }

        [Then(@"text '([^']*)' is not displayed to the topic on Canvas")]
        public void ThenTextIsNotDisplayedToTheTopicOnCanvas(string text)
        {
            var topic = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(topic.DisplayedTextInTopic(text), $"Text '{text}' is displayed in the topic on Canvas");
        }

        [When(@"User clicks on text in the '(.*)' topic on Canvas")]
        public void WhenUserClicksOnTextInTheOnTheViewMapPage(string topicName)
        {
            var text = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.ClickByActions(text.GetTopicByName(topicName));
        }

        [When(@"User clicks and hold editable cursor and moves by '([^']*)' '([^']*)' coordinates on Canvas")]
        public void WhenUserClicksAndHoldEditableCursorAndMovesByCoordinatesOnCanvas(int offsetX, int offsetY)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.MoveToElement(page.CursorInTopic);
            _browsers.Active.ActionsClickAndHoldAndMoveToOffset(page.CursorInTopic, offsetX, offsetY);
            _browsers.Active.MoveByOffset(5, offsetX, offsetY);
            _browsers.Active.ActionsRelease();
        }

        [When(@"User enters '(.*)' characters to the topic")]
        public void WhenUserEntersCharactersToTheTopic(int tnumberOfCharacters)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var text = TestDataGenerator.GenerateRandomTextWithSpaces(tnumberOfCharacters).Replace("#", "").Replace("@", "");
            _browsers.Active.WaitForElementToBeDisplayed(page.CursorInTopic);
            _browsers.Active.SendKeysByActions(text);
            _valuesText.Value = text;
        }

        [Then(@"'(.*)' topic text is highlighted '(.*)' color")]
        public void ThenTopicTextIsHighlightedColor(string topicName, string color)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var lineHeightInTopic = page.GetTextContentInTopicByName(topicName).GetCssValue("height");
            var removePxInLineHeightInTopic = lineHeightInTopic.Replace("px", "");
            var searchElement = page.SearchHighlightsList.First(x => x.GetAttribute("height").Equals(removePxInLineHeightInTopic));
            var searchElementById = searchElement.GetAttribute("id");
            var searchItemColor = searchElement.GetAttribute("fill");
            Verify.AreEqual(searchItemColor, color, $"Topic '{topicName}' is not highlighted '{color}' color");
        }

        [Then(@"'(.*)' topic text is displayed '(.*)' style")]
        public void ThenTopicTextIsDisplayedStyle(string topicName, string fontStyle)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topic = page.GetTopicByName(topicName);
            Verify.IsTrue(page.ValidateTopicTextDecorationStyle(topic, fontStyle), $"Topic text '{topicName}' is not displayed '{fontStyle}' style on Canvas");
        }

        [Then(@"'(.*)' topic text has '(.*)' color on Canvas")]
        public void ThenTopicTextHasColorOnCanvas(string topicName, string textColor)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(page.ValidateTopicTextColor(page.GetTopicByName(topicName), textColor), $"Topic text '{topicName}' has not '{textColor}' color");
        }

        [Then(@"'(.*)' topic text has '(.*)' size")]
        public void ThenTopicTextHasSize(string topicName, string textSize)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(page.ValidateTopicTextSize(page.GetTopicByName(topicName), textSize), $"Topic text '{topicName}' has not '{textSize}' size.'");
        }

        [Then(@"'([^']*)' topic text is aligned '([^']*)'")]
        public void ThenTopicTextIsAligned(string topicName, string Postion)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var alignmentPostion = page.GetTextAlignPosition(Postion);
            var test = page.GetTopicByName(topicName).GetCssValue("text-align");
            Verify.AreEqual(page.GetTopicByName(topicName).GetCssValue("text-align"), alignmentPostion, $"'{topicName}' topic text is not aligned '{alignmentPostion}'");
        }

        [Then(@"'(.*)' topic text is displayed  '(.*)' in font")]
        public void ThenTopicTextIsDisplayedInFont(string topicName, string textStyle)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(page.ValidateTopicTextFontStyle(page.GetTopicByName(topicName), textStyle), $"Topic text '{topicName}' has not '{textStyle}' style");
        }

        [Then(@"text '([^']*)' has font size of '([^']*)' in the '([^']*)' topic on Canvas")]
        public void ThenTextHasFontSizeOfInTheOnCanvas(string text, string size, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topic = page.GetTopicBySubTextAndModelId(_topicDetails.TopicModelIdList[topicName], text);
            Verify.IsTrue(page.ValidateTopicTextSize(topic, size), $"Topic text '{topicName}' has not '{size}' size.'");
        }

        [Then(@"text '([^']*)' is displayed in '([^']*)' font in the '([^']*)' topic on Canvas")]
        public void ThenTextIsDisplayedInFontInTheOnCanvas(string text, string font, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topic = page.GetTopicBySubTextAndModelId(_topicDetails.TopicModelIdList[topicName], text);
            Verify.IsTrue(page.ValidateTopicTextFontStyle(topic, font), $"Topic text '{topicName}' has not '{font}' style in topic '{topicName}'");
        }

        [Then(@"text '([^']*)' is displayed '([^']*)' style in the '([^']*)' topic on Canvas")]
        public void ThenTextIsDisplayedStyleInTheOnCanvas(string text, string fontStyle, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topic = page.GetTopicBySubTextAndModelId(_topicDetails.TopicModelIdList[topicName], text);
            var isTextInStyle = page.ValidateTopicTextDecorationStyle(topic, fontStyle);
            Verify.IsTrue(isTextInStyle, $"Topic text '{topicName}' is not displayed '{fontStyle}' style in topic '{topicName}' on Canvas");
        }

        [Then(@"text '([^']*)' has '([^']*)' color in the '([^']*)' topic on Canvas")]
        public void ThenTextHasColorInTheOnCanvas(string text, string textColor, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topic = page.GetTopicBySubTextAndModelId(_topicDetails.TopicModelIdList[topicName], text);
            Verify.IsTrue(page.ValidateTopicTextColor(topic, textColor), $"Topic text '{text}' has not '{textColor}' color in topic '{topicName}'");
        }

        [When(@"User remembers '([^']*)' text color in '([^']*)' topic on Canvas")]
        public void WhenUserRemembersTopicTextColor(string text, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topicTextColor = page.GetTopicBySubTextAndModelId(_topicDetails.TopicModelIdList[topicName], text).GetCssValue("color");
            _topicDetails.TopicTextColor.Add(new KeyValuePair<string, string>(text, topicTextColor));
        }

        [Then(@"'([^']*)' topic text color is changed on '([^']*)' Topic")]
        public void ThenTopicTextColorIsChangedOnTopic(string text, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topicTextColor = page.GetTopicBySubTextAndModelId(_topicDetails.TopicModelIdList[topicName], text).GetCssValue("color");
            var previousColor = _topicDetails.TopicTextColor.First(x => x.Key.Equals(text)).Value;
            Verify.AreNotEqual(topicTextColor, previousColor, $"'{topicName}' topic text color has not changed on Canvas");
        }

        [When(@"User remembers location of text in '([^']*)' topic")]
        public void WhenUserRemembersLocationOfTextInTopic(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topicTextLocation = page.GetTextContentInTopicByName(topicName).Location;
            _locWebList.ListOfTextLocations[topicName] = topicTextLocation;
        }

        [Then(@"text in '([^']*)' topic has changed location by X axis on Canvas")]
        public void ThenTextInTopicHasChangedLocationByXAxisOnCanvas(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.AreNotEqual(_locWebList.ListOfTextLocations[topicName].X, page.GetTextContentInTopicByName(topicName).Location.X, $"Text in Topic '{topicName}' has not changed location by X axis");
        }

        [Then(@"text in '([^']*)' topic has changed location by Y axis on Canvas")]
        public void ThenTextInTopicHasChangedLocationByYAxisOnCanvas(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.AreNotEqual(_locWebList.ListOfTextLocations[topicName].Y, page.GetTextContentInTopicByName(topicName).Location.Y, $"Text in Topic '{topicName}' has not changed location by Y axis");
        }

        [Then(@"text in '([^']*)' topic has not changed location by X axis on Canvas")]
        public void ThenTextInTopicHasNotChangedLocationByXAxisOnCanvas(string topicName)
        {
            //TODO waiting for offset
            Thread.Sleep(1000);
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.AreEqual(_locWebList.ListOfTextLocations[topicName].X, page.GetTextContentInTopicByName(topicName).Location.X, $"Text in Topic '{topicName}' has changed location by X axis");
        }

        [Then(@"text in '([^']*)' topic has not changed location by Y axis on Canvas")]
        public void ThenTextInTopicHasNotChangedLocationByYAxisOnCanvas(string topicName)
        {
            //TODO waiting for offset
            Thread.Sleep(1000);
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.AreEqual(_locWebList.ListOfTextLocations[topicName].Y, page.GetTextContentInTopicByName(topicName).Location.Y, $"Text in Topic '{topicName}' has changed location by Y axis");
        }

        [When(@"User enters '(.*)' text to the topic on Canvas")]
        public void WhenUserEntersTextToTheTopicOnCanvas(string value)
        {
            var topic = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.WaitForElementToBeDisplayed(topic.CursorInTopic);
            _browsers.Active.SendKeysByActions(value);
        }

        [When(@"User enters '([^']*)' by character to the '([^']*)' topic on Canvas")]
        public void WhenUserEntersByCharacterToTheTopicOnCanvas(string text, string topicName)
        {
            var topic = _browsers.Active.NowAt<WebEditorPage>();
            topic.GetTopicByName(topicName).SendKeysByCharacter(text);
        }

        [Then(@"linebreak occurs in topic between '([^']*)' and '([^']*)' text")]
        public void ThenLinebreakOccursInTopicBetweenAndText(string firstPart, string secondPart)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(page.GetTopicLineBreak(firstPart, secondPart).Displayed(), $"There is no line break in '{firstPart}{secondPart}' topic");
        }

        [Then(@"'([^']*)' topic line color is '([^']*)' on Canvas")]
        public void ThenTopicLineColorIsOnCanvas(string topicName, string color)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topicId = _topicDetails.TopicModelIdList[topicName];
            var topicLineColor = page.GetTopicConnectionLineById(topicId).GetCssValue("stroke");
            Verify.AreEqual(topicLineColor, color, $"'{color}' color is not displayed in '{topicName}' topic connection line");
        }
        #endregion

        #region Cursor

        [When(@"User moves Side panel resizable handle by '([^']*)' '([^']*)' coordinates")]
        public void WhenUserMovesSidePanelResizableHandleByCoordinates(int offsetX, int offsetY)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var handle = page.SidePanelResizableHandle;
            _browsers.Active.MoveToElement(handle);
            _browsers.Active.ActionsClickAndHoldAndMoveToOffset(handle, offsetX, offsetY);
            _browsers.Active.MoveByOffset(5, offsetX, offsetY);
            _browsers.Active.ActionsRelease();
        }

        [When(@"User moves cursor by '(.*)' '(.*)' coordinates on Canvas")]
        public void WhenUserMovesCursorByCoordinatesToViewMapPage(int offsetX, int offsetY)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.MoveByOffset(3, offsetX, offsetY);
            //wait for move to occur
            Thread.Sleep(1000);
        }

        [Then(@"cursor relationship is not displayed to the '(.*)' topics on Canvas")]
        public void ThenCursorRelationshipIsNotDisplayedToTheTopicsOnTheViewMapPage(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topic = page.GetTopicByName(topicName);
            Verify.IsFalse(topic.IsElementExists(By.XPath(page.RelationshipInTopic)), $"Relationship is displayed in '{topicName}' topic");
        }

        [When(@"User hovers cursor the '(.*)' topic")]
        public void WhenUserHoversCursorTheTopic(string topicName)
        {
            var canvas = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.ActionMoveToElement(canvas.GetTopicByName(topicName));
        }

        [Then(@"Magnifier Cursor is displayed on Canvas")]
        public void ThenMagnifierCursorIsDisplayedOnCanvas()
        {
            var canvas = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(canvas.MagnifierCursor), "Magnifier Cursor is not displayed on Canvas");
        }

        [Then(@"Magnifier Cursor is not displayed on Canvas")]
        public void ThenMagnifierCursorIsNotDisplayedOnCanvas()
        {
            var canvas = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(_browsers.Active.IsElementDisplayed(canvas.MagnifierCursor), "Magnifier Cursor is displayed on Canvas");
        }

        [Then(@"text cursor is not displayed on Canvas")]
        public void ThenTextCursorIsNotDisplayedOnCanvas()
        {
            var topic = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(topic.CursorInTopic.IsAttributePresent("contenteditable"), "Text cursor is displayed on canvas");
        }

        [Then(@"hand cursor icon is displayed on Canvas")]
        public void ThenHandCursorIconIsDisplayedOnCanvas()
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.HandCursor), "Hand cursor icon is not displayed on canvas");
        }

        [Then(@"hand cursor icon is not displayed on Canvas")]
        public void ThenHandCursorIconIsNotDisplayedOnCanvas()
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(_browsers.Active.IsElementDisplayed(page.HandCursor), "Hand cursor icon is displayed on canvas");
        }

        [When(@"User moves cursor mouse on Canvas")]
        public void WhenUserMovesCursorMouseOnTheViewMapPage()
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.MoveToElement(page.BodyContainer);
            //TODO waiting for cursor to point on topic side
            Thread.Sleep(1000);
        }

        [When(@"User mouses over clickable area by '([^']*)' and '([^']*)' coordinates  on Canvas")]
        public void WhenUserMousesOverClickableAreaByAndCoordinatesOnCanvas(int offsetX, int offsetY)
        {
            _browsers.Active.MoveByOffset(20, offsetX, offsetY);
            //TODO waiting for cursor to point on topic side
            Thread.Sleep(500);
        }

        [When(@"User  clicks and holds at coordinates '([^']*)' and '([^']*)' and moves mouse by '([^']*)' and '([^']*)' coordinates and release on Canvas")]
        public void WhenUserClicksAndHoldsAtCoordinatesAndAndMovesMouseByAndCoordinatesAndReleaseOnCanvas(int startX, int startY, int endX, int endY)
        {
            _browsers.Active.MoveByOffsetAndClickAndHold(startX, startY);
            _browsers.Active.MoveByOffset(3, endX, endY);
            _browsers.Active.ActionsRelease();
        }

        [When(@"User scrolls the map down")]
        public void WhenUserScrollsTheMapDown()
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.ScrollGridToTheEnd(_browsers.Active.FindElement(By.XPath(page.Canvas)));
            //wait for scoll to complete
            Thread.Sleep(3000);
        }

        [When(@"User scrolls the map up")]
        public void WhenUserScrollsTheMapUp()
        {
            //wait for page to be stable
            Thread.Sleep(3000);
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.ScrollGridToTheTop(_browsers.Active.FindElement(By.XPath(page.Canvas)));
            //wait for scoll to complete
            Thread.Sleep(3000);
        }
        #endregion

        #region Others

        [When(@"User clicks Relationship label on Canvas")]
        public void WhenUserClicksRelationshipLabelOnCanvas()
        {
            var relationshipLabel = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.WaitForElementToBeDisplayed(relationshipLabel.RelationshipLabel);
            relationshipLabel.RelationshipLabel.Click();
        }

        [Then(@"Three dots button is displayed in '([^']*)' Topic with X value '([^']*)' and Y value '([^']*)'")]
        public void ThenThreeDotsButtonIsDisplayedInTopicWithXValueAndYValue(string topicName, string xValue, string yValue)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var getIconXvalue = page.GetInfoCardButtonPosition(topicName).GetAttribute("rx");
            var getIconYvalue = page.GetInfoCardButtonPosition(topicName).GetAttribute("ry");
            Verify.AreEqual(xValue, getIconXvalue, $"Three dots button is not displayed in '{topicName}' topic");
            Verify.AreEqual(yValue, getIconYvalue, $"Three dots button is not displayed in '{topicName}' topic");
        }

        [Then(@"Three dots button is displayed in '(.*)' Topic infobox")]
        public void ThenThreeDotsButtonIsDisplayedInTopicInfobox(string topicName)
        {
            var topicInfobox = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(topicInfobox.GetInfoCardButtonInTopicInfobox(topicName)), $"Three dots button is not displayed of the '{topicName}' topic infobox");
        }

        [Then(@"Three dots button is not displayed in '(.*)' Topic infobox")]
        public void ThenThreeDotsButtonIsNotDisplayedInTopicInfobox(string topicName)
        {
            var topicInfobox = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(topicInfobox.IsInfoCardButtonDisplayedInTopicInfobox(topicName), $"Three dots button is displayed of the '{topicName}' topic infobox");
        }

        [When(@"User Right clicks on three dots button in '([^']*)' topic infobox")]
        public void WhenUserRightClicksOnThreeDotsButtonInTopicInfobox(string topicName)
        {
            var topicInfobox = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.MoveToElement(topicInfobox.GetInfoCardButtonInTopicInfobox(topicName));
            _browsers.Active.ContextClick(topicInfobox.GetInfoCardButtonInTopicInfobox(topicName));
        }

        [When(@"User clicks Three dots button in '([^']*)' Topic infobox")]
        public void WhenUserClicksThreeDotsButtonInTopicInfobox(string topicName)
        {
            var topicInfobox = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.MoveToElement(topicInfobox.GetInfoCardButtonInTopicInfobox(topicName));
            topicInfobox.GetInfoCardButtonInTopicInfobox(topicName).Click();
        }

        [Then(@"text is truncated and ellipsis '([^']*)' is displayed in Topic")]
        public void ThenTextIsTruncatedAndEllipsisIsDisplayedInTopic(string ellipsis)
        {
            var topicInfo = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(topicInfo.DisplayedTopicOnCanvas(ellipsis), $"Text is not truncated and ellipsis '{ellipsis}' is not displayed in Topic");
        }

        #region Handles Menu of Flowchart Mode
        [Then(@"Handles menu of flowchart mode is displayed on Canvas")]
        public void ThenHandlesMenuOfFlowchartModeIsDisplayedOnCanvas()
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(_browsers.Active.IsElementDisplayed(page.FlowChartModeHandlesMenu), "Handles menu of flowchart mode is not displayed on Canvas");
        }

        [When(@"User selects '([^']*)' shape icon in handles menu of flowchart mode on Canvas")]
        public void WhenUserSelectsShapeInTheFlowchartTopicHandleOnCanvas(string shape)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            page.GetIconByShapeNameInHandlesMenu(shape).Click();
        }
        #endregion

        #region Share context menu

        [When(@"User clicks on the '(.*)' button in Share context menu")]
        public void WhenUserClicksOnTheButtonInShareContextMenu(string buttonName)
        {
            var popup = _browsers.Active.NowAt<WebEditorPage>();
            popup.GetButtonByNameInContextMenuShare(buttonName).Click();
        }
        #endregion

        #endregion

        #region Shapes

        #region EditShapes

        [When(@"User clicks '(.*)' arrow on the '(.*)' shape")]
        public void WhenUserClicksArrowOnTheShape(string arrowPosition, string stringShapeType)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            GetShapeOnCanvasByShapeType(stringShapeType).FindElement(By.XPath(page.GetRotationArrowInShape(arrowPosition))).Click();
        }

        [Then(@"'(.*)' shape has been rotated by '(.*)' degrees")]
        public void ThenShapeHasBeenRotatedByDegrees(string stringShapeType, string angleRotation)
        {
            var transformShape = GetShapeOnCanvasByShapeType(stringShapeType).GetAttribute("transform");
            var matches = Regex.Matches(transformShape, @"(?<=\().*?(?=\))", RegexOptions.IgnoreCase);
            var coordinates = matches[0].Value.Split(',');
            var rotation = coordinates[0];
            Verify.AreEqual(angleRotation, rotation, $"Shape '{stringShapeType}' has not been rotated by '{angleRotation}' degrees");
        }

        [Then(@"'(.*)' Smart shape has been rotated by '(.*)' degrees")]
        public void ThenSmartShapeHasBeenRotatedByDegrees(string stringSmartShapeType, string angleRotation)
        {
            var transformSmartShape = GetSmartShapeType(stringSmartShapeType).GetAttribute("transform");
            var matches = Regex.Matches(transformSmartShape, @"(?<=\().*?(?=\))", RegexOptions.IgnoreCase);
            var coordinates = matches[0].Value.Split(',');
            var rotation = coordinates[0];
            Verify.AreEqual(angleRotation, rotation, $"Shape '{stringSmartShapeType}' has not been rotated by '{angleRotation}' degrees");
        }

        [When(@"User clicks and holds '(.*)' arrow on the '(.*)' shape and drags mouse by '(.*)' and '(.*)' coordinates")]
        public void WhenUserClicksAndHoldsArrowOnTheShapeAndDragsMouseByAndCoordinates(string arrowPosition, string stringShapeType, int offsetX, int offsetY)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var rotationArrow = GetShapeOnCanvasByShapeType(stringShapeType).FindElement(By.XPath(page.GetRotationArrowInShape(arrowPosition)));
            _browsers.Active.ActionsClickAndHold(rotationArrow);
            _browsers.Active.ActionsDragAndDropToOffset(rotationArrow, offsetX, offsetY);
            _browsers.Active.ActionsRelease();
        }

        [When(@"User clicks on the '([^']*)' shape and drags mouse by '([^']*)' and '([^']*)' coordinates")]
        public void WhenUserClicksOnTheShapeAndDragsMouseByAndCoordinates(string stringShapeType, int offsetX, int offsetY)
        {
            var shape = GetShapeOnCanvasByShapeType(stringShapeType);
            _browsers.Active.ActionMoveToElement(shape);
            _browsers.Active.ActionsClickAndHold(shape);
            offsetX = offsetX / 5;
            offsetY = offsetY / 5;
            _browsers.Active.MoveByOffset(5, offsetX, offsetY);
            _browsers.Active.ActionsRelease();
        }

        [When(@"User clicks and holds '(.*)' arrow on the '(.*)' Smart shape and drags mouse by '(.*)' and '(.*)' coordinates")]
        public void WhenUserClicksAndHoldsArrowOnTheSmartShapeAndDragsMouseByAndCoordinates(string arrowPosition, string stringSmartShapeType, int offsetX, int offsetY)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var rotationArrow = GetSmartShapeType(stringSmartShapeType).FindElement(By.XPath(page.GetRotationArrowInShape(arrowPosition)));
            _browsers.Active.ActionsClickAndHold(rotationArrow);
            _browsers.Active.ActionsDragAndDropToOffset(rotationArrow, offsetX, offsetY);
            _browsers.Active.ActionsRelease();
        }

        [When(@"User drags and drops '(.*)' point on '(.*)' shape by coordinates '(.*)' and '(.*)'")]
        public void WhenUserDragsAndDropsPointOnShapeByCoordinatesAnd(string pointPosition, string stringShapeType, int offsetX, int offsetY)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var pointOnShape = GetShapeOnCanvasByShapeType(stringShapeType).FindElement(By.XPath(page.GetPointPositionOnShape(pointPosition)));
            _browsers.Active.ActionsClickAndHold(pointOnShape);
            _browsers.Active.MoveByOffset(1, offsetX, offsetY);
            _browsers.Active.ActionsReleaseElement(pointOnShape);
        }

        [Then(@"'(.*)' shape with '(.*)' width and '(.*)' height is displayed on page")]
        public void ThenShapeWithWidthAndHeightIsDisplayedOnPage(string stringShapeType, string shapeWidth, string shapeHeight)
        {
            var width = GetShapeOnCanvasByShapeType(stringShapeType).FindElement(By.XPath("./*")).GetAttribute("width");
            var height = GetShapeOnCanvasByShapeType(stringShapeType).FindElement(By.XPath("./*")).GetAttribute("height");
            Verify.IsTrue(width.Contains(shapeWidth), $"Shape '{stringShapeType}' width is displayed incorrectly");
            Verify.IsTrue(height.Contains(shapeHeight), $"Shape '{stringShapeType}' height is displayed incorrectly");
        }

        [Then(@"'([^']*)' shape with approximate '([^']*)' width and approximate '([^']*)' height is displayed on page")]
        public void ThenShapeWithApproximateWidthAndApproximateHeightIsDisplayedOnPage(string stringShapeType, int shapeWidth, int shapeHeight)
        {
            var rangeValue = 1;
            var width = GetShapeOnCanvasByShapeType(stringShapeType).FindElement(By.XPath("./*")).GetAttribute("width");
            var height = GetShapeOnCanvasByShapeType(stringShapeType).FindElement(By.XPath("./*")).GetAttribute("height");
            var widthWholeValue = (int)Convert.ToDecimal(width);
            var heightWholeValue = (int)Convert.ToDecimal(height);
            Verify.IsTrue(Enumerable.Range(widthWholeValue - rangeValue, widthWholeValue + rangeValue).Contains(shapeWidth), $"Shape '{stringShapeType}' width is displayed incorrectly. Expected width:'{shapeWidth}' Actual Width: '{width}' ");
            Verify.IsTrue(Enumerable.Range(heightWholeValue - rangeValue, heightWholeValue + rangeValue).Contains(shapeHeight), $"Shape '{stringShapeType}' height is displayed incorrectly.Expected Height:'{shapeHeight}' Actual Height: '{height}'");
        }

        public IWebElement GetShapeOnCanvasByShapeType(string stringShapeType)
        {
            return _shapesList.Value.Last(el => el.ElementShape.Equals(GetShapeTypeValue(stringShapeType))).Element;
        }

        public ShapeType GetShapeTypeValue(string stringShapeType)
        {
            return (ShapeType)Enum.Parse(typeof(ShapeType), stringShapeType.Replace(" ", string.Empty));
        }


        public IWebElement GetSmartShapeType(string stringSmartShapeType)
        {
            var SmartshapeType = (SmartShapeType)Enum.Parse(typeof(SmartShapeType), stringSmartShapeType.Replace(" ", string.Empty));
            var elementOnCanvas = _shapesList.Value.Last(el => el.ElementSmartShape.Equals(SmartshapeType)).Element;
            return elementOnCanvas;
        }
        #endregion

        [When(@"User adds '([^']*)' shape from '([^']*)' dropdown menu to '([^']*)','([^']*)' position on Canvas")]
        public void WhenUserAddsShapeFromDropdownMenuToPositionOnCanvas(string stringShapeType, string dropdownMenu, int оffsetX, int оffsetY)
        {
            var page = _browsers.Active.NowAt<ToolPanelPage>();
            _browsers.Active.ClickByActions(page.GetButtonByNameOnToolsPanel("Insert Shape"));

            _browsers.Active.Component<DropdownMenuItem>(dropdownMenu).GetItemByName(stringShapeType).Click();
            _browsers.Active.MoveByOffsetAndClick(оffsetX, оffsetY);

            var canvas = _browsers.Active.NowAt<WebEditorPage>();

            var lastAddedShape = canvas.BackgroundObjectsOnPage.Last();

            _shapesList.Value.Add(new Shape()
            {
                Element = lastAddedShape,
                ElementShape = GetShapeTypeValue(stringShapeType)
            });

            _browsers.Active.ActionsRelease();
        }

        [When(@"User moves '(.*)' shape by coordinates '(.*)' and '(.*)' on Canvas")]
        public void WhenUserMovesShapeByCoordinatesAndOnCanvas(string stringShapeType, int offSetX, int offSetY)
        {
            var elementOnCanvas = GetShapeOnCanvasByShapeType(stringShapeType);
            _browsers.Active.ActionsClickAndHold(elementOnCanvas);
            _browsers.Active.MoveByOffset(10, offSetX, offSetY);
            _browsers.Active.ActionsReleaseElement(elementOnCanvas);
            //Wait for element to be release completely
            Thread.Sleep(200);
        }

        [When(@"User drags and drops '([^']*)' shape onto '([^']*)' topic")]
        public void WhenUserDragsAndDropsShapeOntoTopic(string stringShapeType, string topicName)
        {
            var canvas = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.ActionsDragElementAndDropOntoElement(GetShapeOnCanvasByShapeType(stringShapeType), canvas.GetTopicByName(topicName));
            //wait for shape release to complete
            Thread.Sleep(200);
        }

        [Then(@"'(.*)' shape has location changed on Canvas")]
        public void ThenShapeHasLocationChangedOnCanvas(string stringShapeType)
        {
            //wait for shape movement to complete
            Thread.Sleep(300);
            var shapeLocation = GetShapeOnCanvasByShapeType(stringShapeType).Location;
            var resultX = shapeLocation.X;
            var resultY = shapeLocation.Y;
            Verify.AreNotEqual(_locWeb.Location.X, shapeLocation.X, $"'{stringShapeType}' shape x axis location has not changed on Canvas");
            Verify.AreNotEqual(_locWeb.Location.Y, shapeLocation.Y, $"'{stringShapeType}' shape y axis location has not changed on Canvas");
        }


        [Then(@"'([^']*)' shape has changed location by X axis on Canvas")]
        public void ThenShapeHasChangedLocationByXAxisOnCanvas(string stringShapeType)
        {
            //delay to ensure Shape has moved
            Thread.Sleep(300);
            Verify.AreNotEqual(_locWeb.Location.X, GetShapeOnCanvasByShapeType(stringShapeType).Location.X, $"Shape '{stringShapeType}' has not changed location by X axis");
        }

        [Then(@"'([^']*)' shape has changed location by Y axis on Canvas")]
        public void ThenShapeHasChangedLocationByYAxisOnCanvas(string stringShapeType)
        {
            //delay to ensure Shape has moved
            Thread.Sleep(300);
            Verify.AreNotEqual(_locWeb.Location.Y, GetShapeOnCanvasByShapeType(stringShapeType).Location.Y, $"Shape '{stringShapeType}' has not changed location by Y axis");
        }

        [When(@"User clicks on '(.*)' shape")]
        public void WhenUserClicksOnShape(string stringShapeType)
        {
            _browsers.Active.HoverAndClick(GetShapeOnCanvasByShapeType(stringShapeType));
        }

        [When(@"User selects first '(.*)' shape and second '(.*)' shape on Canvas")]
        public void WhenUserSelectsFirstShapeAndSecondShapeOnCanvas(string firstShape, string secondShape)
        {
            var firstShapeType = (ShapeType)Enum.Parse(typeof(ShapeType), firstShape.Replace(" ", string.Empty));
            var firstElementOnCanvas = _shapesList.Value.First(el => el.ElementShape.Equals(firstShapeType)).Element;
            var secondShapeType = (ShapeType)Enum.Parse(typeof(ShapeType), secondShape.Replace(" ", string.Empty));
            var secondElementOnCanvas = _shapesList.Value.First(el => el.ElementShape.Equals(secondShapeType)).Element;
            _browsers.Active.ActionsPressHoldAndClick(firstElementOnCanvas, secondElementOnCanvas);
        }

        [When(@"User right clicks on '(.*)' shape")]
        public void WhenUserRightClicksOnShape(string stringShapeType)
        {
            _browsers.Active.ContextClick(GetShapeOnCanvasByShapeType(stringShapeType));
        }

        [When(@"User right clicks on '([^']*)' shape and hold")]
        public void WhenUserRightClicksOnShapeAndHold(string stringShapeType)
        {
            _browsers.Active.MoveToElement(GetShapeOnCanvasByShapeType(stringShapeType));
            _browsers.Active.ActionsContextClickAndHold(GetShapeOnCanvasByShapeType(stringShapeType));
        }

        [Then(@"border for '(.*)' shape is highlighted green color")]
        public void ThenBorderForShapeIsHighlightedGreenColor(string stringShapeType)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.WaitForAllElementsToContainsTextInCssValue(page.PointsInBorderShape, "px", "border");
            var borderShape = page.PointsInBorderShape.First().GetCssValue("border");
            Verify.IsTrue(borderShape.Contains("rgb(99, 165, 88)"), $"'{stringShapeType}' shape border is not highlighted green color");
        }

        [Then(@"'(.*)' shape is highlighted green frame")]
        public void ThenShapeIsHighlightedGreenFrame(string stringShapeType)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var transform = GetShapeOnCanvasByShapeType(stringShapeType).GetAttribute("transform");
            Verify.IsTrue(page.IsGreenHighlightedFrameDisplayed(transform), $"Shape '{stringShapeType}' is not highlighted green frame");
        }

        [Then(@"'(.*)' Shape is displayed on Canvas")]
        public void ThenShapeIsDisplayedOnCanvas(string stringShapeType)
        {
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(GetShapeOnCanvasByShapeType(stringShapeType)), $"Shape '{stringShapeType}' is not displayed on Canvas");
        }

        [Then(@"'(.*)' Shape is not displayed on Canvas")]
        public void ThenShapeIsNotDisplayedOnCanvas(string stringShapeType)
        {
            Verify.IsFalse(_browsers.Active.IsElementDisplayed(GetShapeOnCanvasByShapeType(stringShapeType)), $"Shape '{stringShapeType}' is displayed on Canvas");
        }

        [Then(@"'(.*)' Shapes are displayed on Canvas")]
        public void ThenShapesAreDisplayedOnCanvas(int count)
        {
            var canvas = _browsers.Active.NowAt<WebEditorPage>();
            var shapeCount = canvas.BackgroundObjectsOnPage.Count();
            Verify.AreEqual(count, shapeCount, $"Shapes count are displayed incorrect");
        }

        [When(@"User remembers the location of '(.*)' shape on Canvas")]
        public void WhenUserRemembersTheLocationOfShapeOnCanvas(string stringShapeType)
        {
            var topicLocation = GetShapeOnCanvasByShapeType(stringShapeType).Location;
            var resultX = topicLocation.X;
            var resultY = topicLocation.Y;
            Point point = new Point(resultX, resultY);
            _locWeb.Location = point;
        }

        [Then(@"'(.*)' color is displayed to the '(.*)' shape line")]
        public void ThenColorIsDisplayedToTheShapeLine(string color, string stringShapeType)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var shapeOnCanvas = GetShapeOnCanvasByShapeType(stringShapeType);
            var colorShapeLine = shapeOnCanvas.FindElement(By.XPath(page.GetParametersShape)).GetCssValue("stroke");
            Verify.AreEqual(colorShapeLine, color, $"'{color}' color is not displayed in '{stringShapeType}' shape line");
        }

        [Then(@"'(.*)' fill color is displayed to the '(.*)' Shape")]
        public void ThenFillColorIsDisplayedToTheShape(string fillColor, string stringShapeType)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var shapeOnCanvas = GetShapeOnCanvasByShapeType(stringShapeType);
            var fillColorShape = shapeOnCanvas.FindElement(By.XPath(page.GetParametersShape)).GetCssValue("fill");
            Verify.AreEqual(fillColorShape, fillColor, $"'{fillColor}' fill color is not displayed in '{stringShapeType}' shape");
        }

        [Then(@"'(.*)' color is displayed to the '(.*)' smart shape line")]
        public void ThenColorIsDisplayedToTheSmartShapeLine(string color, string stringSmartShapeType)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var smartshapeOnCanvas = GetSmartShapeType(stringSmartShapeType);
            var colorShapeLines = smartshapeOnCanvas.FindElements(By.XPath(page.GetSmartShapeLines));
            Verify.IsTrue(colorShapeLines.All(element => element.GetCssValue("stroke").Equals(color)), $"{color}' color is not displayed in '{stringSmartShapeType}' one or more shape line");
        }

        [Then(@"'(.*)' fill color is displayed to the '(.*)' Smart Shape")]
        public void ThenFillColorIsDisplayedToTheSmartShape(string fillColor, string stringSmartShapeType)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var smartshapeOnCanvas = GetSmartShapeType(stringSmartShapeType);
            var fillColorShape = smartshapeOnCanvas.FindElement(By.XPath(page.GetMainSmartShapeParameters)).GetCssValue("fill");
            Verify.AreEqual(fillColorShape, fillColor, $"'{fillColor}' fill color is not displayed in '{stringSmartShapeType}' shape");
        }

        [Then(@"'(.*)' size is displayed for '(.*)' smart shape line")]
        public void ThenSizeIsDisplayedForSmartShapeLine(string sizeLine, string stringSmartShapeType)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var smartshapeOnCanvas = GetSmartShapeType(stringSmartShapeType);
            var sizeLineSmartShape = smartshapeOnCanvas.FindElements(By.XPath(page.GetSmartShapeLines));
            if (sizeLineSmartShape.Count == 0)
            {
                throw new Exception($"Lines is not displayed for '{stringSmartShapeType}' shape");
            }
            Verify.IsTrue(sizeLineSmartShape.Any(element => element.GetCssValue("stroke-width").Equals(sizeLine)), $"'{sizeLine}' size line is incorrect for '{stringSmartShapeType}' smart shape");
        }

        [Then(@"'(.*)' pattern line is displayed to the '(.*)' smart shape")]
        public void ThenPatternLineIsDisplayedToTheSmartShape(string patternLine, string stringSmartShapeType)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var elementOnCanvas = GetSmartShapeType(stringSmartShapeType);
            var patternLineSmartShape = elementOnCanvas.FindElements(By.XPath(page.GetSmartShapeLines));
            Verify.IsTrue(patternLineSmartShape.All(element => element.GetCssValue("stroke-dasharray").Equals(patternLine)), $"'{patternLine}' pattern line is not displayed for '{stringSmartShapeType}' smart shape");
        }

        [Then(@"'(.*)' transparency color is displayed to the '(.*)' Shape")]
        public void ThenTransparencyColorIsDisplayedToTheShape(string transparency, string stringShapeType)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var transparencyShape = GetShapeOnCanvasByShapeType(stringShapeType).FindElement(By.XPath(page.GetParametersShape)).GetCssValue("fill");
            Verify.AreEqual(transparencyShape, transparency, $"'{transparency}' transparency is not displayed in '{stringShapeType}' shape");
        }

        [Then(@"corner radius rx '(.*)', ry'(.*)' is displayed in '(.*)' shape")]
        public void ThenCornerRadiusRxRyIsDisplayedInShape(double rx, double ry, string stringShapeType)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var shapeOnCanvas = GetShapeOnCanvasByShapeType(stringShapeType);
            var radiusX = shapeOnCanvas.FindElement(By.XPath(page.GetParametersShape)).GetAttribute("rx");
            var radiusY = shapeOnCanvas.FindElement(By.XPath(page.GetParametersShape)).GetAttribute("ry");
            var x = double.Parse(radiusX);
            var resultRX = Math.Round(x, 1);
            var y = double.Parse(radiusY);
            var resultRY = Math.Round(y, 1);
            Verify.AreEqual(resultRX, rx, $"corner radius rx '{rx}', ry '{ry}' is not displayed in '(.*)' shape");
            Verify.AreEqual(resultRY, ry, $"corner radius rx '{rx}', ry '{ry}' is not displayed in '(.*)' shape");
        }

        [Then(@"'(.*)' size is displayed for '(.*)' shape line")]
        public void ThenSizeIsDisplayedForShapeLine(string sizeLine, string stringShapeType)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var sizeLineShape = GetShapeOnCanvasByShapeType(stringShapeType).FindElement(By.XPath(page.GetParametersShape)).GetCssValue("stroke-width");
            Verify.AreEqual(sizeLine, sizeLineShape, $"'{sizeLine}' size line is incorrect for '{stringShapeType}' shape");
        }

        [Then(@"'(.*)' pattern line is displayed to the '(.*)' shape")]
        public void ThenPatternLineIsDisplayedToTheShape(string patternLine, string stringShapeType)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var elementOnCanvas = GetShapeOnCanvasByShapeType(stringShapeType);
            var patternLineShape = elementOnCanvas.FindElement(By.XPath(page.GetParametersShape)).GetCssValue("stroke-dasharray");
            Verify.AreEqual(patternLineShape, patternLine, $"'{patternLine}' pattern line is not displayed for '{stringShapeType}' shape");
        }

        [Then(@"'(.*)' angle is applied to the '(.*)' shape")]
        public void ThenAngleIsAppliedToTheShape(string angle, string stringShapeType)
        {
            var angleShape = GetShapeOnCanvasByShapeType(stringShapeType).GetAttribute("transform");
            var rotate = angleShape.Replace("(", " ");
            Verify.IsTrue(rotate.Contains(angle), $"'{angle}' angle is not applied in '{stringShapeType}' shape");
        }

        [Then(@"'(.*)' title is displayed of the '(.*)' shape")]
        public void ThenTitleIsDisplayedOfTheShape(string title, string stringShapeType)
        {
            DisplayedTitleInShape(stringShapeType, title);
        }

        [Then(@"title is not displayed for '(.*)' shape")]
        public void ThenTitleIsNotDisplayedForShape(string stringShapeType)
        {
            DisplayedTitleInShape(stringShapeType);
        }

        public bool DisplayedTitleInShape(string stringShapeType, string title = "")
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var elementOnCanvas = GetShapeOnCanvasByShapeType(stringShapeType);
            if (!_browsers.Active.IsElementInElementDisplayed(elementOnCanvas, By.XPath(page.GetTitleOfShape), WebDriverExtensions.WaitTime.Second))
            {
                return false;
            }
            else
            {
                if (!elementOnCanvas.FindElement(By.XPath(page.GetTitleOfShape)).Text.Equals(title))
                {
                    throw new Exception($"Title '{title}' is not displayed of '{stringShapeType}' shape");
                }
                return true;
            }
        }

        [Then(@"'(.*)' title is displayed on '(.*)' orientation of the '(.*)' shape")]
        public void ThenTitleIsDisplayedOnOrientationOfTheShape(string title, string titleRotate, string stringShapeType)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var elementOnCanvas = GetShapeOnCanvasByShapeType(stringShapeType);
            var locationTitleOfShape = elementOnCanvas.FindElement(By.XPath(page.GetParametersForTitleOfShape(title))).GetAttribute("transform");
            Verify.IsTrue(locationTitleOfShape.Contains(titleRotate), $"{title} title was not rotated");
        }

        [Then(@"'(.*)' title is alignment to '(.*)' in the '(.*)' shape")]
        public void ThenTitleIsAlignmentToInTheShape(string title, string titleAlignment, string stringShapeType)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var elementOnCanvas = GetShapeOnCanvasByShapeType(stringShapeType);
            var locationTitleOfShape = elementOnCanvas.FindElement(By.XPath(page.GetParametersForTitleOfShape(title))).GetAttribute("text-anchor");
            Verify.AreEqual(locationTitleOfShape, titleAlignment, $"{title} title is not change location of {stringShapeType} shape");
        }

        [Then(@"'(.*)' shape is displayed on the '(.*)' position")]
        public void ThenShapeIsDisplayedOnThePosition(string stringShapeType, int indexShape)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var shapeElement = GetShapeOnCanvasByShapeType(stringShapeType);
            var actualIndex = page.BackgroundObjectsOnPage.IndexOf(shapeElement);
            Verify.AreEqual(actualIndex, indexShape, $"Stacking order of '{stringShapeType}' shape has not been changed");
        }

        [Then(@"'([^']*)' shape is overlapped by '([^']*)' topic on Canvas")]
        public void ThenShapeIsOverlappedByTopicOnCanvas(string stringShapeType, string topicName)
        {
            var rangeValueX = 20;
            var rangeValueY = 50;
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var shapeLoc = GetShapeOnCanvasByShapeType(stringShapeType).Location;
            var topicLoc = page.GetTopicByName(topicName).Location;
            Verify.IsTrue(topicLoc.X - rangeValueX <= shapeLoc.X && shapeLoc.X <= topicLoc.X + rangeValueX, $"'{stringShapeType}' shape is not overlapped by '{topicName}' topic");
            Verify.IsTrue(topicLoc.Y - rangeValueY <= shapeLoc.Y && shapeLoc.Y <= topicLoc.Y + rangeValueY, $"'{stringShapeType}' shape is not overlapped by '{topicName}' topic");
        }

        #endregion

        #region TextBox

        [When(@"User clicks on added textbox with text '([^']*)' on Canvas")]
        public void WhenUserClicksOnAddedTextboxWithTextOnCanvas(string textValue)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            page.GetTextBoxByName(textValue).Click();
        }

        [When(@"User adds text box from tool panel with text '([^']*)' to '([^']*)','([^']*)' position on Canvas")]
        public void WhenUserAddsTextBoxFromToolPanelWithTextToPositionOnCanvas(string textValue, int оffsetX, int оffsetY)
        {
            var page = _browsers.Active.NowAt<ToolPanelPage>();
            _browsers.Active.ClickByActions(page.GetButtonByNameOnToolsPanel("Insert Text Box"));
            _browsers.Active.MoveByOffsetAndClick(оffsetX, оffsetY);

            var canvas = _browsers.Active.NowAt<WebEditorPage>();

            var textId = canvas.BackgroundObjectsOnPage.Last().GetAttribute("id");

            _browsers.Active.WaitForElementToBeDisplayed(canvas.TextBoxesOnPage.Last(), WebDriverExtensions.WaitTime.Short);

            _browsers.Active.SendKeysByActions(textValue);
            _backgroundObjectList.Value.Add(new KeyValuePair<string, string>(textValue, textId));
        }

        [Then(@"Text box is editable on Canvas")]
        public void ThenTextBoxIsEditableOnCanvas()
        {
            var canvas = _browsers.Active.NowAt<WebEditorPage>();
            // Wait text box to load 
            Thread.Sleep(300);
            Verify.IsTrue(canvas.CursorInTextBox.Displayed(), "Cursor is not in TextBox on canvas");
        }

        [Then(@"Textbox is selected on Canvas")]
        public void ThenTextboxIsSelectedOnCanvas()
        {
            var canvas = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(canvas.BackgroundObjectBorder.Displayed(), "Texbox is not selected on canvas");
        }

        [When(@"User click on Textbox with text '([^']*)' on canvas")]
        public void WhenUserClickOnTextboxWithTextOnCanvas(string textValue)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            page.GetTextBoxByName(textValue).Click();
        }

        [Then(@"All Textbox is deselected on Canvas")]
        public void ThenAllTextboxIsDeselectedOnCanvas()
        {
            var canvas = _browsers.Active.NowAt<WebEditorPage>();
            var selector = canvas.BackgroundObjectList.Count();
            Verify.AreEqual(0, selector, $"'{selector}' Selected Textbox is displayed on the canvas");
        }

        [Then(@"'([^']*)' Textbox with border '([^']*)' is displayed on canvas")]
        public void ThenTextboxWithBorderIsDisplayedOnCanvas(int textboxCount, string borderColor)
        {
            var canvas = _browsers.Active.NowAt<WebEditorPage>();
            var selector = canvas.BackgroundObjectList;
            var color = selector.First().GetCssValue("stroke");
            var count = selector.Count();

            Verify.AreEqual(textboxCount, count, $"{textboxCount} selected Textbox is not displayed");
            Verify.AreEqual(borderColor, color, $"Border is highlighted '{color}' on Textbox");
        }

        [Then(@"'([^']*)' Textbox is displayed on Canvas")]
        public void ThenTextboxIsDisplayedOnCanvas(string textValue)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetTextBoxByName(textValue)), $"Textbox with text '{textValue}' is not displayed on canvas");
        }

        [When(@"User doubleClick on Textbox with text '([^']*)' on Canvas")]
        public void WhenUserDoubleClickOnTextboxWithTextOnCanvas(string textValue)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.DoubleClick(page.GetTextBoxByName(textValue));
        }

        [Then(@"User enter '([^']*)' text into the Textbox")]
        public void ThenUserEnterTextIntoTheTextbox(string newTextValue)
        {
            var canvas = _browsers.Active.NowAt<WebEditorPage>();
            canvas.CursorInTextBox.SendKeys(newTextValue);
        }

        [Then(@"'([^']*)' Textbox is not displayed on Canvas")]
        public void ThenTextboxIsNotDisplayedOnCanvas(string textValue)
        {
            var canvas = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(canvas.CursorInTextBox.Displayed(), $"Textbox with text '{textValue}' is displayed on canvas");
        }

        [Then(@"Text box with text '([^']*)' has been rotated by '([^']*)' degrees")]
        public void ThenTextBoxWithTextHasBeenRotatedByDegrees(string textValue, string angleRotation)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var transformTextBoxShape = GetBackgroundObjectByName(textValue).GetAttribute("transform");
            var TextBoxRotateValue = transformTextBoxShape.Split("rotate");
            var matches = Regex.Matches(TextBoxRotateValue[1], @"(?<=\().*?(?=\))", RegexOptions.IgnoreCase);
            var coordinates = matches[0].Value.Split(',');
            var rotation = coordinates[0];
            Verify.AreEqual(angleRotation, rotation, $"Text Box with text '{textValue}' has not been rotated by '{angleRotation}' degrees");
        }

        [When(@"User clicks and holds '([^']*)' arrow on textbox with text '([^']*)' and drags mouse by '([^']*)' and '([^']*)' coordinates")]
        public void WhenUserClicksAndHoldsArrowOnTextboxWithTextAndDragsMouseByAndCoordinates(string arrowPosition, string textValue, int offsetX, int offsetY)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var rotationArrow = GetBackgroundObjectByName(textValue).FindElement(By.XPath(page.GetRotationArrowInShape(arrowPosition)));
            _browsers.Active.ActionsClickAndHold(rotationArrow);
            _browsers.Active.MoveByOffset(3, offsetX, offsetY);
            _browsers.Active.ActionsRelease();
        }

        [Then(@"'(.*)' textbox text is displayed '(.*)' style")]
        public void ThenTextBoxTextIsDisplayedStyle(string textValue, string fontStyle)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var textbox = page.GetTextBoxByName(textValue);
            Verify.IsTrue(page.ValidateTopicTextDecorationStyle(textbox, fontStyle), $"Textbox text '{textValue}' is not displayed '{fontStyle}' style on Canvas");
        }

        [Then(@"'(.*)' textbox text has '(.*)' color on Canvas")]
        public void ThenTextBoxTextHasColorOnCanvas(string textValue, string textColor)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(page.ValidateTopicTextColor(page.GetTextBoxByName(textValue), textColor), $"Textbox text '{textValue}' has not '{textColor}' color");
        }

        [Then(@"'(.*)' textbox text has '(.*)' size")]
        public void ThenTextBoxTextHasSize(string textValue, string textSize)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(page.ValidateTopicTextSize(page.GetTextBoxByName(textValue), textSize), $"Textbox text '{textValue}' has not '{textSize}' size.'");
        }

        [Then(@"'([^']*)' textbox text is aligned '([^']*)'")]
        public void ThenTextBoxTextIsAligned(string textValue, string Postion)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var alignmentPostion = page.GetTextAlignPosition(Postion);
            Verify.AreEqual(page.GetTextBoxByName(textValue).GetCssValue("text-align"), alignmentPostion, $"'{textValue}' Textbox text is not aligned '{alignmentPostion}'");
        }

        [Then(@"'(.*)' textbox text is displayed  '(.*)' in font")]
        public void ThenTextBoxTextIsDisplayedInFont(string textValue, string textStyle)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(page.ValidateTopicTextFontStyle(page.GetTextBoxByName(textValue), textStyle), $"Textbox text '{textValue}' has not '{textStyle}' style");
        }

        [Then(@"Topic with text '(.*)' is aligned '([^']*)' on Canvas")]
        public void ThenTopicWithTextIsAlignedOnCanvas(string topicName, string Postion)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var alignmentPostion = page.GetTextAlignPosition(Postion);
            Verify.AreEqual(page.GetTopicByText(topicName).GetCssValue("text-align"), alignmentPostion, $"'{topicName}' text is not aligned '{alignmentPostion}'");
        }

        #endregion

        #region Background Images
        [Then(@"image is displayed on the Canvas background")]
        public void ThenImageIsDisplayedOnTheCanvasBackground()
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(page.IsBackgroundImageDisplayed(page.PaperContainer), $"Image is not displayed in canvas background");
        }

        [Then(@"background image transparency is '([^']*)'")]
        public void ThenBackgroundImageTransparencyIs(string transparency)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var actualTransparency = page.GetBackgroundImage(page.PaperContainer).GetCssValue("opacity");
            Verify.AreEqual(transparency, actualTransparency, $"BackgroundImage Transparency not as expected '{transparency}'. Actual '{actualTransparency}'");
        }

        [Then(@"image is not displayed on the Canvas background")]
        public void ThenImageIsNotDisplayedOnTheCanvasBackground()
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(page.IsBackgroundImageDisplayed(page.PaperContainer), $"Image is displayed in canvas background");
        }

        [Then(@"background color is '([^']*)' on Canvas")]
        public void ThenBackgroundColorIsOnCanvas(string color)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var actualBackgroundColor = page.PaperContainerEditable.GetCssValue("background-color");
            Verify.AreEqual(color, actualBackgroundColor, $"Background color is not as expected: '{color}'.Actual '{actualBackgroundColor}'");
        }

        # endregion 

        #region Tags


        [When(@"User clicks '([^']*)' tags in '([^']*)' topic infobox")]
        public void WhenUserClicksTagsInTopicInfobox(string tagName, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.HoverAndClick(page.GetTagInTopicInfobox(tagName, topicName));
        }

        [When(@"User Right clicks '(.*)' tags in '(.*)' topic infobox")]
        public void WhenUserRightClicksTagsInTopicInfobox(string tagName, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.ContextClick(page.GetTagInTopicInfobox(tagName, topicName));
        }

        [When(@"User drag '(.*)' tag icon from '(.*)' topic on '(.*)' topic")]
        public void WhenUserDragTagIconFromTopicOnTopic(string tag, string topicName1, string topicName2)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.DragAndDrop(page.GetTagInTopicInfobox(tag, topicName1), page.GetTopicByName(topicName2));
        }

        [Then(@"'(.*)' tag is displayed in '(.*)' topic infobox")]
        public void ThenTagIsDisplayedInTopicInfobox(string tagName, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetTagInTopicInfobox(tagName, topicName)), $"'{tagName}' is not displayed in '{topicName}' topic");
        }

        [Then(@"'(.*)' tag is not displayed in '(.*)' topic infobox")]
        public void ThenTagIsNotDisplayedInTopicInfobox(string tagName, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(page.IsTagDisplayedInTopicInfobox(tagName, topicName), $"'{tagName}' is displayed in '{topicName}' topic");
        }

        [When(@"User clicks Remove button to '(.*)' tag in '(.*)' topic infobox")]
        public void WhenUserClicksRemoveButtonToTagInTopicInfobox(string tagName, string topicName)
        {
            var infobox = _browsers.Active.NowAt<WebEditorPage>();
            infobox.GetTagInTopicInfobox(tagName, topicName).FindElement(By.XPath(infobox.TagRemoveButton)).Click();
        }


        [Then(@"'(.*)' Tag is displayed to the '(.*)' color in '(.*)' topic infobox")]
        public void ThenTagIsDisplayedToTheColorInTopicInfobox(string tagName, string color, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var currentTagColor = page.GetTagInTopicInfobox(tagName, topicName).FindElement(By.XPath("./preceding-sibling::*[@stroke]")).GetCssValue("fill");
            AutomationUtils.Utils.Logger.Write($"{currentTagColor} tag color");
            Verify.AreEqual(color, currentTagColor, $"Tag '{tagName}' is not displayed to the '{color}' color in '{topicName}' topic infobox");
        }

        [Then(@"'([^']*)' Tag text is displayed '([^']*)' in font in '([^']*)' topic infobox")]
        public void ThenTagTextIsDisplayedInFontInTopicInfobox(string tagName, string textStyle, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(page.IsTagTextDisplayedInStyleInTopic(tagName, textStyle, topicName), $"Tag text '{tagName}' has no '{textStyle}' style in '{topicName}' topic infobox");
        }

        [Then(@"'(.*)' Tag text is displayed to the '(.*)' color in '(.*)' topic infobox")]
        public void ThenTagTextIsDisplayedToTheColorInTopicInfobox(string tagName, string textColor, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var currentTextColor = page.GetTagInTopicInfobox(tagName, topicName).FindElement(By.XPath("./preceding-sibling::*[@class='tag-label']")).GetCssValue("fill");
            Verify.AreEqual(textColor, currentTextColor, $"Tag text '{tagName}' is not displayed to the '{textColor}' color in '{topicName}' topic infobox");
        }

        [When(@"User mouses over '(.*)' tag in '(.*)' topic infobox")]
        public void WhenUserMousesOverTagInTopicInfobox(string tagName, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.MoveToElement(page.GetTagInTopicInfobox(tagName, topicName));
        }
        #endregion

        #region PropertiesInTopic

        [Then(@"'([^']*)' property is displayed in '([^']*)' topic infobox")]
        public void ThenPropertyIsDisplayedInTopicInfobox(string propertyName, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetPropertyByNameInTopicInfobox(propertyName, topicName)), $"Property '{propertyName}' is  not displayed in '{topicName}' topic");
        }

        [Then(@"'([^']*)' property is not displayed in '([^']*)' topic infobox")]
        public void ThenPropertyIsNotDisplayedInTopicInfobox(string propertyName, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(page.IsPropertyDisplayedInTopicInfobox(propertyName, topicName), $"Property '{propertyName}' is displayed in '{topicName}' topic");
        }

        [Then(@"value '([^']*)' is displayed for '([^']*)' property in '([^']*)' topic infobox")]
        public void ThenValueIsDisplayedForPropertyInTopicInfobox(string propertyValue, string propertyName, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var actualPropertyValue = page.GetPropertyValueInTopicInfobox(propertyName, topicName).GetText();
            if (propertyValue == "")
            {
                if (actualPropertyValue == null)
                {
                    actualPropertyValue = actualPropertyValue ?? "";
                }
                Verify.AreEqual(propertyValue, actualPropertyValue, $"Value '{propertyValue}' is not displayed to the '{propertyName}' property in '{topicName}' topic");
            }
            else
            {
                Verify.AreEqual(propertyValue, actualPropertyValue, $"Value '{propertyValue}' is not displayed to the '{propertyName}' property in '{topicName}' topic");
            }
        }

        [Then(@"color '([^']*)' is displayed to the '([^']*)' property in '([^']*)' topic infobox")]
        public void ThenColorIsDisplayedToThePropertyInTopicInfobox(string color, string propertyName, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var colorInField = page.GetPropertyValueInTopicInfobox(propertyName, topicName).GetCssValue("fill");
            Verify.AreEqual(colorInField, color, $"{color} is not displayed in field");
        }

        [Then(@"'([^']*)' separator is displayed in '([^']*)' topic infobox")]
        public void ThenSeparatorIsDisplayedInTopicInfobox(int seperatorCount, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topicSeperatorCount = page.GetSeparatorsInTopicInfobox(topicName).Count;
            Verify.AreEqual(seperatorCount, topicSeperatorCount, $"'{topicSeperatorCount}' separator is displayed in '{topicName}' infobox");
        }

        #endregion

        #region Resources

        [When(@"User mouses over '(.*)' resource in '(.*)' topic infobox")]
        public void WhenUserMousesOverResourceInTopicInfobox(string resourceName, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.MoveToElement(page.GetResourceInTopicInfobox(resourceName, topicName));
        }

        [Then(@"'(.*)' resource is displayed in '(.*)' topic")]
        public void ThenResourceIsDisplayedInTopic(string resourceName, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetResourceInTopicInfobox(resourceName, topicName)), $"'{resourceName}' resource is not displayed in '{topicName}' topic");
        }

        [Then(@"'(.*)' resource is not displayed in '(.*)' topic")]
        public void ThenResourceIsNotDisplayedInTopic(string resourceName, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(page.IsResourceDisplayedInTopicInfobox(resourceName, topicName), $"Resource '{resourceName}' is displayed in '{topicName}' topic");
        }

        [Then(@"'(.*)' resource is displayed to the '(.*)' color in '(.*)' topic infobox")]
        public void ThenResourceIsDisplayedToTheColorInTopicInfobox(string resourceName, string color, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var getResourceColor = page.GetResourceInTopicInfobox(resourceName, topicName).GetCssValue("fill");
            Verify.AreEqual(color, getResourceColor, $"Resource '{resourceName}' is not displayed to the '{color}' color in '{topicName}' topic");
        }

        [Then(@"'(.*)' Resource text is displayed to the '(.*)' color in '(.*)' topic infobox")]
        public void ThenResourceTextIsDisplayedToTheColorInTopicInfobox(string resourceName, string color, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var getTextColorInRecourse = page.GetResourceInTopicInfobox(resourceName, topicName).FindElement(By.XPath(".//following-sibling::*[@text-anchor='start']")).GetCssValue("fill");
            Verify.AreEqual(color, getTextColorInRecourse, $"Resource text '{resourceName}' is not displayed to the '{color}' color in '{topicName}' topic");
        }

        [When(@"User clicks '([^']*)' resource in '([^']*)' topic infobox")]
        public void WhenUserClicksResourceInTopicInfobox(string resourceName, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            page.GetResourceInTopicInfobox(resourceName, topicName).Click();
        }

        [When(@"User right clicks '(.*)' resource in '(.*)' topic")]
        public void WhenUserRightClicksResourceInTopic(string resourceName, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.ContextClick(page.GetResourceInTopicInfobox(resourceName, topicName));
        }

        [When(@"User clicks Remove button to '(.*)' resource in '(.*)' topic")]
        public void WhenUserClicksRemoveButtonToResourceInTopic(string resourceName, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            page.GetResourceInTopicInfobox(resourceName, topicName).FindElement(By.XPath(page.ResourceRemoveButton)).Click();
        }

        #endregion

        [Then(@"'([^']*)' author details is with icon '([^']*)' is displayed in '([^']*)' topic infobox")]
        public void ThenAuthorDetailsIsWithIconIsDisplayedInTopicInfobox(string authorDetails, string authorIcon, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.AreEqual(authorDetails, page.GetAuthorDetailsInTopicInfobox(authorIcon, topicName), $"'{authorDetails}' author detail with icon '{authorIcon}' is not displayed in '{topicName}' topic");
        }

        [Then(@"'([^']*)' author details is not displayed in '([^']*)' topic infobox")]
        public void ThenAuthorDetailsIsNotDisplayedInTopicInfobox(string authorRole, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(page.IsAuthorDetailsDisplayedByDataRoleInTopicInfobox(topicName, authorRole), $"'{authorRole}' author detail is displayed in '{topicName}' topic");
        }

        [Then(@"'([^']*)' author details is displayed in '([^']*)' topic infobox")]
        public void ThenAuthorDetailsIsDisplayedInTopicInfobox(string authorRole, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(page.IsAuthorDetailsDisplayedByDataRoleInTopicInfobox(topicName, authorRole), $"'{authorRole}' author detail is not displayed in '{topicName}' topic");
        }

        #region Icon
        [Then(@"Milestone icon is displayed '([^']*)' topic infobox")]
        public void ThenMilestoneIconIsDisplayedTopic(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetMilestoneIconInTopicInfobox(topicName)), $"Milestone icon is not displayed in '{topicName}' topic infobox");
        }

        [Then(@"Milestone icon not is displayed '([^']*)' topic infobox")]
        public void ThenMilestoneIconNotIsDisplayedTopic(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(page.IsMilestoneIconDisplayedInTopicInfobox(topicName), $"Milestone icon is displayed in '{topicName}' topic infobox");
        }

        [When(@"User clicks '(.*)' icon in '(.*)' topic")]
        public void WhenUserClicksIconInTopic(string iconName, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            page.GetIconInTopic(iconName, topicName).Click();
        }

        [When(@"User Right clicks '(.*)' icon in '(.*)' topic")]
        public void WhenUserRightClicksIconInTopic(string iconName, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.ContextClick(page.GetIconInTopic(iconName, topicName));
        }

        [When(@"User hover over '([^']*)' icon in '([^']*)' topic")]
        public void WhenUserHoverOverIconInTopic(string iconName, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.MoveToElement(page.GetIconInTopic(iconName, topicName));
        }

        [Then(@"'(.*)' Icon is displayed to the '(.*)' Topic")]
        public void ThenIconIsDisplayedToTheTopic(string iconName, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetIconInTopic(iconName, topicName)), $"Icon '{iconName}' is not displayed in '{topicName}' topic");
        }

        [Then(@"'([^']*)' Icon with value '([^']*)' is displayed to the '([^']*)' Topic infobox")]
        public void ThenIconWithValueIsDisplayedToTheTopicInfobox(string iconName, string iconValue, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetIconNameAndValueInTopicInfobox(iconName, iconValue, topicName)), $"Topic icon '{iconName}' with value '{iconValue}' is not displayed in '{topicName}' topic infobox");
        }

        [Then(@"'([^']*)' Icon with value '([^']*)' is displayed to the '([^']*)' Topic infobox with transform value '([^']*)'")]
        public void ThenIconWithValueIsDisplayedToTheTopicInfoboxWithTransformValue(string iconName, string iconValue, string topicName, string transformValue)
        {
            var rangeValue = 5;
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var getIconTransform = page.GetIconNameAndValueTransformInTopicInfobox(iconName, iconValue, topicName).GetAttribute("transform");
            var expectedTransformValue = page.TransformExtractedFromString(transformValue);
            var actualTransformValue = page.TransformExtractedFromString(getIconTransform);
            Verify.IsTrue(actualTransformValue.Item1 - rangeValue <= expectedTransformValue.Item1 && expectedTransformValue.Item1 <= actualTransformValue.Item1 + rangeValue, $"{transformValue} Transform not as expected . Actual: {getIconTransform}");
            Verify.IsTrue(actualTransformValue.Item2 - rangeValue <= expectedTransformValue.Item2 && expectedTransformValue.Item2 <= actualTransformValue.Item2 + rangeValue, $"{transformValue} Transform not as expected . Actual: {getIconTransform}");
        }

        [Then(@"'([^']*)' Icon with value '([^']*)' is displayed to the '([^']*)' Topic infobox with transform value X '([^']*)'")]
        public void ThenIconWithValueIsDisplayedToTheTopicInfoboxWithTransformValueY(string iconName, string iconValue, string topicName, int transformValueX)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var getIconTransform = page.GetIconNameAndValueTransformInTopicInfobox(iconName, iconValue, topicName).GetAttribute("transform");
            var actualTransformValue = page.TransformExtractedFromString(getIconTransform);
            Verify.AreEqual(transformValueX, actualTransformValue.Item1, $"{transformValueX} X transform is not as expected for '{iconName}' Icon with value '([^']*)' . Actual: {getIconTransform}");
        }

        [Then(@"'([^']*)' Icon with value '([^']*)' is displayed to the '([^']*)' Topic infobox with Y value '([^']*)'")]
        public void ThenIconWithValueIsDisplayedToTheTopicInfoboxWithYValue(string iconName, string iconValue, string topicName, string yValue)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var getIconYvalue = page.GetIconNameAndValueInTopicInfobox(iconName, iconValue, topicName).GetAttribute("Y");
            Verify.AreEqual(yValue, getIconYvalue, $"Topic icon '{iconName}' with value '{iconValue}' is not displayed in '{topicName}' topic infobox with transform Y value '{yValue}'");
        }

        [Then(@"'([^']*)' Icon with value '([^']*)' is displayed to the '([^']*)' Topic infobox with X value '([^']*)' and Y value '([^']*)'")]
        public void ThenIconWithValueIsDisplayedToTheTopicInfoboxWithXValueAndYValue(string iconName, string iconValue, string topicName, string xValue, string yValue)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var getIconXvalue = page.GetIconNameAndValueInTopicInfobox(iconName, iconValue, topicName).GetAttribute("X");
            var getIconYvalue = page.GetIconNameAndValueInTopicInfobox(iconName, iconValue, topicName).GetAttribute("Y");
            Verify.AreEqual(xValue, getIconXvalue, $"Topic icon '{iconName}' with value '{iconValue}' is not displayed in '{topicName}' topic infobox with transform X value '{xValue}'");
            Verify.AreEqual(yValue, getIconYvalue, $"Topic icon '{iconName}' with value '{iconValue}' is not displayed in '{topicName}' topic infobox with transform Y value '{yValue}'");
        }

        [Then(@"'([^']*)' Icon with value '([^']*)' is displayed to the '([^']*)' Topic with X value '([^']*)' and Y value '([^']*)'")]
        public void ThenIconWithValueIsDisplayedToTheTopicWithXValueAndYValue(string iconName, string iconValue, string topicName, string xValue, string yValue)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var getIconXvalue = page.GetIconNameAndValueInTopic(iconName, iconValue, topicName).GetAttribute("X");
            var getIconYvalue = page.GetIconNameAndValueInTopic(iconName, iconValue, topicName).GetAttribute("Y");
            Verify.AreEqual(xValue, getIconXvalue, $"Topic icon '{iconName}' with value '{iconValue}' is not displayed in '{topicName}' topic with transform X value '{xValue}'");
            Verify.AreEqual(yValue, getIconYvalue, $"Topic icon '{iconName}' with value '{iconValue}' is not displayed in '{topicName}' topic with transform Y value '{yValue}'");
        }

        [Then(@"'([^']*)' Icon is displayed to the '([^']*)' Topic infobox")]
        public void ThenIconIsDisplayedToTheTopicInfobox(string iconName, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetIconInTopicInfobox(iconName, topicName)), $"Icon '{iconName}' is not displayed in '{topicName}' topic infobox");
        }

        [Then(@"'([^']*)' Image Icon is displayed to the '([^']*)' Topic infobox")]
        public void ThenImageIconIsDisplayedToTheTopicInfobox(string iconName, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(page.IsImageIconDisplayedInTopicInfobox(iconName, topicName), $"Image icon '{iconName}' is not displayed in '{topicName}' topic");
        }

        [Then(@"'([^']*)' Image Icon is not displayed to the '([^']*)' Topic infobox")]
        public void ThenImageIconIsNotDisplayedToTheTopicInfobox(string iconName, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(page.IsImageIconDisplayedInTopicInfobox(iconName, topicName), $"Image icon '{iconName}' is displayed in '{topicName}' topic");
        }

        [Then(@"Only topic name is displayed in '([^']*)' topic on Canvas")]
        public void ThenOnlyTopicNameIsDisplayedInTopicOnCanvas(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(page.IsTopicNameOnlyDisplayedInTopic(topicName), "Other elements are displayed next to Topic name");
        }

        [When(@"User clicks Image icon in '([^']*)' topic infobox")]
        public void WhenUserClicksImageIconInTopicInfobox(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            page.GetImageIconInTopicInfobox(topicName, WebDriverExtensions.WaitTime.Second).Click();
        }

        [When(@"User drag image icon from '([^']*)' topic infobox on '([^']*)' topic")]
        public void WhenUserDragImageIconFromTopicInfoboxOnTopic(string fromTopicName, string toTopicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.ActionsClickAndHoldElementToOffset(page.GetImageIconInTopicInfobox(fromTopicName, SeleniumAutomationUtils.SeleniumExtensions.WebDriverExtensions.WaitTime.Second), 0, 0);
            //Wait for move to occur
            Thread.Sleep(500);
            _browsers.Active.MoveByOffset(10, 20, 20);
            _browsers.Active.MoveToElement(page.GetTopicByName(toTopicName));
            _browsers.Active.ActionsRelease();
        }

        [Then(@"'([^']*)' Icon is not displayed to the '([^']*)' Topic infobox")]
        public void ThenIconIsNotDisplayedToTheTopicInfobox(string iconName, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse((page.IsIconDisplayedInTopicInfobox(iconName, topicName)), $"Icon '{iconName}' is displayed in '{topicName}' topic infobox");
        }

        [Then(@"'([^']*)' icon has lock in '([^']*)' topic on Canvas")]
        public void ThenLockProgressIconIsDisplayedToTheTopic(string iconName, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(page.IsLockedIconDisplayedInTopic(iconName, topicName), $"Locked icon '{iconName}' is not displayed in '{topicName}' topic");
        }

        [Then(@"'(.*)' Icon is not displayed to the '(.*)' Topic")]
        public void ThenIconIsNotDisplayedToTheTopic(string iconName, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(page.IsIconDisplayedInTopic(iconName, topicName), $"Icon '{iconName}' is displayed in '{topicName}' topic");
        }

        [When(@"User drags '(.*)' Icon from '(.*)' topic on '(.*)' topic")]
        public void WhenUserDragsIconFromTopicOnTopic(string iconName, string topicName1, string topicName2)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.DragAndDrop(page.GetIconInTopic(iconName, topicName1), page.GetTopicByName(topicName2));
        }

        [When(@"User clicks Comment icon to the '(.*)' topic infobox")]
        public void WhenUserClicksCommentIconToTheTopicInfobox(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.ClickElementLeftCenter(page.GetCommentsIconInTopicInfobox(topicName));
        }

        [Then(@"Comment icon is displayed to the '(.*)' topic infobox")]
        public void ThenCommentIconIsDisplayedToTheTopicInfobox(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetCommentsIconInTopicInfobox(topicName)), $"Comment icon is displayed to the '{topicName}' topic infobox");
        }

        [Then(@"Comment icon is not displayed to the '(.*)' topic infobox")]
        public void ThenCommentIconIsNotDisplayedToTheTopicInfobox(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(page.IsCommentsIconDisplayedInTopicInfobox(topicName), $"Comments icon is displayed in {topicName} topic");
        }

        [When(@"User mouse over the comment icon in the '(.*)' topic infobox on Canvas")]
        public void WhenUserMouseOverTheCommentIconInTheTopicInfoboxOnCanvas(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.MoveToElement(page.GetCommentsIconInTopicInfobox(topicName));
        }

        [Then(@"'(.*)' number is displayed in the comment icon of the '(.*)' topic infobox")]
        public void ThenNumberIsDisplayedInTheCommentIconOfTheTopicInfobox(string numberOfComments, string topicName)
        {
            var topicInfobox = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(topicInfobox.GetNumberOfCommentsInIcon(topicName, numberOfComments).Displayed(), $"'{numberOfComments}' number is not displayed in the comment icon of the '{topicName}' topic infobox");
        }

        [When(@"User clicks Notes icon in '(.*)' topic infobox")]
        public void WhenUserClicksNotesIconInTopicInfobox(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            page.GetNotesIconInTopicByName(topicName).Click();
        }

        [When(@"User mouses over Notes icon in '(.*)' topic infobox")]
        public void WhenUserMousesOverNotesIconInTopicInfobox(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.MoveToElement(page.GetNotesIconInTopicByName(topicName));
        }

        [Then(@"'(.*)' Notes icon is displayed in '(.*)' topic infobox")]
        public void ThenNotesIconIsDisplayedInTopicInfobox(string icon, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var getIcon = page.GetNotesIconInTopicByName(topicName).GetAttribute("xlink:href");
            Verify.AreEqual(icon, getIcon, $"Icon '{icon}' is not displayed in '{topicName}' topic infobox");
        }

        [Then(@"'([^']*)' Notes text is displayed in '([^']*)' topic infobox")]
        public void ThenNotesTextIsDisplayedInTopicInfobox(string text, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var getText = page.GetNotesTextInTopicByName(topicName).GetAttribute("data-tooltip");
            Verify.AreEqual(text, getText, $"Notes '{getText}' text is not displayed in '{topicName}' topic infobox");
        }

        [Then(@"Notes icon is displayed to the '(.*)' topic infobox")]
        public void ThenNotesIconIsDisplayedToTheTopicInfobox(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetNotesIconInTopicByName(topicName)), $"Notes icon is not displayed to the '{topicName}' topic infobox");
        }

        [Then(@"Notes icon is not displayed to the '(.*)' topic infobox")]
        public void ThenNotesIconIsNotDisplayedToTheTopicInfobox(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(page.IsNotesIconDisplayedInTopicInfobox(topicName), $"Notes icon is displayed in {topicName} topic infobox");
        }

        [Then(@"'(.*)' Note preview text is displayed to the '(.*)' topic infobox")]
        public void ThenNotePreviewIsDisplayedToTheTopicInfobox(string value, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetNoteTitleTextInTopicInfobox(value, topicName)), $"Note preview text '{value}' is not displayed in '{topicName}' topic infobox");
        }

        [Then(@"Links icon is displayed to the '(.*)' topic infobox")]
        public void ThenLinksIconIsDisplayedToTheTopicInfobox(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetHyperlinkIconInTopicInfobox(topicName)), $"Links icon is not displayed to the '{topicName}' topic infobox");
        }

        [Then(@"Links icon is not displayed to the '(.*)' topic infobox")]
        public void ThenLinksIconIsNotDisplayedToTheTopicInfobox(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(page.IsHyperlinkIconDisplayedInTopicInfobox(topicName), $"Hyperlink icon is displayed in {topicName} topic infobox");
        }

        [Then(@"'([^']*)' link icon with '([^']*)' link title is displayed to the '([^']*)' topic infobox")]
        public void ThenLinkIconWithLinkTitleIsDisplayedToTheTopicInfobox(string linkIcon, string linkTitle, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetLinkIconFromLinkTitleTextInTopicInfobox(linkIcon, linkTitle.AddRandom(_sessionRandom), topicName.AddRandom(_sessionRandom))), $"Link icon '{linkIcon}' with Link title with '{linkTitle}' is not displayed in '{topicName}' topic infobox");
        }

        [Then(@"'([^']*)' link icon with '([^']*)' link title is not displayed to the '([^']*)' topic infobox")]
        public void ThenLinkIconWithLinkTitleIsNotDisplayedToTheTopicInfobox(string linkIcon, string linkTitle, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(_browsers.Active.IsElementDisplayed(page.GetLinkIconFromLinkTitleTextInTopicInfobox(linkIcon, linkTitle, topicName)), $"Link icon '{linkIcon}' with Link title with '{linkTitle}' is displayed in '{topicName}' topic infobox");
        }

        [When(@"User drag '([^']*)' link icon with '([^']*)' link title from '([^']*)' topic on '([^']*)' topic")]
        public void WhenUserDragLinkIconWithLinkTitleFromTopicOnTopic(string linkIcon, string linkTitle, string topicName1, string topicName2)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.DragAndDrop(page.GetLinkIconFromLinkTitleTextInTopicInfobox(linkIcon, linkTitle, topicName1), page.GetTopicByName(topicName2));
        }

        [Then(@"'(.*)' Link title is displayed to the '(.*)' topic infobox")]
        public void ThenLinkTitleIsDisplayedToTheTopicInfobox(string value, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            topicName = topicName.AddRandom(_sessionRandom);
            value = value.AddRandom(_sessionRandom);
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetLinkTitleTextInTopicInfobox(value, topicName)), $"Link title text '{value}' is not displayed in '{topicName}' topic infobox");
        }

        [When(@"User clicks on '([^']*)' Link title displayed to the '([^']*)' topic infobox")]
        public void WhenUserClicksOnLinkTitleDisplayedToTheTopicInfobox(string value, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            page.GetLinkTitleTextInTopicInfobox(value, topicName).Click();
        }

        [Then(@"hyperlinks icon with tooltip '(.*)' text is displayed in '(.*)' topic")]
        public void ThenHyperlinksIconWithTooltipTextIsDisplayedInTopic(string tooltip, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.ActionsMoveToElementByOffset(page.GetHyperlinkIconInTopicInfobox(topicName), 1, 1);
            var content = _browsers.Active.Component<Tooltip>().GetTooltipContent();
            Verify.AreEqual(content, tooltip, $"Tooltip '{tooltip}' is not displayed to User");
        }

        [When(@"User clicks attachment icon in '(.*)' topic")]
        public void WhenUserClicksAttachmentIconInTopic(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            page.GetAttachmentsIconInTopicInfobox(topicName).Click();
        }

        [Then(@"Attachment icon is displayed to the '(.*)' topic infobox")]
        public void ThenAttachmentIconIsDisplayedToTheTopicInfobox(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetAttachmentsIconInTopicInfobox(topicName)), $"Attachment icon is not displayed to the '{topicName}' topic infobox");
        }

        [Then(@"Attachment icon is not displayed to the '(.*)' topic infobox")]
        public void ThenAttachmentIconIsNotDisplayedToTheTopicInfobox(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(page.IsAttachmentsIconDisplayedInTopicInfobox(topicName), $"Attachment icon is displayed in {topicName} topic infobox");
        }

        [When(@"User clicks Hyperlinks icon in '(.*)' topic infobox")]
        public void WhenUserClicksHyperlinksIconInTopicInfobox(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            page.GetHyperlinkIconInTopicInfobox(topicName).Click();
        }

        [When(@"User drag Hyperlink icon from '(.*)' topic on '(.*)' topic")]
        public void WhenUserDragHyperlinkIconFromTopicOnTopic(string topicName1, string topicName2)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.DragAndDrop(page.GetHyperlinkIconInTopicInfobox(topicName1), page.GetTopicByName(topicName2));
        }

        [When(@"User drag Attachment icon from '(.*)' topic on '(.*)' topic")]
        public void WhenUserDragAttachmentIconFromTopicOnTopic(string topicName1, string topicName2)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.DragAndDrop(page.GetAttachmentsIconInTopicInfobox(topicName1), page.GetTopicByName(topicName2));
        }

        [When(@"User drag '(.*)' resource icon from '(.*)' topic on '(.*)' topic")]
        public void WhenUserDragResourceIconFromTopicOnTopic(string resourceName, string topicName1, string topicName2)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.ActionsDragElementAroundThenMoveToSecondElement(page.GetResourceInTopicInfobox(resourceName, topicName1), page.GetTopicByName(topicName2));
            _browsers.Active.ActionsRelease();
        }

        [When(@"User drag '([^']*)' property icon from '([^']*)' topic on '([^']*)' topic")]
        public void WhenUserDragPropertyIconFromTopicOnTopic(string propertyName, string topicName1, string topicName2)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.DragAndDrop(page.GetPropertyByNameInTopicInfobox(propertyName, topicName1), page.GetTopicByName(topicName2));
        }

        [When(@"User drag Notes icon from '(.*)' topic on '(.*)' topic")]
        public void WhenUserDragNotesIconFromTopicOnTopic(string firstTopic, string secondTopic)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.DragAndDrop(page.GetNotesIconInTopicByName(firstTopic), page.GetTopicByName(secondTopic));
        }

        #endregion

        #region Attachments

        [Then(@"'(.*)' attachment filename is displayed to the '(.*)' topic infobox")]
        public void ThenAttachmentFilenameIsDisplayedToTheTopicInfobox(string attachmentName, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            topicName = topicName.AddRandom(_sessionRandom);
            attachmentName = attachmentName.AddRandom(_sessionRandom);
            Verify.IsTrue(page.GetAttachmentFilenameInTopicInfobox(attachmentName, topicName).Displayed(), $"'{attachmentName}' attachment filename is not displayed to the '{topicName}' topic infobox");
        }

        [When(@"User clicks on '([^']*)' attachment filename on '([^']*)' topic infobox")]
        public void WhenUserClicksOnAttachmentFilenameOnTopicInfobox(string attachmentName, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            page.GetAttachmentFilenameInTopicInfobox(attachmentName, topicName).Click();
        }

        [When(@"User mouses over '([^']*)' attachment filename on '([^']*)' topic infobox")]
        public void WhenUserMousesOverAttachmentFilenameOnTopicInfobox(string attachmentName, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.MoveToElement(page.GetAttachmentFilenameInTopicInfobox(attachmentName, topicName));
        }

        #endregion

        #region Date

        [Then(@"Date box is not displayed in the '(.*)' topic infobox on Canvas")]
        public void ThenDateBoxIsNotDisplayedInTheTopicOnTheViewMapPage(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var data = page.GetTopicByName(topicName);
            Verify.IsFalse(data.IsElementExists(By.XPath(page.DateInfobox)), $"Data box is displayed to the {topicName}");
        }

        [Then(@"'(.*)' Start date is displayed to the '(.*)' topic infobox")]
        public void ThenStartDateIsDisplayedToTheTopicInfobox(string startDate, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            startDate = startDate.AddRandom(_sessionRandom).Date("M/d");
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetStartDateInTopicInfobox(startDate, topicName)), $"Start date '{startDate}' is not displayed to the '{topicName}' topic infobox");
        }

        [Then(@"'([^']*)' Start date is displayed to the '([^']*)' topic infobox ignore weekend")]
        public void ThenStartDateIsDisplayedToTheTopicInfoboxIgnoreWeekend(string startDate, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            if (DateTime.Now.IsWeekend())
            {
                var nextDate = DateTime.Now.GetNextWorkingDay().ToString("M/d");
                Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetStartDateInTopicInfobox(nextDate, topicName)), $"Start date '{startDate}' is not displayed to the '{topicName}' topic infobox");
            }
            else
            {
                startDate = startDate.AddRandom(_sessionRandom).Date("M/d");
                Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetStartDateInTopicInfobox(startDate, topicName)), $"Start date '{startDate}' is not displayed to the '{topicName}' topic infobox");
            }
        }

        [Then(@"'(.*)' Start date is not displayed to the '(.*)' topic infobox")]
        public void ThenStartDateIsNotDisplayedToTheTopicInfobox(string startDate, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            startDate = startDate.AddRandom(_sessionRandom).Date("M/d");
            Verify.IsFalse(page.IsStartDateDisplayedInTopicInfobox(startDate, topicName), $"Start date '{startDate}' is displayed to the '{topicName}' topic infobox");
        }

        [When(@"User drag '(.*)' Start date from '(.*)' topic on '(.*)' topic")]
        public void WhenUserDragStartDateFromTopicOnTopic(string startDate, string topicName1, string topicName2)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.DragAndDrop(page.GetStartDateInTopicInfobox(startDate, topicName1), page.GetTopicByName(topicName2));
        }

        [When(@"User clicks '([^']*)' Due date on '([^']*)' topic infobox")]
        public void WhenUserClicksDueDateOnTopicInfobox(string dueDate, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            dueDate = dueDate.AddRandom(_sessionRandom).Date("M/d");
            page.GetDueDateInTopicInfobox(dueDate, topicName).Click();
        }

        [Then(@"Date calender pop up is displayed on canvas")]
        public void ThenDateCalenderPopUpIsDisplayedOnCanvas()
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetDatePicker()), "Date calender pop up is not displayed on Canvas");
        }

        [Then(@"'(.*)' Due date is displayed to the '(.*)' topic infobox")]
        public void ThenDueDateIsDisplayedToTheTopicInfobox(string dueDate, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            dueDate = dueDate.AddRandom(_sessionRandom).Date("M/d");
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetDueDateInTopicInfobox(dueDate, topicName)), $"Due date '{dueDate}' is not displayed to the '{topicName}' topic infobox");
        }

        [Then(@"'([^']*)' Due date is displayed to the '([^']*)' topic infobox ignore weekend")]
        public void ThenDueDateIsDisplayedToTheTopicInfoboxIgnoreWeekend(string dueDate, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            if (DateTime.Now.IsWeekend())
            {
                var nextDate = DateTime.Now.GetNextWorkingDay().ToString("M/d");
                Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetDueDateInTopicInfobox(dueDate, topicName)), $"Due date '{dueDate}' is not displayed to the '{topicName}' topic infobox");
            }
            else
            {
                dueDate = dueDate.AddRandom(_sessionRandom).Date("M/d");
                Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetDueDateInTopicInfobox(dueDate, topicName)), $"Due date '{dueDate}' is not displayed to the '{topicName}' topic infobox");
            }
        }

        [Then(@"'(.*)' Due date is not displayed to the '(.*)' topic infobox")]
        public void ThenDueDateIsNotDisplayedToTheTopicInfobox(string dueDate, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            dueDate = dueDate.AddRandom(_sessionRandom).Date("M/d");
            Verify.IsFalse(page.IsDueDateDisplayedInTopicInfobox(dueDate, topicName), $"Due date '{dueDate}' is displayed to the '{topicName}' topic infobox");
        }

        [When(@"User drag '(.*)' Due date from '(.*)' topic on '(.*)' topic")]
        public void WhenUserDragDueDateFromTopicOnTopic(string dueDate, string topicName1, string topicName2)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.DragAndDrop(page.GetDueDateInTopicInfobox(dueDate, topicName1), page.GetTopicByName(topicName2));
        }

        [When(@"User drag date icon from '([^']*)' topic on '([^']*)' topic")]
        public void WhenUserDragDateIconFromTopicOnTopic(string topicName1, string topicName2)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.DragAndDrop(page.GetDateIconInTopicInfobox(topicName1), page.GetTopicByName(topicName2));
        }

        [Then(@"'(.*)' date info is displayed to the '(.*)' topic infobox")]
        public void ThenDateInfoIsDisplayedToTheTopicInfobox(string dateInfo, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetDateInfoInTopicInfobox(dateInfo, topicName)), $"'{dateInfo}' date info is not displayed to the '{topicName}' topic infobox");
        }

        [Then(@"'(.*)' date info is not displayed to the '(.*)' topic infobox")]
        public void ThenDateInfoIsNotDisplayedToTheTopicInfobox(string dateInfo, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(page.IsDateInfoDisplayedInTopicInfobox(dateInfo, topicName), $"'{dateInfo}' date info is not displayed to the '{topicName}' topic infobox");
        }

        #endregion

        #region Effort

        [Then(@"'(.*)' effort info is displayed to the '(.*)' topic infobox")]
        public void ThenEffortInfoIsDisplayedToTheTopicInfobox(string effortInfo, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetEffortInfoInTopicInfobox(effortInfo, topicName)), $"'{effortInfo}' effort info is not displayed to the '{topicName}' topic infobox");
        }

        [Then(@"'([^']*)' effort info is not displayed to the '([^']*)' topic infobox")]
        public void ThenEffortInfoIsNotDisplayedToTheTopicInfobox(string effortInfo, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(page.IsEffortInfoDisplayedInTopicInfobox(effortInfo, topicName), $"Effort '{effortInfo}' is displayed in topic '{topicName}'");
        }

        #endregion

        #region Boundary

        [Then(@"'([^']*)' topic is located in boundary on Canvas")]
        public void ThenTopicIsLocatedInBoundaryOnCanvas(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(page.IsTopicLocatedInBoundary(topicName), $"Topic '{topicName}' is not located in boundary on Canvas");
        }

        [Then(@"'([^']*)' topic is located in '([^']*)' opacity boundary on Canvas")]
        public void ThenTopicIsLocatedInOpacityBoundaryOnCanvas(string topicName, string opacity)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.AreEqual(opacity, page.GetTopicBoundaryOpacity(topicName), $"'{topicName}' topic is not located in '{opacity}' opacity boundary on Canvas)");
        }

        [Then(@"'([^']*)' topic is not located in boundary on Canvas")]
        public void ThenTopicIsNotLocatedInBoundaryOnCanvas(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(page.IsTopicLocatedInBoundary(topicName), $"Topic '{topicName}' is located in boundary on Canvas");
        }

        [When(@"User selects '([^']*)' topic boundary body on Canvas")]
        public void WhenUserSelectsTopicBoundaryBody(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var boundary = page.GetTopicBoundaryBody(topicName);
            var width = boundary.Size.Width;
            var height = boundary.Size.Height;
            _browsers.Active.ActionsMoveToElementAndClick(boundary, width / 2, height / 2);
        }

        [Then(@"'([^']*)' topic boundary body is '([^']*)' color on Canvas")]
        public void ThenTopicBoundaryBodyIsColor(string topicName, string color)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(page.ValidateTopicBoundaryBodyColor(topicName, color), $"Topic '{topicName}' boundary body is not '{color}'");
        }

        [Then(@"Boundary outerline is highlighted blue color on the '([^']*)' topic on Canvas")]
        public void ThenBoundaryOuterlineIsHighlightedBlueColorOnTheTopicOnViewMapPage(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(page.GetTopicByName(topicName).IsElementExists(By.XPath(page.BorderHighlight)), $"Boundary outline is not highlight on {topicName} topic");
        }

        #endregion

        #region Canvas

        [Then(@"'([^']*)' subscribe link is displayed at the bottom of Canvas")]
        public void ThenUserSeesSubscribeLinkOnWebEditorPage(string linkMessage)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(page.GetSubscribeLink(linkMessage).Displayed(), $"Subscribe link {linkMessage} is not displayed on Web Editor page");
        }

        [Then(@"'([^']*)' message is displayed at the bottom of Canvas")]
        public void ThenMessageIsDisplayedAtTheBottomOfCanvas(string textMessage)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(page.IsMessageDisplayed(textMessage), $"Message {textMessage} is not displayed on Web Editor page");
        }

        [Then(@"'([^']*)' message is not displayed at the bottom of Canvas")]
        public void ThenMessageIsNotDisplayedAtTheBottomOfCanvas(string textMessage)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(page.IsMessageDisplayed(textMessage), $"Message {textMessage} is displayed on Web Editor page");
        }

        [When(@"User right-click on Canvas")]
        public void WhenUserRight_ClickWeb_EditorArea()
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.ContextClick(page.BodyContainer);
            //wait for context menu to display
            Thread.Sleep(200);
        }

        [Then(@"'(.*)' topic shape is attached to the cursor on Canvas")]
        public void ThenDropActionTopicIsDisplaysAShapeThatConformsParentTopic(string shape)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var second = page.ShapeTopic.GetAttribute("shape-type");
            Verify.AreEqual(shape, second, $"'{shape}' topic shape is not attached to the cursor on Canvas");
        }

        [When(@"User right-clicks on Canvas and hold and wait")]
        public void WhenUserRight_ClicksOnWebEditorAreaAndHoldAndWait()
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.ActionsContextClickAndHold(page.PaperContainer);
            //Wait for cursor to change to Hand Icon
            Thread.Sleep(1000);
        }

        [When(@"User left-clicks on Canvas and hold and wait")]
        public void WhenUserLeft_ClicksOnWebEditorAreaAndHoldAndWait()
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.ActionsClickAndHold(page.PaperContainer);
            //Wait for cursor to change to Hand Icon
            Thread.Sleep(1000);
        }

        [When(@"User left-clicks by '([^']*)' '([^']*)' coordinates on Canvas and hold and wait")]
        public void WhenUserLeft_ClicksByCoordinatesOnCanvasAndHoldAndWait(int offsetX, int offsetY)
        {
            _browsers.Active.ActionsClickAndHoldByOffset(offsetX, offsetY);
            //Wait for cursor to change to Hand Icon
            Thread.Sleep(1000);
        }

        [Then(@"Web Editor page is displayed to the User")]
        public void ThenWebEditorPageIsDisplayedToTheUser()
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var toolbox = _browsers.Active.NowAt<SideToolboxPage>();
            for (int i = 0; i < 60; i++)
            {
                try
                {
                    _browsers.Active.MoveToElement(toolbox.FilterButton);
                    if (_browsers.Active.ComponentDisplayedState<Tooltip>(new Properties { WaitTime = WebDriverExtensions.WaitTime.Short }))
                    {
                        if (_browsers.Active.IsElementDisplayed(page.ModalPopupOnPage))
                        {
                            page.GetButtonInModalPopup("Cancel").Click();
                        }
                        return;
                    }
                }
                catch { }
                //wait for one sec then check if editor is displayed 
                Thread.Sleep(1000);
            }

            throw new Exception($"Web Editor page is not displayed");
        }

        [When(@"User clicks on the Body on Canvas")]
        public void WhenUserClicksOnTheBodyOnTheViewMapPage()
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.HoverAndClick(page.BodyContainer);
        }

        [When(@"User clicks by coordinates '([^']*)' and '([^']*)' on Canvas")]
        public void WhenUserClicksByCoordinatesAndOnCanvas(int offSetX, int offSetY)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.ActionMoveToElementAndMoveByOffsetClick(page.BodyContainer, offSetX, offSetY);

        }

        [When(@"User right-clicks by coordinates '([^']*)' and '([^']*)' on Canvas")]
        public void WhenUserRight_ClicksByCoordinatesAndOnCanvas(int offSetX, int offSetY)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.ActionsLeftClickElementByOffSet(page.BodyContainer, offSetX, offSetY);
        }

        [When(@"User double right clicks by coordinates '(.*)' and '(.*)' on Canvas")]
        public void WhenUserDoubleRightClicksByCoordinatesAndOnCanvas(int offSetX, int offSetY)
        {
            _browsers.Active.ActionMoveByOffsetAndDoubleRightClick(offSetX, offSetY);
        }

        [Then(@"'([^']*)' collapse button is displayed on Canvas")]
        public void ThenCollapseButtonIsDisplayedOnCanvas(int count)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var mapCount = page.TopicCollapseState.Count();
            Verify.AreEqual(count, mapCount, $"Expected collapse button is '{count}' but retrieved count on canvas is '{mapCount}'");
        }

        [Then(@"selected topic is displayed attached to the mouse cursor at 50 percent opacity")]
        public void ThenSelectedTopicIsDisplayedAttachedToTheMouseCursorAt50PercentOpacity()
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(page.SelectedTopicAttachedMouse.GetCssValue("opacity").Equals("0.5"), $"topic is not displayed with 50% transparency");
        }

        [Then(@"coeditor cursor is displayed on Canvas")]
        public void ThenCoeditorCursorIsDisplayedOnCanvas()
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.CoeditorCursor), "Coeditor cursor is not displayed on canvas");
        }

        [Then(@"coeditor cursor is not displayed on Canvas")]
        public void ThenCoeditorCursorIsNotDisplayedOnCanvas()
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(_browsers.Active.IsElementDisplayed(page.CoeditorCursor), "Coeditor cursor is displayed on canvas");
        }

        [When(@"User clicks '(.*)' Subscribe link at the bottom of Canvas")]
        public void WhenUserClicksSubscribeLinkOnWebEditorPage(string text)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.WaitForElementToBeDisplayed(page.GetSubscribeLink(text));
            page.GetSubscribeLink(text).Click();
        }
        #endregion

        #region Relationship

        [Then(@"relationship line anchor point has changes its location by X axis")]
        public void ThenTopicEndpointHasChangesItsLocationByXAxis()
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.AreNotEqual(_locWeb.Location.X, page.GetRelationShipPointLocation().X, $"Topic endpoint has not changes its location by X axis");
        }

        [Then(@"relationship line anchor point has changes its location by Y axis")]
        public void ThenTopicEndpointHasChangesItsLocationByYAxis()
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.AreNotEqual(_locWeb.Location.Y, page.GetRelationShipPointLocation().Y, $"Topic endpoint has not changes its location by Y axis");
        }

        [When(@"User remembers the anchor point location of the selected relationship line")]
        public void WhenUserRemembersTheLocationOfAPointOnTopic()
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var RelationShipPointLocation = page.GetRelationShipPointLocation();
            var resultX = RelationShipPointLocation.X;
            var resultY = RelationShipPointLocation.Y;
            Point point = new Point(resultX, resultY);
            _locWeb.Location = point;
        }

        [Then(@"'(.*)' relationship lines are displayed on Canvas")]
        public void ThenRelationshipLinesAreDisplayedOnCanvas(int relationshipCount)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.AreEqual(page.RelationshipLinesOnCanvas.Count, relationshipCount, "Count of relationship line are displayed incorrect");
        }

        [Then(@"relationship line has Color '([^']*)' on Canvas")]
        public void ThenRelationshipLineHasColorOnViewMapPage(string color)
        {
            var line = _browsers.Active.NowAt<WebEditorPage>();
            var elementColor = line.RelationshipOnTopics.GetAttribute("stroke");
            Verify.AreEqual(color, elementColor, $"Relationship line does not have color '{color}'. Actual color: '{elementColor}'");
        }

        [Then(@"relationship is not displayed on the Canvas")]
        public void ThenRelationshipIsNotDisplayedOnTheCanvas()
        {
            var line = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsFalse(_browsers.Active.IsElementDisplayed(line.RelationshipOnTopics), "Relationship is not assigned to the topics");
        }

        [When(@"User clicks on the relationship line")]
        public void WhenUserClicksOnTheRelationshipLine()
        {
            var line = _browsers.Active.NowAt<WebEditorPage>();
            var elementSize = line.RelationshipOnTopics.Size;
            for (int k = 0; k < 200; k++)
            {
                _browsers.Active.ActionsMoveToElementAndClick(line.RelationshipOnTopics, k - (elementSize.Width / 2), (elementSize.Height / 2) - k);
                if (_browsers.Active.IsElementDisplayed(line.RelationshipLineSelected))
                    break;
            }
        }

        [When(@"User clicks on the '(.*)' relationship line dynamic selection")]
        public void WhenUserClicksOnTheRelationshipLineDynamicSelection(string lineNumber)
        {
            var relationshipline = _browsers.Active.FindElement(By.XPath("(.//*[contains(@class,'relationship')]/*[contains(@class,'relationship-path')])[" + lineNumber + "]"));
            int getTopleftY = ((relationshipline.Size.Height) / 2) - (relationshipline.Size.Height);
            int getTopleftX = ((relationshipline.Size.Width) / 2) - (relationshipline.Size.Width);
            var relationshipLabel = _browsers.Active.NowAt<WebEditorPage>();

            for (int i = 0; i < 200; i++)
            {
                _browsers.Active.ActionsMoveToElementAndClick(relationshipline, getTopleftX + i, getTopleftY + i);
                if (_browsers.Active.IsElementDisplayed(relationshipLabel.RelationshipLabel))
                    break;
            }
        }

        [Then(@"relationship is selected on Canvas")]
        public void ThenRelationshipIsSelectedOnCanvas()
        {
            var line = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(line.RelationshipLineSelected), "Line was not clicked");
        }

        [Then(@"Bezier has '(.*)' endpoint handlebars on Canvas")]
        public void ThenBezierHasEndpointHandlebarsOnViewMapPage(int value)
        {
            var point = _browsers.Active.NowAt<WebEditorPage>();
            var count = point.RelationshipsEndpointOnHandlebars.Count;
            Verify.AreEqual(count, value, "Endpoint handlebars display is incorrect count");
        }

        [Then(@"Bezier has '([^']*)' endpoint handlebars on Topics")]
        public void ThenBezierHasEndpointHandlebarsOnTopics(int value)
        {
            var point = _browsers.Active.NowAt<WebEditorPage>();
            var count = point.RelationshipsEndpointOnTopic.Count;
            Verify.AreEqual(count, value, "Endpoint handlebars display is incorrect count");
        }

        [When(@"User moves relationship point by '(.*)' and '(.*)' coordinates")]
        public void WhenUserMovesRelationshipPointByAndCoordinates(int offSetX, int offSetY)
        {
            var point = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.ActionsClickAndHold(point.RelationshipsEndpointOnTopic.First());
            _browsers.Active.MoveByOffset(10, offSetX, offSetY);
            _browsers.Active.ActionsRelease();
        }

        [When(@"User move the endpoint to '(.*)' topic on the map")]
        public void WhenUserMoveTheEndpointToTopicOnTheMap(string topicName)
        {
            var map = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.ActionsClickAndHold(map.RelationshipsEndpointOnTopic.First());
            _browsers.Active.MoveByOffset(10, -1, 0);
            _browsers.Active.MoveToElement(map.GetTopicByName(topicName));
            _browsers.Active.ActionsReleaseElement(map.GetTopicByName(topicName));
        }

        [Then(@"relationship arrow anchor point is displayed in '([^']*)' topic")]
        public void ThenRelationshipPointIsDisplayedInTopic(string topicName)
        {
            var map = _browsers.Active.NowAt<WebEditorPage>();
            var topic = map.GetTopicByName(topicName);
            var topicArea = topic.FindElement(By.XPath(map.AreaTopic)).Location;
            var endpoint = map.RelationshipsEndpointOnTopic.First(x => x.GetAttribute("index").Equals("1")).Location;
            var deltaX = endpoint.X - topicArea.X;
            var deltaY = endpoint.Y - topicArea.Y;
            Verify.IsTrue(deltaX <= 250, $"Relationship point is not displayed in '{topicName}' shape and Expected X coordinate within ±250 units of a certain value, but found: {deltaX} units off.");
            Verify.IsTrue(deltaY <= 370, $"Relationship point is not displayed  in '{topicName}' shape and Expected Y coordinate within ±370 units of a certain value, but found: {deltaY} units off.");
        }

        [Then(@"relationship point is displayed in '([^']*)' shape")]
        public void ThenRelationshipPointIsDisplayedInShape(string stringShapeType)
        {
            var map = _browsers.Active.NowAt<WebEditorPage>();
            var elementOnCanvas = GetShapeOnCanvasByShapeType(stringShapeType);
            var shapeArea = elementOnCanvas.Location;
            var endpoint = map.RelationshipsEndpointOnTopic.FirstOrDefault().Location;
            var deltaX = endpoint.X - shapeArea.X;
            var deltaY = endpoint.Y - shapeArea.Y;
            Verify.IsTrue(Math.Abs(deltaX) <= 300, $"Relationship point is not displayed in '{stringShapeType}' shape and Expected X coordinate within ±300 units of a certain value, but found: {deltaX} units off.");
            Verify.IsTrue(Math.Abs(deltaY) <= 400, $"Relationship point is not displayed  in '{stringShapeType}' shape and Expected Y coordinate within ±200 units of a certain value, but found: {deltaY} units off.");
        }

        [Then(@"relationship icon is displayed on Canvas")]
        public void ThenRelationshipIconIsDisplayedOnTheViewMapPage()
        {
            var icon = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.WaitForElementToBeDisplayed(icon.RelationshipIcon);
            Verify.IsTrue(icon.RelationshipIcon.Displayed(), "relationship icon is not displayed");
        }

        [Then(@"cursor relationship added to the '(.*)' topic on Canvas")]
        public void ThenCursorRelationshipAddedToTheTopicOnViewMapPage(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topic = page.GetTopicByName(topicName);
            Verify.IsTrue(topic.IsElementExists(By.XPath(page.RelationshipInTopic)), $"Relationship is not displayed in {topicName} topic");
        }

        [Then(@"cursor relationship added to the '([^']*)' shape on the Canvas")]
        public void ThenCursorRelationshipAddedToTheShapeOnTheCanvas(string stringShapeType)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var elementOnCanvas = GetShapeOnCanvasByShapeType(stringShapeType);
            Verify.IsTrue(elementOnCanvas.IsElementExists(By.XPath(page.RelationshipInTopic)), $"Relationship is not displayed in {stringShapeType} shape");
        }

        [Then(@"Relationship lines are displaying in following colors on Canvas:")]
        public void ThenRelationshipLinesAreDisplayingInColorsOnCanvas(Table table)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var expectedColors = table.Rows.SelectMany(row => row.Values).ToList();
            var strokeColors = page.GetAllRelationshipLinesCssByCssValue("stroke").ToList(); ;
            Verify.AreEqual(expectedColors, strokeColors, $"Relationship lines are not displaying '{strokeColors}' in colors on the Canvas.");
        }

        [Then(@"Relationship lines are displaying in following width on Canvas:")]
        public void ThenRelationshipLinesAreDisplayingInWidthOnCanvas(Table table)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var expectedWidths = table.Rows.SelectMany(row => row.Values).ToList();
            var strokeWidths = page.GetAllRelationshipLinesCssByCssValue("stroke-width").ToList();
            Verify.AreEqual(expectedWidths, strokeWidths, $"Relationship lines are not displaying '{strokeWidths}' in widths on the Canvas.");
        }
        #endregion

        #region Topic CoEdting frame
        [Then(@"'([^']*)' topic is highlighted with CoEditing frame on Canvas")]
        public void ThenTopicIsHighlightedWithCoEditingFrame(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetTopicCoeditingFrameByTopicName(topicName)), $"Topic '{topicName}' is not located in coediting frame on Canvas");
        }

        [Then(@"User '([^']*)' is displayed on '([^']*)' topic CoEditing frame on Canvas")]
        public void ThenUserIsDisplayedOnTopicCoEditingFrame(string username, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(username.Contains(page.GetTopicCoeditingFrameUsername(topicName)), $"Username '{username}' is not displayed in topic '{topicName}' Coediting Frame");
        }

        [Then(@"lock icon is displayed on '([^']*)' topic CoEditing frame on Canvas")]
        public void ThenLockIconIsDisplayedInOnTopicCoEditingFrame(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(page.IsLockIconDisplayedInTopicCoeditingFrame(topicName), $"Lock icon is not displayed in topic '{topicName}' Coediting frame");
        }

        [Then(@"'([^']*)' quick add button is displayed on '([^']*)' topic CoEditing frame on Canvas")]
        public void ThenQuickAddButtonIsDisplayedOnTopicCoEditingFrame(string position, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(page.GetQuickAddButtonInTopicCoeditingFrame(topicName, position)), $"Quick Add button is not displayed in topic '{topicName}' Coediting frame");
        }

        [When(@"User clicks '([^']*)' quick add button on '([^']*)' topic CoEditing frame on Canvas")]
        public void WhenUserClicksQuickAddButtonOnTopicCoEditingFrame(string position, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            page.GetQuickAddButtonInTopicCoeditingFrame(topicName, position).Click();
        }
        #endregion

        public IWebElement GetBackgroundObjectByName(string backgroundObjectName)
        {
            var canvas = _browsers.Active.NowAt<WebEditorPage>();
            var selector = canvas.BackgroundObjectsOnPage;
            var backgroundObjectId = _backgroundObjectList.Value.First(x => x.Key.Equals(backgroundObjectName)).Value;
            var el = selector.First(x => x.GetAttribute("id").Equals(backgroundObjectId));
            return el;
        }

        [When(@"User clicks on '([^']*)' Plus button and hold in '([^']*)' topic on Canvas")]
        public void WhenUserClicksAndHoldPlusButtonInTopic(string buttonName, string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topicModelId = page.GetTopicIdByTopicName(topicName);
            var plusButton = page.GetPlusButtonOnSelectedTopicById(topicModelId, buttonName);
            _browsers.Active.ActionsClickAndHold(plusButton);
        }

        public object IsTopicOverlappedBy(IWebElement topic)
        {
            IJavaScriptExecutor js = (IJavaScriptExecutor)_browsers.Active;
            return js.ExecuteScript(
                @"var element = arguments[0];
                var elementsBoundingClientRect = element.getBoundingClientRect();
                var centerOfElement = {
                  x: elementsBoundingClientRect.left + ((elementsBoundingClientRect.width) / 2),
                  y: elementsBoundingClientRect.top + ((elementsBoundingClientRect.height) / 2),
                };
                var actualElementAtCenterOfElement = document.elementFromPoint(centerOfElement.x, centerOfElement.y);
                return !element.contains(actualElementAtCenterOfElement);",
            topic);
        }

    }
}