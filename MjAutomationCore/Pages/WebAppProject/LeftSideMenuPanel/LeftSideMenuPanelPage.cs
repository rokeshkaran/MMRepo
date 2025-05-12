using OpenQA.Selenium;
using SeleniumAutomationUtils.Pages;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;

namespace MjAutomationCore.Pages.WebAppProject.LeftSideMenuPanel
{
    class LeftSideMenuPanelPage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[@id='menu']")]
        public IWebElement MenuPanel { get; set; }

        [FindsBy(How = How.XPath, Using = ".//button[@class='btn btn-close-menu']")]
        public IWebElement CloseMenuButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='menu-version']")]
        public IWebElement MenuVersion { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='user']/following-sibling::button[not(contains(@style,'none')) and not(contains(@class,'disabled'))]")]
        public IList<IWebElement> LeftMenuButtonLists { get; set; }
        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            { };
        }
        public bool GetMenuPanelState()
        {
            var state = MenuPanel.GetAttribute("style").Contains("visible");
            return state;
        }

        public IWebElement GetButtonByName(string buttonName)
        {
            var selector = By.XPath($".//div[@id='menu']//button[text()=\"{buttonName}\"]");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Button '{buttonName}' is not displayed on Left side menu panel");
            }

            return Driver.FindElement(selector);
        }
        public IWebElement GetSubTitleByTitleHeader(string subTitle, string headTitle)
        {
            var selector = By.XPath($".//div[@class='title']//div[@class='title-caption' and text()='{headTitle}']/following-sibling::div[@class='title-body' and text()='{subTitle}']");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Second))
            {
                throw new Exception($"SubTitle '{subTitle}' is not displayed on Left side menu panel");
            }

            return Driver.FindElement(selector);
        }
    }
}
