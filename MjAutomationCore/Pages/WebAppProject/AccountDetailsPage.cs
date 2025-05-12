using System;
using System.Collections.Generic;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using MjAutomationCore.Base;
using MjAutomationCore.Extensions;
using System.Reflection.PortableExecutable;
using System.Linq;
using OpenQA.Selenium.Support.UI;
using SeleniumExtras.WaitHelpers;
using MjAutomationCore.Providers;

namespace MjAutomationCore.Pages.WebAppProject
{
    public class AccountDetailsPage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//*[contains(@class, 'account-details-panels')]")]
        public IWebElement Section { get; set; }

        public readonly string EmailToggleIcon = ".//div[@class='account-details-general-account-email-toggle-icon']";

        public readonly string ProductStatus = ".//span[contains(@class,'subscription-status')][text()='{0}']";

        public readonly string ProductToggleArrow = ".//div[contains(@class,'collapsible-content-toggle')]";

        public readonly string ProductExpiryDate = ".//div[@class='account-details-subscription-collapsible-content']//span[text()='{0}']//parent::div//span[contains(@class,'row-value expired-mark')]";

        private readonly string SectionSelector = ".//h3[contains(@class,'header')][text()='{0}']//parent::div[contains(@class,'account-details-panel')]";

        public override List<By> GetPageIdentitySelectors()
        {
            var frameSelector = SelectorFor(this, p => p.Iframe);
            var frames = Driver.FindElements(frameSelector);
            if (frames.Any())
            {
                Driver.SwitchToSpecificFrame(frames[0]);
            }
            return new List<By> { };
        }

        public IWebElement GetSectionByHeader(string header)
        {
            var selector = By.XPath(string.Format(SectionSelector, header));

            if (!Driver.IsElementDisplayed(selector))
            {
                throw new Exception($"Section '{header}' is not displayed on Account Details page");
            }
            return Driver.FindElement(selector);
        }

        public bool DisplayedSection(string header)
        {
            try
            {
                return Driver.IsElementDisplayed(GetSectionByHeader(header), WebDriverExtensions.WaitTime.Medium);
            }
            catch
            {
                return false;
            }
        }

        public IWebElement GetCheckboxByLabel(string labelName, string header)
        {
            var selector = By.XPath($".//label[translate(text(), ' ', ' ') = '{labelName}']/preceding-sibling::input[@type='checkbox']");
            if (!Driver.IsElementInElementDisplayed(GetSectionByHeader(header), selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Checkbox '{labelName}' is not displayed on Account Details page");
            }
            return GetSectionByHeader(header).FindElement(selector);
        }

        public IWebElement GetRowByLabelinSection(string label, string section)
        {
            var Section = GetSectionByHeader(section);
            var row = By.XPath($".//label[translate(text(), ' ', ' ')='{label}']/parent::div[@class='account-details-settings-row']");
            if (!Driver.IsElementInElementDisplayed(Section, row, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Row '{label}' is not displayed in Section '{section}' on  Account Details page");
            }
            return Section.FindElement(row);
        }

        public IWebElement GetLinkInRow(string linkText, string label, string section)
        {
            var row = GetRowByLabelinSection(label, section);
            var selector = By.XPath($"./*[contains(., '{linkText}')]");
            if (!Driver.IsElementInElementDisplayed(row, selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Link '{linkText}' is not displayed in Section '{section}' on Account Details page");
            }
            return row.FindElement(selector);
        }

        public IWebElement GetTooltip(string linkText, string label, string section)
        {
            var link = GetLinkInRow(linkText, label, section);
            var selector = By.XPath($"./span[@class='account-details-settings-tooltip']");
            if (!Driver.IsElementInElementDisplayed(link, selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Tooltip is not displayed in Section '{section}' on Account Details page");
            }
            return link.FindElement(selector);
        }

        public List<IWebElement> GetSubsectionListInSection(string section)
        {
            var selector = By.XPath(".//div[contains(@class,'account-details')]");
            if (!Driver.IsElementInElementDisplayed(GetSectionByHeader(section), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new NoSuchElementException($"Subsections are not displayed in section '{section}'");
            }
            return GetSectionByHeader(section).FindElements(selector).ToList();
        }

        public IWebElement GetSubsectionByHeader(string subsection, string section)
        {
            var selector = By.XPath(".//h3[contains(@class,'header')]");
            if (!Driver.IsElementInElementDisplayed(GetSectionByHeader(section), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new NoSuchElementException($"Subsections are not displayed in section '{section}'");
            }
            return GetSubsectionListInSection(section).Find(x => x.FindElement(selector).Text.Equals(subsection));
        }

        public String GetEmailAddressOnPage(string subsectionHeader, string sectionHeader)
        {
            var Subsection = GetSubsectionByHeader(subsectionHeader, sectionHeader);
            var locator = By.XPath(".//span[@class='account-details-general-account-email']");
            if (!Driver.IsElementInElementDisplayed(Subsection, locator, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Email address is not displayed in Subsection '{subsectionHeader} in Section '{sectionHeader}' on Account Details page");
            }
            return Subsection.FindElement(locator).Text;
        }

        public bool GetAccountNameOnPage(string Username, string subsectionHeader, string sectionHeader)
        {
            var Subsection = GetSubsectionByHeader(subsectionHeader, sectionHeader);
            var locator = By.XPath($".//div[@class='account-details-general-account-name-section']//span[contains(text(), '{Username}')]");
            if (!Driver.IsElementInElementDisplayed(Subsection, locator, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Account Name '{Username}' is not displayed in Subsection '{subsectionHeader} in Section '{sectionHeader}' on Account Details page");
            }
            return Driver.IsElementDisplayed(Subsection.FindElement(locator));
        }

        public IWebElement GetAccountDetailsSubscriptionLabel(string LabelText, string section)
        {
            var Section = GetSectionByHeader(section);
            var selector = By.XPath($".//span[text()='{LabelText}']");
            if (!Driver.IsElementInElementDisplayed(Section, selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"'{LabelText}' is not displayed in Section '{section}' on  Account Details page");
            }
            return Section.FindElement(selector);
        }

        public List<IWebElement> GetProductlistInSection(string section)
        {
            var Section = GetSectionByHeader(section);
            var selector = By.XPath(".//div[@class='account-details-subscriptions']/div[contains(@class,'account-details-subscription')]");
            if (!Driver.IsElementInElementDisplayed(Section, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new NoSuchElementException($"List of products are not displayed in section '{section}'");
            }
            return Section.FindElements(selector).ToList();
        }

        public IWebElement GetProductByLabel(string productName, string section)
        {
            var selector = By.XPath(".//span[contains(@class,'product-label')]");
            if (GetProductlistInSection(section).Any(x => x.FindElement(selector).Text.Equals(productName)))
            {
                return (GetProductlistInSection(section).First(x => x.FindElement(selector).Text.Equals(productName)));
            }
            throw new Exception($"Product '{productName}' is not displayed in '{section}' section on Account Details page");
        }

        public bool DisplayedProductDetailState(string productName, string section)
        {
            var state = GetProductByLabel(productName, section).GetAttribute("class");
            return state.Contains("visible");
        }

        public bool DisplayedProductStatus(string productName, string section, string status)
        {
            var selector = By.XPath(string.Format(ProductStatus, status));
            if (!Driver.IsElementInElementDisplayed(GetProductByLabel(productName, section), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Product '{productName}' with status '{status}' is not displayed in '{section}' section on Account Details page");
            }
            return true;
        }
    }
}
