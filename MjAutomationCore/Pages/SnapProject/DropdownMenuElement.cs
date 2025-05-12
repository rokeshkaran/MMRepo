using OpenQA.Selenium;
using SeleniumAutomationUtils.Pages;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;

namespace MjAutomationCore.Pages.SnapProject
{
    class DropdownMenuElement : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'semi-transparent')]/div[contains(@class,'mm-capture-queue')]")]
        public IWebElement DropdownMenu { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            { };
        }

        public IWebElement GetItemByName(string item)
        {
            var selector = By.XPath($".//div[contains(@class,'open-manage')][text()='{item}']");
            if (!Driver.IsElementInElementDisplayed(DropdownMenu, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"'{item}' item is not displayed in dropdown menu");
            }

            return DropdownMenu.FindElement(selector);
        }
    }
}
