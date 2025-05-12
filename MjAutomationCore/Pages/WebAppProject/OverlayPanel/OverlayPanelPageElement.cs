using OpenQA.Selenium;
using SeleniumAutomationUtils.Pages;
using SeleniumExtras.PageObjects;
using System.Collections.Generic;

namespace MjAutomationCore.Pages.WebAppProject.OverlayPanel
{
    class OverlayPanelPageElement : SeleniumBasePage, IContextContainer
    {
        const string Selector = ".//div[@id='overlay-panel']";
        public new By Context => By.XPath(Selector);

        [FindsBy(How = How.XPath, Using = Selector)]
        public IWebElement OverlayPanel { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'joint-toast')]")]
        public IWebElement ToastNotification { get; set; }
        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By> { };
        }

        public bool DisplayedToastNotification()
        {
            return ToastNotification.GetAttribute("class").Contains("show");
        }
    }
}