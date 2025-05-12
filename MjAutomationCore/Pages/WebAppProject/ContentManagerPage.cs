using AutomationUtils.Utils;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.FileManagerHeader;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Pages;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using static SeleniumAutomationUtils.SeleniumExtensions.WebDriverExtensions;

namespace MjAutomationCore.Pages.WebAppProject
{
    class ContentManagerPage : SeleniumBasePage
    {
        public string ContenItemSelector = ".//div[@class='title'][text()='{0}']/ancestor::div[contains(@class,'content-item')][not(contains(@style,'display: none;'))]";

        public string NextArrowIcon = ".//div[@class='actions']/div[@class='icon next-icon']";

        public string FileActionButton = ".//*[contains(@class,'{0}')]";

        public string InfoDescription = ".//div[@class='info']";

        public string InfoMessageContent = "./following::div[@class='info-message']";

        public string LoadingContent = "./following::i[@class='progress-bar-icon'][@style]";

        public string ContentManagerFiles = ".//div[@class='content-manager-content incomplete']";

        [FindsBy(How = How.XPath, Using = ".//div[@id='contentManager']")]
        public IWebElement ContentManager { get; set; }
        
        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'move-to-page-container')]//div[@class='content-row']/p")]
        public IWebElement FooterFileName { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'content-manager-content')]")]
        public IWebElement ManagerContent { get; set; }

        [FindsBy(How = How.XPath, Using = ".//i[@class='progress-bar-icon'][@style]")]
        public IWebElement ProgressBarIcon { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'content-item remote-service')]")]
        public IList<IWebElement> ContentItemRemoteServiceList { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'recent-files')]")]
        public IWebElement RecentFilesBanner { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='add-place-container']")]
        public IWebElement AddPlaceContainer { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'move-to-page-container')]")]
        public IWebElement ContentManagerFooterContainer { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'content-item')]/div[contains(@style,'folder-icon')]")]
        public IList<IWebElement> FolderIcon { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='content-item directory']//div[@class='title']")]
        public IList<IWebElement> FolderTitleList { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='content-item file']//div[@class='title']")]
        public IList<IWebElement> FileTitleList { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='content-item site']//div[@class='title']")]
        public IList<IWebElement> SiteTitleList { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='content-item file']//div[@class='info']")]
        public IList<IWebElement> FileInfoList { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='content-item file']/div[contains(@class,'icon')]")]
        public IList<IWebElement> FileIcon { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='search-result-loading']")]
        public IWebElement SearchResultLoading { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='no-search-result-icon']")]
        public IWebElement NoSearchResultIcon { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='no-search-result-title']")]
        public IWebElement NoSearchResultTitle { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='no-search-result-text']")]
        public IWebElement NoSearchResultText { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='search-result-count']")]
        public IWebElement SearchResultCount { get; set; }
        
        public By ContentItemSelectorWithTitleAndInfo(string title, string info)
        {
            string selector = $".//div[contains(@class,'content-item')]//div[@class='title'][text()='{title}']/ancestor::div[contains(@class,'content-item')]//div[@class='info'][(text()='{info}')]/ancestor::div[contains(@class,'content-item')]";
            return By.XPath(selector);
        }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            {
                SelectorFor(this, p=> p.ManagerContent)
            };
        }

        public bool IsContentItemDisplayed(string item, WaitTime waitTime = WaitTime.Short)
        {
            try
            {
                return Driver.IsElementDisplayed(GetContentItem(item), waitTime);
            }
            catch
            {
                return false;
            }
        }

        public bool IsContentItemWithDescriptionDisplayed(string item, string description)
        {
            if (!IsContentItemDisplayed(item))
            {
                return false;
            }
            else if (!GetContentItems(item).Any(x => GetInfoDescription(x).Contains(description)))
            {
                return false;
            }
            else
            {
                return true;
            }

        }

        public int ContentItemCount(string item, string description)
        {
            return GetContentItems(item).Count(x => GetInfoDescription(x).Contains(description));
        }

        public IWebElement GetContentItem(string item)
        {
            var selector = By.XPath(string.Format(ContenItemSelector, item));
            return ManagerContent.FindElement(selector);
        }

        public IWebElement GetFileActionButtonByName(IWebElement contentItem, string buttonName)
        {
            var selector = By.XPath(string.Format(FileActionButton, buttonName));
            return contentItem.FindElement(selector);
        }

        public bool DisplayedContentItemState(string item)
        {
            var selector = By.XPath(".//div[@class='actions']/div[@class='icon checkmark-icon']");
            var state = GetContentItem(item).FindElement(selector).GetCssValue("display").Equals("inline-block");
            return state;
        }

        public IList<IWebElement> GetContentItems(string item, WebDriverExtensions.WaitTime wait = WebDriverExtensions.WaitTime.ExtraLong)
        {
            var selector = By.XPath(string.Format(ContenItemSelector, item)); 
            if (!Driver.IsElementDisplayed(selector, wait))
            {
                throw new Exception($"Content item '{item}' is not displayed on page");
            }
            return Driver.FindElements(selector);
        }

        public string GetInfoDescription(IWebElement contentItem)
        {
            var selector = By.XPath(InfoDescription);
            if (!Driver.IsElementInElementDisplayed(contentItem, selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception("Description is not displayed on page");
            }

            return contentItem.FindElement(selector).Text;
        }

        public string GetTitleFile(IWebElement contentItem)
        {
            var selector = By.XPath(".//div[@class='title']");
            if (!Driver.IsElementInElementDisplayed(contentItem, selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception("File is not displayed on page");
            }

            return contentItem.FindElement(selector).Text;
        }

        public IWebElement GetFooterButtonByName(string button)
        {
            var selector = By.XPath($".//button[contains(text(),'{button}')]");
            if (!Driver.IsElementInElementDisplayed(ContentManagerFooterContainer, selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"'{button}' button is not displayed on Canvas Footer");
            }

            return ContentManagerFooterContainer.FindElement(selector);
        }

        public IWebElement ContentPageBackButton(string button)
        {
            var selector = By.XPath($".//div[contains(@class,'add-place')]//div[@class='title' and text()='{button}']");
            if (!Driver.IsElementInElementDisplayed(ManagerContent, selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"'{button}' button is not displayed on ContentPage");

            }
            return ManagerContent.FindElement(selector);
        }

        public IWebElement GetFooterIconByName(string icon)
        {
            var selector = By.XPath($".//div[@class='content-row']//div[@class='{icon}-icon']");
            if (!Driver.IsElementInElementDisplayed(ContentManagerFooterContainer, selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"'{icon}' icon is not displayed on Canvas Footer");
            }

            return ContentManagerFooterContainer.FindElement(selector);
        }

        public IWebElement GetTabByName(string tabName)
        {
            var selector = By.XPath(string.Format(FileManagerHeaderBasePage.TabSelector, tabName));
            if (!Driver.IsElementInElementDisplayed(ContentManager, selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Tab with '{tabName}' name is not displayed on file manager header page");
            }

            return ContentManager.FindElement(selector);
        }
        
        public bool IsSavedRemoteServiceLoginInProcess()
        {
            try
            {
                return ContentItemRemoteServiceList.Any(x => x.GetAttribute("class").Contains("signing"));
            }
            catch 
            {
                return false;
            }
        }
    }
}