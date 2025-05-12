using MjAutomationCore.Extensions;
using MjAutomationCore.Providers;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Pages;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MjAutomationCore.Pages.WebAppProject.MindManagerFiles
{
    class UnpublishedFilesPage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[@id='unpublish-complete-form']")]
        public IWebElement UnpublishForm { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='unpublish-files-container']//*[contains(@class,'file-name')]")]
        public IList<IWebElement> UnPublishedFileList { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            var iframe = Driver.FindElements(By.XPath(".//iframe[not(@title='reCAPTCHA') and not(contains(@style,'display: none;')) and not (contains(@title,'onetrust'))]"));
            if (iframe.Any())
            {
                Driver.SwitchToSpecificFrame(iframe[0]);
            }
            return new List<By>
            {
                SelectorFor(this, p=> p.UnpublishForm)
            };
        }
    }
}
