using AutomationUtils.Utils;
using MjAutomationCore.Components.Base;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.MindManagerFiles;
using MjAutomationCore.Utils;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using System.Linq;
using Reqnroll;

namespace MjAutomationCore.Steps.Base.Components.Base
{
    [Binding]
    class DropdownMenuItemSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsersList;
        private readonly LinkInviteOthersToEdit _linkToEdit;
        public DropdownMenuItemSteps(BrowsersList browsersList, LinkInviteOthersToEdit linkToEdit)
        {
            _browsersList = browsersList;
            _linkToEdit = linkToEdit;
        }

        [Then(@"following items is displayed in '(.*)' dropdown menu")]
        public void ThenFollowingItemsIsDisplayedInDropdownMenu(string dropdownMenu, Table table)
        {
            var expectedItemList = table.Rows.SelectMany(row => row.Values).ToList();
            var itemList = _browsersList.Active.Component<DropdownMenuItem>(dropdownMenu, new Properties() { WaitTime = WebDriverExtensions.WaitTime.Short }).GetItems().Select(x => x.Text).ToList();
            Verify.AreEqual(expectedItemList, itemList, $"Items is not displayed correctly in '{dropdownMenu}' dropdown menu");
        }

        [When(@"User clicks '(.*)' item in '(.*)' dropdown menu")]
        public void WhenUserClicksItemInDropdownMenu(string item, string dropdownMenu)
        {
            _browsersList.Active.Component<DropdownMenuItem>(dropdownMenu).GetItemByName(item).Click();
            if (item.Equals("Copy link"))
            {
                var page = _browsersList.Active.NowAt<BaseExtensionsPage>();
                _browsersList.Active.AddedFieldByJavascript();
                _browsersList.Active.InsertFromClipboard(page.GetCopyText);
                var getText = page.GetCopyText.GetAttribute("value");
                _linkToEdit.Value = getText;
                _browsersList.Active.SwitchTo().DefaultContent();
            }
        }

        [Then(@"'([^']*)' item is displayed as selected in '([^']*)' dropdown menu")]
        public void ThenItemIsDisplayedAsSelectedInDropdownMenu(string itemName, string dropdownMenu)
        {
            Verify.IsTrue(_browsersList.Active.Component<DropdownMenuItem>(dropdownMenu).GetItemState(itemName), $"Item '{itemName}' is not selected in '{dropdownMenu}' dropdown menu");
        }

        [Then(@"'([^']*)' dropdown menu is displayed to User")]
        public void ThenDropdownMenuIsDisplayedToUser(string dropdownMenu)
        {
            Verify.IsTrue(_browsersList.Active.ComponentDisplayedState<DropdownMenuItem>(dropdownMenu), $"Dropdown menu '{dropdownMenu}' is not displayed to User");
        }

        [When(@"User clicks switch by label name '([^']*)' in '([^']*)' dropdown menu")]
        public void WhenUserClicksSwitchByLabelNameInDropdownMenu(string labelName, string dropdownMenu)
        {
            _browsersList.Active.ClickByActions(_browsersList.Active.Component<DropdownMenuItem>(dropdownMenu).GetSwitchByLabelName(labelName));
        }

        [Then(@"'([^']*)' toggle with '([^']*)' name is enabled in '([^']*)' Menu")]
        public void ThenToggleWithNameIsEnabledInMenu(string toggleMenu, string labelName, string menuName)
        {
            Verify.IsTrue(_browsersList.Active.Component<DropdownMenuButton>(menuName).GetToggleByLabelNameInMenu(toggleMenu, labelName).IsActive(), $"'{toggleMenu}' is not enabled for label Name '{labelName}' in '{menuName}' menu");
        }

        [Then(@"'([^']*)' toggle with '([^']*)' name is disabled in '([^']*)' Menu")]
        public void ThenToggleWithNameIsDisabledInMenu(string toggleMenu, string labelName, string menuName)
        {
            Verify.IsFalse(_browsersList.Active.Component<DropdownMenuButton>(menuName).GetToggleByLabelNameInMenu(toggleMenu, labelName).IsActive(), $"'{toggleMenu}' is enabled for label Name '{labelName}' in '{menuName}' menu");
        }

        [When(@"User hover on question icon in '([^']*)' toggle menu in '([^']*)' Menu")]
        public void WhenUserHoverOnQuestionIconInToggleMenuInMenu(string toggleMenu, string menuName)
        {
            var panel = _browsersList.Active.Component<DropdownMenuButton>(menuName);
            _browsersList.Active.MoveToElement(panel.GetToggleHelpButtonInToggleMenu(toggleMenu));
        }

        [When(@"User toggle '([^']*)' and switch '([^']*)' icon off in '([^']*)' Menu")]
        public void WhenUserToggleAndSwitchIconOffInMenu(string toggleMenu, string labelName, string menuName)
        {
            var panel = _browsersList.Active.Component<DropdownMenuButton>(menuName);
            panel.GetToggleByLabelNameInMenu(toggleMenu, labelName).Click();
        }

        [When(@"User toggle '([^']*)' and switch '([^']*)' icon on in '([^']*)' Menu")]
        public void WhenUserToggleAndSwitchIconOnInMenu(string toggleMenu, string labelName, string menuName)
        {
            var panel = _browsersList.Active.Component<DropdownMenuButton>(menuName);
            panel.GetToggleByLabelNameInMenu(toggleMenu, labelName).Click();
        }
    }
}