using MjAutomationCore.Components.Buttons;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;

namespace MjAutomationCore.Components.TextEditor
{
    class TextEditorElement : BaseWebComponent, IWebComponent
    {
        public new By Context => By.XPath(".//div[@class='joint-text-style joint-theme-default']");

        private string FontSelector = ".//div[contains(@class,'joint-select-box joint-theme-default text-style')][contains(@class,'{0}')][not(contains(@class,'rendered'))]";

        public string SelectboxOptionContent = ".//div[contains(@class, 'select-box-option-content')]";

        public string ArrowSelector = ".//span[@class='opt']/span[@class='{0}']";

        // The second part of the xpath '//div[contains(@class,'select-box-placeholder')]' is to cater the diferent in HTML structure on CI
        public string FontFamilySelector = ".//div[contains(@class,'text-style-font-family')]//span[contains(@style,'font-family')] | .//div[contains(@class,'text-style-font-family')]//div[contains(@class,'select-box-placeholder')]";

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'sp-replacer sp-light')]")]
        public IWebElement ColorButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'joint-select-box joint-theme-default text-alignment')]//img[@style]")]
        public IWebElement FontAlignIcon { get; set; }
        protected override By Construct()
        {
            return Context;
        }

        #region FontStyle
        public IWebElement GetFontStyleButton(string button)
        {
            return Driver.GetComponent<ButtonWithTextOrIconName>(button, new Properties() { Parent = Instance });
        }

        #endregion

        #region Font

        public IWebElement GetFontSectionByName(string sectionName)
        {
            var selector = By.XPath(string.Format(FontSelector, sectionName));
            return Instance.FindElement(selector);
        }

        public void SelectArrowInFontSizeSection(string arrow)
        {
            var selector = By.XPath(string.Format(ArrowSelector, arrow));
            Instance.FindElement(selector).Click();
        }

        public IWebElement GetSelectboxOptionContentInSection(string sectionName)
        {
            return GetFontSectionByName(sectionName).FindElement(By.XPath(SelectboxOptionContent));
        }

        public bool IsFontFamilySelected()
        {
            var selector = By.XPath(FontFamilySelector);
            return Driver.IsElementInElementExists(Instance, selector, WebDriverExtensions.WaitTime.Short);
        }

        public IWebElement GetFontFamilySelected()
        {
            if(!IsFontFamilySelected())
            {
                throw new Exception("Font Family is not selected");
            }
            return Instance.FindElement(By.XPath(FontFamilySelector));
        }
        #endregion

        #region Align
        public string GetAlignSelected()
        {
                string src = FontAlignIcon.GetAttribute("src");
                return src;
        }
        #endregion
    }
}
