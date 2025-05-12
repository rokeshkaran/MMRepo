using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;

namespace MjAutomationCore.Components.Base
{
    class FullscreenDialog : BaseWebComponent, IWebComponent
    {
        public By Container => By.XPath($".//div[@id='fullscreen-dialog']//div[@class='dialog']");

        protected override By Construct()
        {
            return Container;
        }

        [FindsBy(How = How.XPath, Using = "./preceding-sibling::div[@class='overlay']")]
        public IWebElement FullscreenDialogOverlay { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='content']/div[@class='title']/p")]
        public IWebElement FullscreenDialogTitle { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='content']/div[@class='text']/p")]
        public IWebElement FullscreenDialogMessage { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='close']")]
        public IWebElement FullscreenDialogCloseButton { get; set; }

        public IWebElement GetButtonByNameInFullscreenDialogWindow(string buttonName)
        {
            var selector = By.XPath($".//div[@class='buttons']//span[text()='{buttonName}']");
            if (!Driver.IsElementInElementDisplayed(Instance, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Button '{buttonName}' is not displayed in Fullscreen Dialog window");
            }
            return Instance.FindElement(selector);
        }
    }
}
