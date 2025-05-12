using AutomationUtils.Utils;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.MindManagerFiles;
using MjAutomationCore.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using System.Linq;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject
{
    [Binding]
    public class ViewMapFiles : ReqnrollContext

    {
        private readonly WebDriver _driver;
        private readonly BrowsersList _browsers;

        public ViewMapFiles(WebDriver driver, BrowsersList browsersList)
        {
            _driver = browsersList.GetBrowser();
            _browsers = browsersList;
        }

        #region SideMenu

        [Then(@"""(.*)"" text is displayed in the Pop up")]
        public void ThenTextIsDisplayedInThePopUp(string text)
        {
            var page = _driver.NowAt<ViewMapFilePage>();
            Assert.IsTrue(page.GetTextFromSideMenuPopUp(text).LastOrDefault().Displayed(), $"{text} is not displayed in the Pop-up");
        }

        [Then(@"Date field is displayed in the Pop up")]
        public void ThenDateFieldIsDisplayedInThePopUp()
        {
            var page = _driver.NowAt<ViewMapFilePage>();
            Assert.IsTrue(page.PopUpInputDateField.Displayed(), "Date field is not displayed");
        }

        [Then(@"Resources field is displayed in the Pop up")]
        public void ThenResourcesDateIsDisplayedInThePopUp()
        {
            var page = _driver.NowAt<ViewMapFilePage>();
            Assert.IsTrue(page.PopUpResourcesField.Displayed(), "Resources field not displayed");
        }

        [When(@"User clicks switcher on the Saved Filter")]
        public void WhenUserClicksSwitcherOnTheSavedFilter()
        {
            var page = _browsers.Active.NowAt<ViewMapFilePage>();
            _browsers.Active.ClickByActions(page.SavedFiltedSwitcher);
        }

        [Then(@"Saved Filter toggle is set to '([^']*)' State")]
        public void ThenSavedFilterToggleIsSetTo(string label)
        {
            var page = _browsers.Active.NowAt<ViewMapFilePage>();
            Verify.IsTrue(page.SavedFiltedSwitcherLabel.Text.Contains(label), $"Saved Filter toggle is not set to '{label}'");           
        }

        [Then(@"the value '(.*)' is displayed to '(.*)' section in Properties popup")]
        public void ThenTheValueIsDisplayedToSectionInPropertiesPopup(string value, string sectionName)
        {
            var popup = _driver.NowAt<ViewMapFilePage>();
            var valueInField = popup.GetValueInSeclionName(sectionName).GetAttribute("value");
            Assert.AreEqual(value, valueInField, $"{value} value is not displayed in {sectionName} section");
        }

        [Then(@"Image is displayed for User")]
        public void ThenImageIsDisplayedForUser()
        {
            var page = _driver.NowAt<ViewMapFilePage>();
            Assert.IsTrue(page.AttachmentImage.Displayed(), "Picture is not displayed");
        }

        [Then(@"""(.*)"" topic is highlighted on the View Map page")]
        public void ThenTopicIsHighlightedOnTheViewMapPage(string topicName)
        {
            var page = _driver.NowAt<ViewMapFilePage>();
            Assert.IsTrue(page.IsTopcikHighlighted(topicName), $"'{topicName}' is not highlighted");
        }

        [Then(@"Filter On/Off button is displayed to the User")]
        public void ThenFilterOnOffButtonIsDisplayedToTheUser()
        {
            var button = _driver.NowAt<ViewMapFilePage>();
            _driver.WaitForDataLoading();
            Assert.IsTrue(button.FilterOnOffButton.Displayed(), "Filter On/Off button is not displayed");
        }

        [When(@"User clicks Filter ON/Off button on the View map page")]
        public void WhenUserClicksFilterONOffButtonOnTheViewMapPage()
        {
            var button = _driver.NowAt<ViewMapFilePage>();
            button.FilterOnOffButton.Click();
        }

        #endregion
    }
}