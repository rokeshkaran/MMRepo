using AutomationUtils.Utils;
using MjAutomationCore.Components.SelectBox;
using MjAutomationCore.Components.TextEditor;
using MjAutomationCore.Extensions;
using MjAutomationCore.Utils;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using System.Threading;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.Components.TextEditor
{
    [Binding]
    class TextEditorSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly BrowsersList _browsers;

        public TextEditorSteps(WebDriver driver, BrowsersList browsersList)
        {
            _driver = browsersList.GetBrowser();
            _browsers = browsersList;
        }

        [Then(@"text editor is displayed in '([^']*)' container")]
        public void ThenTextEditorIsDisplayedInContainer(string container)
        {
            var parent = WebContainer.GetContainerSelector(container);
            Verify.IsTrue(_browsers.Active.ComponentDisplayedState<TextEditorElement>(new Properties { ParentSelector = parent, WaitTime = WebDriverExtensions.WaitTime.Short }), $"Text editor is not displayed in '{container}' container");
        }

        [Then(@"text editor is not displayed in '([^']*)' container")]
        public void ThenTextEditorIsNotDisplayedInContainer(string container)
        {
            var parent = WebContainer.GetContainerSelector(container);
            Verify.IsFalse(_browsers.Active.ComponentDisplayedState<TextEditorElement>(new Properties { ParentSelector = parent, WaitTime = WebDriverExtensions.WaitTime.Short }), $"Text editor is displayed in '{container}' container");
        }

        #region FontStyle

        [When(@"User clicks '([^']*)' button in font style section of text editor in '([^']*)' container")]
        public void WhenUserClicksButtonInFontStyleSectionOfTextEditorInContainer(string button, string container)
        {
            var parent = WebContainer.GetContainerSelector(container);
            _browsers.Active.Component<TextEditorElement>(new Properties { ParentSelector = parent }).GetFontStyleButton(button).Click();
        }

        [Then(@"'([^']*)' button is selected in font style section of text editor in '([^']*)' container")]
        public void ThenButtonIsSelectedInFontStyleSectionOfTextEditorInContainer(string button, string container)
        {
            var parent = WebContainer.GetContainerSelector(container);
            Verify.IsTrue(_browsers.Active.Component<TextEditorElement>(new Properties { ParentSelector = parent }).GetFontStyleButton(button).IsSelected(),
                $"Button '{button}' is unselected in font style section of text editor in '{container}' container");
        }

        [Then(@"'([^']*)' button is unselected in font style section of text editor in '([^']*)' container")]
        public void ThenButtonIsUnselectedInFontStyleSectionOfTextEditorInContainer(string button, string container)
        {
            var parent = WebContainer.GetContainerSelector(container);
            Verify.IsFalse(_browsers.Active.Component<TextEditorElement>(new Properties { ParentSelector = parent }).GetFontStyleButton(button).IsSelected(),
                $"Button '{button}' is selected in font style section of text editor in '{container}' container");
        }

        #endregion

        #region FontSize

        [When(@"User clicks font size section in text editor and selects '([^']*)' option in '([^']*)' selectbox in '([^']*)' container")]
        public void WhenUserClicksFontSizeSectionInTextEditorAndSelectsOptionInSelectboxInContainer(string optionName, string selectboxName, string container)
        {
            var parent = WebContainer.GetContainerSelector(container);
            _browsers.Active.Component<TextEditorElement>(new Properties { ParentSelector = parent }).GetSelectboxOptionContentInSection("text-style-size").Click();
            _browsers.Active.HoverAndClick(_browsers.Active.Component<SelectboxOptions>(selectboxName).GetOptionByName(optionName));
        }

        [When(@"User enters '([^']*)' value in input field of font size section on text editor in '([^']*)' container")]
        public void WhenUserEntersValueInInputFieldOfFontSizeSectionOnTextEditorInContainer(string value, string container)
        {
            var parent = WebContainer.GetContainerSelector(container);
            _browsers.Active.Component<TextEditorElement>(new Properties { ParentSelector = parent }).GetSelectboxOptionContentInSection("text-style-size").SendKeys(value);
        }

        [When(@"User clicks '([^']*)' arrow in font size section of text editor in '([^']*)' container")]
        public void WhenUserClicksArrowInFontSizeSectionOfTextEditorInContainer(string arrow, string container)
        {
            var parent = WebContainer.GetContainerSelector(container);
            _browsers.Active.Component<TextEditorElement>(new Properties { ParentSelector = parent }).SelectArrowInFontSizeSection(arrow);
        }

        [Then(@"font size '([^']*)' is displayed in font style section of text editor in '([^']*)' container")]
        public void ThenFontSizeIsDisplayedInFontStyleSectionOfTextEditorInContainer(string size, string container)
        {
            var parent = WebContainer.GetContainerSelector(container);
            Verify.AreEqual(_browsers.Active.Component<TextEditorElement>(new Properties { ParentSelector = parent }).GetSelectboxOptionContentInSection("text-style-size").GetText(), size,
               $"Size '{size}' is not displayed in font style section of text editor in '{container}' container");
        }

        #endregion

        #region FontFamily

        [When(@"User clicks font family section in text editor and selects '([^']*)' option in '([^']*)' selectbox in '([^']*)' container")]
        public void WhenUserClicksFontFamilySectionInTextEditorAndSelectsOptionInSelectboxInContainer(string optionName, string selectboxName, string container)
        {
            var parent = WebContainer.GetContainerSelector(container);
            _browsers.Active.HoverAndClick(_browsers.Active.Component<TextEditorElement>(new Properties { ParentSelector = parent }).GetFontSectionByName("text-style-font-family"));
            _browsers.Active.HoverAndClick(_browsers.Active.Component<SelectboxOptions>(selectboxName).GetOptionByName(optionName));
        }

        [Then(@"no font family option is selected in text editor on '([^']*)' container")]
        public void ThenNoFontFamilyOptionIsSelectedInTextEditorOnContainer(string container)
        {
            var parent = WebContainer.GetContainerSelector(container);
            var IsFontSelected = _browsers.Active.Component<TextEditorElement>(new Properties { ParentSelector = parent }).IsFontFamilySelected();
            Verify.IsFalse(IsFontSelected, $"font family option is selected in text editor on '{container}' container");
        }

        [Then(@"'([^']*)' font family option is selected in text editor on '([^']*)' container")]
        public void ThenFontFamilyOptionIsSelectedInTextEditorOnContainer(string font, string container)
        {
            var parent = WebContainer.GetContainerSelector(container);
            var FontSelected = _browsers.Active.Component<TextEditorElement>(new Properties { ParentSelector = parent }).GetFontFamilySelected().Text;
            Verify.IsTrue(FontSelected.Contains(font), $"'{font} Font Family is not selected in '{container}' container.Actual Select: '{FontSelected}'");
        }

        #endregion

        #region ColorSection

        [When(@"User clicks Color button in text editor in '([^']*)' container")]
        public void WhenUserClicksColorButtonInTextEditorInContainer(string container)
        {
            var parent = WebContainer.GetContainerSelector(container);
            _browsers.Active.Component<TextEditorElement>(new Properties { ParentSelector = parent }).ColorButton.Click();
        }

        #endregion

        #region TextAlignment

        [When(@"User clicks align icon in text editor and selects '([^']*)' option in '([^']*)' selectbox in '([^']*)' container")]
        public void WhenUserClicksAlignIconInTextEditorAndSelectsOptionInSelectboxInContainer(string optionName, string selectboxName, string container)
        {
            var parent = WebContainer.GetContainerSelector(container);
            _browsers.Active.Component<TextEditorElement>(new Properties { ParentSelector = parent }).FontAlignIcon.Click();
            Thread.Sleep(100);//wait for option to appear
            _browsers.Active.HoverAndClick(_browsers.Active.Component<SelectboxOptions>(selectboxName).GetOptionByName(optionName));
            Thread.Sleep(200);//wait for option to be selected
        }

        [Then(@"'([^']*)' align option is selected in text editor in '([^']*)' container")]
        public void ThenAlignOptionIsSelectedInTextEditorInContainer(string optionName, string container)
        {
            var AlignSelected = _browsers.Active.Component<TextEditorElement>().GetAlignSelected();
            Verify.IsTrue(AlignSelected.Contains(optionName), $"'{optionName} Align option is not selected in '{container}' container");
        }
        #endregion
    }
}