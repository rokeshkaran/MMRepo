using MjAutomationCore.Components.Base;
using MjAutomationCore.Extensions;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MjAutomationCore.Components.ColorPicker
{
    class ColorPicker : BaseWebComponent, IWebComponent
    {
        public string Container => ".//div[contains(@class,'sp-container sp-light')][not(contains (@class,'sp-hidden'))]";

        protected override By Construct()
        {
            var selector = By.XPath(Container);
            return selector;
        }

        public IWebElement GetInputField()
        {
            return Driver.GetComponent<InputByAttribute>("sp-input", new Properties() { Parent = Instance });
        }

        [FindsBy(How = How.XPath, Using = ".//*[contains(@class,'sp-eyedropper')]")]
        public IWebElement Eyedropper { get; set; }

        [FindsBy(How = How.XPath, Using = ".//*[contains(@class,'sp-palette-row-initial')]//*[contains(@class,'sp-thumb-inner')]")]
        public IWebElement ColorPreview { get; set; }

        #region PaletteContainer

        [FindsBy(How = How.XPath, Using = ".//div[@class='sp-palette-container']")]
        public IWebElement PaletteContainer { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='sp-palette-container']//span[@class=' sp-thumb-el sp-thumb-el-nocolor']")]
        public IWebElement NoColorCheckbox { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='sp-palette-container']//*[contains(@class,'sp-thumb-el-default')]")]
        public IWebElement ResetColorCheckbox { get; set; }

        public IWebElement GetCheckboxByColorInPaletteContainer(string color)
        {
            var selector = By.XPath($".//div[@class='sp-palette-container']//span[@data-color='{color}']");
            if (!Driver.IsElementInElementDisplayed(Instance, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Checkbox with '{color}' color is not displayed in palette container on Color picker");
            }

            return Instance.FindElement(selector);
        }

        public IList<IWebElement> GetCheckboxListInSelectionPalette()
        {
            var selector = By.XPath(".//div[contains(@class,'sp-palette-row')]/span");
            return Instance.FindElements(selector);
        }

        public IWebElement GetCheckboxByColor(string color)
        {
            return GetCheckboxListInSelectionPalette().First(x => x.GetAttribute("data-color").Equals(color));
        }

        #endregion

        #region PickerContainer

        public IWebElement GetPickerContainer()
        {
            var selector = By.XPath(".//div[@class='sp-picker-container']");
            if (!Driver.IsElementInElementDisplayed(Instance, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Picker Container is not displayed");
            }

            return Instance.FindElement(selector);
        }

        public IWebElement GetSliderInColorPicker()
        {
            var selector = By.XPath(".//div[@class='sp-hue']");
            if (!Driver.IsElementInElementDisplayed(GetPickerContainer(), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception("Slider is not displayed in color picker");
            }

            return Instance.FindElement(selector);
        }
        public IWebElement GetCursorInsideSlider()
        {
            var selector = By.XPath(".//div[@class='sp-slider']");
            if (!Driver.IsElementInElementDisplayed(GetPickerContainer(), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception("Cursor is not displayed in color picker area");
            }

            return Instance.FindElement(selector);
        }
        public IWebElement GetColorPickerArea()
        {
            var selector = By.XPath(".//div[@class='sp-color']");
            if (!Driver.IsElementInElementDisplayed(GetPickerContainer(), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception("Color picker area is not displayed");
            }

            return Instance.FindElement(selector);
        }

        public IWebElement GetCursorInsideColorPickerArea()
        {
            var selector = By.XPath(".//div[@class='sp-dragger']");
            if (!Driver.IsElementInElementDisplayed(GetPickerContainer(), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception("Cursor is not displayed in color picker area");
            }

            return Instance.FindElement(selector);
        }
        #endregion

        #region ButtonContainer

        public IWebElement GetButtonByName(string button)
        {
            var selector = By.XPath($".//div[contains(@class,'sp-button-container')]/*[text()='{button}']");
            if (!Driver.IsElementInElementDisplayed(Instance, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"'{button}' button is not displayed in Color Picker window");
            }

            return Instance.FindElement(selector);
        }

        public IWebElement GetButtonByNameInHeader(string tab)
        {
            var selector = By.XPath($"./parent::*/preceding-sibling::*//*[text()='{tab}']");
            if (!Driver.IsElementInElementDisplayed(Instance, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Tab '{tab}' is not displayed on Color Picker");
            }
            return Instance.FindElement(selector);
        }

        public IWebElement GetClearColorSelectionButton()
        {
            var selector = By.XPath($".//div[contains(@class,'sp-clear-display')]");
            if (!Driver.IsElementInElementDisplayed(Instance, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Clear color selection button is not displayed in Color Picker window");
            }

            return Instance.FindElement(selector);
        }
        #endregion
    }
}