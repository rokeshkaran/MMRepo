using AutomationUtils.Utils;
using MjAutomationCore.Components.ColorPicker;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.ColorPicker;
using MjAutomationCore.Extensions;
using MjAutomationCore.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using System.Drawing;
using System.Threading;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.WebEditor
{
    [Binding]
    class ColorPickerPopupSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly LocationWebDto _locWeb;
        private readonly BrowsersList _browsersList;
        private readonly ColorPickerData _colorPicker;

        public ColorPickerPopupSteps(WebDriver driver, LocationWebDto locWeb, BrowsersList browsersList, ColorPickerData colorPicker)
        {
            _driver = driver;
            _locWeb = locWeb;
            _browsersList = browsersList;
            _colorPicker = colorPicker;
        }

        [Then(@"Color Picker window is displayed to User")]
        public void ThenColorPickerWindowIsDisplayedToUser()
        {
            Verify.IsTrue(_driver.ComponentDisplayedState<ColorPicker>(), "Color Picker is not displayed");
        }

        [Then(@"Color Picker window is not displayed to User")]
        public void ThenColorPickerWindowIsNotDisplayedToUser()
        {
            Verify.IsFalse(_driver.ComponentDisplayedState<ColorPicker>(new Properties { WaitTime = WebDriverExtensions.WaitTime.Second }), "Color Picker is displayed");
        }

        [Then(@"'([^']*)' tab is displayed in Color Picker Header")]
        public void ThenTabIsDisplayedInColorPickerHeader(string tabName)
        {
            var tab = _browsersList.Active.Component<ColorPicker>().GetButtonByNameInHeader(tabName);
            Verify.IsTrue(_browsersList.Active.IsElementDisplayed(tab), $"Tab '{tabName}' is not displayed in Color Picker Header");
        }

        [When(@"User click on '([^']*)' tab in Color Picker Header")]
        public void WhenUserClickOnTabInColorPickerHeader(string tabName)
        {
            _browsersList.Active.Component<ColorPicker>().GetButtonByNameInHeader(tabName).Click();
        }

        [Then(@"Color Canvas is displayed on Color Picker")]
        public void ThenColorCanvasIsDisplayedOnColorPicker()
        {
            var colorCanvas = _browsersList.Active.Component<ColorPicker>().GetColorPickerArea();
            Verify.IsTrue(_browsersList.Active.IsElementDisplayed(colorCanvas), "Color canvas is not displayed on Color Picker");
        }

        [Then(@"Color Slider is displayed on Color Picker")]
        public void ThenColorSliderIsDisplayedOnColorPicker()
        {
            var colorSlider = _browsersList.Active.Component<ColorPicker>().GetSliderInColorPicker();
            Verify.IsTrue(_browsersList.Active.IsElementDisplayed(colorSlider), "Color Slider is not displayed on Color Picker");
        }

        [Then(@"Eyedropper button is displayed on Color Picker")]
        public void ThenColorEyedropperIsDisplayedOnColorPicker()
        {
            var eyedropper = _browsersList.Active.Component<ColorPicker>().Eyedropper;
            Verify.IsTrue(_browsersList.Active.IsElementDisplayed(eyedropper), "Color Eyedropper is not displayed on Color Picker");
        }

        [When(@"User click Eyedropper button on Color Picker")]
        public void WhenUserClickEyedropperButtonOnColorPicker()
        {
            _driver.Component<ColorPicker>().Eyedropper.Click();
        }

        [Then(@"Color Preview is displayed on Color Picker")]
        public void ThenColorPreviewIsDisplayedOnColorPicker()
        {
            var colorPreview = _browsersList.Active.Component<ColorPicker>().ColorPreview;
            Verify.IsTrue(_browsersList.Active.IsElementDisplayed(colorPreview), "Color Preview is not displayed on Color Picker");
        }

        [Then(@"Colour Hex code field is displayed on Color Picker")]
        public void ThenColourHexCodeFieldIsDisplayedOnColorPicker()
        {
            var colourHexCodeField = _browsersList.Active.Component<ColorPicker>().GetInputField();
            Verify.IsTrue(_browsersList.Active.IsElementDisplayed(colourHexCodeField), "Colour Hex code field is not displayed on Color Picker");
        }

        [Then(@"Colour Palette is displayed on Color Picker")]
        public void ThenColourPaletteIsDisplayedOnColorPicker()
        {
            var colorPalette = _browsersList.Active.Component<ColorPicker>().PaletteContainer;
            Verify.IsTrue(_browsersList.Active.IsElementDisplayed(colorPalette), "Colour Palette is not displayed on Color Picker");
        }

        [When(@"User enters '(.*)' hex code in input field on Color picker")]
        public void WhenUserEntersHexCodeInInputFieldOnColorPicker(string hexCode)
        {
            _browsersList.Active.Component<ColorPicker>().GetInputField().ClearSendKeys(hexCode);
        }

        [When(@"User remembers hex code input field value on color picker")]
        public void WhenUserRemembersHexCodeInputFieldValueOnColorPicker()
        {
            _colorPicker.HexCode = _browsersList.Active.Component<ColorPicker>().GetInputField().GetAttribute("value");
        }

        [Then(@"hex code input field value is changed in color picker")]
        public void ThenHexCodeInputFieldIsChangedInColorPicker()
        {
            var currentValue = _browsersList.Active.Component<ColorPicker>().GetInputField().GetAttribute("value");
            Verify.AreNotEqual(_colorPicker.HexCode, currentValue, $"Value of hex code input field is not changed in the color picker");
        }

        [Then(@"Colour Hex code '([^']*)' is displayed on Hex Code Color Picker")]
        public void ThenColourHexCodeIsDisplayedOnHexCodeColorPicker(string hex)
        {
            var actualColor = _browsersList.Active.Component<ColorPicker>().GetInputField().GetAttribute("value");
            Verify.IsTrue(actualColor.Contains(hex), $"Hex code '{hex}' is not  displayed on Hex Code Field. Actual: '{actualColor}'");
        }

        [Then(@"Color Preview has color '([^']*)' on Color Picker")]
        public void ThenColorPreviewHasColorOnColorPicker(string color)
        {
            var actualColor = _browsersList.Active.Component<ColorPicker>().ColorPreview.GetAttribute("style");
            Verify.IsTrue(actualColor.Contains(color), $"Color '{color}' is not  displayed on Preview Color Field. Actual: '{actualColor}'");
        }

        [Then(@"Color Preview has not color '([^']*)' on Color Picker")]
        public void ThenColorPreviewHasNotColorOnColorPicker(string color)
        {
            var actualColor = _browsersList.Active.Component<ColorPicker>().ColorPreview.GetAttribute("style");
            Verify.IsFalse(actualColor.Contains(color), $"Color '{color}' is displayed on Preview Color Field. Actual: '{actualColor}'");
        }

        [When(@"User moves cursor by '(.*)' '(.*)' coordinates to field color Picker")]
        public void WhenUserMovesCursorByCoordinatesToFieldColorPicker(int offsetX, int offsetY)
        {
            _driver.Component<ColorPicker>().GetSliderInColorPicker();
            _driver.ActionsClickAndHold(_driver.Component<ColorPicker>().GetSliderInColorPicker());
            _driver.MoveByOffset(4, offsetX, offsetY);
            _driver.ActionsReleaseElement(_driver.Component<ColorPicker>().GetSliderInColorPicker());
            Thread.Sleep(200);
        }

        [When(@"User click mouse by '(.*)' '(.*)' coordinates in field color Area")]
        public void WhenUserClickMouseByCoordinatesInFieldColorArea(int offsetX, int offsetY)
        {
            var PickerArea = _browsersList.Active.Component<ColorPicker>().GetColorPickerArea();
            _browsersList.Active.ActionsMoveToElementAndClick(PickerArea, offsetX, offsetY);
        }

        [When(@"User clicks '(.*)' button in Color Picker window")]
        public void WhenUserClicksButtonInColorPickerWindow(string buttonName)
        {
            _driver.Component<ColorPicker>().GetButtonByName(buttonName).Click();
        }

        [Then(@"'([^']*)' button is displayed on Color Picker")]
        public void ThenButtonIsDisplayedOnColorPicker(string buttonName)
        {
            var button = _browsersList.Active.Component<ColorPicker>().GetButtonByName(buttonName);
            Verify.IsTrue(_browsersList.Active.IsElementDisplayed(button), $"Button '{buttonName}' is not displayed on Color Picker");
        }

        [Then(@"checkbox with color '(.*)' is displayed in palette container on Color picker")]
        public void ThenCheckboxWithColorIsDisplayedInPaletteContainerOnColorPicker(string checkboxColor)
        {
            Verify.IsTrue(_driver.Component<ColorPicker>().GetCheckboxByColorInPaletteContainer(checkboxColor).Displayed(), $"Сheckbox with '{checkboxColor}' color is not displayed in Color Picker");
        }

        [Then(@"checkbox with color '([^']*)' is highlighted in palette container on Color picker")]
        public void ThenCheckboxWithColorIsHighlightedInPaletteContainerOnColorPicker(string checkboxColor)
        {
            Verify.IsTrue(_driver.Component<ColorPicker>().GetCheckboxByColor(checkboxColor).IsActive(), $"Checkbox with color '{checkboxColor}' is not highlighted in Color Picker");
        }

        [When(@"User clicks '(.*)' checkbox in palette container on Color picker")]
        public void WhenUserClicksCheckboxInPaletteContainerOnColorPicker(string checkboxColor)
        {
            _driver.Component<ColorPicker>().GetCheckboxByColorInPaletteContainer(checkboxColor).Click();
        }

        [When(@"User clicks no color checkbox in palette container on Color picker")]
        public void WhenUserClicksNoColorCheckboxInPaletteContainerOnColorPicker()
        {
            _driver.Component<ColorPicker>().NoColorCheckbox.Click();
        }

        [When(@"User clicks reset color checkbox in palette container on Color picker")]
        public void WhenUserClicksResetColorCheckboxInPaletteContainerOnColorPicker()
        {
            _driver.Component<ColorPicker>().ResetColorCheckbox.Click();
        }

        [Then(@"checkbox with color '(.*)' is displayed in Fill Color popup")]
        public void ThenCheckboxWithColorIsDisplayedInFillColorPopup(string checkboxColor)
        {
            Verify.IsTrue(_driver.Component<ColorPicker>().GetCheckboxByColor(checkboxColor).Displayed(), $"Сheckbox with '{checkboxColor}' color is not displayed in Color Picker");
        }

        [Then(@"checkbox with color '(.*)' is checked in Fill Color Popup")]
        public void ThenCheckboxWithColorIsCheckedInFillColorPopup(string checkboxColor)
        {
            Verify.IsTrue(_driver.Component<ColorPicker>().GetCheckboxByColor(checkboxColor).IsActive(), $"Checkbox with color '{checkboxColor}' is unchecked in Fill Color Popup");
        }

        [When(@"User clicks on color '(.*)' checkbox in Fill Color popup")]
        public void WhenUserClicksOnColorCheckboxInFillColorPopup(string checkboxColor)
        {
            _driver.Component<ColorPicker>().GetCheckboxByColor(checkboxColor).Click();
        }

        [When(@"User clicks Clear Color Selection in Fill Color Pop Up")]
        public void WhenUserClicksClearColorSelectionInFillColorPopUp()
        {
            _driver.Component<ColorPicker>().GetClearColorSelectionButton().Click();
        }

        [When(@"User remembers the location of the cursor in field color Picker")]
        public void WhenUserRemembersTheLocationOfTheCursorInFieldColorPicker()
        {
            var sliderLoc = _driver.Component<ColorPicker>().GetCursorInsideSlider().Location;
            Point point = new Point(sliderLoc.X, sliderLoc.Y);
            _locWeb.Location = point;
        }

        [When(@"User clicks by coordinate '([^']*)' on color Slider")]
        public void WhenUserClicksByCoordinateAndOnColorSlider(int offSetX)
        {
            var colorSlider = _driver.Component<ColorPicker>().GetSliderInColorPicker();
            _browsersList.Active.ActionsMoveToElementAndClick(colorSlider, offSetX, 1);
        }

        [Then(@"Slider cursor has location changed in the color picker")]
        public void ThenSliderCursorHasLocationChangedInTheColorPicker()
        {
            var sliderLoc = _driver.Component<ColorPicker>().GetCursorInsideSlider().Location;
            Verify.AreNotEqual(_locWeb.Location.X, sliderLoc.X, $"Slider location has not changed in the color picker");
        }

        [Then(@"Color slider has value '([^']*)' in the color picker")]
        public void ThenSliderHasValueInTheColorPicker(string value)
        {
            var sliderValue = _driver.Component<ColorPicker>().GetCursorInsideSlider().GetCssValue("left");
            Verify.IsTrue(sliderValue.Contains(value), $"Slider value is not '{value}' in the color picker. Actual Value: '{sliderValue}'");
        }

        [When(@"User remembers location of the cursor point in field color Area")]
        public void WhenUserRemembersLocationOfTheCursorPointInFieldColorArea()
        {
            var pointLoc = _driver.Component<ColorPicker>().GetCursorInsideColorPickerArea().Location;
            Point point = new Point(pointLoc.X, pointLoc.Y);
            _locWeb.Location = point;
        }

        [Then(@"point in field color has location changed")]
        public void ThenPointInFieldColorHasLocationChanged()
        {
            var pointLoc = _driver.Component<ColorPicker>().GetCursorInsideColorPickerArea().Location;
            Assert.AreNotEqual(_locWeb.Location.X, pointLoc.X, "Point has not changed location in color area by X axis");
            Assert.AreNotEqual(_locWeb.Location.Y, pointLoc.Y, "Point has not changed location in color area by Y axis");
        }

        [Then(@"Point in field color located in '([^']*)' '([^']*)' coordinated")]
        public void ThenPointInFieldColorHasCoordinated(int offsetX, int offsetY)
        {
            var pickerArea = _driver.Component<ColorPicker>().GetColorPickerArea().Location;
            var pointLoc = _driver.Component<ColorPicker>().GetCursorInsideColorPickerArea().Location;
            //"Assert" should be used for inaccuracies in determining the cursor's location.
            Assert.AreEqual(pickerArea.X + offsetX, pointLoc.X, 1, $"Point has not changed location in color area by X axis. Actual:'{pointLoc.X - pickerArea.X}'");
            Assert.AreEqual(pickerArea.Y + offsetY, pointLoc.Y, 1, $"Point has not changed location in color area by Y axis. Actual: '{pointLoc.Y - pickerArea.Y}'");
        }

        [When(@"User drag and drop color point through color Area")]
        public void WhenUserDragAndDropColorPointThroughColorArea()
        {
            var pointLoc = _driver.Component<ColorPicker>().GetCursorInsideColorPickerArea();
            var pickerArea = _driver.Component<ColorPicker>().GetColorPickerArea();
            _browsersList.Active.ActionsDragElementAndDropOntoElement(pointLoc, pickerArea);
            _browsersList.Active.MoveToElement(pointLoc);
        }

        [When(@"User drag and drop color point through color Area by '([^']*)' '([^']*)' coordinates")]
        public void WhenUserDragAndDropColorPointThroughColorAreaByCoordinates(int offsetX, int offsetY)
        {
            var pointLoc = _driver.Component<ColorPicker>().GetCursorInsideColorPickerArea();
            _browsersList.Active.ActionsDragAndDropToOffset(pointLoc, offsetX, offsetY);
        }

        [When(@"User remembers color of сolor area in the color picker")]
        public void WhenUserRemembersColorOfColorAreaInTheColorPicker()
        {
            var backgroundColor = _browsersList.Active.Component<ColorPicker>().GetColorPickerArea().GetCssValue("background-color");
            _colorPicker.ColorArea = backgroundColor;
        }

        [When(@"User remembers color preview in the color picker")]
        public void WhenUserRemembersColorPreviewInTheColorPicker()
        {
            var backgroundColor = _browsersList.Active.Component<ColorPicker>().ColorPreview.GetCssValue("background-color");
            _colorPicker.ColorPreview = backgroundColor;
        }

        [Then(@"Color of сolor area is changed in the color picker")]
        public void ThenColorOfColorAreaIsChangedInTheColorPicker()
        {
            var currentColor = _browsersList.Active.Component<ColorPicker>().GetColorPickerArea().GetCssValue("background-color");
            Verify.AreNotEqual(_colorPicker.ColorArea, currentColor, $"Color of color area is not changed in the color picker");
        }

        [Then(@"Color preview is changed in the color picker")]
        public void ThenColorPreviewIsChangedInTheColorPicker()
        {
            var currentColor = _browsersList.Active.Component<ColorPicker>().ColorPreview.GetCssValue("background-color");
            Verify.AreNotEqual(_colorPicker.ColorPreview, currentColor, $"Color preview is not changed in the color picker");
        }

        [Then(@"Color area has '([^']*)' background color")]
        public void ThenColorAreaHasBackgroundColor(string color)
        {
            var actualColor = _driver.Component<ColorPicker>().GetColorPickerArea().GetCssValue("background-color");
            Verify.IsTrue(actualColor.Contains(color), $"Color '{color}' is not displayed on for Color Area. Actual: '{actualColor}'");
        }
    }
}