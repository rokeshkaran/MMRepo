using AutomationUtils.Utils;
using MjAutomationCore.Components.Base;
using MjAutomationCore.Components.Buttons;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.ShapesList;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.QA;
using MjAutomationCore.Pages.WebAppProject.ToolPanel;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using System;
using System.ComponentModel;
using System.Linq;
using System.Reflection;
using System.Text.RegularExpressions;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.WebEditor
{
    [Binding]
    class SmartShapesStesp : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly ShapesList _shapesList;

        public SmartShapesStesp(WebDriver driver, ShapesList shapesList)
        {
            _driver = driver;
            _shapesList = shapesList;
        }

        [When(@"User right clicks on '([^']*)' Smart shape on Canvas")]
        public void WhenUserRightClicksOnSmartShapeOnCanvas(string stringShapeType)
        {
            var smartShapeType = (SmartShapeType)Enum.Parse(typeof(SmartShapeType), stringShapeType.Replace(" ", string.Empty));
            var elementOnCanvas = _shapesList.Value.Last(el => el.ElementSmartShape.Equals(smartShapeType)).Element;
            _driver.ContextClick(elementOnCanvas);
        }

        [When(@"User adds '(.*)' Smart shape to '(.*)','(.*)' position on canvas")]
        public void WhenUserAddsSmartShapeToPositionOnCanvas(string stringSmartShapeType, int offsetX, int offsetY)
        {
            UserAddsSmartShapeOnTheOptionToPositionOnCanvas(stringSmartShapeType, offsetX, offsetY);
        }

        [When(@"User adds '(.*)' Smart shape on the '(.*)' option to '(.*)','(.*)' position on canvas")]
        public void WhenUserAddsSmartShapeOnTheOptionToPositionOnCanvas(string stringSmartShapeType, string optionShape, int offsetX, int offsetY)
        {
            UserAddsSmartShapeOnTheOptionToPositionOnCanvas(stringSmartShapeType, offsetX, offsetY, optionShape);
        }

        private void UserAddsSmartShapeOnTheOptionToPositionOnCanvas(string stringSmartShapeType, int offsetX, int offsetY,
            string optionShape = "")
        {
            var smartShapeType = (SmartShapeType)Enum.Parse(typeof(SmartShapeType), stringSmartShapeType.Replace(" ", string.Empty));

            var page = _driver.NowAt<ToolPanelPage>();
            _driver.ClickByActions(page.GetButtonByNameOnToolsPanel("Insert Smart Shape"));

            if (optionShape == String.Empty)
            {
                if (stringSmartShapeType.Equals("Table"))
                {
                    _driver.Component<DropdownMenuButton>("insert-smart-bg-object").GetButtonByType(stringSmartShapeType).Click();
                }
                else
                {
                    _driver.Component<DropdownMenuButton>("insert-smart-bg-object").GetMenuButtonByType(stringSmartShapeType).Click();
                }
            }
            else
            {
                _driver.MoveToElement(_driver.Component<DropdownMenuButton>("insert-smart-bg-object").GetMenuButtonByType(stringSmartShapeType));
                var parent = _driver.Component<DropdownMenuButton>().Instances.Last();
                _driver.GetComponent<ButtonByType>(optionShape, new Properties() { Parent = parent, WaitTime = WebDriverExtensions.WaitTime.Short }).Click();
            }

            _driver.MoveByOffsetAndClick(offsetX, offsetY);

            var canvas = _driver.NowAt<WebEditorPage>();

            var lastAddedShape = canvas.BackgroundObjectsOnPage.Last();

            _shapesList.Value.Add(new Shape()
            {
                Element = lastAddedShape,
                ElementSmartShape = smartShapeType
            });
            _driver.ActionsRelease();
        }

        [Then(@"'([^']*)' Smart shape is displayed on Canvas")]
        public void ThenSmartShapeIsDisplayedOnCanvas(string stringShapeType)
        {
            var smartShapeType = (SmartShapeType)Enum.Parse(typeof(SmartShapeType), stringShapeType.Replace(" ", string.Empty));
            var elementOnCanvas = _shapesList.Value.Last(el => el.ElementSmartShape.Equals(smartShapeType)).Element;
            Verify.IsTrue(elementOnCanvas.Displayed(), $"Smart shape '{stringShapeType}' is not displayed on Canvas");
        }

        [Then(@"'([^']*)' Static Smart shape is displayed on Canvas")]
        public void ThenStaticSmartShapeIsDisplayedOnCanvas(string stringShapeType)
        {
            string description = GetEnumDescription((StaticSmartShapeType)Enum.Parse(typeof(StaticSmartShapeType), stringShapeType.Replace(" ", string.Empty)));
            string[] parts = description.Split(',');
            string shapeId = parts[1];
            var canvas = _driver.NowAt<WebEditorPage>();
            var lastAddedShape = canvas.BackgroundObjectsOnPage.Last();
            Verify.AreEqual(lastAddedShape.GetAttribute("id"), shapeId, $"'{stringShapeType}' Smart shape is not displayed on Canvas");
        }

        [Then(@"'([^']*)' Smart shape with '([^']*)' Horizontal lanes is displayed on Canvas")]
        public void ThenSmartShapeWithHorizontalLanesIsDisplayedOnCanvas(string stringShapeType, int countLane)
        {
            var canvas = _driver.NowAt<WebEditorPage>();
            var smartShapeType = (SmartShapeType)Enum.Parse(typeof(SmartShapeType), stringShapeType.Replace(" ", string.Empty));
            var elementOnCanvas = _shapesList.Value.Last(el => el.ElementSmartShape.Equals(smartShapeType)).Element;
            var value = elementOnCanvas.FindElement(By.XPath(canvas.ShapePath)).GetAttribute("d");
            Verify.AreEqual(HorizontalLanesCount(value) + 1, countLane, $"Count lines in the '{stringShapeType}' smart shape is displayed incorrect");
        }

        [Then(@"'([^']*)' Smart shape with '([^']*)' Vertical lanes is displayed on Canvas")]
        public void ThenSmartShapeWithVerticalLanesIsDisplayedOnCanvas(string stringShapeType, int countLane)
        {
            var canvas = _driver.NowAt<WebEditorPage>();
            var smartShapeType = (SmartShapeType)Enum.Parse(typeof(SmartShapeType), stringShapeType.Replace(" ", string.Empty));
            var elementOnCanvas = _shapesList.Value.Last(el => el.ElementSmartShape.Equals(smartShapeType)).Element;
            var value = elementOnCanvas.FindElement(By.XPath(canvas.ShapePath)).GetAttribute("d");
            Verify.AreEqual(VerticalLanesCount(value) + 1, countLane, $"Count lines in the '{stringShapeType}' smart shape is displayed incorrect");
        }

        [Then(@"Funnel Smart shape with '([^']*)' segments is displayed on Canvas")]
        public void ThenFunnelSmartShapeWithSegmentsIsDisplayedOnCanvas(int countSegment)
        {
            var canvas = _driver.NowAt<WebEditorPage>();
            var shapeFunnel = "Funnel";
            var smartShapeType = (SmartShapeType)Enum.Parse(typeof(SmartShapeType), shapeFunnel.Replace(" ", string.Empty));
            var elementOnCanvas = _shapesList.Value.Last(el => el.ElementSmartShape.Equals(smartShapeType)).Element;
            var value = elementOnCanvas.FindElement(By.XPath(canvas.ShapePath)).GetAttribute("d");
            Verify.AreEqual(SegmentsCount(value), countSegment, $"Count segments in the '{shapeFunnel}' smart shape is displayed incorrect");
        }

        [Then(@"Table Smart shape with '([^']*)' Horizontal lanes is displayed on Canvas")]
        public void ThenTableSmartShapeWithHorizontalLanesIsDisplayedOnCanvas(int countLane)
        {
            var shapeTable = "Table";
            var canvas = _driver.NowAt<WebEditorPage>();
            var smartShapeType = (SmartShapeType)Enum.Parse(typeof(SmartShapeType), shapeTable.Replace(" ", string.Empty));
            var elementOnCanvas = _shapesList.Value.Last(el => el.ElementSmartShape.Equals(smartShapeType)).Element;
            var value = elementOnCanvas.FindElement(By.XPath(canvas.ShapePath)).GetAttribute("d");
            Verify.AreEqual(HorizontalLanesCount(value), countLane, $"Count lines in the '{shapeTable}' smart shape is displayed incorrect");
        }

        [Then(@"Table Smart shape with '([^']*)' Vertical lanes is displayed on Canvas")]
        public void ThenTableSmartShapeWithVerticalLanesIsDisplayedOnCanvas(int countLane)
        {
            var shapeTable = "Table";
            var canvas = _driver.NowAt<WebEditorPage>();
            var smartShapeType = (SmartShapeType)Enum.Parse(typeof(SmartShapeType), shapeTable.Replace(" ", string.Empty));
            var elementOnCanvas = _shapesList.Value.Last(el => el.ElementSmartShape.Equals(smartShapeType)).Element;
            var value = elementOnCanvas.FindElement(By.XPath(canvas.ShapePath)).GetAttribute("d");
            Verify.AreEqual(VerticalLanesCount(value), countLane, $"Count lines in the '{shapeTable}' smart shape is displayed incorrect");
        }

        public static string GetEnumDescription(Enum value)
        {
            FieldInfo field = value.GetType().GetField(value.ToString());

            DescriptionAttribute attribute = (DescriptionAttribute)field.GetCustomAttributes(typeof(DescriptionAttribute), false).FirstOrDefault();

            return attribute != null ? attribute.Description : value.ToString();
        }

        public static int HorizontalLanesCount(string str)
        {
            var horizontalLanes = Regex.Matches(str, @"[h]").Count();
            return horizontalLanes;
        }

        public static int VerticalLanesCount(string str)
        {
            var verticalLanes = Regex.Matches(str, @"[v]").Count();
            return verticalLanes;
        }

        public static int SegmentsCount(string str)
        {
            var horizontalLanes = Regex.Matches(str, @"[L]").Count();
            return horizontalLanes + 1;
        }
    }
}