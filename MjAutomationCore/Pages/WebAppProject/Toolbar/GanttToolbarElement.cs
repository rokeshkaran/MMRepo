using OpenQA.Selenium;
using SeleniumAutomationUtils.Pages;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;

namespace MjAutomationCore.Pages.WebAppProject.Toolbar
{
    class GanttToolbarElement : SeleniumBasePage, IContextContainer
    {

        [FindsBy(How = How.XPath, Using = ".//div[@id='gantt-toolbar']")]
        public IWebElement GanttToolbar { get; set; }

        public IWebElement GetGanttToolbarButtonById(string toolbarId)
        {
            var selector = By.XPath($".//*[@data-toolbar-id='{toolbarId}']");
            if (!Driver.IsElementInElementDisplayed(GanttToolbar, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Button '{toolbarId}' is not displayed on Gantt toolbar");
            }
            return GanttToolbar.FindElement(selector);
        }
    }
}