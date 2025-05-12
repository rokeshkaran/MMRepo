using OpenQA.Selenium;
using SeleniumAutomationUtils.Pages;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;

namespace MjAutomationCore.Pages.WebAppProject.ToolPanel
{
    class ToolPanelPage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[contains(@id,'toolPanel')]")]
        public IWebElement ToolPanel { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@id='toolPanel']//button")]
        public IList<IWebElement> ButtonsOnToolPanel { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            { };
        }

        public IWebElement GetButtonByNameOnToolsPanel(string buttonName)
        {
            var selector = By.XPath($".//span[text()='{buttonName}']/parent::button");
            if (!Driver.IsElementInElementDisplayed(ToolPanel, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Button '{buttonName}' is not displayed on Tools panel");
            }

            return ToolPanel.FindElement(selector);
        }

        public bool GetToolsPanelLocation(string side)
        {
            Driver.WaitForElementToContainsTextInAttribute(ToolPanel, side, "class", WebDriverExtensions.WaitTime.Short);
            var location = ToolPanel.GetAttribute("class").Contains(side);
            return location;
        }
    }
}