using MjAutomationCore.Base;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;

namespace MjAutomationCore.Pages.WebAppProject.MenuToolbar
{
    class StandardModeMenuToolbarPage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[@class='search toolbar-component']")]
        public IWebElement SearchButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@id='toolbar']")]
        public IWebElement StandardMenuToolbar { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'search toolbar-component')]")]
        public IWebElement SearchToolbar { get; set; }
        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            {};
        }

        public bool ToolbarPosition(string position)
        {
            if (!Driver.IsElementDisplayed(StandardMenuToolbar, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception("Toolbar is not displayed to Standard mode");
            }

            var actualPosition = StandardMenuToolbar.GetAttribute("data-position");
            return actualPosition.Equals(position);
        }
        public bool GetSearchToolbarState()
        {
            var state = SearchToolbar.GetAttribute("class");
            return state.Contains("expanded");
        }
    }
}
