using AutomationUtils.Utils;
using MjAutomationCore.DTO.WebAppDTO.Publish;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.QA;
using MjAutomationCore.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using System.Linq;
using System.Threading;
using Reqnroll;
using static Dropbox.Api.Files.SearchMatchType;
using FileSystemHelper = MjAutomationCore.Utils.FileSystemHelper;

namespace MjAutomationCore.Steps.WebAppProject
{
    [Binding]
    class AdvancedOptions : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly BrowsersList _browsersList;

        public AdvancedOptions(WebDriver driver, BrowsersList browsersList)
        {
            _driver = driver;
            _browsersList = browsersList;
        }

        [Then(@"'(.*)' checkbox is checked on Advanced Options page")]
        public void ThenCheckboxIsCheckedOnAdvancedOptionsPage(string checkboxName)
        {
            var page = _driver.NowAt<AdvancedOptionsPage>();
            _driver.ExecuteScript("document.getElementsByClassName(\"label\")[0]");
            var rr = _driver.ExecuteScript("window.getComputedStyle(element,':before').getPropertyValue('display')");
            Assert.AreEqual(rr, "block");
        }

        [When(@"User click Storage Location field")]
        public void WhenUserClickStorageLocationField()
        {
            var page = _driver.NowAt<AdvancedOptionsPage>();
            page.StorageLocationField.Click();
        }

        [Then(@"following Storage Location drop-down list is displayed:")]
        public void ThenFollowingStorageLocationDrop_DownListIsDisplayed(Table table)
        {
            var page = _driver.NowAt<AdvancedOptionsPage>();
            var templatesList = page.StorageLocationTemplatesList.Select(column => column.Text).ToList();
            var expectedTemplatesList = table.Rows.SelectMany(row => row.Values).ToList();
            Assert.AreEqual(templatesList, expectedTemplatesList, "Items are not the correct");
        }

        [When(@"User clicks '(.*)' filed and selects '(.*)' value in dropdown on Advanced Options page")]
        public void WhenUserClicksFiledAndSelectsValueInDropdownOnAdvancedOptionsPage(string filedName, string value)
        {
            var page = _driver.NowAt<AdvancedOptionsPage>();
            page.GetValueInDropdown(filedName).SelectboxSelect(value);
        }

        [When(@"User clicks the view options menu on Advanced Options page")]
        public void WhenUserClicksTheViewOptionsMenuOnAdvancedOptionsPage()
        {
            var page = _browsersList.Active.NowAt<AdvancedOptionsPage>();
            page.PublishedViewDropdownField.Click();
            _browsersList.Active.WaitForElementsToBeDisplayed(page.PublishedViewDropdownOptions);
        }

        [When(@"User selects '([^']*)' value in view options dropdown on Advanced Options page")]
        public void WhenUserSelectsValueInViewOptionsDropdownOnAdvancedOptionsPage(string option)
        {
            var page = _browsersList.Active.NowAt<AdvancedOptionsPage>();
            page.GetPublishedViewOptionByNameFromDropdown(option).Click();
        }

        [Then(@"'(.*)' value is displayed in '(.*)' filed on Advanced Options page")]
        public void ThenValueIsDisplayedInFiledOnAdvancedOptionsPage(string value, string filedName)
        {
            var page = _driver.NowAt<AdvancedOptionsPage>();
            //Delete sleap afre add wait
            Thread.Sleep(500);
            var displayedValue = page.GetValueInDropdown(filedName).GetSelectedValueFromSelectbox();
            Assert.AreEqual(value, displayedValue, $"Value '{value}' is not dispalyed in '{filedName}' filed on Advanced Options page");
        }

        [Then(@"'([^']*)' option is selected in Publish View Dropdown Menu on Advanced Options page")]
        public void ThenOptionIsSelectedInPublishViewDropdownMenuOnAdvancedOptionsPage(string option)
        {
            var page = _browsersList.Active.NowAt<AdvancedOptionsPage>();
            Verify.AreEqual(option, page.GetPublishedViewSelectedOption().Text, $"Option '{option}' is not selected in Publish View Dropdown Menu on Advanced Options page");
        }

        [When(@"User selects '(.*)' in Storage Location dropdown")]
        public void WhenUserSelectsInStorageLocationDropdown(string value)
        {
            var page = _driver.NowAt<AdvancedOptionsPage>();
            page.StorageLocationField.SelectboxSelect(value);
        }

        [Then(@"value '(.*)' is displayed in Storage Location field")]
        public void ThenValueIsDisplayedInStorageLocationField(string value)
        {
            var page = _driver.NowAt<AdvancedOptionsPage>();
            var selectedValue = page.StorageLocationField.GetSelectedValueFromSelectbox();
            Assert.AreEqual(value, selectedValue, $"Selected value '{value}' is not dispalyed in Storage Location filed");
        }

        [Then(@"Storage Location dropdown is displayed on the Advanced Options page")]
        public void ThenStorageLocationDropdownIsDisplayedOnTheAdvancedOptionsPage()
        {
            var page = _driver.NowAt<AdvancedOptionsPage>();
            _driver.WaitForDataLoading();
            Assert.IsTrue(page.StorageLocationField.Displayed(), "Storage Location dropdown is not displayed");
        }

        [When(@"User clicks '(.*)' button in the Password field on the Advanced Options page")]
        public void WhenUserClicksButtonInThePasswordFieldOnTheAdvancedOptionsPage(string buttonName)
        {
            var button = _driver.NowAt<AdvancedOptionsPage>();
            _driver.WaitForElementToBeDisplayed(button.GetButtonByNameInPasswordField(buttonName));
            button.GetButtonByNameInPasswordField(buttonName).Click();
        }

        [When(@"User add '(.*)' image on the Advanced Options page")]
        public void WhenUserAddImageOnTheAdvancedOptionsPage(string image)
        {
            var way = _driver.NowAt<AdvancedOptionsPage>();
            way.InputImage.SendKeys(FileSystemHelper.GeneratePathToEmbedded(image));
            _driver.WaitForElementToContainsTextInAttribute(way.ImageLogo, "image", "src", WebDriverExtensions.WaitTime.Long);
        }

        [Then(@"Image is displayed to the User on the Advanced Options page")]
        public void ThenImageIsDisplayedToTheUserOnTheAdvancedOptionsPage()
        {
            var page = _driver.NowAt<AdvancedOptionsPage>();
            var image = page.ImageLogo.GetAttribute("src");
            Verify.IsNotEmpty(image, "Image logo is not displayed");
        }

        [When(@"User clicks Remove button to the choose image field")]
        public void WhenUserClicksRemoveButtonToTheChooseImageField()
        {
            var page = _driver.NowAt<AdvancedOptionsPage>();
            _driver.ClickByJavascript(page.BrandingLogoRemoveButton);
        }

        [Then(@"Remove button to the choose image field is displayed on the Advanced Options page")]
        public void ThenRemoveButtonToTheChooseImageFieldIsDisplayedOnTheAdvancedOptionsPage()
        {
            var page = _driver.NowAt<AdvancedOptionsPage>();
            Assert.IsTrue(page.BrandingLogoRemoveButton.Displayed(), "Remove Button is not displayed to the choose image field on Advance Option Page");
        }

        [Then(@"Image is not displayed on the Advanced Options page to User")]
        public void ThenImageIsNotDisplayedOnTheAdvancedOptionsPageToUser()
        {
            var page = _driver.NowAt<AdvancedOptionsPage>();
            Assert.IsTrue(page.ChooseImageButton.Displayed(), "Image is displayed to the User");
            Assert.IsFalse(page.ImageLogo.Displayed());
        }

        [Then(@"password characters are Show to the User")]
        public void ThenPasswordCharactersAreShowToTheUser()
        {
            var passField = _driver.NowAt<AdvancedOptionsPage>();
            Assert.IsTrue(passField.DisplayedPasswordCharacters(), "Password characters are hidden to the User");
        }

        [Then(@"password characters are Hidden to the User")]
        public void ThenPasswordCharactersAreHiddenToTheUser()
        {
            var passField = _driver.NowAt<AdvancedOptionsPage>();
            Assert.IsFalse(passField.DisplayedPasswordCharacters(), "Password characters are show to the User");
        }

    }
}
