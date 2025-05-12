using AutomationUtils.Utils;
using MjAutomationCore.Components.Base;
using MjAutomationCore.Components.TextAccelerator;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.Extensions;
using MjAutomationCore.Utils;
using SeleniumAutomation.Framework;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using System.Linq;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.Components.TextAccelerator
{
    [Binding]
    class TextAcceleratorPopupSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsers;
        private readonly SessionRandomValue _sessionRandom;

        public TextAcceleratorPopupSteps(BrowsersList browsers, SessionRandomValue sessionRandom)
        {
            _browsers = browsers;
            _sessionRandom = sessionRandom;
        }

        [Then(@"text accelerator '([^']*)' is displayed to User")]
        public void ThenTextAcceleratorIsDisplayedToUser(string textAcceleratorName)
        {
            Verify.IsTrue(_browsers.Active.ComponentDisplayedState<TextAcceleratorPopup>(textAcceleratorName, new Properties { WaitTime = WebDriverExtensions.WaitTime.Short }),
                $"Text accelerator '{textAcceleratorName}' is not displayed to User");
        }

        [Then(@"text accelerator '([^']*)' is not displayed to User")]
        public void ThenTextAcceleratorIsNotDisplayedToUser(string textAcceleratorName)
        {
            Verify.IsFalse(_browsers.Active.ComponentDisplayedState<TextAcceleratorPopup>(textAcceleratorName, new Properties { WaitTime = WebDriverExtensions.WaitTime.Second }),
                $"Text accelerator '{textAcceleratorName}' is displayed to User");
        }

        [When(@"User enters '([^']*)' value in input field of '([^']*)' text accelerator")]
        public void WhenUserEntersValueInInputFieldOfTextAccelerator(string value, string textAcceleratorName)
        {
            value = value.AddRandom(_sessionRandom);
            _browsers.Active.Component<TextAcceleratorPopup>(textAcceleratorName).InputField.ClearSendKeys(value);
        }

        [When(@"User presses the Down arrow key and selects '([^']*)' value in '([^']*)' text accelerator")]
        public void WhenUserPressesTheDownArrowKeyAndSelectsValueInTextAccelerator(string option, string textAcceleratorName)
        {
            _browsers.Active.Component<TextAcceleratorPopup>(textAcceleratorName).TextAcceleratorOptionSelected(option);
            _browsers.Active.ActionsSendKeys("Enter");
        }

        [When(@"User clicks '([^']*)' value in '([^']*)' text accelerator")]
        public void WhenUserClicksValueInTextAccelerator(string item, string textAcceleratorName)
        {
            _browsers.Active.Component<TextAcceleratorPopup>(textAcceleratorName).GetTextAcceleratorOption(item).Click();
        }

        [Then(@"following items is displayed in '([^']*)' text accelerator menu")]
        public void ThenFollowingItemsIsDisplayedInTextAcceleratorMenu(string textAcceleratorName, Table table)
        {
            var expectedItemList = table.Rows.SelectMany(row => row.Values).ToList();
            var itemList = _browsers.Active.Component<TextAcceleratorPopup>(textAcceleratorName).GetTextAcceleratorOptions().Select(x => x.Text).ToList();
            Verify.AreEqual(expectedItemList, itemList, $"Items is not displayed correctly in '{textAcceleratorName}' dropdown menu");
        }

    }
}