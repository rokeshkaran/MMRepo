using AutomationUtils.Utils;
using MjAutomationCore.Components.FloatingToolbarMenu;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.QA;
using MjAutomationCore.Utils;
using SeleniumAutomationUtils.SeleniumExtensions;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.FloatingToolbar
{
    [Binding]
    public class FloatingToolbarSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsers;

        public FloatingToolbarSteps(BrowsersList browsersList)
        {
            _browsers = browsersList;
        }

        [When(@"User clicks on '([^']*)' option in Floating Toolbar Popup")]
        public void WhenUserClicksOnOptionInFloatingToolbarPopup(string buttonName)
        {
            _browsers.Active.Component<FloatingToolbarMenu>().GetButtonByName(buttonName).Click();
        }

        [Then(@"Floating Toolbar is displayed on Canvas")]
        public void ThenFloatingToolbarIsDisplayedOnCanvas()
        {
            Verify.IsTrue(_browsers.Active.ComponentDisplayedState<FloatingToolbarMenu>(), "Floating Toolbar is not displayed on Canvas");
        }

        [Then(@"Floating Toolbar is not displayed on Canvas")]
        public void ThenFloatingToolbarIsNotDisplayedOnCanvas()
        {
            Verify.IsFalse(_browsers.Active.ComponentDisplayedState<FloatingToolbarMenu>(), "Floating Toolbar is displayed on Canvas");
        }

        [Then(@"Floating Toolbar is displayed above '([^']*)' topic on Canvas")]
        public void ThenFloatingToolbarIsDisplayedAboveTopicOnCanvas(string topicName)
        {
            var page = _browsers.Active.NowAt<WebEditorPage>();
            var topicYAxis= page.GetTopicByName(topicName).Location.Y;
            var toolbarYAxis = _browsers.Active.GetComponent<FloatingToolbarMenu>().Location.Y;
            Verify.IsTrue(topicYAxis > toolbarYAxis, $"Floating Toolbar is not displayed above '{topicName}' topic on Canvas");
        }
    }
}
