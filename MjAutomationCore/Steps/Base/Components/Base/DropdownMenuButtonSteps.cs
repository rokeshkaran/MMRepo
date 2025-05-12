using AutomationUtils.Utils;
using MjAutomationCore.Components.Base;
using MjAutomationCore.Components.Buttons;
using MjAutomationCore.Components.CustomContent;
using MjAutomationCore.Extensions;
using MjAutomationCore.Utils;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using System;
using System.Collections.Generic;
using System.Linq;
using Reqnroll;

namespace MjAutomationCore.Steps.Base.Components.Base
{
    [Binding]
    class DropdownMenuButtonSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsers;
        public DropdownMenuButtonSteps(BrowsersList browsers)
        {
            _browsers = browsers;
        }

        [Then(@"'([^']*)' Menu is displayed to User")]
        public void ThenMenuIsDisplayedToUser(string menuName)
        {
            Verify.IsTrue(_browsers.Active.ComponentDisplayedState<DropdownMenuButton>(menuName), $"Menu '{menuName}' is not displayed to User");
        }

        [Then(@"'([^']*)' Menu is not displayed to User")]
        public void ThenMenuIsNotDisplayedToUser(string menuName)
        {
            Verify.IsFalse(_browsers.Active.ComponentDisplayedState<DropdownMenuButton>(menuName, new Properties { WaitTime = WebDriverExtensions.WaitTime.Short }), $"Menu '{menuName}' is displayed to User");
        }

        [When(@"User clicks button with '([^']*)' name in '([^']*)' menu")]
        public void WhenUserClicksButtonWithNameInMenu(string button, string menuName)
        {
            _browsers.Active.Component<DropdownMenuButton>(menuName).GetButtonByType(button).Click();
        }

        [When(@"User mouse hovers Diamond icon on '([^']*)' button in '([^']*)' menu")]
        public void WhenUserMouseHoversDiamondIconWithNameInMenu(string menuButton, string menuName)
        {
            _browsers.Active.MoveToElement(_browsers.Active.Component<DropdownMenuButton>(menuName).GetDiamondIcon(menuButton));
        }

        [When(@"User clicks button with  text '([^']*)' and subtext '([^']*)' in '([^']*)' menu")]
        public void WhenUserClicksButtonWithNameAndTextInMenu(string text, string subText, string menu)
        {
            var buttonList =_browsers.Active.Component<DropdownMenuButton>(menu).GetButtonByTypeList().ToList();
            buttonList.Where(x => x.Text.Contains(text) & x.Text.Contains(subText)).First().Click();
        }

        [Then(@"button with '([^']*)' name contains '([^']*)' text in '([^']*)' menu")]
        public void ThenButtonWithNameContainsTextInMenu(string button, string text, string menuName)
        {
            var value = _browsers.Active.Component<DropdownMenuButton>(menuName).GetButtonByType(button).Text;
            Verify.AreEqual(value, text, $"Button with '{button}' name does not contain '{text}' text in '{menuName}' menu");
        }

        [Then(@"button with '([^']*)' name is displayed in '([^']*)' menu")]
        public void ThenButtonWithNameIsDisplayedInMenu(string button, string menuName)
        {
            var parent = _browsers.Active.GetComponent<DropdownMenuButton>(menuName);
            Verify.IsTrue(_browsers.Active.ComponentDisplayedState<ButtonByType>(button, new Properties() { Parent = parent, WaitTime = WebDriverExtensions.WaitTime.Short }),
                $"Button with '{button}' name is not displayed in '{menuName}' menu");
        }

        [Then(@"menu button with '([^']*)' name is displayed in '([^']*)' menu")]
        public void ThenMenuButtonWithNameIsDisplayedInMenu(string button, string menuName)
        {
            var parent = _browsers.Active.GetComponent<DropdownMenuButton>(menuName);
            Verify.IsTrue(_browsers.Active.ComponentDisplayedState<MenuButtonByType>(button, new Properties() { Parent = parent, WaitTime = WebDriverExtensions.WaitTime.Short }),
                $"Menu button with '{button}' name is not displayed in '{menuName}' menu");
        }

        [Then(@"button with '([^']*)' name is not displayed in '([^']*)' menu")]
        public void ThenButtonWithNameIsNotDisplayedInMenu(string button, string menuName)
        {
            var parent = _browsers.Active.GetComponent<DropdownMenuButton>(menuName);
            Verify.IsFalse(_browsers.Active.ComponentDisplayedState<ButtonByType>(button, new Properties() { Parent = parent, WaitTime = WebDriverExtensions.WaitTime.Second }),
                $"Button with '{button}' name is displayed in '{menuName}' menu");
        }

        [Then(@"button with '([^']*)' name is disabled in '([^']*)' menu")]
        public void ThenButtonWithNameIsDisabledInMenu(string button, string menuName)
        {
            var buttonState = _browsers.Active.Component<DropdownMenuButton>(menuName).GetButtonByType(button).GetAttribute("data-state").Equals("disabled");
            Verify.IsTrue(buttonState, $"Button with '{button}' name is displayed as enabled in '{menuName}' menu");
        }

        [Then(@"button with '([^']*)' name is enabled in '([^']*)' menu")]
        public void ThenButtonWithNameIsEnabledInMenu(string button, string menuName)
        {
            var buttonState = _browsers.Active.Component<DropdownMenuButton>(menuName).GetButtonByType(button).GetAttribute("data-state");
            Verify.IsTrue(string.IsNullOrEmpty(buttonState) || buttonState == "enabled", $"Button with '{button}' name is displayed as disabled in '{menuName}' menu");
        }

        [Then(@"button with '([^']*)' name is checked in '([^']*)' menu")]
        public void ThenButtonWithNameIsCheckedInMenu(string button, string menuName)
        {
            var buttonState = _browsers.Active.Component<DropdownMenuButton>(menuName).GetButtonByType(button).GetAttribute("data-name").Contains("hide");
            Verify.IsTrue(buttonState, $"Button with '{button}' name is displayed as unchecked in '{menuName}' menu");
        }

        [Then(@"button with '([^']*)' name is unchecked in '([^']*)' menu")]
        public void ThenButtonWithNameIsUncheckedInMenu(string button, string menuName)
        {
            var buttonState = _browsers.Active.Component<DropdownMenuButton>(menuName).GetButtonByType(button).GetAttribute("data-name").Contains("show");
            Verify.IsTrue(buttonState, $"Button with '{button}' name is displayed as checked in '{menuName}' menu");
        }

        [When(@"User clicks menu button with '([^']*)' name in '([^']*)' menu")]
        public void WhenUserClicksMenuButtonWithNameInMenu(string menuButton, string menuName)
        {
            _browsers.Active.Component<DropdownMenuButton>(menuName).GetMenuButtonByType(menuButton).Click();
        }

        [When(@"User mouse hovers menu button with '([^']*)' name in '([^']*)' menu")]
        public void WhenUserMouseHoversMenuButtonWithNameInMenu(string menuButton, string menuName)
        {
            _browsers.Active.MoveToElement(_browsers.Active.Component<DropdownMenuButton>(menuName).GetMenuButtonByType(menuButton));
        }

        [Then(@"following buttons are displayed in '([^']*)' menu")]
        public void ThenFollowingButtonsAreDisplayedInMenu(string buttonMenuName, Table table)
        {
            var buttonList = _browsers.Active.Component<DropdownMenuButton>(buttonMenuName).GetButtonByTypeList().Select(column => column.Text.Split(new[] { "\n", "\r" }, StringSplitOptions.None)[0].Trim()).ToList();
            var expectedButtons = table.Rows.SelectMany(row => row.Values).ToList();
            Verify.AreEqual(expectedButtons, buttonList, $"Buttons are displayed incorrect in '{buttonMenuName}' menu");
        }

        [Then(@"following menu buttons are displayed in '([^']*)' menu")]
        public void ThenFollowingMenuButtonsAreDisplayedInMenu(string menu, Table table)
        {
            var buttonList = _browsers.Active.Component<DropdownMenuButton>(menu).GetMenuButtonByTypeList().Select(column => column.Text).ToList();
            var expectedButtons = table.Rows.SelectMany(row => row.Values).ToList();
            Verify.AreEqual(expectedButtons, buttonList, $"Menu Buttons are displayed incorrect in '{menu}' menu");
        }

        [Then(@"custom content '([^']*)' contains '([^']*)' text in '([^']*)' menu")]
        public void ThenCustomContentContainsTextInMenu(string customContent, string text, string menu)
        {
            var parent = _browsers.Active.GetComponent<DropdownMenuButton>(menu);
            var value = _browsers.Active.GetComponent<CustomContentByType>(customContent, new Properties() { Parent = parent, WaitTime = WebDriverExtensions.WaitTime.Short }).Text;
            Verify.IsTrue(value.Contains(text), $"Custom content '{customContent}' does not contain '{text}' text in '{menu}' menu");
        }

        [Then(@"Custom content '([^']*)' is displayed at the folowing number in '([^']*)' menu")]
        public void ThenSeparatorLineIsDisplayedAtTheFolowingNumberInMenu(string customContent, string menu, Table table)
        {
            var parent = _browsers.Active.Component<DropdownMenuButton>(menu);
            var allchildElements = parent.AllMenuItems;
            var expectedPositions = table.Rows.SelectMany(row => row.Values).ToList();
            List<string> separatorIndexes = new List<string>();
            int currentIndex = 1;
            foreach (var child in allchildElements)
            {
                if (child.GetClassName().Contains(customContent))
                {
                    separatorIndexes.Add(currentIndex.ToString());
                }
                currentIndex++;
            }
            Verify.AreEqual(expectedPositions, separatorIndexes, $"{separatorIndexes.Count} separate lines are displayed, but was expected {expectedPositions.Count}");
        }

        [Then(@"Icons section '([^']*)' is not displayed in '([^']*)' menu")]
        public void ThenIconsSectionIsNotDisplayedInMenu(string customContent, string menu)
        {
            var parent = _browsers.Active.GetComponent<DropdownMenuButton>(menu);
            Verify.IsFalse(_browsers.Active.ComponentDisplayedState<CustomContentByType>(customContent, new Properties() { Parent = parent, WaitTime = WebDriverExtensions.WaitTime.Short }),
                $"Icons section '{customContent}' is displayed in '{menu}' menu");
        }

        [When(@"User clicks icon button with '([^']*)' name in '([^']*)' menu")]
        public void WhenUserClicksIconButtonWithNameInMenu(string iconButton, string menu)
        {
            _browsers.Active.HoverAndClick(_browsers.Active.Component<DropdownMenuButton>(menu).GetButtonWithTextOrIconName(iconButton));
        }

        [Then(@"text '([^']*)' is displayed in button menu with '([^']*)' name in '([^']*)' menu")]
        public void ThenTextIsDisplayedInButtonMenuWithNameInMenu(string text, string button, string menuName)
        {
            var value = _browsers.Active.Component<DropdownMenuButton>(menuName).GetButtonByType(button).Text.RemoveLineBreakes();
            Verify.AreEqual(value, text, $"Text '{text}' is not displayed in button menu '{button}' name in '{button}' menu");
        }
    }
}