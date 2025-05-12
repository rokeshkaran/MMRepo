using MjAutomationCore.Base;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System.Collections.Generic;
using System.Linq;

namespace MjAutomationCore.Pages.WebAppProject.QA
{
    class SharePublishedPage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'middle')]")]
        public IWebElement CentralPanel { get; set; }
        public override List<By> GetPageIdentitySelectors()
        {
            //Need to Optimised the code
            var pageIframe = Driver.FindElements(By.XPath(".//iframe[not(@title='reCAPTCHA') and not(contains(@style,'display: none;')) and not(@class='ot-text-resize')]"));
            if (pageIframe != null && pageIframe.Any())
            {
                Driver.SwitchToFrame(0);
            }
            return new List<By>
            {
                SelectorFor(this, p => p.LogoImageOnPage)
            };
        }
        public string GetSocialIconByName(string iconName)
        {
            var selector = $".//following::div[@class='thumbnails-container']/*[@data-site='{iconName}']";
            return selector;
        }
    }
}