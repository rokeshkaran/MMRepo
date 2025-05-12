using AutomationUtils.Utils;
using MjAutomationCore.Components.ToolbarLogo;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.MenuToolbar;
using MjAutomationCore.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using System;
using System.Text;
using System.Threading;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.MenuToolbar
{
    [Binding]
    class MenuToolbarBaseStep : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly BrowsersList _browsers;
        private readonly SessionRandomValue _sessionRandom;

        public MenuToolbarBaseStep(WebDriver driver, BrowsersList browsersList, SessionRandomValue sessionRandom)
        {
            _driver = browsersList.GetBrowser();
            _browsers = browsersList;
            _sessionRandom = sessionRandom;
        }

        [When(@"User clicks '(.*)' button on Menu toolbar")]
        public void WhenUserClicksButtonOnMenuToolbar(string buttonName)
        {
            var panel = _browsers.Active.NowAt<MenuToolbarBasePage>();
            panel.GetButtonByNameOnToolbar(buttonName).Click();
        }

        [Then(@"'([^']*)' button is not displayed on Menu toolbar")]
        public void ThenButtonIsNotDisplayedOnMenuToolbar(string buttonName)
        {
            var panel = _browsers.Active.NowAt<MenuToolbarBasePage>();
            Verify.IsFalse(panel.DisplayedButton(buttonName), $"Button '{buttonName}' is displayed on Menu toolbar");
        }

        [Then(@"'(.*)' button is displayed on Menu toolbar")]
        public void ThenButtonIsDisplayedOnMenuToolbar(string buttonName)
        {
            var panel = _browsers.Active.NowAt<MenuToolbarBasePage>();
            Verify.IsTrue(panel.DisplayedButton(buttonName), $"Button '{buttonName}' is not displayed on Menu toolbar");
        }

        [Then(@"'([^']*)' button is disabled on Menu toolbar")]
        public void ThenButtonIsDisabledOnMenuToolbar(string buttonName)
        {
            var panel = _browsers.Active.NowAt<MenuToolbarBasePage>();
            Verify.IsTrue(panel.GetButtonByNameOnToolbar(buttonName).IsDisabledState(), $"Button '{buttonName}' is enabled on menu toolbar");
        }

        [Then(@"'([^']*)' button is enabled on Menu toolbar")]
        public void ThenButtonIsEnabledOnMenuToolbar(string buttonName)
        {
            var panel = _browsers.Active.NowAt<MenuToolbarBasePage>();
            Verify.IsFalse(panel.GetButtonByNameOnToolbar(buttonName).IsDisabledState(), $"Button '{buttonName}' is disabled on menu toolbar");
        }

        [When(@"User clicks Logo image on Menu toolbar")]
        public void WhenUserClicksLogoImageOnMenuToolbar()
        {
            var panel = _browsers.Active.NowAt<MenuToolbarBasePage>();
            _browsers.Active.WaitForElementToBeDisplayed(panel.LogoImageOnToolbar);
            _browsers.Active.ClickByJavascript(panel.LogoImageOnToolbar);
        }

        [Then(@"'([^']*)' map name is displayed on Toolbar")]
        public void ThenMapNameIsDisplayedOnToolbar(string mapName)
        {
            mapName = mapName.AddRandom(_sessionRandom);
            var panel = _browsers.Active.NowAt<MenuToolbarBasePage>();
            Verify.IsTrue(panel.MapNameOnToolbar.Text.Equals(mapName), $"'{mapName}' Map name is not displayed on Toolbar");
        }

        [Then(@"'([^']*)' logo is displayed in '([^']*)' container on '([^']*)' side")]
        public void ThenLogoIsDisplayedInContainerOnSide(string logo, string container, string side)
        {
            var parent = WebContainer.GetContainerSelector(container);
            var ImageDetails = _browsers.Active.GetComponent<ToolbarLogoElement>(new Properties() { ParentSelector = parent }).GetCssValue("background-image");
            if (ImageDetails.Contains("base64"))
            {
                string[] strlist = ImageDetails.Split(",", 2);
                var encoded = strlist[1].Remove(strlist[1].Length - 2);
                var decoded = encoded.DecodedString();

                byte[] svgBytes = Encoding.UTF8.GetBytes(decoded);
                int fileSizeBytes = svgBytes.Length;
                string ImageSize = fileSizeBytes.ToString();
                string expectedSize = (side.Equals("left")) ? "1307" : "10903";
                if (logo.Equals("default"))
                {
                    Verify.IsTrue(ImageSize.Equals(expectedSize), $"Default Logo is not displayed on Menu toolbar with size {expectedSize} Bytes");
                }
                else
                {
                    Verify.IsFalse(ImageSize.Equals(expectedSize), $"'{logo}' Logo is not displayed on Menu toolbar with size {expectedSize} Bytes");
                }
            }
            else
            {
                throw new Exception($"'{logo}' Logo  displayed on Menu toolbar on '{side}' side does not contain base64.");
            }
        }

        [Then(@"Custom logo is displayed in '([^']*)' container")]
        public void ThenCustomLogoIsDisplayedInContainerOnSide(string container)
        {
            var parent = WebContainer.GetContainerSelector(container);
            var ImageDetails = _browsers.Active.GetComponent<ToolbarLogoElement>(new Properties() { ParentSelector = parent }).GetAttribute("style");
            Verify.IsTrue(ImageDetails.Contains("background-image"),$"Custom Logo is not displayed in {container} container"
            );
        }

        [Then(@"Autosave label is displayed on Tools panel")]
        public void ThenAutosaveLabelIsDisplayedOnToolsPanel()
        {
            var page = _browsers.Active.NowAt<MenuToolbarBasePage>();
            Verify.IsTrue(page.DisplayedAutosaveLabel(), "Autosave label is not displayed on Tools panel");
        }

        [Then(@"Autosave label is not displayed on Tools panel")]
        public void ThenAutosaveLabelIsNotDisplayedOnToolsPanel()
        {
            var page = _browsers.Active.NowAt<MenuToolbarBasePage>();
            Verify.IsFalse(page.DisplayedAutosaveLabel(), "Autosave label is displayed on Tools panel");
        }

        [When(@"User click switch button Autosave")]
        public void WhenUserClickSwitchButtonAutosave()
        {
            var switcher = _browsers.Active.NowAt<MenuToolbarBasePage>();
            _browsers.Active.ClickByJavascript(switcher.AutosaveSwitcher);
            //TODO Wait for switch
            Thread.Sleep(300);
        }

        [When(@"User disables autosave via JS")]
        public void WhenUserDisablesAutosaveViaJS()
        {
            _browsers.Active.SetAutosave();
        }

        [Then(@"Autosave switcher is displayed '(.*)' to the User")]
        public void ThenAutosaveSwitcherIsDisplayedToTheUser(string switcher)
        {
            var menuPanel = _browsers.Active.NowAt<MenuToolbarBasePage>();
            Assert.IsTrue(menuPanel.GetSwitchStatusForAutosave(switcher));
        }

        #region SearchToolbar

        [When(@"User clicks Prev button on Search toolbar")]
        public void WhenUserClicksPrevButtonOnSearchToolbar()
        {
            var button = _browsers.Active.NowAt<MenuToolbarBasePage>();
            button.PrevButtonOnSearchToolbar.Click();
        }

        [When(@"User clicks Next button on Search toolbar")]
        public void WhenUserClicksNextButtonOnSearchToolbar()
        {
            var button = _browsers.Active.NowAt<MenuToolbarBasePage>();
            button.NextButtonOnSearchToolbar.Click();
        }

        [When(@"User clicks '(.*)' button on Search toolbar")]
        public void WhenUserClicksButtonOnSearchToolbar(string buttonName)
        {
            var button = _browsers.Active.NowAt<MenuToolbarBasePage>();
            button.GetButtonByNameOnToolbar(buttonName).Click();
        }

        [When(@"User enters '(.*)' value in input filed on Search toolbar")]
        public void WhenUserEntersValueInInputFiledOnSearchToolbar(string value)
        {
            var inputFiled = _browsers.Active.NowAt<MenuToolbarBasePage>();
            inputFiled.InputFieldOnSearchToolbar.SendKeys(value);
            // TODO Waiting for focus shift after input
            Thread.Sleep(1000);
        }

        [Then(@"'([^']*)' value is displayed in input filed on Search toolbar")]
        public void ThenValueIsDisplayedInInputFiledOnSearchToolbar(string value)
        {
            var inputFiled = _browsers.Active.NowAt<MenuToolbarBasePage>();
            var exValue = inputFiled.InputFieldOnSearchToolbar.GetAttribute("value");
            Verify.AreEqual(value, exValue, $"Value '{value}' is not displayed in input filed on Search toolbar");
        }

        [When(@"User clears input filed on Search toolbar")]
        public void WhenUserClearsInputFiledOnSearchToolbar()
        {
            var inputFiled = _browsers.Active.NowAt<MenuToolbarBasePage>();
            inputFiled.InputFieldOnSearchToolbar.Clear();
        }

        [Then(@"'(.*)' label result is displayed on Search toolbar")]
        public void ThenLabelResultIsDisplayedOnSearchToolbar(string label)
        {
            var inputFiled = _browsers.Active.NowAt<MenuToolbarBasePage>();
            Assert.IsTrue(inputFiled.GetSearchControlLabel(label).Displayed());
        }

        #endregion

    }
}