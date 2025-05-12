using System.Collections.Generic;
using MjAutomationCore.Base;
using OpenQA.Selenium;
using SeleniumExtras.PageObjects;

namespace MjAutomationCore.Pages.WebAppProject.MindManagerFiles
{
    class ViewPublishedFilePage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[@id='presentation-toolbar']//button[@class='presentation-menu presentation-btn']")]
        public IWebElement MenuButtonInPresentationViewMode { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            {
                SelectorFor(this, p => p.MenuButtonInPresentationViewMode)
            };
        }
    }
}
