using System.Collections.Generic;
using SeleniumAutomationUtils.SeleniumExtensions;
using MjAutomationCore.Base;
using OpenQA.Selenium;

namespace MjAutomationCore.Pages.WebAppProject.QA
{
    class PublishTypePage : SeleniumBasePage
    {    
        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            {
                SelectorFor(this, p => p.LogoImageOnPage)
            };
        }

        public bool LogoImage()
        {
            return Driver.IsElementDisplayed(LogoImageOnPage, WebDriverExtensions.WaitTime.Short);
        }
    }
}