using SeleniumAutomationUtils.SeleniumExtensions;
using AutomationUtils.Utils;
using MjAutomationCore.Pages.WebAppProject.SidePanel;
using MjAutomationCore.Utils;
using System.Threading;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.SidePanelSteps
{
    [Binding]
    public class NotificationContentSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsers;

        public NotificationContentSteps(BrowsersList browsersList)
        {
            _browsers = browsersList;
        }

        [Then(@"notification content panel is displayed to User")]
        public void ThenNotificationContentPanelIsDisplayedToUser()
        {
            var panel = _browsers.Active.NowAtWithContext<NotificationContentPage>();
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(panel.ContextElement), "Notification content panel is not displayed");
        }

        [Then(@"notification content panel is not displayed to User")]
        public void ThenNotificationContentPanelIsNotDisplayedToUser()
        {
            var panel = _browsers.Active.NowAt<NotificationContentPage>();
            for (int i = 0; i < 4; i++)
            {
                try
                {
                    if (!_browsers.Active.IsElementDisplayed(panel.Context))
                    {
                        break;
                    }
                }
                catch { }

                Thread.Sleep(500);
            }

            Verify.IsFalse(_browsers.Active.IsElementDisplayed(panel.Context), "Notification content panel is displayed");
        }

        [Then(@"'(.*)' title is displayed on notification content panel")]
        public void ThenTitleIsDisplayedOnNotificationContentPanel(string title)
        {
            var panel = _browsers.Active.NowAtWithContext<NotificationContentPage>();
            Verify.AreEqual(panel.ContentTitle.Text, title, $"'{title}' title is not displayed on Notification content panel");
        }

        [Then(@"'(.*)' subtitle is displayed on notification content panel")]
        public void ThenSubtitleIsDisplayedOnNotificationContentPanel(string subTitle)
        {
            var panel = _browsers.Active.NowAtWithContext<NotificationContentPage>();
            Verify.AreEqual(panel.ContentSubtitle.Text, subTitle, $"'{subTitle}' subtitle is not displayed on Notification content panel");
        }

        [Then(@"'(.*)' text message is displayed on notification content panel")]
        public void ThenTextMessageIsDisplayedOnNotificationContentPanel(string textMessage)
        {
            var panel = _browsers.Active.NowAtWithContext<NotificationContentPage>();
            Verify.AreEqual(panel.TextMessage.Text, textMessage, $"'{textMessage}' text message is not displayed on Notification content panel");
        }

        [When(@"User clicks '(.*)' footer button on notification content panel")]
        public void WhenUserClicksFooterButtonOnNotificationContentPanel(string button)
        {
            var panel = _browsers.Active.NowAtWithContext<NotificationContentPage>();
            panel.GetFooterButtonByName(button).Click();
        }

        [When(@"User clicks Close button in top right corner on Notification panel")]
        public void WhenUserClicksCloseButtonInTopRightCornerOnNotificationPanel()
        {
            var panel = _browsers.Active.NowAtWithContext<NotificationContentPage>();
            panel.CloseButton.Click();
        }

        [When(@"User clicks Back button on Notification panel")]
        public void WhenUserClicksBackButtonOnNotificationPanel()
        {
            var panel = _browsers.Active.NowAtWithContext<NotificationContentPage>();
            panel.BackButton.Click();
        }
    }
}