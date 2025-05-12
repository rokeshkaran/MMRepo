using SeleniumAutomationUtils.SeleniumExtensions;
using AutomationUtils.Utils;
using MjAutomationCore.Components.Base;
using Reqnroll;
using MjAutomationCore.Utils;
using MjAutomationCore.Components.Topic;
using SeleniumAutomationUtils.Components;

namespace MjAutomationCore.Steps.Base.Components.Base
{
    [Binding]
    class TooltipSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsers;

        public TooltipSteps(BrowsersList browsers)
        {
            _browsers = browsers;
        }

        [Then(@"'(.*)' tooltip is displayed to the User")]
        public void ThenTooltipIsDisplayedToTheUser(string tooltip)
        {
            var content = _browsers.Active.Component<Tooltip>().GetTooltipContent();
            Verify.AreEqual(tooltip, content, $"Tooltip '{tooltip}' is not displayed to User");
        }

        [Then(@"tooltip is not displayed to the User")]
        public void ThenTooltipIsNotDisplayedToTheUser()
        {
            Verify.IsFalse(_browsers.Active.ComponentDisplayedState<Tooltip>(), "Tooltip is displayed to User");
        }

        [Then(@"text '([^']*)' in tooltip is highlighted in '([^']*)' color")]
        public void ThenTextInTooltipIsHighlightedInColor(string text, string color)
        {
            var actualColor = _browsers.Active.Component<Tooltip>().GetText(text).GetCssValue("color");
            Verify.AreEqual(color, actualColor, $"Text '{text}' in tooltip is not highlighted in '{color}' color");
        }

        [Then(@"text '([^']*)' is displayed in tooltip")]
        public void ThenTextIsDisplayedInTooltip(string text)
        {
            var tooltipText = _browsers.Active.Component<Tooltip>().GetText(text);
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(tooltipText), $"Text '{text}' in tooltip is not displayed");
        }

        [Then(@"'([^']*)' topic is displayed in tooltip")]
        public void ThenTopicIsDisplayedInTooltip(string topicName)
        {
            var parent = _browsers.Active.GetComponent<Tooltip>();
            var topic = _browsers.Active.Component<Topic>(new Properties { Parent = parent }).GetTopicByName(topicName);
            Verify.IsTrue(_browsers.Active.IsElementDisplayed(topic), $"Topic '{topicName}' topic is displayed in tooltip");
        }
    }
}