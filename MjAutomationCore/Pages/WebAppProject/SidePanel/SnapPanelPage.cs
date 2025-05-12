using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using SeleniumAutomationUtils.Pages;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using xRetry.Extensions;

namespace MjAutomationCore.Pages.WebAppProject.SidePanel
{
    class SnapPanelPage : BaseSidePanelPage, IContextContainer
    {
        public new By Context => By.XPath(".//div[@id='inspector']");

        [FindsBy(How = How.XPath, Using = ".//div[@class='mm-capture-queue-empty-message']/span")]
        public IWebElement ContentText { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='mm-capture-queue-content']")]
        public IWebElement CaptureQueueContent { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='upload-success content-dialog']")]
        public IWebElement UploadSuccessContent { get; set; }

        [FindsBy(How = How.XPath, Using = ".//ul/li[contains(@class,'mm-capture-queue-item')]")]
        public IList<IWebElement> CaptureQueueItemList { get; set; }

        [FindsBy(How = How.XPath, Using = ".//ul/li[contains(@class,'notification-item')]")]
        public IList<IWebElement> CaptureQueueNotificationItemList { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='mm-capture-queue-popup']")]
        public IWebElement CaptureQueueContextMenu { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='recipients']")]
        public IWebElement RecipientsSection { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='senders']")]
        public IWebElement SendersSection { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='mm-capture-queue-loader']")]
        public IWebElement QueueLoadingIcon { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='filter-by-type-container']")]
        public IWebElement FilterContainer { get; set; }

        [FindsBy(How = How.XPath, Using = ".//p[@class='filter-by-type-clear-all' and text()='Clear All']")]
        public IWebElement FilterClearAllButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='header snap-header']")]
        public IWebElement SnapHeader { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='mm-capture-queue-user-info']")]
        public IWebElement ParticipantMenu { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='mm-capture-queue-page-content']//textarea")]
        public IWebElement AddMemberEntryField { get; set; }

        public string CaptureQueueItemLabel = ".//div[contains(@class,'item-body')]/label";

        public string CaptureQueueItemBorder = ".//div[@class='mm-capture-queue-item-flip-card-inner']";

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By> { };
        }

        #region CaptureQueueItem

        #endregion


        #region ContextMenu

        public IWebElement GetItemByNameInContextMenu(string itemName)
        {
            var item = GetItemListInContextMenu().FirstOrDefault(el => el.Text == itemName);

            if (string.IsNullOrEmpty(item.Text))
            {
                throw new NoSuchElementException($"Item with name '{itemName}' not found in the context menu");
            }
            return item;
        }

        public IList<IWebElement> GetItemListInContextMenu()
        {
            var selector = By.XPath(".//div[@class='mm-capture-queue-popup-items']/div[contains(@class,'mm-capture-queue-popup-item')]");

            if (!Driver.IsElementInElementDisplayed(CaptureQueueContextMenu, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Items is not displayed in Context menu");
            }
            return CaptureQueueContextMenu.FindElements(selector);
        }

        #endregion

        public bool DisplayedNotificationTtemByTitle(string title)
        {
            if (CaptureQueueNotificationItemList.Any())
            {
                return Driver.IsElementDisplayed(GetNotificationItemByTitle(title));
            }

            return false;
        }

        public IList<IWebElement> GetNotificationItemTitleList()
        {
            Driver.WaitForElementsToBeDisplayed(CaptureQueueNotificationItemList, WebDriverExtensions.WaitTime.Medium, false);
            return CaptureQueueNotificationItemList.Select(x => x.FindElement(By.XPath(".//div[@class='title']"))).ToList();
        }

        public IWebElement GetNotificationItemByTitle(string title)
        {
            return GetNotificationItemTitleList().First(x => x.Text.Equals(title));
        }

        public IList<IWebElement> GetAllCaptureItems()
        {
            var selector = By.XPath(".//li[contains(@class,'mm-capture-queue-item') and not(contains(@class,'hidden'))]");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception("No capture items are displayed on the Snap panel.");
            }
            return Driver.FindElements(selector);
        }

        public IWebElement GetCaptureItemByTitle(string itemTitle)
        {
            var selector = By.XPath($".//div[contains(@class,'item-body')]/label[contains(@class,'item-title') and text()='{itemTitle}'] | .//div[contains(@class,'item-body')]/label[contains(@class,'item-title')]//mark[text()='{itemTitle}']");
            var captureItems = GetAllCaptureItems();
            if (captureItems.Where(x => x.IsElementExists(selector)).Any(x => x.FindElement(selector).Text.Equals(itemTitle)))
            {
                return captureItems.Where(x => x.IsElementExists(selector)).FirstOrDefault();
            }
            throw new Exception($"Capture item with '{itemTitle}' title is not displayed on Snap panel");
        }

        public IWebElement GetShareToQueueTitle(string shareToQueue)
        {
            var selector = By.XPath($".//div[@class='mm-capture-queue-share-target-item' and text()='{shareToQueue}']");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"{shareToQueue} queue is not displayed on the Snap panel.");
            }
            return Driver.FindElement(selector);
        }

        public IWebElement GetUploadSuccessContentButton(string button)
        {
            var selector = By.XPath($".//div[@class='upload-success content-dialog']//div[text()='{button}']");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"{button} button is not displayed on Upload Success Content Window.");
            }
            return Driver.FindElement(selector);
        }

        public IWebElement GetQuickViewByTitle(string title)
        {
            var selector = By.XPath($".//div[@class='mm-capture-queue-page-content item-preview-container']/p[@class='item-preview-text' and text()='{title}']/following-sibling::*[@class='item-preview-image']");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"{title} tile is not displayed on Quick View.");
            }
            return Driver.FindElement(selector);
        }

        public IWebElement GetCaptureItemOverlayByTitle(string overlay, string itemTitle)
        {
            var selector = By.XPath($".//div[contains(@class,'mm-capture-queue-item-flip-card-inner')]//div[@class='mm-capture-queue-item-flip-card-back-body' and text()='{overlay}']");
            if (!Driver.IsElementInElementDisplayed(GetCaptureItemByTitle(itemTitle), selector, WebDriverExtensions.WaitTime.Second))
            {
                throw new Exception($"Overlay '{overlay}' is not displayed in Capture item with '{itemTitle}' title on Snap panel");
            }
            return Driver.FindElement(selector);
        }

        public IWebElement GetItemInSnapMenuInContainer(string item, string menuType, string container)
        {
            var selector = By.XPath($".//div[@class='{container}']//div[contains(@class,'{menuType}') and text()='{item}']");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Item with '{item}' title is not displayed in {menuType} menu in '{container}' container on Snap panel");
            }
            return Driver.FindElement(selector);
        }

        public bool IsItemInSnapMenuInContainer(string item, string menuType, string container)
        {
            var selector = By.XPath($".//div[@class='{container}']//div[contains(@class,'{menuType}') and text()='{item}']");
            return Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Short);
        }

        public IWebElement GetPanelByTitleName(string title)
        {
            var selector = By.XPath($".//div[@class='mm-capture-queue-page-title' and text()='{title}']/ancestor::div[@class='mm-capture-queue-full-size-page']");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Title '{title}' is not displayed on Snap Panel");
            }
            return Driver.FindElement(selector);
        }

        public IList<IWebElement> GetListOfUsersInPanel(string title)
        {
            var selector = By.XPath(".//div[contains(@class,'user-row')]");
            if (Driver.IsElementInElementDisplayed(GetPanelByTitleName(title), selector, WebDriverExtensions.WaitTime.Short))
            {
                return GetPanelByTitleName(title).FindElements(selector);
            }
            throw new Exception($"Users are not displayed in '{title}' Panel");
        }

        public IWebElement GetUserRowByNameInPanel(string user, string title)
        {
            var userRows = GetListOfUsersInPanel(title);
            var selector = By.XPath(".//div[contains(@class, 'display-name')]");
            if (userRows.Any(x => x.FindElement(selector).Text.Equals(user)))
            {
                return userRows.First(x => x.FindElement(selector).Text.Equals(user));
            }
            throw new Exception($"User '{user}' is not found in the panel titled '{title}'.");
        }

        public bool IsUserDisplayedByNameInPanel(string user, string title)
        {
            var selector = By.XPath(".//div[contains(@class, 'display-name')]");
            if (GetListOfUsersInPanel(title).Any(x => x.FindElement(selector).Text.Equals(user)))
            {
                return true;
            }
            return false;
        }

        public IWebElement GetUserEmailByNameInPanel(string user, string email, string title)
        {
            var selector = By.XPath($".//following-sibling::div[@class='email' and text()='{email}']");
            if (!Driver.IsElementInElementDisplayed(GetUserRowByNameInPanel(user, title), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"User'{user}' with '{email}' email is not found in the panel titled '{title}'.");
            }
            return GetUserRowByNameInPanel(user, title).FindElement(selector);
        }

        public IWebElement GetUserStatusByNameInPanel(string user, string status, string title)
        {
            var selector = By.XPath($".//following-sibling::div[@class='status' and text()='{status}']");
            if (!Driver.IsElementInElementDisplayed(GetUserRowByNameInPanel(user, title), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"User'{user}' with '{status}' status is not found in the panel titled '{title}'.");
            }
            return GetUserRowByNameInPanel(user, title).FindElement(selector);
        }

        public IWebElement GetRemoveButtonByUserWithTitle(string user, string title)
        {
            var selector = By.XPath(".//parent::div/following-sibling::button[@class='remove-user']");
            if (!Driver.IsElementInElementDisplayed(GetUserRowByNameInPanel(user, title), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"User'{user}' remove button is not displayed in the panel titled '{title}'.");
            }
            return GetUserRowByNameInPanel(user, title).FindElement(selector);
        }

        public string GetItemSourceValue(string itemTitle)
        {
            var selector = By.XPath(".//div[contains(@class,'item-detail')]//label[contains(@class,'item-source')]");
            Driver.WaitForElementInElementToBeDisplayed(GetCaptureItemByTitle(itemTitle), selector, WebDriverExtensions.WaitTime.Short);
            return GetCaptureItemByTitle(itemTitle).FindElement(selector).Text;
        }

        public string GetItemСreationDate(string itemTitle)
        {
            var selector = By.XPath(".//div[contains(@class,'item-detail')]//label[contains(@class,'item-created-at')]");
            Driver.WaitForElementInElementToBeDisplayed(GetCaptureItemByTitle(itemTitle), selector, WebDriverExtensions.WaitTime.Short);
            return GetCaptureItemByTitle(itemTitle).FindElement(selector).Text;
        }

        public string GetItemIcon(string itemTitle)
        {
            var selector = By.XPath(".//img[@class='mm-capture-queue-item-icon'][1]");
            Driver.WaitForElementInElementToBeDisplayed(GetCaptureItemByTitle(itemTitle), selector, WebDriverExtensions.WaitTime.Short);
            return GetCaptureItemByTitle(itemTitle).FindElement(selector).GetCssValue("src");
        }

        public bool IsItemDeletedByTitle(string itemTitle)
        {
            var list = CaptureQueueItemList.Select(x => x.FindElement(By.XPath(CaptureQueueItemLabel))).ToList();
            var item = list.First(x => x.GetAttribute("innerHTML").Equals(itemTitle));
            var result = item.FindElement(By.XPath("./ancestor::li[contains(@class,'capture-queue-item')]")).GetAttribute("class").Contains("hidden");
            return result;
        }

        public string GetHighlightedTextByCaptureItemTitle(string itemTitle)
        {
            var list = CaptureQueueItemList.Select(x => x.FindElement(By.XPath(CaptureQueueItemLabel))).ToList();
            var item = list.First(x => x.GetText().Contains(itemTitle));
            var highlightedValue = item.FindElement(By.XPath(".//mark")).Text;
            return highlightedValue;
        }

        public string GetCaptureQueueSource(string title)
        {
            return GetCaptureItemByTitle(title).FindElement(By.XPath(".//div[contains(@class,'item-body')]/div/label[contains(@class,'item-source')]")).Text;
        }

        public string GetCaptureQueueDate(string title)
        {
            return GetCaptureItemByTitle(title).FindElement(By.XPath(".//div[contains(@class,'item-body')]/div/label[contains(@class,'item-created-at')]")).Text;
        }

        public string GetCaptureQueueItemIcon(string title)
        {
            return GetCaptureItemByTitle(title).FindElement(By.XPath(".//div[contains(@class,'card-front')]/img[contains(@class,'item-icon')]")).GetAttribute("src");
        }

        public bool DisplayedCaptureQueueMessageTitle(string message)
        {
            var selector = By.XPath($".//div[@class='mm-capture-queue-empty-message']/h2[text()=\"{message}\"]");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"'{message}' message title is not displayed on Snap panel");
            }

            return Driver.IsElementDisplayed(selector);
        }

        public IWebElement GetButtonByNameOnSpanPanel(string buttonName)
        {
            var selector = By.XPath($".//button[contains(@class,'mm-capture-queue') and @title='{buttonName}'] | .//button[contains(@class,'mm-capture-queue')]//span[text()='{buttonName}'] | .//div[contains(@class,'mm-capture-queue') and @title='{buttonName}']");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Button '{buttonName}' is not displayed on Snap panel");
            }

            return Driver.FindElement(selector);
        }

        public bool IsButtonDisplayedOnSnapPanel(string buttonName)
        {
            try
            {
                return GetButtonByNameOnSpanPanel(buttonName).Displayed();
            }
            catch
            {
                return false;
            }
        }

        public IWebElement GetBackButtonByTitleName(string title)
        {
            var selector = By.XPath($".//div[@class='mm-capture-queue-page-title' and text()='{title}']//preceding-sibling::button[@class='mm-capture-queue-page-close']");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Back Button is not displayed on '{title}' title on Snap panel");
            }

            return Driver.FindElement(selector);
        }

        public IWebElement GetFooterButtonByName(string buttonName)
        {
            var selector = By.XPath($".//div[@class='mm-capture-queue-footer']//span[text()='{buttonName}']");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Button '{buttonName}' is not displayed in footer on Snap panel");
            }

            return Driver.FindElement(selector);
        }

        public bool IsFooterButtonByNameDisplayed(string buttonName)
        {
            var selector = By.XPath($".//div[@class='mm-capture-queue-footer']//span[text()='{buttonName}']");
            return Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Short);
        }

        public IWebElement GetFooterMessageByName(string footerMessage)
        {
            var selector = By.XPath($".//ul[@class='mm-capture-queue-empty_message-footer']//li//span[text()='{footerMessage}']");
            return Driver.FindElement(selector);
        }

        public IWebElement GetSnapFooterButtonIcon(string footerButton)
        {
            var selector = By.XPath($".//ul[@class='mm-capture-queue-empty_message-footer']//li//img[@alt='{footerButton}']");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Button '{footerButton}' is not displayed in footer on Snap panel");
            }
            return Driver.FindElement(selector);
        }

        public IWebElement GetOptionItemToggleButtonByNameOnSnapPanel(string optionItem, string toggleButton)
        {
            var selector = By.XPath($".//div[@class='options-item']//span[contains(@class,'mm-send-to-trash') and text()='{optionItem}']/following-sibling::label//span[@class='slider']/span[text()='{toggleButton}']");
            return Driver.FindElement(selector);
        }

        public IWebElement GetRestoreIconByTitle(string itemTitle)
        {
            var selector = By.XPath(".//ancestor::li[@class='mm-capture-queue-item' and @title='click to restore']");
            if (!Driver.IsElementInElementDisplayed(GetCaptureItemByTitle(itemTitle), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Restore icon is not displayed on '{itemTitle}' title on Snap panel");
            }
            return Driver.FindElement(selector);
        }

        public bool IsTextHighlightedInCaptureItems(string value)
        {
            var selector = By.XPath($".//div[contains(@class,'item-body')]/*[contains(@class,'queue-item')]//mark[text()='{value}']");
            return Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Short);
        }

        public bool IsCaptureItemDisplayed(string item)
        {
            try
            {
                return GetCaptureItemByTitle(item).Displayed();
            }
            catch
            {
                return false;
            }
        }
    }
}