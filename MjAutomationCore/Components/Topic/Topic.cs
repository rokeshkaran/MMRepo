using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutomationUtils.Utils;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;

namespace MjAutomationCore.Components.Topic
{
     class Topic : BaseWebComponent, IWebComponent
    {
        public By Container => By.XPath(".//*[@data-type='mindjet.ModernTopic']");

        protected override By Construct()
        {
            return Container;
        }

        public IWebElement GetTopicByName(string topicName)
        {
            var text = string.Empty;
            if (topicName.Any(Char.IsWhiteSpace))
            {
                text = topicName.Split(' ').Aggregate(string.Empty, (current, s) => current + $"[contains(text(),'{s}')]");
            }
            else
            {
                text = topicName.Split(' ').Aggregate(string.Empty, (current, s) => current + $"[text()='{s}']");
            }

            var selector = By.XPath($".//*[contains(@class,'content-text interactive')][not(contains(@class,'joint-tip-tap-editor'))]//*{text}[1]");

            if (!Driver.IsElementExists(selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Topic '{topicName}' is not displayed");
            }

            var topic = Driver.FindElement(selector);
            //Remove character 160 which is Non-breaking space
            var topicText = topic.Text.Replace('\u00A0', ' ');

            Verify.AreEqual(topicName, topicText, $"Incorrect topic name. Expected:'{topicName}'. Actual: '{topicText}'");
            return topic;
        }

        public IWebElement GetImageIconInTopicInfobox(string topicName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Second)
        {
            var selector = By.XPath(".//*[@class='image']//*[contains(@class,'topic-image-icon')]");
            var topicInfobox = GetTopicInfobox(topicName);
            if (!Driver.IsElementInElementDisplayed(topicInfobox, selector, waitTime))
            {
                throw new Exception($"Image icon is not displayed in '{topicName}' topic infobox");
            }
            return topicInfobox.FindElement(selector);
        }

        public IWebElement GetTopicInfobox(string topicName)
        {
            var selector = By.XPath("./ancestor::*[contains(@data-type,'Topic')]//*[@class='info']");
            var topic = GetTopicByName(topicName);
            if (!Driver.IsElementInElementDisplayed(topic, selector, WebDriverExtensions.WaitTime.Second))
            {
                throw new Exception($"Topic '{topicName}' Infobox is not displayed");
            }
            return topic.FindElement(selector);
        }

        public bool IsImageIconDisplayedInTopicInfobox(string iconName, string topicName)
        {
            try
            {
                return GetImageIconInTopicInfobox(topicName, WebDriverExtensions.WaitTime.Second).GetAttribute("xlink:href").Contains(iconName);
            }
            catch
            {
                return false;
            }
        }

        public IWebElement GetIconInTopicInfobox(string iconName, string topicName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Medium)
        {
            var selector = By.XPath($".//*[@*[contains(.,'{iconName}')]]");
            var topicInfobox = GetTopicInfobox(topicName);
            if (!Driver.IsElementInElementDisplayed(topicInfobox, selector, waitTime))
            {
                throw new Exception($"Topic icon '{iconName}' is not displayed in '{topicName}' topic infobox");
            }
            return topicInfobox.FindElement(selector);
        }

        public bool IsIconDisplayedInTopicInfobox(string iconName, string topicName)
        {
            try
            {
                return GetIconInTopicInfobox(iconName, topicName, WebDriverExtensions.WaitTime.Second).Displayed();
            }
            catch
            {
                return false;
            }
        }
    }
}
