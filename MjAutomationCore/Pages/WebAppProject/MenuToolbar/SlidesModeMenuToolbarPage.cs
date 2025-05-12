using OpenQA.Selenium;
using SeleniumAutomationUtils.Pages;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;

namespace MjAutomationCore.Pages.WebAppProject.MenuToolbar
{
    class SlidesModeMenuToolbarPage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'joint-slides-toolbar')]")]
        public IWebElement SlidesMenuToolbar { get; set; }

        public string LogoOnSlidesToolbar = ".//a[@class='slides-toolbar-logo']";

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            {
                SelectorFor(this, p => p.SlidesMenuToolbar)
            };
        }

        public IWebElement GetButtonByNameInSlidesToolbarControl(string buttonName)
        {
            var selector = By.XPath($".//button[@data-action='{buttonName}']");

            if (!Driver.IsElementInElementDisplayed(SlidesMenuToolbar, selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Button '{buttonName}' is not displayed on Slides toolbar");
            }

            return SlidesMenuToolbar.FindElement(selector);
        }

        public IWebElement GetCounterLabelOnSlidesToolbar(string label)
        {
            var selector = By.XPath($".//span[@class='slides-toolbar-counter'][text()='{label}']");

            if (!Driver.IsElementInElementDisplayed(SlidesMenuToolbar, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Label '{label}' is not displayed on Slides toolbar");
            }

            return SlidesMenuToolbar.FindElement(selector);
        }
    }
}
