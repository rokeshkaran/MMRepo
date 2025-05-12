using AutomationUtils.Extensions;
using AutomationUtils.Utils;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Pages;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;

namespace MjAutomationCore.Pages.LicensingProject.AdminPortal
{
    class AdminDownloadsPage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[@class='link-card']")]
        public IList<IWebElement> LinkCards { get; set; }

        private readonly string SectionTitleXPath = ".//div[@class='link-card__title']//span";

        private readonly string InstallerXPath = ".//div[@class='link-card-button']";

        private readonly string InstallerTitleXPath = ".//span[@class='link-card-button__title']";

        private readonly string DocumentationLinksXPath = ".//ul[@class='link-card__documentation']//a";

        private readonly string LogoXPath = ".//img[@src='{0}']";

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>{ };
        }

        public List<string> GetSectionTitles()
        {
            Driver.WaitForElementsToBeDisplayed(LinkCards, WebDriverExtensions.WaitTime.Medium, false);
            return LinkCards.Select(card => card.FindElement(By.XPath(SectionTitleXPath)).Text).ToList();
        }

        public IWebElement GetSectionElementByTitle(string title)
        {
            Driver.WaitForElementsToBeDisplayed(LinkCards);
            if (!LinkCards.Any(card => card.FindElement(By.XPath(SectionTitleXPath)).Text.Equals(title)))
            {
                throw new Exception($"Section with title '{title}' not found");
            }
            return LinkCards.First(card => card.FindElement(By.TagName("span")).Text.Equals(title));
        }

        public bool IsLogoImageDisplayedInSectionTitle(string logo, string sectionTitle)
        {
            try
            {
                string logoXPath = string.Format(LogoXPath, logo);
                return Driver.IsElementInElementDisplayed(GetSectionElementByTitle(sectionTitle), By.XPath(logoXPath),
                    WebDriverExtensions.WaitTime.Short);
            }
            catch
            {
                return false;
            }
        }

        public IList<IWebElement> GetInstallersInSection(string sectionTitle)
        {
            var selector = By.XPath(InstallerXPath);
            Driver.WaitForElementInElementToBeDisplayed(GetSectionElementByTitle(sectionTitle), selector, WebDriverExtensions.WaitTime.Medium);
            var sectionElement = GetSectionElementByTitle(sectionTitle);
            return sectionElement.FindElements(selector).ToList();
        }

        public IWebElement GetInstallerButtonInSection(string installerName, string sectionTitle)
        {
            return GetInstallersInSection(sectionTitle).First(x=>x.FindElement(By.XPath(InstallerTitleXPath))
            .Text.Equals(installerName));
        }

        public List<string> GetInstallerTitlesInSection(string sectionTitle)
        {
            var installerTitles = GetInstallersInSection(sectionTitle).ToList()
                .Select(x => x.FindElement(By.XPath(InstallerTitleXPath)).Text).ToList();
            return installerTitles;
        }

        public IList<IWebElement> GetDocumentationLinksInSection(string sectionTitle)
        {
            var sectionElement = GetSectionElementByTitle(sectionTitle);
            var documentationLinks = sectionElement.FindElements(By.XPath(DocumentationLinksXPath)).ToList();
            return documentationLinks;
        }

        public List<string> GetDocumentationLinkTextsInSection(string sectionTitle)
        {
            var documentationLinks = GetDocumentationLinksInSection(sectionTitle);
            var linkTexts = documentationLinks.Select(link => link.Text).ToList();
            return linkTexts;
        }

        public void ClickLinkInSection(string linkName, string sectionTitle)
        {
            IWebElement linkElement = GetDocumentationLinksInSection(sectionTitle).First(link => link.Text.Equals(linkName));
            linkElement.Click();
        }
    }
}