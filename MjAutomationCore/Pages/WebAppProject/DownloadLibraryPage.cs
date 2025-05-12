using MjAutomationCore.Base;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;

namespace MjAutomationCore.Pages.WebAppProject
{
    public class DownloadLibraryPage : SeleniumBasePage
    {
        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            {
                By.XPath(".//*[contains(@class,'container')]//h2[text()='MindManager Product Download Library']")
            };
        }

        public IWebElement GetSectionHeader(string sectionHeader)
        {

            var selector = By.XPath($".//section//div//h3[contains(text(),'{sectionHeader}')]");
            if (!Driver.IsElementDisplayed(selector))
            {
                throw new Exception($"Section '{sectionHeader}' is not displayed on Download Library page");
            }
            return Driver.FindElement(selector);
        }

        public bool DisplayedSectionHeader(string sectionHeader)
        {
            try
            {
                return Driver.IsElementDisplayed(GetSectionHeader(sectionHeader), WebDriverExtensions.WaitTime.Medium);
            }
            catch
            {
                return false;
            }
        }

        public IWebElement GetSubSectionBySectionHeader(string subSection, string sectionHeader)
        {
            var selector = By.XPath($"./parent::div/following-sibling::div//*[@class='h4' and text()='{subSection}'] | ./parent::div/*[@class='h4' and text()='{subSection}']");
            if (!Driver.IsElementInElementDisplayed(GetSectionHeader(sectionHeader), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new NoSuchElementException($"Subsection '{subSection}' is not displayed in section '{sectionHeader}' on Download Library page");
            }
            return GetSectionHeader(sectionHeader).FindElement(selector);
        }

        public IWebElement GetlinkOfSubSectionOfSectionHeader(string subSectionLink, string subSection, string sectionHeader)
        {
            var selector = By.XPath($"./following-sibling::ul[1]/li/a[text()='{subSectionLink}']");
            if (!Driver.IsElementInElementDisplayed(GetSubSectionBySectionHeader(subSection, sectionHeader), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new NoSuchElementException($"Subsection link '{subSectionLink}' is not displayed in SubSection '{subSection}' on Download Library page");
            }
            return GetSubSectionBySectionHeader(subSection, sectionHeader).FindElement(selector);
        }

        public IList<IWebElement> GetItemListInSubSection(string subSection, string sectionHeader)
        {
            var selector = By.XPath("./following-sibling::ul[1]/li/a[text()]");
            if (!Driver.IsElementInElementDisplayed(GetSubSectionBySectionHeader(subSection, sectionHeader), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new NoSuchElementException($"Subsection link lists is not displayed in SubSection '{subSection}' on Download Library page");
            }
            return GetSubSectionBySectionHeader(subSection, sectionHeader).FindElements(selector);
        }
    }
}
