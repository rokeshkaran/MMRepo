using AutomationUtils.Extensions;
using AutomationUtils.Utils;
using MjAutomationCore.Components.Base;
using MjAutomationCore.Components.SelectBox;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Extensions;
using MjAutomationCore.Helpers;
using MjAutomationCore.Pages.WebAppProject;
using MjAutomationCore.Pages.WebAppProject.SidePanel;
using MjAutomationCore.Pages.WebAppProject.SideToolbox;
using MjAutomationCore.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Threading;
using Reqnroll;
using Reqnroll.Assist;

namespace MjAutomationCore.Steps.WebAppProject.WebEditor
{
    [Binding]
    class SidePanelSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly BrowsersList _browsers;
        private readonly ValuesText _valuesText;
        private readonly SessionRandomValue _sessionRandom;
        private readonly LocationWebDto _locWeb;

        public SidePanelSteps(WebDriver driver, BrowsersList browsersList, ValuesText valuesText, LocationWebDto locWeb, SessionRandomValue sessionRandom)
        {
            _driver = browsersList.GetBrowser();
            _browsers = browsersList;
            _valuesText = valuesText;
            _locWeb = locWeb;
            _sessionRandom = sessionRandom;
        }

        #region EnterValueInFieldFoPanel

        [When(@"User enters '(.*)' value in '(.*)' property input field of '(.*)' side panel with '(.*)' header")]
        public void WhenUserEntersValueInPropertyInputFieldOfSidePanelWithHeader(string value, string fieldName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAtWithContext<SidePanel>();
            var replaceText = value.Replace("\\n", "\n");
            var inputField = panel.GetInputFieldByPropertyName(fieldName, panelName, header);
            _browsers.Active.MoveToElement(inputField);
            inputField.Click();
            _browsers.Active.ClearByJavascript(inputField);
            inputField.SendKeys(replaceText);
            _browsers.Active.ActionsSendKeys("Enter");

            //Below check if value has been added to field or not
            var valueInField = inputField.GetAttribute("value").RemoveLineBreakes();
            if (valueInField != replaceText)
            {
                _browsers.Active.ClearByJavascript(inputField);
                inputField.SendKeys(replaceText);
            }
            panel.GetPropertyTitleByName(fieldName, panelName, header).Click();
        }

        [When(@"User clicks '([^']*)' property input field of '([^']*)' side panel with '([^']*)' header")]
        public void WhenUserClicksPropertyInputFieldOfSidePanelWithHeader(string fieldName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAtWithContext<SidePanel>();
            _driver.MoveToElement(panel.GetPropertyByName(fieldName, panelName, header));
            panel.GetInputFieldByPropertyName(fieldName, panelName, header).Click();
        }

        [When(@"User deletes all data in '([^']*)' property input field of '([^']*)' side panel with '([^']*)' header")]
        public void WhenUserDeletesAllDataInPropertyInputFieldOfSidePanelWithHeader(string fieldName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAtWithContext<SidePanel>();
            _driver.MoveToElement(panel.GetPropertyByName(fieldName, panelName, header));
            panel.GetInputFieldByPropertyName(fieldName, panelName, header).Click();
            _driver.ClearByJavascript(panel.GetInputFieldByPropertyName(fieldName, panelName, header));
        }

        [Then(@"'([^']*)' property input field is disabled on '([^']*)' side panel with '([^']*)' header")]
        public void ThenPropertyInputFieldIsDisabledOnSidePanelWithHeader(string fieldName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAtWithContext<SidePanel>();
            Verify.IsTrue(panel.GetInputFieldByPropertyName(fieldName, panelName, header).IsDisabledState(), $"'{fieldName}' input field of '{panelName}' side panel with '{header}' header is not disable");
        }

        [Then(@"Input field is disabled in '([^']*)' section of '([^']*)' side panel with '([^']*)' header")]
        public void ThenInputFieldIsDisabledInSectionOfSidePanelWithHeader(string sectionName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAtWithContext<SidePanel>();
            Verify.IsTrue(panel.GetDisableDateInputFieldInSectionOnSidePanel(sectionName, panelName, header), $"'{sectionName}' input field of '{panelName}' side panel with '{header}' header is not disable");
        }

        [Then(@"'([^']*)' input field is disabled in '([^']*)' section of '([^']*)' side panel with '([^']*)' header")]
        public void ThenInputFieldIsDisabledInSectionOfSidePanelWithHeader(string field, string sectionName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAtWithContext<SidePanel>();
            Verify.IsTrue(panel.GetInputField(field, panelName, header, sectionName).IsDisabledState(), $"'{sectionName}' input field of '{panelName}' side panel with '{header}' header is not disable");
        }

        [Then(@"'([^']*)' input field is disabled of '([^']*)' side panel with '([^']*)' header")]
        public void ThenInputFieldIsDisabledOfSidePanelWithHeader(string labelName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAtWithContext<SidePanel>();
            Verify.IsTrue(panel.GetDisableInputFieldByLabelOnSidePanel(labelName, panelName, header), $"'{labelName}' input field of '{panelName}' side panel with '{header}' header is not disable");
        }

        [When(@"User enter '(.*)' value in the '(.*)' field of '(.*)' panel")]
        public void WhenUserEnterValueInTheFieldOfPanel(string value, string fieldName, string panelName)
        {
            UserEnterValueInTheFieldInSectionOfPanel(value, fieldName, panelName);
        }

        private void UserEnterValueInTheFieldInSectionOfPanel(string value, string fieldName, string panelName,
            string sectionName = "")
        {
            var panel = _driver.NowAtWithContext<SidePanel>();
            _driver.MoveToElement(panel.GetFieldByNameOnPanel(fieldName, panelName, sectionName));
            _driver.WaitForElementToBeDisplayed(panel.GetFieldByNameOnPanel(fieldName, panelName, sectionName));
            panel.GetFieldByNameOnPanel(fieldName, panelName, sectionName).Click();
            _driver.ClearByJavascript(panel.GetFieldByNameOnPanel(fieldName, panelName, sectionName).FindElement(By.XPath(panel.InputField)));
            panel.GetFieldByNameOnPanel(fieldName, panelName, sectionName).FindElement(By.XPath(panel.InputField)).SendKeysByCharacter(value);
        }

        #endregion

        #region EnterTextInFieldFoPanel

        [When(@"User enter '(.*)' text in the '(.*)' field of '(.*)' panel")]
        public void WhenUserEnterTextInTheFieldOfPanel(string value, string fieldName, string panelName)
        {
            var panel = _driver.NowAtWithContext<SidePanel>();
            var textValue = panel.GetFieldByNameOnPanel(fieldName, panelName).FindElement(By.XPath(panel.GetValueOfTextArea));
            var replaceText = value.Replace("\\n", "\n");
            textValue.Clear();
            textValue.SendKeysByCharacter(replaceText);
        }

        #endregion

        #region ColorPickerMenuButton

        [Then(@"'(.*)' color is displayed to '(.*)' field in '(.*)' section of '(.*)' side panel with '(.*)' header")]
        public void ThenColorIsDisplayedToFieldInSectionOfSidePanelWithHeader(string color, string fieldName, string section, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            Verify.IsTrue(panel.DisplayedColorInMenuButton(color, fieldName, panelName, header, section), $"'{color}' color is not displayed to '{fieldName}' field in '{section}' section of '{panelName}' side panel with '{header}' header");
        }

        [Then(@"'(.*)' color is displayed to '(.*)' field of '(.*)' side panel with '(.*)' header")]
        public void ThenColorIsDisplayedToFieldOfSidePanelWithHeader(string color, string fieldName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            Verify.IsTrue(panel.DisplayedColorInMenuButton(color, fieldName, panelName, header), $"'{color}' color is not displayed to '{fieldName}' field of '{panelName}' side panel with '{header}' header");
        }

        [When(@"User clicks Color Picker menu button in '(.*)' field in '(.*)' section of '(.*)' side panel with '(.*)' header")]
        public void WhenUserClicksColorPickerMenuButtonInFieldInSectionOfSidePanelWithHeader(string fieldName, string section, string panelName, string header)
        {
            UserClicksColorPickerMenuButtonInFieldInSectionOfSidePanelWithHeader(fieldName, panelName, header, section);
        }

        [When(@"User clicks Color Picker menu button in '(.*)' field of '(.*)' side panel with '(.*)' header")]
        public void WhenUserClicksColorPickerMenuButtonInFieldOfSidePanelWithHeader(string fieldName, string panelName, string header)
        {
            UserClicksColorPickerMenuButtonInFieldInSectionOfSidePanelWithHeader(fieldName, panelName, header);
        }

        public void UserClicksColorPickerMenuButtonInFieldInSectionOfSidePanelWithHeader(string fieldName, string panelName, string header, string section = "")
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            panel.GetColorPickerMenuButton(fieldName, panelName, header, section).Click();
        }

        #endregion

        #region GetValueInDropdownOfPanel

        [When(@"User clicks '(.*)' property selectbox of '(.*)' side panel with '(.*)' header and selects '(.*)' in dropdown menu")]
        public void WhenUserClicksPropertySelectboxOfSidePanelWithHeaderAndSelectsInDropdownMenu(string fieldName, string panelName, string header, string valueInDropdown)
        {
            var panel = _browsers.Active.NowAtWithContext<SidePanel>();
            _browsers.Active.MoveToElement(panel.GetPropertyByName(fieldName, panelName, header));
            _browsers.Active.WaitForElementToBeDisplayed(panel.GetPropertyByName(fieldName, panelName, header));
            panel.GeSelectboxByPropertyName(fieldName, panelName, header).Click();
            var dropdown = _driver.NowAt<DropdownSelectboxOptions>();
            dropdown.GetDropDownMenuOption(valueInDropdown).Click();
        }

        [Then(@"'([^']*)' value is displayed in '([^']*)' property selectbox of '([^']*)' side panel with '([^']*)' header")]
        public void ThenValueIsDisplayedInPropertySelectboxOfSidePanelWithHeader(string value, string fieldName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAtWithContext<SidePanel>();
            var valueInSelectBox = panel.GeSelectboxByPropertyName(fieldName, panelName, header).GetText();
            if (valueInSelectBox == null)
            {
                valueInSelectBox = valueInSelectBox ?? "";
            }
            Verify.AreEqual(valueInSelectBox, value, $"'{value}' value is not displayed in '{fieldName}' property selectbox of '{panelName}' side panel with '{header}' header");
        }


        [When(@"User clicks '(.*)' field of '(.*)' panel and selects '(.*)' in the dropdown menu")]
        public void WhenUserClicksFieldOfPanelAndSelectsInTheDropdownMenu(string fieldName, string panelName, string valueInDropdown)
        {
            UserClicksFieldInSectionOfPanelAndSelectsInDropdownMenu(fieldName, panelName, valueInDropdown);
        }

        private void UserClicksFieldInSectionOfPanelAndSelectsInDropdownMenu(string fieldName, string panelName, string value,
            string sectionName = "")
        {
            var panel = _driver.NowAtWithContext<SidePanel>();
            var dropdown = _driver.NowAt<DropdownSelectboxOptions>();
            _driver.MoveToElement(panel.GetFieldByNameOnPanel(fieldName, panelName, sectionName));
            _driver.WaitForElementToBeDisplayed(panel.GetFieldByNameOnPanel(fieldName, panelName, sectionName));
            panel.GetFieldByNameOnPanel(fieldName, panelName, sectionName).Click();
            dropdown.GetDropDownMenuOption(value);
        }

        [Then(@"dropdown menu is displayed in '([^']*)' section of '([^']*)' side panel with '([^']*)' header")]
        public void ThenDropdownMenuIsDisplayedInSectionOfSidePanelWithHeade(string sectionName, string panelName, string header)
        {
            var dropdown = _driver.NowAt<DropdownSelectboxOptions>();
            Verify.IsTrue(dropdown.DropdownMenuOptions.Displayed(), $"dropdown menu is not displayed in '{sectionName}' section of' '{panelName}' side panel with '{header}' header");
        }

        #endregion

        #region GetPatternLineInDropdownOfPanel

        [When(@"User clicks '(.*)' field in '(.*)' section of '(.*)' panel and select pattern '(.*)' in dropdown menu")]
        public void WhenUserClicksFieldInSectionOfPanelAndSelectPatternInDropdownMenu(string fieldName, string sectionName, string panelName, string patternInDropdown)
        {
            UserClicksFieldInSectionOfPanelAndSelectPatternInDropdownMenu(fieldName, panelName, patternInDropdown, sectionName);
        }

        private void UserClicksFieldInSectionOfPanelAndSelectPatternInDropdownMenu(string fieldName, string panelName, string patternLineInDropdown,
            string sectionName = "")
        {
            var panel = _driver.NowAtWithContext<SidePanel>();
            var dd = _driver.NowAt<DropdownSelectboxOptions>();
            _driver.MoveToElement(panel.GetFieldByNameOnPanel(fieldName, panelName, sectionName));
            _driver.WaitForElementToBeDisplayed(panel.GetFieldByNameOnPanel(fieldName, panelName, sectionName));
            panel.GetFieldByNameOnPanel(fieldName, panelName, sectionName).Click();
            _driver.WaitForElementToBeDisplayed(dd.DropdownMenuOptions);
            Assert.IsTrue(dd.DropdownMenuOptions.Displayed(), $"dropdown menu is not displayed for {fieldName} section");
            dd.DropdownMenuOptions.FindElement(By.XPath(panel.GetPatternLineInDropdownOnPanel(patternLineInDropdown))).Click();
        }
        #endregion

        #region ValueIsDisplayedInFieldOnPanel

        [Then(@"'(.*)' value is displayed in '(.*)' property field of '(.*)' side panel with '(.*)' header")]
        public void ThenValueIsDisplayedInPropertyFieldOfSidePanelWithHeader(string value, string fieldName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAtWithContext<SidePanel>();
            Verify.AreEqual(value, panel.GetValueInSelectbox(fieldName, panelName, header), $"'{value}' value is not displayed in '{fieldName}' property selectbox of '{panelName}' side panel with '{header}' header");
        }

        [Then(@"'(.*)' value is displayed in '(.*)' property input field of '(.*)' side panel with '(.*)' header")]
        public void ThenValueIsDisplayedInPropertyInputFieldOfSidePanelWithHeader(string value, string fieldName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAtWithContext<SidePanel>();
            Thread.Sleep(200);
            var valueInField = panel.GetInputFieldByPropertyName(fieldName, panelName, header).GetAttribute("value").RemoveLineBreakes();
            Verify.AreEqual(valueInField, value, $"'{value}' value is not displayed in '{fieldName}' property input field of '{panelName}' side panel with '{header}' header");
        }

        [Then(@"'(.*)' value is displayed to '(.*)' field of '(.*)' panel")]
        public void ThenValueIsDisplayedToFieldOfPanel(string value, string fieldName, string panelName)
        {
            ValueIsDisplayedToFieldInTheSectionOfPanel(value, fieldName, panelName);
        }

        private void ValueIsDisplayedToFieldInTheSectionOfPanel(string value, string fieldName, string panelName,
            string sectionName = "")
        {
            var panel = _driver.NowAtWithContext<SidePanel>();
            Thread.Sleep(200);
            var valueInField = panel.GetFieldByNameOnPanel(fieldName, panelName, sectionName).FindElement(By.XPath(panel.InputField)).GetAttribute("value");
            Assert.AreEqual(valueInField, value, $"{value} value is not displayed in field {fieldName} on {panelName} panel");
        }

        #endregion

        #region ValueInField

        [Then(@"'(.*)' value is displayed to '(.*)' field in '(.*)' section of '(.*)' side panel with '(.*)' header")]
        public void ThenValueIsDisplayedToFieldInSectionOfSidePanelWithHeader(string value, string field, string section, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            var valueInField = panel.GetInputField(field, panelName, header, section).GetAttribute("value");
            Verify.AreEqual(valueInField, value, $"'{value}' value is not displayed to field '{field}' in '{section}' section of '{panelName}' side panel with '{header}' header");
        }

        [When(@"User enters '(.*)' value to '(.*)' field in '(.*)' section of '(.*)' side panel with '(.*)' header")]
        public void WhenUserEntersValueToFieldInSectionOfSidePanelWithHeader(string value, string field, string section, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            _browsers.Active.MoveToElement(panel.GetInputField(field, panelName, header, section));
            panel.GetInputField(field, panelName, header, section).Click();
            _driver.ActionKeysCombinationControlA();
            panel.GetInputField(field, panelName, header, section).SendKeys(value);
        }

        [When(@"User enters '(.*)' value to '(.*)' field in '(.*)' section of '(.*)' side panel with '(.*)' for Size section")]
        public void WhenUserEntersValueToFieldInSectionOfSidePanelWithForSizeSection(string value, string field, string section, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            panel.GetInputField(field, panelName, header, section).Click();
            _driver.ActionKeysCombinationControlA();
            _driver.ActionsSendKeys("Delete");
            panel.GetInputField(field, panelName, header, section).SendKeysByCharacter(value);
        }

        [When(@"User clicks on '(.*)' field in '(.*)' section of '(.*)' side panel with '(.*)' header")]
        public void WhenUserClicksOnFieldInSectionOfSidePanelWithHeader(string field, string section, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            panel.GetInputField(field, panelName, header, section).Click();
        }

        #endregion


        #region ValueSelectionField

        [Then(@"'(.*)' value is displayed in '(.*)' selectbox in '(.*)' section of '(.*)' side panel with '(.*)' header")]
        public void ThenValueIsDisplayedInSelectboxInSectionOfSidePanelWithHeader(string value, string selectbox, string sectionName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            Verify.IsTrue(panel.DisplayedSelectboxOptionName(value, selectbox, panelName, header, sectionName),
            $"Value '{value}' is not displayed in '{selectbox}' selectbox in '{sectionName}' section of '{panelName}' side panel with '{header}' header");
        }

        [Then(@"'([^']*)' value is displayed in '([^']*)' section of '([^']*)' side panel with '([^']*)' header")]
        public void ThenValueIsDisplayedInSectionOfSidePanelWithHeader(string value, string sectionName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            Verify.IsTrue(panel.DisplayedSelectboxOptionValue(value, panelName, header, sectionName),
            $"Value '{value}' is not displayed in '{sectionName}' section of '{panelName}' side panel with '{header}' header");
        }

        [When(@"User clicks '(.*)' selectbox in '(.*)' section of '(.*)' side panel with '(.*)' header and select '(.*)' in dropdown menu")]
        public void WhenUserClicksSelectboxInSectionOfSidePanelWithHeaderAndSelectInDropdownMenu(string selectbox, string sectionName, string panelName, string header, string value)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            var dropdown = _driver.NowAt<DropdownSelectboxOptions>();
            _browsers.Active.HoverAndClick(panel.GetSelectboxByName(selectbox, panelName, header, sectionName));
            _browsers.Active.HoverAndClick(dropdown.GetDropDownMenuOption(value));
        }

        [When(@"User clicks on the selectbox in '([^']*)' section of '([^']*)' side panel with '([^']*)' header and select '([^']*)' in dropdown menu")]
        public void WhenUserClicksOnTheSelectboxInSectionOfSidePanelWithHeaderAndSelectInDropdownMenu(string sectionName, string panelName, string header, string value)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            var dropdown = _driver.NowAt<DropdownSelectboxOptions>();
            _browsers.Active.HoverAndClick(panel.GetSelectboxInSection(sectionName, panelName, header));
            _browsers.Active.HoverAndClick(dropdown.GetDropDownMenuOption(value));
        }

        [Then(@"following options are displayed in '([^']*)' selectbox dropdown menu")]
        public void ThenFollowingOptionsAreDisplayedInSelectboxDropdownMenu(string dropDownselectboxMenu, Table table)
        {
            var dropdown = _driver.NowAt<DropdownSelectboxOptions>();
            var expectedItemList = table.Rows.SelectMany(row => row.Values).ToList();
            var optionList = dropdown.GetContentValueInDopdownOptionList().Select(x => x.Text).ToList();
            Verify.AreEqual(expectedItemList, optionList, $"Options is not displayed correctly in '{dropDownselectboxMenu}' dropdown menu");
        }

        [When(@"User selects '([^']*)' in dropdown menu")]
        public void WhenUserSelectsInDropdownMenu(string value)
        {
            var dropdown = _driver.NowAt<DropdownSelectboxOptions>();
            _browsers.Active.HoverAndClick(dropdown.GetDropDownMenuOption(value));
        }

        [When(@"User clicks dropdown arrow in '([^']*)' section of '([^']*)' side panel with '([^']*)' header")]
        public void WhenUserClicksDropdownArrowInSectionOfSidePanelWithHeader(string sectionName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            _browsers.Active.HoverAndClick(panel.GetSelectboxInSection(sectionName, panelName, header));
        }

        #endregion

        [Then(@"'(.*)' font pattern is displayed to '(.*)' selection field in the '(.*)' section of '(.*)' panel")]
        public void ThenFontPatternIsDisplayedToSelectionFieldInTheSectionOfPanel(string line, string fieldName, string sectionName, string panelName)
        {
            var panel = _driver.NowAtWithContext<SidePanel>();
            var lineTypes = panel.GetFieldByNameOnPanel(fieldName, panelName, sectionName).FindElement(By.XPath(panel.PatternTypesInSelectionField)).GetCssValue("stroke-dasharray");
            var dasharrayLine = lineTypes.Replace("px", String.Empty);
            Assert.AreEqual(dasharrayLine, line, $"{line} line types is not displayed in {fieldName} selection field on {panelName} panel");
        }

        #region CheckboxInFieldOnPanel

        [When(@"User checks checkbox to '(.*)' field in '(.*)' section of '(.*)' side panel with '(.*)' header")]
        public void WhenUserChecksCheckboxToFieldInSectionOfSidePanelWithHeader(string fieldName, string section, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            panel.SetCheckboxStateInField(fieldName, panelName, header, true, section);
        }

        [When(@"User checks uncheckbox to '(.*)' field in '(.*)' section of '(.*)' side panel with '(.*)' header")]
        public void WhenUserChecksUncheckboxToFieldInSectionOfSidePanelWithHeader(string fieldName, string section, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            panel.SetCheckboxStateInField(fieldName, panelName, header, false, section);
        }

        [Then(@"checkbox is checked to '(.*)' field in '(.*)' section of '(.*)' side panel with '(.*)' header")]
        public void ThenCheckboxIsCheckedToFieldInSectionOfSidePanelWithHeader(string fieldName, string section, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            Verify.IsTrue(panel.GetCheckboxState(fieldName, panelName, header, section), $"Checkbox is unchecked to '{fieldName}' field in '{section}' section of '{panelName}' side panel with '{header}' header");
        }

        [Then(@"checkbox is unchecked to '(.*)' field in '(.*)' section of '(.*)' side panel with '(.*)' header")]
        public void ThenCheckboxIsUncheckedToFieldInSectionOfSidePanelWithHeader(string fieldName, string section, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            Verify.IsFalse(panel.GetCheckboxState(fieldName, panelName, header, section), $"Checkbox is checked to '{fieldName}' field in '{section}' section of '{panelName}' side panel with '{header}' header");
        }

        #endregion

        [Then(@"'(.*)' property input field border is highlighted in '(.*)' color of '(.*)' side panel with '(.*)' header")]
        public void ThenPropertyInputFieldBorderIsHighlightedInColorOfSidePanelWithHeader(string fieldName, string color, string panelName, string header)
        {
            var panel = _driver.NowAtWithContext<SidePanel>();
            var fieldColor = panel.GetInputFieldByPropertyName(fieldName, panelName, header).GetCssValue("outline");
            Verify.IsTrue(fieldColor.Contains(color), $"'{fieldName}' is not highlighted in '{color}' color of '{panelName}' side panel with '{header}' header ");
        }

        [Then(@"'(.*)' field border is highlighted in red color of '(.*)' panel")]
        public void ThenFieldBorderIsHighlightedInRedColorOfPanel(string fieldName, string panelName)
        {
            var panel = _driver.NowAtWithContext<SidePanel>();
            var colorField = panel.GetFieldByNameOnPanel(fieldName, panelName).FindElement(By.XPath(panel.InputField)).GetCssValue("outline");
            Assert.IsTrue(panel.GetFieldByNameOnPanel(fieldName, panelName).FindElement(By.XPath(panel.InputField)).IsInvalid(), $"{fieldName} is not highlighted in red");
            Assert.IsTrue(colorField.Contains("rgb(255, 0, 0)"), $"{fieldName} is not highlighted in red");
        }

        [Then(@"'(.*)' text is displayed to '(.*)' field of '(.*)' panel")]
        public void ThenTextIsDisplayedToFieldOfPanel(string value, string fieldName, string panelName)
        {
            var panel = _driver.NowAtWithContext<SidePanel>();
            var textValue = panel.GetFieldByNameOnPanel(fieldName, panelName).FindElement(By.XPath(panel.GetValueOfTextArea)).GetAttribute("value");
            var expectedText = textValue.RemoveLineBreakes();
            Assert.AreEqual(value, expectedText);
        }

        #region NotesPanel

        [When(@"User enters '(.*)' text to input note field on Notes panel")]
        public void WhenUserEntersTextToInputNoteFieldOnNotesPanel(string value)
        {
            var panel = _driver.NowAt<SidePanel>();
            panel.NotesInputField.SendKeys(value);
        }

        [Then(@"'(.*)' text is dipslayed in Note field on Notes panel")]
        public void ThenTextIsDipslayedInNoteFieldOnNotesPanel(string value)
        {
            var panel = _driver.NowAt<SidePanel>();
            _driver.WaitForElementToContainsText(panel.NotesInputField, value, WebDriverExtensions.WaitTime.Short);
            var getText = panel.NotesInputField.Text;
            Assert.AreEqual(getText, value, $"Text '{value}' is not displayed in note field on Notes panel");
        }

        [Then(@"'(.*)' text is displayed on view only Notes panel")]
        public void ThenTextIsDipslayedOnviewonlyNotesPanel(string value)
        {
            var panel = _driver.NowAt<SidePanel>();
            var getText = panel.SingleViewOnlyNoteContainer.Text;
            Verify.AreEqual(getText, value, $"Text '{value}' is not displayed on Notes panel");
        }

        [Then(@"User checks text to note field on Notes panel")]
        public void ThenUserChecksTextToNoteFieldOnNotesPanel()
        {
            var panel = _driver.NowAt<SidePanel>();
            Assert.AreEqual(panel.NotesInputField.Text, _valuesText.Value, "Incorrect text format");
        }

        [Then(@"'(.*)' value is highlighted '(.*)' color in Note field on Notes panel")]
        public void ThenValueIsHighlightedColorInNoteFieldOnNotesPanel(string value, string color)
        {
            var panel = _driver.NowAt<SidePanel>();
            var getColor = panel.NotesInputField.FindElement(By.XPath($".//mark[text()='{value}']")).GetCssValue("background-color");
            Assert.AreEqual(getColor, color);
        }

        [When(@"User clicks Notes input field")]
        public void WhenUserClicksNotesInputField()
        {
            var page = _driver.NowAt<SidePanel>();
            page.NotesInputField.Click();
        }

        [When(@"User Clear notes input field")]
        public void WhenUserClearNotesInputField()
        {
            var page = _driver.NowAt<SidePanel>();
            page.NotesInputField.Clear();
        }

        [When(@"User enters '(.*)' characters to input note field on Notes panel")]
        public void WhenUserEntersCharactersToInputNoteFieldOnNotesPanel(int numberOfCharacters)
        {
            var text = RandomTextWithSpacesForNotes(numberOfCharacters);
            _browsers.Active.SendKeysByActions(text);
            _valuesText.Value = text;
        }

        [Then(@"'([^']*)' text is displayed '([^']*)' style")]
        public void ThenTextIsDisplayedStyle(string noteText, string fontStyle)
        {
            var panel = _driver.NowAt<SidePanel>();
            var element = panel.NotesInputField.FindElement(By.XPath($".//*[text()='{noteText}']"));
            switch (fontStyle)
            {
                case ("normal"):
                case ("italic"):

                    var getTextStyle = element.GetCssValue("font-style");
                    Verify.AreEqual(getTextStyle, fontStyle, $"Note text '{noteText}' is not displayed '{fontStyle}' style");
                    break;

                case ("underline"):
                case ("line-through"):
                    var getTextDecoration = element.GetCssValue("text-decoration");
                    Verify.AreEqual(getTextDecoration, fontStyle, $"Note text '{noteText}' is not displayed '{fontStyle}' style");
                    break;

                case ("bold"):
                    var getFontWeight = element.GetCssValue("font-weight");
                    //The font weight proprerty in numeric for bold is 700, hence below font-weight equal to 700 means value is bold 
                    if (getFontWeight.Equals("700"))
                    {
                        var convertFontWeightToBold = getFontWeight.Replace("700", "bold");
                        Verify.AreEqual(convertFontWeightToBold, fontStyle, $"Note text '{noteText}' is not displayed '{fontStyle}' style");
                    }
                    break;
            }
        }

        [When(@"User clicks on '([^']*)' button in note style section '([^']*)' of '([^']*)' side panel with '([^']*)' header")]
        public void WhenUserClicksOnButtonInNoteStyleSectionOfSidePanelWithHeader(string ButtonName, string sectionName, string sidePanel, string notes)
        {
            var panel = _driver.NowAt<SidePanel>();
            panel.GetButtonInNoteToolbarSection(ButtonName, sectionName, sidePanel, notes).Click();
        }

        [Then(@"'([^']*)' button is selected in note syle section '([^']*)' of '([^']*)' side panel with '([^']*)' header")]
        public void ThenButtonIsSelectedInNoteSyleSectionOfSidePanelWithHeader(string ButtonName, string sectionName, string sidePanel, string notes)
        {
            var panel = _driver.NowAt<SidePanel>();
            Verify.IsTrue(panel.GetButtonInNoteToolbarSection(ButtonName, sectionName, sidePanel, notes).IsActive(),
             $"Button '{ButtonName}' is unselected in notes style section of '{sidePanel}' side panel with '{notes}' header");
        }

        [Then(@"'([^']*)' button is unselected in note syle section '([^']*)' of '([^']*)' side panel with '([^']*)' header")]
        public void ThenButtonIsUnselectedInNoteSyleSectionOfSidePanelWithHeader(string ButtonName, string sectionName, string sidePanel, string notes)
        {
            var panel = _driver.NowAt<SidePanel>();
            Verify.IsFalse(panel.GetButtonInNoteToolbarSection(ButtonName, sectionName, sidePanel, notes).IsActive(),
             $"Button '{ButtonName}' is selected in notes style section of '{sidePanel}' side panel with '{notes}' header");
        }

        [When(@"User clicks in note editor and selects '([^']*)' option in '([^']*)' selectbox")]
        public void WhenUserClicksInNoteEditorAndSelectsOptionInSelectbox(string optionName, string selectboxName)
        {
            var page = _driver.NowAt<SidePanel>();
            _browsers.Active.WaitForElementToBeExists(page.NotesTextStyleSelectOptions);
            page.NotesTextStyleSelectOptions.Click();
            _browsers.Active.HoverAndClick(_browsers.Active.Component<SelectboxOptions>(selectboxName).GetOptionByName(optionName));
        }

        [When(@"User click '([^']*)' section in note editor and selects '([^']*)' option in drop down options list")]
        public void WhenUserClickSectionInNoteEditorAndSelectsOptionInDropDownOptionsList(string sectionName, string optionName)
        {
            var page = _driver.NowAt<SidePanel>();
            page.GetDropdownListMenuByLabelName(sectionName).Click();
            _browsers.Active.HoverAndClick(page.GetDropdownListItemsByName(sectionName, optionName));
        }

        [Then(@"'([^']*)' note text is displayed '([^']*)' in font")]
        public void ThenNoteTextIsDisplayedInFont(string noteText, string fontFamily)
        {
            var page = _driver.NowAt<SidePanel>();
            Verify.IsTrue(page.CheckNoteTextFontFamily(noteText, fontFamily), $"'{fontFamily}' is not displayed in Note text '{noteText}'");
        }

        [Then(@"'([^']*)' note text has '([^']*)' size")]
        public void ThenNoteTextHasSize(string noteText, string fontSize)
        {
            var page = _driver.NowAt<SidePanel>();
            Verify.IsTrue(page.CheckNoteTextSize(noteText, fontSize), $"Note text '{noteText}' has not change '{fontSize}' size");
        }

        [Then(@"Image '([^']*)' is displayed at position '([^']*)' between '([^']*)' and '([^']*)' text to input note field on Notes panel")]
        public void ThenImageIsDisplayedAtPositionBetweenAndTextToInputNoteFieldOnNotesPanel(string imageName, int index, string noteText1, string noteText2)
        {
            var page = _driver.NowAt<SidePanel>();
            List<string> NoteContainerValue = page.GetNotesContainerValues();
            Verify.IsTrue(NoteContainerValue[index - 1] == noteText1 && NoteContainerValue[index].Contains(imageName) && NoteContainerValue[index + 1] == noteText2, $"'{imageName}' is not displayed between text '{noteText1}' and '{noteText2}' ");
        }

        [When(@"User uploads '([^']*)' file through input type file to note field")]
        public void WhenUserUploadsFileThroughInputTypeFile(string imageName)
        {
            var page = _driver.NowAt<SidePanel>();
            page.NotesInputFileType.SendKeys(Utils.FileSystemHelper.GeneratePathToEmbedded(imageName));
            //Wait for file upload data
            Thread.Sleep(2000);
        }

        [Then(@"width of the notes side panel is '([^']*)'")]
        public void ThenWidthOfTheNotesSidePanelIs(int width)
        {
            var page = _driver.NowAt<SidePanel>();
            var elementWidth = page.NotesInputField.Size.Width;
            Verify.AreEqual(elementWidth, width, $"Note does not have same width '{width}' as actual Width '{elementWidth}'");
        }

        [Then(@"text is displayed as '([^']*)' wrapped in notes textbox")]
        public void ThenTextIsWrappedInNoteInputField(string text)
        {
            var page = _driver.NowAt<SidePanel>();
            var getWrappedText = page.NotesInputField.GetCssValue("word-wrap");
            Verify.AreEqual(getWrappedText, text, $"Note text is not wrapped '{getWrappedText}'");
        }

        [When(@"User scrolls the note textbox up")]
        public void WhenUserScrollsTheNoteTextboxUp()
        {
            var page = _driver.NowAt<SidePanel>();
            _driver.ScrollGridToTheTop(page.NotesInputField);
            //Wait for scroll to happen
            Thread.Sleep(1000);
        }

        [When(@"User scrolls the note textbox down")]
        public void WhenUserScrollsTheNoteTextboxDown()
        {
            var page = _driver.NowAt<SidePanel>();
            _driver.ScrollGridToTheEnd(page.NotesInputField);
            //Wait for scroll to happen
            Thread.Sleep(1000);
        }

        [Then(@"notes textbox contains vertical scroll bars")]
        public void ThenNotesTextboxContainsVerticalScrollBars()
        {
            var page = _driver.NowAt<SidePanel>();
            var verticalScrollBars = _driver.IsElementHaveVerticalScrollbar(page.NotesInputField);
            Verify.IsTrue(verticalScrollBars, "Vertical Scroll bars are not visible");
        }

        [Then(@"notes textbox contains horizontal scroll bars")]
        public void ThenNotesTextboxContainsHorizontalScrollBars()
        {
            var page = _driver.NowAt<SidePanel>();
            var horizontalScrollBars = _driver.IsElementHaveVerticalScrollbar(page.NotesInputField);
            Verify.IsTrue(horizontalScrollBars, "Horizontal Scroll bars are not visible");
        }

        [When(@"User scrolls the note textbox to right")]
        public void WhenUserScrollsTheNoteTextboxToRight()
        {
            var page = _driver.NowAt<SidePanel>();
            _browsers.Active.ScrollGridToTheRight(page.NotesInputField);
            //Wait for scroll to happen
            Thread.Sleep(1000);
        }

        [When(@"User remembers location of image '([^']*)' in notes textbox")]
        public void WhenUserRemembersLocationOfImageInNotesTextbox(string image)
        {
            var page = _driver.NowAt<SidePanel>();
            var imageLocation = page.NotesInputField.FindElement(By.XPath(page.GetImageNameInNoteTexbox(image))).Location;
            Point point = new Point(imageLocation.X, imageLocation.Y);
            _locWeb.Location = point;
        }

        [Then(@"'([^']*)' image has changed location by Y axis in notes textbox")]
        public void ThenImageHasChangedLocationByYAxisInNotesTextbox(string image)
        {
            var page = _driver.NowAt<SidePanel>();
            Verify.AreNotEqual(_locWeb.Location.Y, page.NotesInputField.FindElement(By.XPath(page.GetImageNameInNoteTexbox(image))).Location.Y, $"Image '{image}' has not changed location by Y axis");
        }

        [Then(@"'([^']*)' image has changed location by X axis in notes textbox")]
        public void ThenImageHasChangedLocationByXAxisInNotesTextbox(string image)
        {
            var page = _driver.NowAt<SidePanel>();
            Verify.AreNotEqual(_locWeb.Location.X, page.NotesInputField.FindElement(By.XPath(page.GetImageNameInNoteTexbox(image))).Location.X, $"Image '{image}' has not changed location by Y axis");
        }

        [When(@"notes textbox is increase by width X axis '([^']*)' and Y axis '([^']*)'")]
        public void WhenNotesTextboxIsIncreaseByWidthXAxisAndYAxis(int offsetX, int offsetY)
        {
            var page = _driver.NowAt<SidePanel>();
            var pointOnShape = page.NotesResizeblaArea;
            _driver.ActionsClickAndHold(pointOnShape);
            _driver.MoveByOffset(1, offsetX, offsetY);
            _driver.ActionsRelease();
            //Waiting for element to be release
            Thread.Sleep(200);
        }

        [Then(@"plain text is displayed in notes textbox")]
        public void ThenPlainTextIsDisplayedInNotesTextbox()
        {
            var page = _driver.NowAt<SidePanel>();
            var getText = page.NotesInputField.Text;
            Verify.IsTrue(getText.Length > 0, "No text is displayed in notes textbox");
        }

        [Then(@"plain text is not displayed in notes textbox")]
        public void ThenPlainTextIsNotDisplayedInNotesTextbox()
        {
            var page = _driver.NowAt<SidePanel>();
            var getText = page.NotesInputField.Text;
            Verify.IsFalse(getText.Length > 0, "Text is displayed in notes textbox");
        }

        [Then(@"'([^']*)' image is displayed in notes textbox")]
        public void ThenImageIsDisplayedInNotesTextbox(string imageName)
        {
            var page = _driver.NowAt<SidePanel>();
            Verify.IsTrue(page.IsImageDisplayedInNoteTexbox(imageName), $"'Image {imageName}' is not displayed in notes textbox");
        }

        [Then(@"'([^']*)' image is not displayed in notes textbox")]
        public void ThenImageIsNotDisplayedInNotesTextbox(string imageName)
        {
            var page = _driver.NowAt<SidePanel>();
            Verify.IsFalse(page.IsImageDisplayedInNoteTexbox(imageName), $"'Image {imageName}' is displayed in notes textbox");
        }

        [Then(@"bulleted list '([^']*)' is displayed in notes textbox")]
        public void ThenBulletedListIsDisplayedInTheNoteTextbox(string disc)
        {
            var page = _driver.NowAt<SidePanel>();
            var bulletedListText = page.NotesInputField.FindElement(By.XPath(".//ul")).GetCssValue("list-style-type");
            Verify.AreEqual(bulletedListText, disc, "No bulleted list is displayed in notes textbox");
        }

        [Then(@"a table '([^']*)' is displayed in notes textbox")]
        public void ThenATableIsDisplayedInNotesTextbox(string collapse)
        {
            var page = _driver.NowAt<SidePanel>();
            var table = page.NotesInputField.FindElement(By.XPath(".//table")).GetCssValue("border-collapse");
            Verify.AreEqual(table, collapse, "No table is displayed in notes textbox");
        }

        [Then(@"hyperlink '([^']*)' is displayed in notes textbox")]
        public void ThenHyperlinkIsDisplayedInNotesTextbox(string hyperlink)
        {
            var page = _driver.NowAt<SidePanel>();
            var link = page.NotesInputField.FindElements(By.XPath(".//a")).First(x => x.Text.Equals(hyperlink)).GetText();
            Verify.AreEqual(link, hyperlink, $"'{hyperlink}' is not displayed in notes textbox");
        }

        [Then(@"hyperlink with topic name '([^']*)' is displayed in notes textbox")]
        public void ThenHyperlinkWithTopicNameIsDisplayedInNotesTextbox(string hyperlinkTopic)
        {
            var page = _driver.NowAt<SidePanel>();
            Verify.AreEqual(page.NotesInputField.FindElement(By.XPath(page.GetHyperlinkInNoteTexbox(hyperlinkTopic))).GetText(), hyperlinkTopic, $"'{hyperlinkTopic}' is not displayed in notes textbox");
        }

        [When(@"User clicks '([^']*)' arrow in font size section of note editor")]
        public void WhenUserClicksArrowInFontSizeSectionOfNoteEditor(string arrowPosition)
        {
            var page = _driver.NowAt<SidePanel>();
            page.SelectArrowInFontSizeSection(arrowPosition);
        }

        public static string RandomTextWithSpacesForNotes(int count)
        {
            var result = string.Empty;
            for (int i = 0; i < count; i++)
            {
                if ((i % 20).Equals(0))
                {
                    result += " ";
                    i++;
                    continue;
                }
                else
                {
                    result += (char)new Random().Next(33, 126);
                    Thread.Sleep(1);
                }
            }

            return result;
        }

        #endregion

        [Then(@"'(.*)' text is displayed in comment container on Comments panel")]
        public void ThenTextIsDisplayedInCommentContainerOnCommentsPanel(string value)
        {
            var page = _browsers.Active.NowAtWithContext<SidePanel>();
            var emptyComment = page.EmptyComment.Text;
            Assert.AreEqual(emptyComment, value, $"Text '{value}' is displayed incorrect in comment container on Comments panel");
        }

        [Then(@"'(.*)' comment contains following info on Comments panel:")]
        public void ThenCommentContainsFollowingInfoOnCommentsPanel(int commentNumber, Table table)
        {
            Thread.Sleep(500); //Wait for commens
            var page = _driver.NowAtWithContext<SidePanel>();
            var container = table.CreateInstance<CommentsContainerDto>();
            var commentAvatar = page.GetCommentsContainerByIndex(commentNumber).FindElement(By.XPath(page.CommentAvatar)).GetAttribute("src");
            var commentAuthor = page.GetCommentsContainerByIndex(commentNumber).FindElement(By.XPath(page.CommentAuthor)).Text;
            var сommentTopic = page.GetCommentsContainerByIndex(commentNumber).FindElement(By.XPath(page.CommentTopics)).Text;
            var commentText = page.GetCommentsContainerByIndex(commentNumber).FindElement(By.XPath(page.CommentText)).Text;
            var commentTime = page.GetCommentsContainerByIndex(commentNumber).FindElement(By.XPath(page.CommentTime)).Text;

            if (!string.IsNullOrEmpty(container.CommentAvatar))
            {
                Verify.IsTrue(commentAvatar.Contains(container.CommentAvatar), $"Avatar icon is  incorrect in '{commentNumber}' comments container");
            }

            if (!string.IsNullOrEmpty(container.CommentAuthor))
            {
                Verify.AreEqual(commentAuthor, container.CommentAuthor, $"Comment Author is displayed incorrect in '{commentNumber}' comments container");
            }

            if (!string.IsNullOrEmpty(container.CommentText))
            {
                Verify.AreEqual(commentText, container.CommentText.AddRandom(_sessionRandom), $"Comment text is displayed incorrect in '{commentNumber}' comments container");
            }

            if (!string.IsNullOrEmpty(container.CommentTopic))
            {
                Verify.AreEqual(сommentTopic, container.CommentTopic, $"Comment topic is displayed incorrect in '{commentNumber}' comments container");
            }

            if (!string.IsNullOrEmpty(container.CommentTime))
            {
                Verify.IsTrue(commentTime.Contains(container.CommentTime.Date("M/d/yyyy")), $"Comment date is displayed incorrect in '{commentNumber}' comments container");
            }
        }

        [When(@"User clicks Comment button on Comments panel")]
        public void WhenUserClicksCommentButtonOnCommentsPanel()
        {
            var panel = _driver.NowAt<SidePanel>();
            _browsers.Active.HoverAndClick(panel.CommentButton);
        }

        [Then(@"Comment button is not displayed on Comments panel")]
        public void ThenCommentButtonIsNotDisplayedOnCommentsPanel()
        {
            var panel = _driver.NowAt<SidePanel>();
            Verify.IsFalse(_browsers.Active.IsElementDisplayed(panel.CommentButton), "Comment button is displayed on Side Panel panel");
        }

        [When(@"User clicks '([^']*)' button on '([^']*)' comment text on Comments panel")]
        public void WhenUserClicksButtonOnCommentTextOnCommentsPanel(string button, string comment)
        {
            var page = _driver.NowAt<SidePanel>();
            comment = comment.AddRandom(_sessionRandom);
            page.GetCommentsButtonByText(button, comment).Click();
        }

        [When(@"User clicks Delete button in '(.*)' comment on Comments panel")]
        public void WhenUserClicksDeleteButtonInCommentOnCommentsPanel(int commentNumber)
        {
            var page = _driver.NowAtWithContext<SidePanel>();
            page.GetCommentsContainerByIndex(commentNumber).FindElement(By.XPath(page.DeleteButtons)).Click();
        }

        #region EditBarOnCommentsPanel

        [Then(@"input field for editing comments is displayed to the User")]
        public void ThenInputFieldForEditingCommentsIsDisplayedToTheUser()
        {
            var panel = _driver.NowAt<SidePanel>();
            Assert.IsTrue(panel.DisplayedInputFieldForEditingComments(), "Input field for editing comments is not displayed");
        }

        [Then(@"input field for editing comments is not displayed to the User")]
        public void ThenInputFieldForEditingCommentsIsNotDisplayedToTheUser()
        {
            var panel = _driver.NowAt<SidePanel>();
            Assert.IsFalse(panel.DisplayedInputFieldForEditingComments(), "Input field for editing comments is displayed");
        }

        [When(@"User enters '(.*)' text in comment edit field of Comments panel")]
        public void WhenUserEntersTextInCommentEditFieldOfCommentsPanel(string value)
        {
            var panel = _driver.NowAt<SidePanel>();
            panel.InputFieldForEditingComments.ClearSendKeys(value);
        }

        [When(@"User clicks '(.*)' button in comment edit bar of Comments panel")]
        public void WhenUserClicksButtonInCommentEditBarOfCommentsPanel(string buttonName)
        {
            var panel = _driver.NowAt<SidePanel>();
            panel.GetButtonByNameInCommentEditBar(buttonName).Click();
        }

        #endregion

        [Then(@"'(.*)' side panel with '(.*)' header is displayed to the User")]
        public void ThenSidePanelWithHeaderIsDisplayedToTheUser(string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            Verify.IsTrue(panel.DisplayedSidePanel(panelName, header), $"'{panelName}' panel with '{header}' header is not displayed");
        }

        [Then(@"'(.*)' side panel is displayed to the User")]
        public void ThenSidePanelIsDisplayedToTheUser(string panelName)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            Verify.IsTrue(panel.DisplayedSidePanel(panelName), $"'{panelName}' panel is not displayed");
        }

        [Then(@"'(.*)' side panel with '(.*)' header is not displayed to the User")]
        public void ThenSidePanelWithHeaderIsNotDisplayedToTheUser(string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            Verify.IsFalse(panel.DisplayedSidePanel(panelName, header), $"'{panelName}' panel with '{header}' header is displayed");
        }

        #region СommentsPanel

        [Then(@"'(.*)' User name is displayed in the comment on Сomments panel")]
        public void ThenUserNameIsDisplayedInTheCommentOnСommenstPanel(string userName)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            Assert.IsTrue(panel.UsersNameInСomment.Any(x => x.Text.Equals(userName)), $"User '{userName}' is not displayed in comments");
        }

        [Then(@"'(.*)' comment topic is displayed in the comment on Сomments panel")]
        public void ThenCommentTopicIsDisplayedInTheCommentOnСommentsPanel(string topicName)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            Assert.IsTrue(panel.CommentTopic.Any(x => x.Text.Equals(topicName)), $"Topic Name '{topicName}' is not displayed in comments");
        }

        [When(@"User clicks '(.*)' tab on Сomments panel")]
        public void WhenUserClicksTabOnСommentsPanel(string tabName)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            panel.GetTabByNameOnСommentsPanel(tabName).Click();
        }

        [Then(@"'(.*)' tab is displayed on Сomments panel")]
        public void ThenTabIsDisplayedOnСommentsPanel(string tabName)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            Assert.IsTrue(panel.DisplayedTabOnСommentsPanel(tabName), $"Tab '{tabName}' is not displayed on Сomments panel");
        }

        [Then(@"'(.*)' tab is not displayed on Сomments panel")]
        public void ThenTabIsNotDisplayedOnСommentsPanel(string tabName)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            Assert.IsFalse(panel.DisplayedTabOnСommentsPanel(tabName), $"Tab '{tabName}' is displayed on Сomments panel");
        }

        [Then(@"'(.*)' tab is active on Сomments panel")]
        public void ThenTabIsActiveOnСommentsPanel(string tabName)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            _browsers.Active.WaitForElementToContainsTextInAttribute(panel.GetTabByNameOnСommentsPanel(tabName), "active", "class", WebDriverExtensions.WaitTime.Short);
            Verify.IsTrue(panel.GetTabByNameOnСommentsPanel(tabName).IsActive(), $"Tab '{tabName}' is not active on Сomments panel");
        }


        [Then(@"'(.*)' comment text is displayed in the comment on Сomments panel")]
        public void ThenCommentTextIsDisplayedInTheCommentOnСommentsPanel(string text)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            Assert.IsTrue(panel.СommentText.Any(x => x.Text.Equals(text)), $"Text '{text}' is not displayed in comments");
        }

        [Then(@"'(.*)' comment date and time is displayed in the comment on Сomments panel")]
        public void ThenCommentDateAndTimeIsDisplayedInTheCommentOnСommentsPanel(string creationData)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            Assert.IsTrue(panel.CommentCreationData.Any(x => x.Text.Equals(creationData)), $"Creation data '{creationData}' is not displayed in comments");
        }

        #endregion

        [Then(@"'(.*)' css property for '(.*)' should have '(.*)' value")]
        public void ThenCssPropertyForShouldHaveValue(string testFormat, string topicName, string value)
        {
            var page = _driver.NowAtWithContext<SidePanel>();
            _driver.WaitForElementToBeDisplayed(page.GetFormatTestInTopicByName(topicName));
            var format = page.GetFormatTestInTopicByName(topicName).GetCssValue(testFormat);
            Assert.AreEqual(format, $"{value}");
        }

        [When(@"User clicks '([^']*)' action button on '([^']*)' side panel with '([^']*)' header")]
        public void WhenUserClicksActionButtonOnSidePanelWithHeader(string actionButton, string panelName, string header)
        {
            var panel = _browsers.Active.NowAtWithContext<SidePanel>();
            panel.GetContentActionButtonByName(actionButton, panelName, header).Click();
        }

        [When(@"User clicks '([^']*)' action button on '([^']*)' side panel with '([^']*)' header  and select '([^']*)' item in '([^']*)' dropdown")]
        public void WhenUserClicksActionButtonOnSidePanelWithHeaderAndSelectItemInDropdown(string actionButton, string panelName, string header, string item, string dropdownMenu)
        {
            var panel = _driver.NowAtWithContext<SidePanel>();
            panel.GetContentActionButtonByName(actionButton, panelName, header).Click();
            _browsers.Active.Component<DropdownMenuItem>(dropdownMenu).GetItemByName(item).Click();
        }

        [Then(@"'([^']*)' action button is displayed of '([^']*)' side panel with '([^']*)' header")]
        public void ThenActionButtonIsDisplayedOfSidePanelWithHeader(string actionButton, string panelName, string header)
        {
            var panel = _browsers.Active.NowAtWithContext<SidePanel>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(panel.GetContentActionButtonByName(actionButton, panelName, header), WebDriverExtensions.WaitTime.Short), $"Action button '{actionButton}' is not displayed of '{panelName}' side panel with '{header}' header");
        }

        [Then(@"'(.*)' resource is displayed in '(.*)' section of '(.*)' side panel with '(.*)' header")]
        public void ThenResourceIsDisplayedInSectionOfSidePanelWithHeader(string value, string sectionName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            Verify.IsTrue(panel.DisplayedResourceInSectionOnPanel(value, sectionName, panelName, header), $"Resource '{value}' is not displayed in '{sectionName}' section of '{panelName}' panel with '{header}' header");
        }

        [Then(@"'(.*)' resource is not displayed in '(.*)' section of '(.*)' side panel with '(.*)' header")]
        public void ThenResourceIsNotDisplayedInSectionOfSidePanelWithHeader(string value, string sectionName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            Verify.IsFalse(panel.DisplayedResourceInSectionOnPanel(value, sectionName, panelName, header), $"Resource '{value}' is displayed in '{sectionName}' section of '{panelName}' panel with '{header}' header");
        }

        [Then(@"input filed is displayed empty in '([^']*)' section of '([^']*)' side panel with '([^']*)' header")]
        public void ThenInputFiledIsDisplayedEmptyInSectionOfSidePanelWithHeader(string sectionName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            Verify.IsFalse(panel.DisplayedItemInResourceInputField(sectionName, panelName, header), $"Input filed is not empty in '{sectionName}' section of '{panelName}' side panel with '{header}' header");
        }

        [When(@"User clicks Remove on '(.*)' resource in '(.*)' section on '(.*)' panel with '(.*)' header")]
        public void WhenUserClicksRemoveOnResourceInSectionOnPanelWithHeader(string value, string sectionName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            panel.RemoveResourceByNemeInSectionOnPanel(value, sectionName, panelName, header);
        }

        #region TaskInformationPanel

        [When(@"User checks checkbox in '(.*)' section of '(.*)' side panel with '(.*)' header")]
        public void WhenUserChecksCheckboxInSectionOfSidePanelWithHeader(string sectionName, string panelName, string header)
        {
            var panel = _driver.NowAt<SidePanel>();
            panel.SetCheckboxState(sectionName, panelName, true, header);
        }

        [When(@"User checks '([^']*)' checkbox of '([^']*)' side panel with '([^']*)' header")]
        public void WhenUserChecksCheckboxOfSidePanelWithHeader(string milestone, string panelByName, string header)
        {
            var panel = _driver.NowAt<SidePanel>();
            panel.SetCheckboxStateByLabel(milestone, panelByName, header, true);
        }

        [When(@"User unchecks '([^']*)' checkbox of '([^']*)' side panel with '([^']*)' header")]
        public void WhenUserUnchecksCheckboxOfSidePanelWithHeader(string milestone, string panelByName, string header)
        {
            var panel = _driver.NowAt<SidePanel>();
            panel.SetCheckboxStateByLabel(milestone, panelByName, header, false);
        }

        [When(@"User unchecks checkbox in '(.*)' section of '(.*)' side panel with '(.*)' header")]
        public void WhenUserUnchecksCheckboxInSectionOfSidePanelWithHeader(string sectionName, string panelName, string header)
        {
            var panel = _driver.NowAt<SidePanel>();
            panel.SetCheckboxState(sectionName, panelName, false, header);
        }

        [Then(@"checkbox by label '([^']*)' is checked in '([^']*)' side panel with '([^']*)' header")]
        public void ThenCheckboxByLabelIsCheckedInSidePanelWithHeader(string labelName, string panelName, string header)
        {
            var panel = _driver.NowAt<SidePanel>();
            Verify.IsTrue(panel.CheckboxCheckedInSidePanelByLabel(labelName, panelName, header), $"Checkbox is unchecked in '{panelName}' side panel with '{header}' header");
        }

        [Then(@"checkbox by label '([^']*)' is unchecked in '([^']*)' side panel with '([^']*)' header")]
        public void ThenCheckboxByLabelIsUncheckedInSidePanelWithHeader(string labelName, string panelName, string header)
        {
            var panel = _driver.NowAt<SidePanel>();
            Verify.IsFalse(panel.CheckboxCheckedInSidePanelByLabel(labelName, panelName, header), $"Checkbox is checked in '{panelName}' side panel with '{header}' header");
        }

        [Then(@"checkbox is checked in '(.*)' section of '(.*)' side panel with '(.*)' header")]
        public void ThenCheckboxIsCheckedInSectionOfSidePanelWithHeader(string sectionName, string panelName, string header)
        {
            var panel = _driver.NowAt<SidePanel>();
            Verify.IsTrue(panel.CheckboxCheckedInSectionOnPanel(sectionName, panelName, header), $"Checkbox is unchecked in '{sectionName}' section of '{panelName}' side panel with '{header}' header");
        }

        [Then(@"checkbox is unchecked in '(.*)' section of '(.*)' side panel with '(.*)' header")]
        public void ThenCheckboxIsUncheckedInSectionOfSidePanelWithHeader(string sectionName, string panelName, string header)
        {
            var panel = _driver.NowAt<SidePanel>();
            Verify.IsFalse(panel.CheckboxCheckedInSectionOnPanel(sectionName, panelName, header), $"Checkbox is checked in '{sectionName}' section of '{panelName}' side panel with '{header}' header");
        }

        [When(@"User enters '(.*)' date in input filed in '(.*)' section of '(.*)' side panel with '(.*)' header")]
        public void WhenUserEntersDateInInputFiledInSectionOfSidePanelWithHeader(string value, string sectionName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            value = value.AddRandom(_sessionRandom).Date();
            panel.GetDateInputFieldInSectionOnSidePanel(sectionName, panelName, header).SendKeys(value);
            //Wait for value to be inserted
            Thread.Sleep(300);
            _driver.ActionsSendKeys("Enter");
        }

        [When(@"User enters '([^']*)' in input field of '([^']*)' in costs section of '([^']*)' side panel with '([^']*)' header")]
        public void WhenUserEntersInInputFieldOfInCostsSectionOfSidePanelWithHeader(string value, string inputField, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            _browsers.Active.DoubleClick(panel.GetCostInputFieldInSectionOnSidePanel(inputField, panelName, header));
            _driver.ClearSendKeyByJavascript(panel.GetCostInputFieldInSectionOnSidePanel(inputField, panelName, header), value);
            //Wait for value to be inserted
            Thread.Sleep(300);
        }

        [Then(@"'([^']*)' value is displayed in input field of '([^']*)' in costs section of '([^']*)' side panel with '([^']*)' header")]
        public void ThenValueIsDisplayedInInputFieldOfInCostsSectionOfSidePanelWithHeader(string value, string inputField, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            var valueFromField = panel.GetCostInputFieldInSectionOnSidePanel(inputField, panelName, header).GetText();
            Verify.AreEqual(valueFromField, value, $"'{value}' is not displayed in cost section of '{panelName}' side panel with '{header}' header");
        }

        [Then(@"'(.*)' date is displayed in '(.*)' section of '(.*)' side panel with '(.*)' header")]
        public void ThenDateIsDisplayedInSectionOfSidePanelWithHeader(string value, string sectionName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            var valueFromDateField = panel.GetDateInputFieldInSectionOnSidePanel(sectionName, panelName, header).GetAttribute("value");
            string date = DateTime.ParseExact(valueFromDateField, "yyyy-MM-dd", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy");
            Verify.AreEqual(date, value.Date(), $"Date '{value}' is not displayed in '{sectionName}' section of '{panelName}' side panel with '{header}' header");
        }

        [Then(@"'([^']*)' date is displayed in '([^']*)' section of '([^']*)' side panel with '([^']*)' header ignore weekend")]
        public void ThenDateIsDisplayedInSectionOfSidePanelWithHeaderIgnoreWeekend(string value, string sectionName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            if (DateTime.Now.IsWeekend())
            {
                var nextDate = DateTime.Now.GetNextWorkingDay().ToString("MM/dd/yyyy");
                panel.GetDateInputFieldInSectionOnSidePanel(sectionName, panelName, header).SendKeys(nextDate);
                Thread.Sleep(300);
                _driver.ActionsSendKeys("Enter");

                var valueFromDateField = panel.GetDateInputFieldInSectionOnSidePanel(sectionName, panelName, header).GetAttribute("value");
                string date = DateTime.ParseExact(valueFromDateField, "yyyy-MM-dd", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy");
                Verify.AreEqual(date, nextDate, $"Date '{value}' is not displayed in '{sectionName}' section of '{panelName}' side panel with '{header}' header");
            }
            else
            {
                var valueFromDateField = panel.GetDateInputFieldInSectionOnSidePanel(sectionName, panelName, header).GetAttribute("value");
                string date = DateTime.ParseExact(valueFromDateField, "yyyy-MM-dd", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy");
                Verify.AreEqual(date, value.Date(), $"Date '{value}' is not displayed in '{sectionName}' section of '{panelName}' side panel with '{header}' header");
            }
        }


        [Then(@"date input field is displayed empty in '(.*)' section of '(.*)' side panel with '(.*)' header")]
        public void ThenDateInputFieldIsDisplayedEmptyInSectionOfSidePanelWithHeader(string sectionName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            var value = panel.GetDateInputFieldInSectionOnSidePanel(sectionName, panelName, header).GetAttribute("value");
            Verify.AreEqual(value, string.Empty, $" '{value}' value is displayed in date input field in '{sectionName}' section of '{panelName}' side panel with '{header}' header");
        }

        #endregion

        [Then(@"'([^']*)' section is displayed on '([^']*)' side panel with '([^']*)' header")]
        public void ThenSectionIsDisplayedOnSidePanelWithHeader(string sectionName, string panelName, string header)
        {
            var panel = _driver.NowAt<SidePanel>();
            Verify.IsTrue(panel.IsSectionDisplayed(sectionName, panelName, header), $"Section '{sectionName}' is not displayed on '{panelName}' panel with '{header}' header");
        }

        [Then(@"'([^']*)' input is displayed in '([^']*)' row in the '([^']*)' subsection of '([^']*)' section with '([^']*)' header")]
        public void ThenInputIsDisplayedInRowInTheSubsectionOfSectionWithHeader(string inputName, string row, string subSectionName, string sectionName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            var rowElement = panel.GetInputByRowNameInSubSection(inputName, row, subSectionName, sectionName, "PanelWithMenuButton", header);
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(rowElement), $"Input '{inputName}' is not displayed in Section '{sectionName}'");
        }

        [Then(@"'([^']*)' icon is displayed in '([^']*)' row in the '([^']*)' subsection of '([^']*)' section with '([^']*)' header")]
        public void ThenIconIsDisplayedInRowInTheSubsectionOfSectionWithHeader(string iconName, string row, string subSectionName, string sectionName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            var rowElement = panel.GetIconByRowNameInSubSection(iconName, row, subSectionName, sectionName, "PanelWithMenuButton", header);
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(rowElement), $"Icon '{iconName}' is not displayed in Section '{sectionName}'");
        }

        [Then(@"checkbox is displayed in '([^']*)' row in the '([^']*)' subsection of '([^']*)' section with '([^']*)' header")]
        public void ThenCheckboxIsDisplayedInRowInTheSubsectionOfSectionWithHeader(string row, string subSectionName, string sectionName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            var checkbox = panel.GetCheckBoxByRowNameInSubSection(row, subSectionName, sectionName, "PanelWithMenuButton", header);
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(checkbox), $"Checkbox is not displayed in '{row}' for Section '{sectionName}'");
        }

        [When(@"User checks '([^']*)' checkbox in the '([^']*)' subsection of '([^']*)' section with '([^']*)' header")]
        public void WhenUserChecksCheckboxFromRowInTheSubsectionOfSectionWithHeader(string row, string subSectionName, string sectionName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            panel.GetCheckBoxByRowNameInSubSection(row, subSectionName, sectionName, "PanelWithMenuButton", header).Click();
        }

        [Then(@"'([^']*)' checkbox is selected in the '([^']*)' subsection of '([^']*)' section with '([^']*)' header")]
        public void ThenCheckboxIsSelectedFromRowInTheSubsectionOfSectionWithHeader(string row, string subSectionName, string sectionName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            var className = panel.GetCheckBoxByRowNameInSubSection(row, subSectionName, sectionName, "PanelWithMenuButton", header);
            Verify.IsTrue(className.IsSelected(), $"Checkbox' is not selected  in '{subSectionName}' subsection");
        }

        [Then(@"'([^']*)' checkbox is NOT selected in the '([^']*)' subsection of '([^']*)' section with '([^']*)' header")]
        public void ThenCheckboxIsNOTSelectedFromRowInTheSubsectionOfSectionWithHeader(string row, string subSectionName, string sectionName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            var className = panel.GetCheckBoxByRowNameInSubSection(row, subSectionName, sectionName, "PanelWithMenuButton", header);
            Verify.IsFalse(className.IsSelected(), $"Checkbox is selected in row '{row}' for '{subSectionName}' subsection");
        }

        [Then(@"User name '([^']*)' is displayed in '([^']*)' row in the '([^']*)' subsection of '([^']*)' section with '([^']*)' header")]
        public void ThenUserIsDisplayedInRowInTheSubsectionOfSectionWithHeader(string user, string row, string subSectionName, string sectionName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            var userDisplayed = panel.GetFieldByRowNameInSubSection(row, subSectionName, sectionName, "PanelWithMenuButton", header).Text;
            Verify.AreEqual(userDisplayed, user, $"User '{user}' is not displayed in Section '{sectionName}'");
        }

        [Then(@"'([^']*)' subsection is displayed on '([^']*)' section on '([^']*)' side panel with '([^']*)' header")]
        public void ThenSubsectionIsDisplayedOnSectionOnSidePanelWithHeader(string subsection, string sectionName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(panel.GetSubSectionByName(subsection, sectionName, panelName, header)), $"Sub section '{subsection}' is not displayed in Section '{sectionName}'");
        }

        [Then(@"'([^']*)' section is not displayed on '([^']*)' side panel with '([^']*)' header")]
        public void ThenSectionIsNotDisplayedOnSidePanelWithHeader(string sectionName, string panelName, string header)
        {
            var panel = _driver.NowAt<SidePanel>();
            Verify.IsFalse(panel.IsSectionDisplayed(sectionName, panelName, header), $"Section '{sectionName}' is displayed on '{panelName}' panel with '{header}' header");
        }

        [Then(@"'([^']*)' section is displayed at top on '([^']*)' side panel with '([^']*)' header")]
        public void ThenSectionIsDisplayedattopOnSidePanelWithHeader(string sectionName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            var sectionList = panel.GetSectionList(panelName, header);
            var customSection = panel.GetSectionByName(sectionName, panelName, header);
            int index = sectionList.IndexOf(customSection);
            Verify.AreEqual(0, index, $"Section '{sectionName}' is not at top on side panel with '{header}' header. It is at position {index + 1}.");
        }

        [When(@"User enters '([^']*)' value in section header input field on Side panel")]
        public void WhenUserEntersValueInSectionHeaderInputFieldOnSidePanel(string value)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            _browsers.Active.WaitForElementToBeDisplayed(panel.SectionInputField, WebDriverExtensions.WaitTime.Second);
            _browsers.Active.ActionKeysCombinationControlA();
            panel.SectionInputField.SendKeys(value);
            _browsers.Active.ActionsSendKeys("Enter");
        }

        [When(@"User enters '([^']*)' value in section header input field without clearing")]
        public void WhenUserEntersValueInSectionHeaderInputFieldWithoutClearing(string value)
        {
            //this step is necessary to verify that the text is ALREADY selected
            var panel = _browsers.Active.NowAt<SidePanel>();
            _browsers.Active.WaitForElementToBeDisplayed(panel.SectionInputField, WebDriverExtensions.WaitTime.Second);
            panel.SectionInputField.SendKeys(value);
        }

        [When(@"User enters '([^']*)' value in item input field without clearing")]
        public void WhenUserEntersValueInitemInputFieldWithoutClearing(string value)
        {
            //this step is necessary to verify that the text is ALREADY selected
            var panel = _browsers.Active.NowAt<SidePanel>();
            _browsers.Active.WaitForElementToBeDisplayed(panel.ItemInputField, WebDriverExtensions.WaitTime.Second);
            panel.ItemInputField.SendKeys(value);
        }

        [When(@"User clicks '(.*)' section header of '(.*)' side panel with '(.*)' header")]
        public void WhenUserClicksSectionHeaderOfSidePanelWithHeader(string sectionName, string panelName, string header)
        {
            var panel = _driver.NowAt<SidePanel>();
            panel.GetSectionHeader(sectionName, panelName, header).Click();
        }

        [When(@"User hovers over at '([^']*)' section header on '([^']*)' side panel with '([^']*)' header and clicks ellips button")]
        public void WhenUserHoversOverAtSectionHeaderOnSidePanelWithHeaderAndClicksEllipsButton(string sectionName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            _browsers.Active.MoveToElement(panel.GetSectionHeader(sectionName, panelName, header));
            panel.GetEllipsButtonOnSectionHeader(sectionName, panelName, header).Click();
        }

        [Then(@"'(.*)' section is displayed as collapsed of '(.*)' side panel with '(.*)' header")]
        public void ThenSectionIsDisplayedAsCollapsedOfSidePanelWithHeader(string sectionName, string panelName, string header)
        {
            var panel = _driver.NowAt<SidePanel>();
            Verify.IsTrue(panel.DisplayedSectionState(sectionName, panelName, header, true), $"Section '{sectionName}' is displayed as expanded of '{panelName}' side panel with '{header}' header");
        }

        [Then(@"'(.*)' section is displayed as expanded of '(.*)' side panel with '(.*)' header")]
        public void ThenSectionIsDisplayedAsExpandedOfSidePanelWithHeader(string sectionName, string panelName, string header)
        {
            var panel = _driver.NowAt<SidePanel>();
            Verify.IsFalse(panel.DisplayedSectionState(sectionName, panelName, header, false), $"Section '{sectionName}' is displayed as collapsed of '{panelName}' side panel with '{header}' header");
        }

        [When(@"User clicks '(.*)' item in '(.*)' section of '(.*)' side panel with '(.*)' header")]
        public void WhenUserClicksItemInSectionOfSidePanelWithHeader(string iconName, string sectionName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            _browsers.Active.MoveToElement(panel.GetItemByNameInSectionOnPanel(iconName, sectionName, panelName, header));
            _browsers.Active.ClickByActions(panel.GetItemByNameInSectionOnPanel(iconName, sectionName, panelName, header));
        }

        [When(@"User enters '([^']*)' value in item input field on Side panel")]
        public void WhenUserEntersValueInItemInputFieldOnSidePanel(string value)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            _browsers.Active.WaitForElementToBeDisplayed(panel.ItemInputField, WebDriverExtensions.WaitTime.Second);
            //To replace below by ClearSendKeys() after fixing the bug
            _browsers.Active.ActionKeysCombinationControlA();
            panel.ItemInputField.SendKeys(value);
            _browsers.Active.ActionsSendKeys("Enter");
        }

        [When(@"User hovers over '([^']*)' item in '([^']*)' section on '([^']*)' side panel with '([^']*)' header and clicks ellips button")]
        public void WhenUserHoversOverItemInSectionOnSidePanelWithHeaderAndClicksEllipsButton(string iconName, string sectionName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            _browsers.Active.MoveToElement(panel.GetItemByNameInSectionOnPanel(iconName, sectionName, panelName, header));
            panel.GetTripleDotButtonOnItem(iconName, sectionName, panelName, header).Click();
        }

        [When(@"User drags '([^']*)' item from '([^']*)' section to '([^']*)' section of '([^']*)' side panel with '([^']*)' header")]
        public void WhenUserDragsItemFromSectionToSectionOfSidePanelWithHeader(string item, string sectionName, string section2, string panelName, string header)
        {
            _browsers.Active.ActionsRelease();
            var panel = _browsers.Active.NowAt<SidePanel>();
            var iconFromSection = panel.GetItemByNameInSectionOnPanel(item, sectionName, panelName, header);
            var toSection = panel.GetSectionByName(section2, panelName, header);
            _browsers.Active.MoveToElement(iconFromSection);
            _browsers.Active.DragAndDrop(iconFromSection, toSection);
        }

        [Then(@"'(.*)' item is displayed as selected in '(.*)' section of '(.*)' side panel with '(.*)' header")]
        public void ThenItemIsDisplayedAsSelectedInSectionOfSidePanelWithHeader(string itemName, string sectionName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            Verify.IsTrue(panel.GetItemByNameInSectionOnPanel(itemName, sectionName, panelName, header).IsSelected(), $"'{itemName}' item is displayed as unselected in '{sectionName} section of '{panelName}' side panel with '{header}' header");
        }

        [Then(@"'(.*)' item is displayed as unselected in '(.*)' section of '(.*)' side panel with '(.*)' header")]
        public void ThenItemIsDisplayedAsUnselectedInSectionOfSidePanelWithHeader(string itemName, string sectionName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            Verify.IsFalse(panel.GetItemByNameInSectionOnPanel(itemName, sectionName, panelName, header).IsSelected(), $"'{itemName}' item is displayed as selected in '{sectionName} section of '{panelName}' side panel with '{header}' header");
        }

        [Then(@"'(.*)' Theme icon is displayed as selected in '(.*)' section of '(.*)' side panel with '(.*)' header")]
        public void ThenThemeIconIsDisplayedAsSelectedInSectionOfSidePanelWithHeader(string themeIcon, string sectionName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            var icon = panel.GetItemListInSection(sectionName, panelName, header).First(x => x.FindElement(By.XPath(".//img[contains(@class,'button-icon')]")).GetAttribute("src").Contains(themeIcon));
            var selectedIcon = icon.IsSelected();
            Verify.IsTrue(selectedIcon, $"'{themeIcon}' theme icon is displayed as unselected in '{sectionName} section of '{panelName}' side panel with '{header}' header");
        }

        [When(@"User clicks '(.*)' Theme icon in '(.*)' section of '(.*)' side panel with '(.*)' header")]
        public void WhenUserClicksThemeIconInSectionOfSidePanelWithHeader(string themeIcon, string sectionName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            _browsers.Active.HoverAndClick(panel.GetItemListInSection(sectionName, panelName, header).First(x => x.FindElement(By.XPath(".//img[contains(@class,'button-icon')]")).GetAttribute("src").Contains(themeIcon)));
        }


        [Then(@"'(.*)' panel has no selected icons")]
        public void ThenPanelHasNoSelectedIcons(string panelName)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            var icons = panel.GetSidePanelByName(panelName).FindElements(By.XPath(panel.AllIconsOnPanel)).Any(x => x.IsSelected());
            Assert.IsFalse(icons, $"Panel '{panelName}' has a selected icons");
        }


        [Then(@"following items is displayed in '(.*)' section of '(.*)' side panel with '(.*)' header:")]
        public void ThenFollowingItemsIsDisplayedInSectionOfSidePanelWithHeader(string sectionName, string panelName, string header, Table table)
        {
            var panel = _browsers.Active.NowAtWithContext<SidePanel>();
            _browsers.Active.WaitForElementsToBeDisplayed(panel.GetItemListInSection(sectionName, panelName, header), WebDriverExtensions.WaitTime.Medium, false);
            var listItems = panel.GetItemListInSection(sectionName, panelName, header);
            var expectedTemplatesList = table.Rows.SelectMany(row => row.Values).ToList();
            var result = !string.IsNullOrEmpty(listItems.First().Text);
            if (result)
            {
                List<string> templatesList = new List<string>();
                List<IWebElement> templatesList2 = new List<IWebElement>();

                if (_driver.IsElementInElementDisplayed(panel.GetItemListInSection(sectionName, panelName, header).First(), By.XPath(panel.IconText), WebDriverExtensions.WaitTime.Second))
                {
                    templatesList = panel.GetItemListInSection(sectionName, panelName, header).Select(x => x.FindElement(By.XPath(panel.IconText)).Text).ToList();
                }
                else
                {
                    templatesList = panel.GetItemListInSection(sectionName, panelName, header).Select(column => column.Text).ToList();
                }

                Verify.AreEqual(templatesList, expectedTemplatesList, $"Items is not displayed correctly in '{sectionName}' section of '{panelName}' side panel with '{header}' header");
            }
            else
            {
                var templatesList = panel.GetItemListInSection(sectionName, panelName, header).Select(column => column.FindElement(By.XPath(".//input[contains(@class,'button-group-edit-text')]")).GetAttribute("value")).ToList();
                Verify.AreEqual(templatesList, expectedTemplatesList, $"Items is not displayed correctly in '{sectionName}' section of '{panelName}' side panel with '{header}' header");
            }
        }

        [Then(@"'(.*)' Theme icons is displayed in '(.*)' section of '(.*)' side panel with '(.*)' header")]
        public void ThenThemeIconsIsDisplayedInSectionOfSidePanelWithHeader(int count, string sectionName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            var iconsCount = panel.GetItemListInSection(sectionName, panelName, header).Count;
            Verify.AreEqual(count, iconsCount, $"The number of icons does not display correctly in '{sectionName}' section of '{panelName}' side panel with '{header}' header");
        }

        [When(@"User clicks '(.*)' relation inspector lable on '(.*)' panel")]
        public void WhenUserClicksRelationInspectorLableOnPanel(string relation, string panelName)
        {
            var panel = _driver.NowAtWithContext<SidePanel>();
            panel.GetRelationLableOnPanel(relation, panelName).Click();
        }

        [When(@"User mouses over '(.*)' item in '(.*)' section of '(.*)' side panel with '(.*)' header")]
        public void WhenUserMousesOverItemInSectionOfSidePanelWithHeader(string item, string sectionName, string panelName, string header)
        {
            var panel = _driver.NowAtWithContext<SidePanel>();
            _driver.MoveToElement(panel.GetItemByNameInSectionOnPanel(item, sectionName, panelName, header));
        }

        [Then(@"'(.*)' item is displayed with selection frame in '(.*)' color in '(.*)' section of '(.*)' side panel with '(.*)' header")]
        public void ThenItemIsDisplayedAsSelectedInSectionOfSidePanelWithHeader(string itemName, string color, string sectionName, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            Verify.AreEqual(panel.GetItemByNameInSectionOnPanel(itemName, sectionName, panelName, header).GetCssValue("background-color"), color, $"'{itemName}' item is displayed with selection frame in '{sectionName} section of '{panelName}' side panel with '{header}' header");
        }

        [When(@"User mouses over '(.*)' item in '(.*)' section of '(.*)' side panel with '(.*)' header and clicks Remove button")]
        public void WhenUserMousesOverItemInSectionOfSidePanelWithHeaderAndClicksRemoveButton(string item, string sectionName, string panelName, string header)
        {
            var panel = _driver.NowAt<SidePanel>();
            _driver.MoveToElement(panel.GetItemByNameInSectionOnPanel(item, sectionName, panelName, header));
            panel.GetItemByNameInSectionOnPanel(item, sectionName, panelName, header).FindElement(By.XPath(panel.RemoveButtonOnAttachmentsOrLinks)).Click();
        }

        [Then(@"'(.*)' item is displayed in '(.*)' section of '(.*)' side panel with '(.*)' header")]
        public void ThenItemIsDisplayedInSectionOfSidePanelWithHeader(string item, string sectionName, string panelName, string header)
        {
            var panel = _driver.NowAt<SidePanel>();
            Verify.IsTrue(panel.DisplayedItemInSectionOnPanel(item, sectionName, panelName, header), $" '{item}' item is not displayed in '{sectionName}' section of '{panelName}' side panel with '{header}' header");
        }

        [Then(@"'([^']*)' item is displayed as editable in '([^']*)' section of '([^']*)' side panel with '([^']*)' header")]
        public void ThenItemIsDisplayedAsEditableInSectionOfSidePanelWithHeader(string item, string sectionName, string panelName, string header)
        {
            var panel = _driver.NowAt<SidePanel>();
            Verify.IsTrue(panel.ItemInputField.GetAttribute("contenteditable").ContainsText("true"), $"Tag '{item}' is not editable in  '{sectionName}' section of '{panelName}' side panel with '{header}' header ");
        }

        [Then(@"'([^']*)' section is displayed as editable on side panel")]
        public void ThenSectionIsDisplayedAsEditableOnSidePanelWithHeader(string sectionName)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            if (!panel.SectionInputField.Text.Equals(sectionName))
            {
                throw new Exception($"Section '{sectionName}' is not displayed on side panel");
            }
            Verify.IsTrue(panel.SectionInputField.GetAttribute("contenteditable").ContainsText("true"), $" '{sectionName}' Section is not editable");
        }

        [Then(@"'([^']*)' item is not displayed in '([^']*)' section of '([^']*)' side panel with '([^']*)' header")]
        public void ThenItemIsNotDisplayedInSectionOfSidePanelWithHeader(string item, string sectionName, string panelName, string header)
        {
            var panel = _driver.NowAt<SidePanel>();
            Verify.IsFalse(panel.DisplayedItemInSectionOnPanel(item, sectionName, panelName, header), $" '{item}' item is displayed in '{sectionName}' section of '{panelName}' side panel with '{header}' header");
        }

        [Then(@"'(.*)' text of empty content is displayed in '(.*)' section of '(.*)' side panel with '(.*)' header")]
        public void ThenTextOfEmptyContentIsDisplayedInSectionOfSidePanelWithHeader(string text, string sectionName, string panelName, string header)
        {
            var panel = _driver.NowAt<SidePanel>();
            var textOfEmptyContent = panel.GetEmptyContentInSection(sectionName, panelName, header).Text;
            Verify.AreEqual(textOfEmptyContent, text, $"'{text}' text of empty content is displayed in '{sectionName}' section of '{panelName}' side panel with '{header}' header");
        }

        [Then(@"'(.*)' participant is displayed in the '(.*)' section of '(.*)' panel")]
        public void ThenParticipantIsDisplayedInTheSectionOfPanel(string participantName, string sectionName, string panelName)
        {
            var panel = _browsers.Active.NowAtWithContext<SidePanel>();
            //TODO update step to new implementation
            //Verify.IsTrue(panel.GetItemByNameInSectionOnPanel(participantName, sectionName, panelName, TriState.UseDefault).Displayed(), $"'{participantName}' participant is not displayed in '{sectionName}' section on '{panelName}' panel");
        }

        [Then(@"'([^']*)' participant is displayed in '([^']*)' section of '([^']*)' side panel with '([^']*)' header")]
        public void ThenParticipantIsDisplayedInSectionOfSidePanelWithHeader(string participantName, string section, string panelName, string header)
        {
            var panel = _browsers.Active.NowAtWithContext<SidePanel>();
            Verify.IsTrue(panel.IsParticipantNameDisplayedInSectionOnPanel(participantName, section, panelName, header), $"'{participantName}' participant is not displayed in '{section}' section of '{panelName}' side panel with '{header}' header");
        }

        [When(@"User mouse over '([^']*)' item on '([^']*)' section of '([^']*)' side panel with '([^']*)' header")]
        public void WhenUserMouseOverItemOnSectionOfSidePanelWithHeader(string itemName, string section, string panelName, string header)
        {
            var panel = _browsers.Active.NowAtWithContext<SidePanel>();
            _browsers.Active.MoveToElement(panel.GetDialogItemByNameInSectionOnPanel(itemName, section, panelName, header));
        }

        [When(@"User move to item")]
        public void WhenUserMoveToItem()
        {
            var panel = _browsers.Active.NowAtWithContext<SidePanel>();
            var t = _browsers.Active.FindElement(By.XPath(".//div[@class='participant current']"));
            _browsers.Active.WaitForElementToBeDisplayed(t);
            _browsers.Active.MoveToElement(t);
        }

        #region Text
        #endregion

        #region  DragAndDropItemOnTopic

        [When(@"User drags '(.*)' item in '(.*)' section of '(.*)' side panel with '(.*)' header on '(.*)' topic of Canvas")]
        public void WhenUserDragsItemInSectionOfSidePanelWithHeaderOnTopicOfCanvas(string item, string sectionName, string panelName, string header, string topic)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            var canvas = _browsers.Active.NowAt<Pages.WebAppProject.QA.WebEditorPage>();
            _browsers.Active.ActionsRelease();
            var itemselected = panel.GetItemByNameInSectionOnPanel(item, sectionName, panelName, header);
            var topicSelected = canvas.GetTopicByName(topic);
            _browsers.Active.ActionMoveToElement(itemselected);
            _browsers.Active.ActionsDragElementToOffsetAndDropOntoAnotherElement(itemselected, topicSelected);
        }

        #endregion

        #region FilterPanel

        [When(@"User clicks Menu button of Filter panel")]
        public void WhenUserClicksMenuButtonOfFilterPanel()
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            panel.GetSidePanelWithMenuButton("Filter").FindElement(By.XPath("//button[contains(@class,'menu-filter')]")).Click();
        }

        [When(@"User clicks '(.*)' behavior button of '(.*)' side panel with '(.*)' header")]
        public void WhenUserClicksBehaviorButtonOfSidePanelWithHeader(string behaviorButton, string panelName, string header)
        {
            var panel = _driver.NowAt<SidePanel>();
            panel.GetBehaviorButtonByName(behaviorButton, panelName, header).Click();
        }

        [Then(@"'(.*)' behavior button is displayed as selected of '(.*)' side panel with '(.*)' header")]
        public void ThenBehaviorButtonIsDisplayedAsSelectedOfSidePanelWithHeader(string behaviorButton, string panelName, string header)
        {
            var panel = _driver.NowAt<SidePanel>();
            Verify.IsTrue(panel.GetBehaviorButtonByName(behaviorButton, panelName, header).IsActive(), $"'{behaviorButton}' behavior button is displayed as unselected of '{panelName}' side panel with '{header}' header");
        }

        [When(@"User mouse over on '(.*)' button of Filter panel")]
        public void WhenUserMouseOverOnButtonOfFilterPanel(string behaviorButton)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            _browsers.Active.MoveToElement(panel.GetBehaviorButtonByName(behaviorButton, "PanelWithMenuButton", "Filter"));
        }


        [When(@"User checks '(.*)' checkbox to '(.*)' group in '(.*)' section on Filter panel")]
        public void WhenUserChecksCheckboxToGroupInSectionOnFilterPanel(string checkboxName, string groupName, string sectionName)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            panel.SetCheckboxStateInFilterPanel(checkboxName, groupName, sectionName, "PanelWithMenuButton", "Filter", true);
        }

        [When("User unchecks {string} checkbox to {string} group in {string} section on Filter panel")]
        public void WhenUserUnchecksCheckboxToGroupInSectionOnFilterPanel(string checkboxName, string groupName, string sectionName)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            panel.SetCheckboxStateInFilterPanel(checkboxName, groupName, sectionName, "PanelWithMenuButton", "Filter", false);
        }

        [Then(@"'(.*)' checkbox is checked to '(.*)' group in '(.*)' section on Filter panel")]
        public void ThenCheckboxIsCheckedToGroupInSectionOnFilterPanel(string checkboxName, string groupName, string sectionName)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            Verify.IsTrue(panel.GetCheckboxInGridItem(checkboxName, groupName, sectionName, "PanelWithMenuButton", "Filter").IsSelected(), $" '{checkboxName}' checkbox is unchecked to '{groupName}' group in '{sectionName}' section of Filter side panel");
        }

        [Then(@"'([^']*)' checkbox is unchecked to '([^']*)' group in '([^']*)' section on Filter panel")]
        public void ThenCheckboxIsUncheckedToGroupInSectionOnFilterPanel(string checkboxName, string groupName, string sectionName)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            Verify.IsFalse(panel.GetCheckboxInGridItem(checkboxName, groupName, sectionName, "PanelWithMenuButton", "Filter").IsSelected(), $" '{checkboxName}' checkbox is checked to '{groupName}' group in '{sectionName}' section of Filter side panel");
        }

        [Then(@"'(.*)' item is displayed in '(.*)' section on Filter panel")]
        public void ThenItemIsDisplayedInSectionOnFilterPanel(string itemName, string sectionName)
        {
            var panel = _driver.NowAt<SidePanel>();
            Verify.IsTrue(panel.DisplayedHistoryItem(itemName, sectionName, "PanelWithMenuButton", "Filter"), $"'{itemName}' history item is not displayed in '{sectionName}' section of Filter side panel");
        }

        [Then("{string} item is displayed in Preset section on Filter panel")]
        public void ThenItemIsDisplayedInPresetSectionOnFilterPanel(string itemName)
        {
            var panel = _driver.NowAt<SidePanel>();
            Verify.IsTrue(panel.GetFilterPresetItemByName(itemName, "Preset", "PanelWithMenuButton", "Filter").Displayed, $"'{itemName}' history item is not displayed in preset section of Filter side panel");
        }

        [Then(@"'(.*)' item is not displayed to '(.*)' section on Filter panel")]
        public void ThenItemIsNotDisplayedToSectionOnFilterPanel(string itemName, string sectionName)
        {
            var panel = _driver.NowAt<SidePanel>();
            Verify.IsFalse(panel.DisplayedHistoryItem(itemName, sectionName, "PanelWithMenuButton", "Filter"), $"'{itemName}' history item is displayed in '{sectionName}' section of Filter side panel");
        }

        [When(@"User clicks Remove button in '(.*)' item in '(.*)' section on Filter panel")]
        public void WhenUserClicksRemoveButtonInItemInSectionOnFilterPanel(string itemName, string sectionName)
        {
            var panel = _driver.NowAt<SidePanel>();
            panel.GetFilterHistoryItemByName(itemName, sectionName, "PanelWithMenuButton", "Filter").FindElement(By.XPath(panel.RemoveHistoryItem)).Click();
        }

        #endregion

        #region Images

        [Then(@"'([^']*)' subsection is displayed in the '([^']*)' section with '([^']*)' header")]
        public void ThenSubsectionIsDisplayedInTheSectionWithHeader(string item, string sectionName, string header)
        {
            var panel = _driver.NowAt<SidePanel>();
            Verify.IsTrue(panel.IsBackgroundItemDisplayed(item, sectionName, "PanelByName", header), $"Section '{sectionName}' is not displayed with '{header}' header");
        }

        [Then(@"background preview Image is displayed")]
        public void ThenBackgroundPreviewImageIsDisplayed()
        {
            var SideToolboxPage = _driver.NowAt<SideToolboxPage>();
            Verify.IsTrue(SideToolboxPage.IsBackgroundImagePreviewDisplayed(), "Background Preview Image is not displayed");
        }

        [Then(@"background preview Image is not displayed")]
        public void ThenBackgroundPreviewImageIsNotDisplayed()
        {
            var SideToolboxPage = _driver.NowAt<SideToolboxPage>();
            Verify.IsFalse(SideToolboxPage.IsBackgroundImagePreviewDisplayed(), "Background Preview Image is not displayed");
        }

        [When(@"User remove the background image")]
        public void WhenUserRemoveTheBackgroundImage()
        {
            var SideToolboxPage = _driver.NowAt<SideToolboxPage>();
            SideToolboxPage.BackgroundImagePreviewRemoveButton.Click();
        }

        [When(@"User adds '(.*)' image via '(.*)' side panel with '(.*)' header")]
        public void WhenUserAddsImageViaSidePanelWithHeader(string image, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            panel.GetSidePanel(panelName, header).FindElement(By.XPath(".//input[@class='add-image-input']")).
                SendKeys(Utils.FileSystemHelper.GeneratePathToEmbedded(image));
            Thread.Sleep(2000);
        }

        [When(@"User checks '(.*)' radio button in '(.*)' section of '(.*)' side panel with '(.*)' header")]
        public void WhenUserChecksRadioButtonInSectionOfSidePanelWithHeader(string radioButton, string section, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            panel.SetRadioButtonInSectionOnPanel(radioButton, section, panelName, header);
        }

        [When(@"User checks '([^']*)' radio button in '([^']*)' side panel with '([^']*)' header")]
        public void WhenUserChecksRadioButtonInSidePanelWithHeader(string radioButton, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            bool desiredSate = true;
            panel.SetRadioButtonOnPanel(radioButton, panelName, header, desiredSate);
        }


        [Then(@"'(.*)' radio button is checked in '(.*)' section of '(.*)' side panel with '(.*)' header")]
        public void ThenRadioButtonIsCheckedInSectionOfSidePanelWithHeader(string radioButton, string section, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            Verify.IsTrue(panel.GetRadioButtonStateInSectionOnPanel(radioButton, section, panelName, header),
                $"'{radioButton}' radio button is unchecked in '{section}' section of '{panel}' side panel with '{header}' header");
        }

        [Then(@"'([^']*)' radio button is unchecked in '([^']*)' section of '([^']*)' side panel with '([^']*)' header")]
        public void ThenRadioButtonIsUncheckedInSectionOfSidePanelWithHeader(string radioButton, string section, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            Verify.IsFalse(panel.GetRadioButtonStateInSectionOnPanel(radioButton, section, panelName, header),
                $"'{radioButton}' radio button is unchecked in '{section}' section of '{panel}' side panel with '{header}' header");
        }

        [Then(@"'([^']*)' radio button is checked in '([^']*)' side panel with '([^']*)' header")]
        public void ThenRadioButtonIsCheckedInSidePanelWithHeader(string radioButton, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            Verify.IsTrue(panel.GetRadioButtonStateOnPanel(radioButton, panelName, header),
                $"'{radioButton}' radio button is unchecked on '{panel}' side panel with '{header}' header");
        }

        [Then(@"'([^']*)' radio button is unchecked in '([^']*)' side panel with '([^']*)' header")]
        public void ThenRadioButtonIsUncheckedInSidePanelWithHeader(string radioButton, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            Verify.IsFalse(panel.GetRadioButtonStateOnPanel(radioButton, panelName, header),
                $"'{radioButton}' radio button is checked on '{panel}' side panel with '{header}' header");
        }


        #endregion

        #region BrandColors

        [Then(@"'([^']*)' Side panel Icon image is displayed in color")]
        public void ThenSidePanelIconImageIsDisplayedInColor(string Icon, Table table)
        {
            var toolbox = _browsers.Active.NowAt<SideToolboxPage>();
            string ImageDetails = "";
            if (!toolbox.DisplayedButton(Icon))
            {
                toolbox.EllipsisButton.Click();
                ImageDetails = _browsers.Active.Component<ScrollContent>().GetItemIconByName(Icon).GetCssValue("background-image");
            }
            else
            {
                ImageDetails = toolbox.GetButtonByName(Icon).GetCssValue("background-image");
            }
            var Decoded = BrandImageHelper.DecodeImage(ImageDetails);
            foreach (var row in table.Rows)
            {
                string Color = row["color"];
                Verify.IsTrue(Decoded.Contains(Color), $"{Icon} image does not contain {Color} color");
            }
        }
        #endregion
    }
}