using System.Collections.Generic;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumAutomationUtils.Pages;
using OpenQA.Selenium;
using SeleniumExtras.PageObjects;

namespace MjAutomationCore.Pages.WebAppProject.MenuToolbar
{
    class PresentationModeMenuToolbarPage : SeleniumBasePage
    {
        const string Selector = ".//div[@id='presentation-toolbar']";
        public new By Context => By.XPath(Selector);

        [FindsBy(How = How.XPath, Using = Selector)]
        public IWebElement PresentationModeMenuToolbar { get; set; }

        [FindsBy(How = How.XPath, Using = ".//button[contains(@class,'presentation-zoomIn')]")]
        public IWebElement ZoomInButtonOnPresentationModeMenuToolbar { get; set; }

        [FindsBy(How = How.XPath, Using = ".//button[contains(@class,'presentation-zoomOut')]")]
        public IWebElement ZoomOutButtonOnPresentationModeMenuToolbar { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'search presentation-search')]")]
        public IWebElement SearchToolbar { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            { };
        }

        public bool MenuToolbar()
        {
            return Driver.IsElementDisplayed(PresentationModeMenuToolbar, WebDriverExtensions.WaitTime.Long);
        }

        public bool GetSearchToolbarState()
        {
            var state = SearchToolbar.GetAttribute("class");
            return state.Contains("expanded");
        }
    }
}
