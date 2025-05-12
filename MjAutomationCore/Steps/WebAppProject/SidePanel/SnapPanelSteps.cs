using SeleniumAutomationUtils.SeleniumExtensions;
using AutomationUtils.Utils;
using MjAutomationCore.DTO.SnapDTO;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.QA;
using MjAutomationCore.Pages.WebAppProject.SidePanel;
using MjAutomationCore.Utils;
using OpenQA.Selenium;
using System.Linq;
using Reqnroll;
using Reqnroll.Assist;
using MjAutomationCore.DTO.WebAppDTO;
using System.Threading;
using MjAutomationCore.Pages.WebAppProject;

namespace MjAutomationCore.Steps.WebAppProject.SidePanelSteps
{
    [Binding]
    class SnapPanelSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsers;
        private readonly SessionRandomValue _sessionRandom;

        public SnapPanelSteps(BrowsersList browsersList, SessionRandomValue sessionRandom)
        {
            _browsers = browsersList;
            _sessionRandom = sessionRandom;
        }

        [Then(@"Snap panel is displayed to the User")]
        public void ThenSnapPanelIsDisplayedToTheUser()
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            Verify.IsTrue(panel.Header.GetCssValue("background-image").Equals("url(\"https://app-qa.mindmanager.com/images/content-manager/mm-21-snap-logo.svg\")"), "Snap panel is not displayed");
        }

        [When(@"User clicks '(.*)' button on Snap panel")]
        public void WhenUserClicksButtonOnSnapPanel(string button)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            panel.GetButtonByNameOnSpanPanel(button).Click();
        }

        [When(@"User click back button on '([^']*)' Title on Snap Panel")]
        public void WhenUserClickBackButtonOnTitleOnSnapPanel(string title)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            panel.GetBackButtonByTitleName(title).Click();
        }

        [Then(@"'([^']*)' button is displayed on Snap panel")]
        public void ThenButtonIsDisplayedOnSnapPanel(string button)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(panel.GetButtonByNameOnSpanPanel(button)), $"'{button}' button is not displayed on Snap panel");
        }

        [Then(@"'([^']*)' button is not displayed on Snap panel")]
        public void ThenButtonIsNotDisplayedOnSnapPanel(string button)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            Verify.IsFalse(panel.IsButtonDisplayedOnSnapPanel(button), $"'{button}' button is displayed on Snap panel");
        }

        [Then(@"filter tab is displayed on Snap panel")]
        public void ThenFilterTabIsDisplayedOnSnapPanel()
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(panel.FilterContainer, WebDriverExtensions.WaitTime.Short), "Filter tab is not displayed on Snap panel");
        }

        [When(@"User clear all filter on Snap panel")]
        public void WhenUserClearAllFilterOnSnapPanel()
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            panel.FilterClearAllButton.Click();
        }

        [Then(@"Queue loading icon is displayed on Snap Panel")]
        public void ThenQueueLoadingIconIsDisplayedOnSnapPanel()
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(panel.QueueLoadingIcon, WebDriverExtensions.WaitTime.Second), "Queue loading icon is not displayed on Snap Panel");
        }

        [When(@"User clicks capture item with '(.*)' title on Snap panel")]
        public void WhenUserClicksCaptureItemWithTitleOnSnapPanel(string itemTitle)
        {
            itemTitle = itemTitle.AddRandom(_sessionRandom);
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            _browsers.Active.ClickByActions(panel.GetCaptureItemByTitle(itemTitle));
        }

        [Then(@"'([^']*)' overlay is displayed on '([^']*)' capture item on Snap panel")]
        public void ThenOverlayIsDisplayedOnCaptureItemOnSnapPanel(string overlay, string itemTitle)
        {
            itemTitle = itemTitle.AddRandom(_sessionRandom);
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(panel.GetCaptureItemOverlayByTitle(overlay, itemTitle)), $"Overlay '{overlay}' is not displayed in Capture item with '{itemTitle}' title on Snap panel");
        }

        [Then(@"capture item with '([^']*)' title is selected")]
        public void ThenCaptureItemWithTitleIsSelected(string itemTitle)
        {
            Thread.Sleep(500); //Wait for Captured Item to be selected
            itemTitle = itemTitle.AddRandom(_sessionRandom);
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            Verify.IsTrue(panel.GetCaptureItemByTitle(itemTitle).GetAttribute("class").Contains("selected"), $"'{itemTitle}' item capture is not selected on Snap panel");
        }

        [Then(@"capture item with '([^']*)' title is highlighted border color '([^']*)' on Snap panel")]
        public void ThenCaptureItemWithTitleIsHighlightedBorderColorOnSnapPanel(string itemTitle, string color)
        {
            itemTitle = itemTitle.AddRandom(_sessionRandom);
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            Verify.IsTrue(panel.GetCaptureItemByTitle(itemTitle).FindElement(By.XPath(panel.CaptureQueueItemBorder)).GetCssValue("border").Contains(color), $"'{itemTitle}' item capture has no border color '{color}' on Snap panel");
        }

        [When(@"User Right clicks capture item with '(.*)' title of Snap panel")]
        public void WhenUserRightClicksCaptureItemWithTitleOfSnapPanel(string captureItem)
        {
            captureItem = captureItem.AddRandom(_sessionRandom);
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            _browsers.Active.ContextClick(panel.GetCaptureItemByTitle(captureItem));
        }

        [Then(@"'([^']*)' text is highlighted in the following capture items in Snap panel:")]
        public void ThenFollowingItemsAreHighlightedInSnapPanel(string searchVal, Table table)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            var expectedCaptureItem = table.Rows.SelectMany(row => row.Values.Select(value => value.AddRandom(_sessionRandom))).ToList();
            Thread.Sleep(500); //Wait for Captured Item
            foreach (var item in expectedCaptureItem)
            {
                Verify.AreEqual(searchVal, panel.GetHighlightedTextByCaptureItemTitle(item), $"'{searchVal}' value is not highlighted in the capture item on Snap panel");
            }
        }

        [Then(@"following capture items are displayed in Snap panel:")]
        public void ThenFollowingCaptureItemsAreDisplayedInSnapPanel(Table table)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            var expectedCaptureItem = table.Rows.SelectMany(row => row.Values.Select(value => value.AddRandom(_sessionRandom))).ToList();
            foreach (var itemTitle in expectedCaptureItem)
            {
                Verify.IsTrue(_browsers.Active.IsElementDisplayed(panel.GetCaptureItemByTitle(itemTitle), WebDriverExtensions.WaitTime.Short), $"'{itemTitle}' item capture is not displayed on Snap panel");
            }
        }

        [Then(@"following capture items are not displayed in Snap panel:")]
        public void ThenFollowingCaptureItemsAreNotDisplayedInSnapPanel(Table table)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            var expectedCaptureItem = table.Rows.SelectMany(row => row.Values.Select(value => value.AddRandom(_sessionRandom))).ToList();
            foreach (var itemTitle in expectedCaptureItem)
            {
                Verify.IsFalse(panel.IsCaptureItemDisplayed(itemTitle), $"'{itemTitle}' item capture is not displayed on Snap panel");
            }
        }

        [Then(@"following capture items are deleted in Snap panel:")]
        public void ThenFollowingCaptureItemsAreDeletedInSnapPanel(Table table)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            var expectedCaptureItem = table.Rows.SelectMany(row => row.Values.Select(value => value.AddRandom(_sessionRandom))).ToList();
            Thread.Sleep(500); //Wait for Captured Item to be hidden
            foreach (var itemTitle in expectedCaptureItem)
            {
                Verify.IsTrue(panel.IsItemDeletedByTitle(itemTitle), $"'{itemTitle}' item capture is not deleted on Snap panel");
            }
        }

        [Then(@"capture item with '(.*)' title has following info on Snap panel:")]
        public void ThenCaptureItemWithTitleHasFollowingInfoOnSnapPanel(string itemTitle, Table table)
        {
            var panel = _browsers.Active.NowAt<SnapPanelPage>();
            var detail = table.CreateInstance<CaptureItemDetailDto>();
            Verify.AreEqual(detail.ItemSource, panel.GetItemSourceValue(itemTitle), $"Source is displayed incorrectly in capture item with '{itemTitle}' title");
            Verify.AreEqual($"on {detail.ItemCreatedAt.Date("M/d/yyyy")}", panel.GetItemСreationDate(itemTitle), $"Сreation date is displayed incorrectly in capture item with '{itemTitle}' title");
        }

        [When(@"User drags and drops '(.*)' capture item from Snap panel in '(.*)' topic")]
        public void WhenUserDragsAndDropsCaptureItemFromSnapPanelInTopic(string title, string topic)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            var topics = _browsers.Active.NowAt<WebEditorPage>();
            title = title.AddRandom(_sessionRandom);
            _browsers.Active.ActionsDragElementToOffsetAndDropOntoAnotherElement(panel.GetCaptureItemByTitle(title), topics.GetTopicByName(topic));
        }

        [When(@"User drags and drops '([^']*)' topic in '([^']*)' queue in Snap panel")]
        public void WhenUserDragsAndDropsTopicInQueueInSnapPanel(string topic, string shareTo)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            var topics = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.ActionsDragElementAndDropOntoElement(topics.GetTopicByName(topic), panel.CaptureQueueContent);
            Thread.Sleep(1000);
            _browsers.Active.MoveToElement(topics.GetTopicByName(topic));
            _browsers.Active.ActionsClickAndHoldAndMoveToOffset(panel.GetShareToQueueTitle(shareTo), 1, 1);
            _browsers.Active.MoveByOffset(5, 1, 1);
            _browsers.Active.ActionsRelease();
        }

        [Then(@"Upload success dialogue window is displayed in Snap panel")]
        public void ThenUploadSuccessDialogueWindowIsDisplayedInSnapPanel()
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(panel.UploadSuccessContent, WebDriverExtensions.WaitTime.Medium), "Upload success dialogue window is not displayed on Snap panel");
        }

        [When(@"User clicks '([^']*)' on upload success dialogue window is displayed in Snap panel")]
        public void WhenUserClicksOnUploadSuccessDialogueWindowIsDisplayedInSnapPanel(string button)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            panel.GetUploadSuccessContentButton(button).Click();
        }

        [Then(@"'([^']*)' title with image is displayed in Quick View")]
        public void ThenTitleWithImageIsDisplayedInQuickView(string title)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(panel.GetQuickViewByTitle(title), WebDriverExtensions.WaitTime.Medium), "Upload success dialogue window is not displayed on Snap panel");
        }

        [When(@"User drags capture item in '(.*)' topic")]
        public void WhenUserDragsCaptureItemInTopic(string topic)
        {
            var t = By.XPath(".//li[@class='mm-capture-queue-item']");
            var topics = _browsers.Active.NowAt<WebEditorPage>();
            _browsers.Active.DragAndDrop(_browsers.Active.FindElement(t), topics.GetTopicByName(topic));
            _browsers.Active.DragAndDropByJavaScript(_browsers.Active.FindElement(t), topics.GetTopicByName(topic));
            Thread.Sleep(500); //Wait for Captured Item to be displayed
        }

        [Then(@"'(.*)' message title is displayed on Snap panel")]
        public void ThenMessageTitleIsDisplayedOnSnapPanel(string message)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            Verify.IsTrue(panel.DisplayedCaptureQueueMessageTitle(message), $"'{message}' message text is not displayed on Snap panel");
        }

        [Then(@"'(.*)' content text is displayed on Snap panel")]
        public void ThenContentTextIsDisplayedOnSnapPanel(string contentText)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            Verify.AreEqual(contentText, panel.ContentText.Text, $"'{contentText}' content text is not displayed on Snap panel");
        }

        [When(@"User clicks on restore icon of '(.*)' title on Snap panel")]
        public void WhenUserClicksRestoreOnSnapPanel(string itemTitle)
        {
            itemTitle = itemTitle.AddRandom(_sessionRandom);
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            panel.GetRestoreIconByTitle(itemTitle).Click();
        }

        [Then(@"'([^']*)' text is not highlighted in search results of capture items:")]
        public void ThenTextIsNotHighlightedInSearchResultsOfCaptureItem(string value, Table table)
        {
            var page = _browsers.Active.NowAt<SnapPanelPage>();
            var expectedCaptureItem = table.Rows.SelectMany(row => row.Values.Select(value => value.AddRandom(_sessionRandom))).ToList();
            foreach (var itemTitle in expectedCaptureItem)
            {
                Verify.IsFalse(page.IsTextHighlightedInCaptureItems(value), $"'{value}' is highlighted in search results of capture item");
            }
        }

        #region NotificationItem

        [When(@"User clicks notification item with '(.*)' title on Snap panel")]
        public void WhenUserClicksNotificationItemWithTitleOnSnapPanel(string notificationTitle)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            panel.GetNotificationItemByTitle(notificationTitle).Click();
        }

        [Then(@"notification item with '(.*)' title is displayed on Snap panel")]
        public void ThenNotificationItemWithTitleIsDisplayedOnSnapPanel(string notificationTitle)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            Verify.IsTrue(panel.DisplayedNotificationTtemByTitle(notificationTitle), $"Notification item with '{notificationTitle}' title is not displayed on Snap panel");
        }

        [Then(@"notification item with '(.*)' title is not displayed on Snap panel")]
        public void ThenNotificationItemWithTitleIsNotDisplayedOnSnapPanel(string notificationTitle)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            Verify.IsFalse(panel.DisplayedNotificationTtemByTitle(notificationTitle), $"Notification item with '{notificationTitle}' title is displayed on Snap panel");
        }

        [Then(@"'([^']*)' option item with toggle button '([^']*)' is displayed on Snap Panel")]
        public void ThenOptionItemWithToggleButtonIsDisplayedOnSnapPanel(string optionItem, string toggleButton)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(panel.GetOptionItemToggleButtonByNameOnSnapPanel(optionItem, toggleButton)), $"Option item '{optionItem}' with toggle button '{toggleButton}' is not displayed on Snap panel");
        }

        [When(@"User clicks on toggle button '([^']*)' of '([^']*)' option item on Snap panel")]
        public void WhenUserClicksOnToggleButtonOfOptionItemOnSnapPanel(string toggleButton, string optionItem)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            panel.GetOptionItemToggleButtonByNameOnSnapPanel(optionItem, toggleButton).Click();
        }

        #endregion

        #region FooterOnPanel

        [When(@"User clicks '(.*)' footer button on Snap panel")]
        public void WhenUserClicksFooterButtonOnSnapPanel(string button)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            panel.GetFooterButtonByName(button).Click();
        }

        [Then(@"'([^']*)' footer button is not displayed on Snap panel")]
        public void ThenFooterButtonIsNotDisplayedOnSnapPanel(string button)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            Verify.IsFalse(panel.IsFooterButtonByNameDisplayed(button), $"'{button}' footer button is displayed on Snap panel");
        }

        [Then(@"'([^']*)' footer button is displayed on Snap panel")]
        public void ThenFooterButtonIsDisplayedOnSnapPanel(string button)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(panel.GetFooterButtonByName(button)), $"'{button}' footer button is not displayed on Snap panel");
        }

        [Then(@"'([^']*)' footer message is displayed on Snap panel")]
        public void ThenFooterMessageIsDisplayedOnSnapPanel(string footerMessage)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(panel.GetFooterMessageByName(footerMessage)), $"'{footerMessage}' message is not displayed on Snap panel");
        }

        [Then(@"Add Member entry field is displayed on Snap Panel")]
        public void ThenAddMemberEntryFieldIsDisplayedOnSnapPanel()
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(panel.AddMemberEntryField), "Add member entry field is not displayed on Snap panel");
        }

        [When(@"User enter '([^']*)' email in add member entry field on Snap Panel")]
        public void WhenUserEnterEmailInAddMemberEntryFieldOnSnapPanel(string email)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            panel.AddMemberEntryField.ClearSendKeys(email.AddRandom(_sessionRandom));
        }

        [Then(@"User '([^']*)' with email '([^']*)' is in '([^']*)' status is displayed in '([^']*)' queue title on Snap panel")]
        public void ThenUserWithEmailIsInStatusIsDisplayedInQueueTitleOnSnapPanel(string user, string email, string status, string title)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            Thread.Sleep(1000); //wait for item to be appear
            user = user.AddRandom(_sessionRandom);
            email = email.AddRandom(_sessionRandom);
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(panel.GetUserEmailByNameInPanel(user, email, title), WebDriverExtensions.WaitTime.Short), $"User '{user}' with email '{email}' is not displayed in '{title}' queue title'");
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(panel.GetUserStatusByNameInPanel(user, status, title), WebDriverExtensions.WaitTime.Short), $"User '{user}' with status '{status}' is not displayed in '{title}' queue title'");
        }

        [Then(@"User '([^']*)' is not displayed in '([^']*)' queue title on Snap panel")]
        public void ThenUserIsNotDisplayedInQueueTitleOnSnapPanel(string user, string title)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            Thread.Sleep(1000); //wait for item to be removed
            user = user.AddRandom(_sessionRandom);
            Verify.IsFalse(panel.IsUserDisplayedByNameInPanel(user, title), $"User '{user}' is displayed in '{title}' queue title'");
        }

        [When(@"User clicks on close button on user '([^']*)' displayed in '([^']*)' queue title on Snap panel")]
        public void WhenUserClicksOnCloseButtonOnUserDisplayedInQueueTitleOnSnapPanel(string user, string title)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            user = user.AddRandom(_sessionRandom);
            panel.GetRemoveButtonByUserWithTitle(user, title).Click();
        }

        #endregion

        #region ContextMenu

        [When(@"User clicks '(.*)' item in context menu")]
        public void WhenUserClicksItemInContextMenu(string itemName)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            panel.GetItemByNameInContextMenu(itemName).Click();
        }

        [When(@"User clicks '([^']*)' item in '([^']*)' menu in '([^']*)' container on Snap Panel")]
        public void WhenUserClicksItemInMenuInContainerOnSnapPanel(string item, string menuType, string container)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            panel.GetItemInSnapMenuInContainer(item.AddRandom(_sessionRandom), menuType, container).Click();
        }

        [Then(@"'([^']*)' item in '([^']*)' menu in '([^']*)' container is displayed on Snap panel")]
        public void ThenItemInMenuInContainerIsDisplayedOnSnapPanel(string item, string menuType, string container)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(panel.GetItemInSnapMenuInContainer(item.AddRandom(_sessionRandom), menuType, container), WebDriverExtensions.WaitTime.Short), $"'{item}' item in '{menuType}' menu in '{container}' container is not displayed on Snap Panel");
        }

        [Then(@"'([^']*)' item in '([^']*)' menu in '([^']*)' container is not displayed on Snap panel")]
        public void ThenItemInMenuInContainerIsNotDisplayedOnSnapPanel(string item, string menuType, string container)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            Verify.IsFalse(panel.IsItemInSnapMenuInContainer(item.AddRandom(_sessionRandom), menuType, container), $"'{item}' item in '{menuType}' menu in '{container}' container is displayed on Snap Panel");
        }

        [Then(@"Participant menu is displayed on Snap panel")]
        public void ThenParticipantMenuIsDisplayedOnSnapPanel()
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(panel.ParticipantMenu, WebDriverExtensions.WaitTime.Short), "Participant menu is not displayed");
        }

        [Then(@"Snap context menu is displayed")]
        public void ThenSnapContextMenuIsDisplayed()
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(panel.CaptureQueueContextMenu), "Snap context menu is not displayed");
        }

        [Then(@"Snap context menu is not displayed")]
        public void ThenSnapContextMenuIsNotDisplayed()
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            Verify.IsFalse(_browsers.Active.IsElementDisplayed(panel.CaptureQueueContextMenu), "Snap context menu is displayed");
        }

        [Then(@"following items are displayed in Snap Context Menu:")]
        public void ThenFollowingItemsAreDisplayedInSnapContextMenu(Table table)
        {
            var panel = _browsers.Active.NowAtWithContext<SnapPanelPage>();
            var captureItemList = panel.GetItemListInContextMenu().Select(x => x.Text).ToList();
            var expectedCaptureItem = table.Rows.SelectMany(row => row.Values).ToList();
            Verify.AreEqual(captureItemList, expectedCaptureItem, "Capture items are not correctly displayed on Snap Context Menu");
        }

        #endregion
    }
}