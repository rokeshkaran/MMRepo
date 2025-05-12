using AutomationUtils.Utils;
using MjAutomationCore.Components.Base;
using MjAutomationCore.DTO.BaseDto.AccountDTO;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.BaseProject;
using MjAutomationCore.Pages.WebAppProject.MindjetStore;
using MjAutomationCore.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.MindjetStore
{
    [Binding]
    class MindjetStoreSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly BrowsersList _browsers;
        private readonly UserDataDto _userData;

        public MindjetStoreSteps(WebDriver driver, BrowsersList browsersList, UserDataDto userData)
        {
            _driver = browsersList.GetBrowser();
            _browsers = browsersList;
            _userData = userData;
        }

        [Then(@"Mindjet Store page is displayed")]
        public void ThenMindjetStorePageIsDisplayed()
        {
            var page = _browsers.Active.NowAt<MindjetStorePage>();
            _browsers.Active.WaitForElementToBeDisplayed(page.MindjetStoreMainPage);
            Assert.IsTrue(page.MindjetStoreMainPage.Displayed(), "Mindjet Store page is not displayed");
        }

        [When(@"User clicks '(.*)' button on Mindjet Store page")]
        public void WhenUserClicksButtonOnMindjetStorePage(string buttonName)
        {
            var page = _browsers.Active.NowAt<MindjetStorePage>();
            page.GetButtonByName(buttonName).Click();
        }

        [Then(@"'(.*)' message with text '(.*)' is displayed on Mindjet Store page")]
        public void ThenMessageWithTextIsDisplayedOnMindjetStorePage(string messege, string text)
        {
            var page = _browsers.Active.NowAt<MindjetStorePage>();
            Assert.IsTrue(page.ErrorMessegeWithText(messege, text));
        }

        [Then(@"'(.*)' field is highlighted red color on Mindjet Store page")]
        public void ThenFieldIsHighlightedRedColorOnMindjetStorePage(string fieldName)
        {
            Verify.IsTrue(_browsers.Active.GetComponent<InputByAttribute>(fieldName).GetCssValue("border-color").Equals("rgb(240, 29, 64)"), $"Border for {fieldName} field is not highlighted red color");
            Verify.IsTrue(_browsers.Active.GetComponent<InputByAttribute>(fieldName).GetCssValue("color").Equals("rgba(241, 43, 43, 1)"), $"Field {fieldName} is not highlighted red color");
        }

        [Then(@"'(.*)' selectbox is highlighted red color on Mindjet Store page")]
        public void ThenSelectBoxIsHighlightedRedColorOnMindjetStorePage(string selectboxName)
        {
            var selectbox = _browsers.Active.NowAt<MindjetStorePage>();
            Assert.IsTrue(selectbox.GetSelecteContainerByName(selectboxName).GetCssValue("border-color").Equals("rgb(240, 29, 64)"), $"Border for {selectboxName} selectbox is not highlighted red color");
            Assert.IsTrue(selectbox.GetSelecteContainerByName(selectboxName).GetCssValue("color").Equals("rgba(241, 43, 43, 1)"), $"Field {selectboxName} is not highlighted red color");
        }

        [When(@"User clicks '(.*)' field and selects '(.*)' in the dropdown list")]
        public void WhenUserClicksFieldAndSelectsInTheDropdownList(string selectboxName, string value)
        {
            var selectbox = _browsers.Active.NowAt<MindjetStorePage>();
           selectbox.GetSelecteContainerByName(selectboxName).Click();
            selectbox.SelectElementInDropdown(value);
        }

        [When(@"User clicks Country field and selects '(.*)' from dropdown")]
        public void WhenUserClicksCountryFieldAndSelectsFromDropdown(string country)
        {
            var page = _browsers.Active.NowAt<MindjetStorePage>();
            page.CountryField.Click();
            _browsers.Active.WaitForElementToBeDisplayed(page.MultiselectDropdown);
            page.SelectElementInDropdown(country);
        }

        [When(@"User enters login of the newly created account in the '(.*)' field")]
        public void WhenUserEntersLoginOfTheNewlyCreatedAccountInTheField(string fieldName)
        {
            _browsers.Active.GetComponent<InputByAttribute>(fieldName).Clear();
            _browsers.Active.GetComponent<InputByAttribute>(fieldName).SendKeys(_userData.Email);
        }
    }
}