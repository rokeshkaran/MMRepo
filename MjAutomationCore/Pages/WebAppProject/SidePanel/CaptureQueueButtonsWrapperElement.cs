using MjAutomationCore.Providers;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Pages;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;

namespace MjAutomationCore.Pages.WebAppProject.SidePanel
{
    class CaptureQueueButtonsWrapperElement : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[@class='mm-capture-queue-buttons-wrapper']")]
        public IWebElement CaptureQueueButtonsWrapper { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            { };
        }

        public bool DisplayedCaptureQueueButtonsWrapper()
        {
            if (!CaptureQueueButtonsWrapper.GetCssValue("display").Equals("flex"))
            {
                return false;
            }
            return true;
        }

        public IWebElement GetButtonByNameInCaptureQueueButtons(string buttonName)
        {
            var section = By.XPath($".//button[@title='{buttonName}']");
            if (!Driver.IsElementInElementDisplayed(CaptureQueueButtonsWrapper, section, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Button '{buttonName}' is not displayed in capture  queue buttons");
            }

            return CaptureQueueButtonsWrapper.FindElement(section);
        }

        public bool DisplayedCounter(string counter, string itemType, string buttonName)
        {
            var section = By.XPath($".//span[@class='mm-capture-queue-{itemType}-counter' and text()='{counter}']");
            var panel = Driver.NowAtWithContext<SnapPanelPage>();
            if (!Driver.IsElementInElementDisplayed(panel.GetButtonByNameOnSpanPanel(buttonName), section, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"'{counter}' Numbers of {itemType} items is not displayed or displayed incorrectly on '{buttonName}' button");
            }

            return Driver.IsElementDisplayed(panel.GetButtonByNameOnSpanPanel(buttonName).FindElement(section));
        }
    }
}