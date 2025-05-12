using MjAutomationCore.Base;
using MjAutomationCore.Utils;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using System;
using System.Collections.Generic;

namespace MjAutomationCore.Pages.BaseProject
{
    public class BrandImageElement : SeleniumBasePage
    {
        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>();
        }
        public IWebElement GetBrandImage(BrowsersList _browsers, string BrandImage)
        {
            IWebElement Image = _browsers.Active.FindElement(By.XPath($".//img[@alt='{BrandImage}' or @class='{BrandImage}']"));
            if (!_browsers.Active.IsElementDisplayed(Image))
            {
                throw new Exception($"'{BrandImage}' image is not displayed on the page");
            }
            return Image;
        }
    }
}
