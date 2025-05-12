using MjAutomationCore.Base;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;
using MjAutomationCore.Extensions;

namespace MjAutomationCore.Pages.BaseProject
{
    class UnifiedComponents : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//input[@type='file']")]
        public IList<IWebElement> FileUploadField { get; set; }
        
        [FindsBy(How = How.XPath, Using = ".//*[contains(@class,'signup-from-shared-file')][contains(@class,'title')]")]
        public IWebElement SignUpFromSharedFileTitle { get; set; }

        [FindsBy(How = How.XPath, Using = ".//*[@class='signup-from-shared-file__email']")]
        public IWebElement SignUpFromSharedFileEmail { get; set; }

        [FindsBy(How = How.XPath, Using = "(.//div[contains(@class,'cursor')][@class!='remote-cursors-container']) | (.//img[contains(@class,'cursor')])")]
        public IWebElement IconNearCursor { get; set; }

        public string HeaderPage = ".//h2[contains(@class,'section-header')]";

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            { };
        }

        public IWebElement GetNotificationMessages(string massage)
        {
            var selector = By.XPath($".//div[@id='toast-container']//div[@class='toast-message'][text()='{massage}']");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception("Notification Messages is not displayed");
            }
            return Driver.FindElement(selector);
        }

        public IWebElement GetHeaderPage(string header)
        {
            var selector = By.XPath($".//h2[contains(@class,'section-header')]//b[text()='{header}'] | .//h1[contains(@class,'section-header')]//b[text()='{header}'] | .//h1[text()='{header}']");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Long))
            {
                throw new Exception($"Header '{header}' is not displayed");
            }
            return Driver.FindElement(selector);
        }

        public bool GetMessegeOnPage(string textMessege)
        {
            var selector = By.XPath($".//*[contains(@class,'form')]/p/b[text()='{textMessege}']");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Medium))
                throw new Exception($"Text {textMessege} is not displayed on page");
            return Driver.IsElementDisplayed(selector);
        }

        public IWebElement GetSectionContentPage(string content)
        {
            var selector = By.XPath($".//div[@class='section-content-container']//h1[text()='{content}']");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Content message '{content}' is not displayed on page");
            }
            return Driver.FindElement(selector);
        }

        public IWebElement GetItemByNameOnMenuList(string item, string sectionName = "")
        {
            var sectionSelector = string.IsNullOrEmpty(sectionName) ?
                String.Empty : $"//div[@class='popup-group-label'][text()='{sectionName}']";
            var selector = By.XPath($".//div[@class='scroll-content']{sectionSelector}//../div[contains(@class,'popup-menu')][text()='{item}']");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Item '{item}' is not displayed in list");
            }

            return Driver.FindElement(selector);
        }

        public bool DisplayedIconNearCursor(string icon)
        {
            if (Driver.IsElementDisplayed(IconNearCursor))
            {
                var iconDetails = IconNearCursor.GetCssValue("background-image");
                if (iconDetails.Contains(icon))
                {
                    return true;
                }
                if (iconDetails.Contains("base64"))
                {
                    string[] strlist = iconDetails.Split(",", 2);
                    var encoded = strlist[1].Remove(strlist[1].Length - 2);
                    var decoded = encoded.DecodedString();
                    if (decoded.Contains(icon))
                    {
                        return true;
                    }
                }
                if (IconNearCursor.GetAttribute("src").Contains(icon))
                {
                    return true;
                }
            }
            return false;
        }

        public By GetHyperlinkSelector(string link)
        {
            var selector = By.XPath($".//a[@class='{link}'] | .//a[text()='{link}']");
            return selector;
        }

        public IWebElement GetHyperlink(string link)
        {
            var selector = GetHyperlinkSelector(link);
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"'{link}' link is not displayed");
            }

            return Driver.FindElement(selector);
        }
    }
}