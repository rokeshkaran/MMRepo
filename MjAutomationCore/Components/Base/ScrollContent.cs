using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MjAutomationCore.Components.Base
{
    class ScrollContent : BaseWebComponent, IWebComponent
    {
        public new By Context => By.XPath(".//div[@class='scroll-content']");

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'popup-menu-item')]")]
        public IList<IWebElement> Items { get; set; }

        public string SideToolboxButton = ".//div[contains(@class,'side-toolbox-button')][not(contains(@style, 'display: none;'))]";

        protected override By Construct()
        {
            return Context;
        }

        public IWebElement GetItemByName(string itemName)
        {
            if (Items.Any(x => x.Text.Equals(itemName)))
            {
                return Items.First(x => x.Text.Equals(itemName));
            }
            else if (Items.Any(x => x.FindElement(By.XPath(SideToolboxButton)).GetAttribute("data-tooltip").Equals(itemName)))
            {
                return Items.First(x => x.FindElement(By.XPath(SideToolboxButton)).GetAttribute("data-tooltip").Equals(itemName));
            }

            throw new Exception($"Item '{itemName}' is not displayed");
        }

        public IWebElement GetItemIconByName(string itemName)
        {
            return GetItemByName(itemName).FindElement(By.XPath(SideToolboxButton));
        }

        public IWebElement GetSwitchByLabelName(string labelName)
        {
            var selector = By.XPath($".//div[@class='filter-option-label'][text()='{labelName}']/parent::div[@class='filter-option']//div[@class='filter-option-switch-labels']");
            if (!Driver.IsElementInElementDisplayed(Instance, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Switch by label '{labelName}'  name is not displayed");
            }
            return Instance.FindElement(selector);
        }
    }
}
