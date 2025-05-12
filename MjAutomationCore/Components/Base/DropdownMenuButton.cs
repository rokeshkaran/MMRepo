using MjAutomationCore.Components.Buttons;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using System.Collections.Generic;
using SeleniumExtras.PageObjects;
using System;
using System.Linq;
using MjAutomationCore.Extensions;

namespace MjAutomationCore.Components.Base
{
    class DropdownMenuButton : BaseWebComponent, IWebComponent
    {
        public new By Context => By.XPath($".//div[contains(@class,'menu-button-popup')][contains(@class,'{Identifier}')]");
        protected override By Construct()
        {
            return Context;
        }

        [FindsBy(How = How.XPath, Using = "./*[contains(@class,'joint-widget')]")]
        public IList<IWebElement> AllMenuItems { get; set; }

        #region ButtonByType
        public IList<IWebElement> GetButtonByTypeList()
        {
            return Driver.Component<ButtonByType>(new Properties() { Parent = Instance }).Instances;
        }

        public IWebElement GetButtonByType(string buttonName)
        {
            if (buttonName == "publish" || buttonName == "Publish")
            {
                return Driver.Component<ButtonByType>(buttonName, new Properties() { Parent = Instance }).Instances.First();
            }
            return Driver.GetComponent<ButtonByType>(buttonName, new Properties() { Parent = Instance });
        }

        public IWebElement GetDiamondIcon(string buttonName)
        {
            var selector = By.XPath("./*[contains(@class,'menu-button__upsell-icon')]");
            var parent = GetButtonByType(buttonName);
            if (!Driver.IsElementInElementDisplayed(parent, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Diamond icon is not displayed");
            }
            return parent.FindElement(selector);
        }

        #endregion

        #region MenuButtonByType
        public IList<IWebElement> GetMenuButtonByTypeList()
        {
            return Driver.Component<MenuButtonByType>(new Properties() { Parent = Instance }).Instances;
        }

        public IWebElement GetMenuButtonByType(string menuButtonName)
        {
            return Driver.GetComponent<MenuButtonByType>(menuButtonName, new Properties() { Parent = Instance });
        }

        #endregion

        #region ButtonWithTextOrIconName
        public IList<IWebElement> GetButtonWithTextOrIconNameList()
        {
            return Driver.Component<ButtonWithTextOrIconName>(new Properties() { Parent = Instance }).Instances;
        }

        public IWebElement GetButtonWithTextOrIconName(string buttonName)
        {
            return Driver.GetComponent<ButtonWithTextOrIconName>(buttonName, new Properties() { Parent = Instance });
        }

        public IWebElement GetToggleMenuByName(string toggleMenu)
        {
            var selector = By.XPath($".//*[contains(@class,'joint-toggle-menu-item')][@data-name='{toggleMenu}']");
            if (!Driver.IsElementInElementDisplayed(Instance, selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Toggle menu with name '{toggleMenu}' is not displayed");
            }
            return Instance.FindElement(selector);
        }

        public IWebElement GetToggleByLabelNameInMenu(string toggleMenu, string labelName)
        {
            var selector = By.XPath($".//div[contains(@class,'toggle-label')][text()='{labelName}']/preceding::div[contains(@class,'toggle')]");
            if (!Driver.IsElementInElementDisplayed(GetToggleMenuByName(toggleMenu), selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"'{labelName}' is not displayed in '{toggleMenu}' menu");
            }
            return GetToggleMenuByName(toggleMenu).FindElement(selector);
        }

        public IWebElement GetToggleHelpButtonInToggleMenu(string toggleMenu)
        {
            var selector = By.XPath($".//div[@class='toggle-help-button']");
            if (!Driver.IsElementInElementDisplayed(GetToggleMenuByName(toggleMenu), selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception("Toggle help button is not displayed");
            }
            return GetToggleMenuByName(toggleMenu).FindElement(selector);
        }
        #endregion
    }
}