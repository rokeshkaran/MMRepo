using AutomationUtils.Utils;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.VisualStudio.TestPlatform.CommunicationUtilities;
using MjAutomationCore.Components.Base;
using MjAutomationCore.Components.SelectBox;
using MjAutomationCore.Components.Topic;
using MjAutomationCore.DTO.BaseDto.RunTimeVariables;
using MjAutomationCore.DTO.LicensingDTO.CustomerAdminPortal;
using MjAutomationCore.DTO.LicensingDTO.RunTimeVariables.Salesportal;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Extensions;
using MjAutomationCore.General.Api.Salesportal;
using MjAutomationCore.Pages.BaseProject;
using MjAutomationCore.Pages.WebAppProject.MindManagerFiles;
using MjAutomationCore.Providers;
using MjAutomationCore.Utils;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using SeleniumAutomation.Framework;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading;
using Reqnroll;
using static SeleniumAutomationUtils.SeleniumExtensions.WebDriverExtensions;
using static System.Net.Mime.MediaTypeNames;

namespace MjAutomationCore.Steps.Base.Components.Base
{
    [Binding]
    class DialogSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly SessionRandomValue _sessionRandom;
        private readonly CustomerDto _customer;
        private readonly CustomersDto _customersDto;
        private readonly PurchaseDto _purchase;
        private readonly PurchasesDto _purchasesDto;
        private readonly ValueSecretToken _secretToken;
        private readonly ValuesText _valuesText;
        private readonly DownloadedFileName _downloadedFileName;
        private readonly BrowsersList _browsers;
        public DialogSteps(WebDriver driver, BrowsersList browsersList, SessionRandomValue sessionRandom, CustomerDto customer, CustomersDto customersDto, PurchaseDto purchase,
            PurchasesDto purchasesDto, ValueSecretToken secretToken, ValuesText valuesText, DownloadedFileName downloadedFileName)
        {
            _driver = driver;
            _browsers = browsersList;
            _sessionRandom = sessionRandom;
            _customer = customer;
            _customersDto = customersDto;
            _purchase = purchase;
            _purchasesDto = purchasesDto;
            _secretToken = secretToken;
            _valuesText = valuesText;
            _downloadedFileName = downloadedFileName;
        }

        [When(@"User clicks close button in '([^']*)' dialog")]
        public void WhenUserClicksCloseButtonInDialog(string dialogName)
        {
            _driver.WaitForElementToBeDisplayed(_driver.GetComponent<Dialog>(dialogName));
            _driver.Component<Dialog>(dialogName).DialogCloseButton.Click();
        }

        [When(@"User clicks on cancel button in '([^']*)' dialog")]
        public void WhenUserClicksOnCancelButtonInDialog(string dialogName)
        {
            _driver.WaitForElementToBeDisplayed(_driver.GetComponent<Dialog>(dialogName));
            _driver.Component<Dialog>(dialogName).DialogCancelButton.Click();
        }

        [When(@"User close '([^']*)' dialog")]
        public void WhenUserCloseDialog(string dialogName)
        {
            _driver.GetComponent<Dialog>(dialogName, new Properties() { WaitTime = WebDriverExtensions.WaitTime.ExtraLong });
            _driver.CloseDialogByJavascript();           
        }

        [Then(@"text '(.*)' displayed in '(.*)' dialog")]
        public void ThenTextDisplayedInDialog(string text, string dialogName)
        {
            text = text.AddRandom(_sessionRandom);
            text = text.Replace("@NewLine", System.Environment.NewLine);
            var actualText = _browsers.Active.Component<Dialog>(dialogName).DialogText.Text;
            Verify.IsTrue(actualText.Contains(text), $"Text is displayed incorrectly in {dialogName} dialog");
        }

        [Then(@"'([^']*)' warning message is displayed in '([^']*)' dialog")]
        public void ThenWarningMessageIsDisplayedInDialog(string message, string dialogName)
        {
            Verify.IsTrue(_driver.Component<Dialog>(dialogName).DialogWarningMessage.Text.Contains(message), $"Warning message '{message}' is displayed incorrectly in {dialogName} dialog");
        }

        [Then(@"text '([^']*)' is displayed in '([^']*)' dialog for confirm deletion in support portal")]
        public void ThenTextIsDisplayedInDialogForConfirmDeletionInSupportPortal(string text, string dialogName)
        {
            text = text.AddRandom(_sessionRandom);
            string customerName = Regex.Match(text, @"<(\w+)>").Groups[1].Value;
            var customerID = _customersDto.Value.First(x => x.Name.Equals(customerName)).Id;
            string modifiedText = text.Replace("<id>", customerID.ToString()).Replace("<", "").Replace(">", "");
            //get message from UI
            var deleteMessageDetailsSpan = _driver.Component<Dialog>(dialogName).FormLicenseDialogDeleteSpan.Text.RemoveLineBreakes(); ;
            var deleteMessageDetailsId = _driver.Component<Dialog>(dialogName).FormLicenseDialogDeleteId.Text;
            var deleteMessageDetailsDiv = _driver.Component<Dialog>(dialogName).FormLicenseDialogDeleteDiv.Text.RemoveLineBreakes(); ;
            var contatenateTextfromScreen = deleteMessageDetailsSpan + deleteMessageDetailsId + "? " + deleteMessageDetailsDiv;
            Verify.AreEqual(modifiedText, contatenateTextfromScreen, $"Text is displayed incorrectly in {dialogName} dialog for confirm customer deletion in support portal");
        }


        [Then(@"text '([^']*)'is displayed  with customer name '([^']*)' and purchase Id '([^']*)' in '([^']*)' dialog for confirm purchase deletion in support portal")]
        public void ThenTextIsDisplayedWithCustomerNameAndPurchaseIdInDialogForConfirmPurchaseDeletionInSupportPortal(string text, string customerName, string purchaseName, string dialogName)
        {
            customerName = customerName.AddRandom(_sessionRandom);
            var purchaseId = _customersDto.Value.First(x => x.Name.Equals(customerName)).Purchases.First(x => x.ProductId.Equals(purchaseName)).PurchaseId;
            string modifiedText = text.Replace("<id>", purchaseId.ToString()).Replace("<", "").Replace(">", "");
            //get message from UI
            var deleteMessageDetailsSpan = _driver.Component<Dialog>(dialogName).FormLicenseDialogDeleteSpan.Text.RemoveLineBreakes(); ;
            var deleteMessageDetailsId = _driver.Component<Dialog>(dialogName).FormLicenseDialogDeleteId.Text;
            var deleteMessageDetailsDiv = _driver.Component<Dialog>(dialogName).FormLicenseDialogDeleteDiv.Text.RemoveLineBreakes(); ;
            var contatenateTextfromScreen = deleteMessageDetailsSpan + deleteMessageDetailsId + " " + deleteMessageDetailsDiv;
            Verify.AreEqual(modifiedText, contatenateTextfromScreen, $"Text is displayed incorrectly in {dialogName} dialog for confirm purchase deletion in support portal");
        }

        [Then(@"'(.*)' dialog is displayed to User")]
        public void ThenDialogIsDisplayedToUser(string dialogName)
        {
            Verify.IsTrue(_browsers.Active.ComponentDisplayedState<Dialog>(dialogName), $"Dialog '{dialogName}' is not displayed");
        }

        [Then(@"'(.*)' dialog is not displayed to User")]
        public void ThenDialogIsNotDisplayedToUser(string dialogName)
        {
            Verify.IsFalse(_driver.ComponentDisplayedState<Dialog>(dialogName, new Properties { Displayed = Microsoft.VisualBasic.TriState.False }), $"Dialog '{dialogName}' is displayed");
        }

        [Then(@"'([^']*)' button is disabled on '([^']*)' dialog")]
        public void ThenButtonIsDisabledOnDialog(string buttonName, string dialogName)
        {
            Verify.IsTrue(_driver.Component<Dialog>(dialogName).GetButtonByName(buttonName).IsDisabledState(),
                $"Button '{buttonName}' is enabled in '{dialogName}' dialog");
        }

        [Then(@"'([^']*)' button is not displayed on '([^']*)' dialog")]
        public void ThenButtonIsNotDisplayedOnDialog(string buttonName, string dialogName)
        {
            Verify.IsFalse(_browsers.Active.Component<Dialog>(dialogName).IsButtonDisplayed(buttonName),
                $"Button '{buttonName}' is displayed in '{dialogName}' dialog");
        }

        [Then(@"'([^']*)' button is enabled on '([^']*)' dialog")]
        public void ThenButtonIsEnabledOnDialog(string buttonName, string dialogName)
        {
            Verify.IsFalse(_driver.Component<Dialog>(dialogName).GetButtonByName(buttonName).IsDisabledState(),
                $"Button '{buttonName}' is disabled in '{dialogName}' dialog");
        }

        [When(@"User checks checkbox by label '([^']*)' on '([^']*)' dialog")]
        public void WhenUserChecksCheckboxByLabelOnDialog(string checkboxByLabel, string dialogName)
        {
            var parent = _driver.GetComponent<Dialog>(dialogName);
            _driver.GetComponent<CheckBoxByLabelName>(checkboxByLabel, new Properties() { Parent = parent, WaitTime = WebDriverExtensions.WaitTime.Second }).Click();
        }

        [Then(@"checkbox by label '([^']*)' is checked on '([^']*)' dialog")]
        public void ThenCheckboxByLabelIsCheckedOnDialog(string checkboxByLabel, string dialogName)
        {
            var parent = _driver.GetComponent<Dialog>(dialogName);
            Verify.IsTrue(_driver.GetComponent<CheckBoxByLabelName>(checkboxByLabel, new Properties() { Parent = parent, WaitTime = WebDriverExtensions.WaitTime.Second }).Selected,
                $"Сheckbox by label '{checkboxByLabel}' is unchecked on '{dialogName}' dialog");
        }

        [Then(@"checkbox by label '([^']*)' is unchecked on '([^']*)' dialog")]
        public void ThenCheckboxByLabelIsUncheckedOnDialog(string checkboxByLabel, string dialogName)
        {
            var parent = _driver.GetComponent<Dialog>(dialogName);
            Verify.IsFalse(_driver.GetComponent<CheckBoxByLabelName>(checkboxByLabel, new Properties() { Parent = parent, WaitTime = WebDriverExtensions.WaitTime.Second }).Selected,
                $"Сheckbox by label '{checkboxByLabel}' is checked on '{dialogName}' dialog");
        }

        [When(@"User clicks '(.*)' button in '(.*)' dialog")]
        public void WhenUserClicksButtonInDialog(string buttonName, string dialogName)
        {
            _browsers.Active.WaitForElementToBeEnabled(_browsers.Active.Component<Dialog>(dialogName).GetButtonByName(buttonName), WebDriverExtensions.WaitTime.Short);
            _browsers.Active.Component<Dialog>(dialogName).GetButtonByName(buttonName).Click();
            if (!_browsers.Active.IsAlertPresent(WebDriverExtensions.WaitTime.Second))
            {
                _browsers.Active.WaitForDataLoading();
            }
        }

        [When(@"User close Admin System Message")]
        public void WhenUserCloseAdminSystemMessage()
        {
            var page = _browsers.Active.NowAt<BaseExtensionsPage>();
            if (page.Iframe.Any())
            {
                _browsers.Active.SwitchToSpecificFrame(page.Iframe[0]);
                if (_browsers.Active.IsElementDisplayed(_browsers.Active.Component<Dialog>("system-message").GetButtonByName("OK"), WebDriverExtensions.WaitTime.Short))
                {
                    _browsers.Active.Component<Dialog>("system-message").GetButtonByName("OK").Click();
                    _browsers.Active.SwitchTo().DefaultContent();
                }
            }
        }

        [When(@"User clicks outside the '([^']*)' dialog for BULA terms")]
        public void WhenUserClicksOutsideTheDialogForBULATerms(string dialog)
        {
            var DialogWindow = _browsers.Active.GetComponent<Dialog>(dialog);
            _browsers.Active.ActionsMoveToElementAndClick(DialogWindow, -100, -100);
        }

        [Then(@"image is displayed on '([^']*)' dialog with approximate '([^']*)' width and approximate '([^']*)' height")]
        public void ThenImageIsDisplayedOnDialogWithApproximateWidthAndApproximateHeight(string dialog, int width, int height)
        {
            var page = _driver.Component<Dialog>(dialog);
            var rangeValue = 5;
            var widthWholeValue = (int)Convert.ToDecimal(page.TopicImageViewerMode.GetCssValue("max-width").Split(".")[0]);
            var heightWholeValue = (int)Convert.ToDecimal(page.TopicImageViewerMode.GetCssValue("max-height").Split(".")[0]);
            Verify.IsTrue(widthWholeValue - rangeValue <= width && width <= widthWholeValue + rangeValue, $"Image in viewer mode does not have width {width}. Actual: {widthWholeValue}");
            Verify.IsTrue(heightWholeValue - rangeValue <= height && height <= heightWholeValue + rangeValue, $"Image in viewer mode does not have width {height}. Actual: {heightWholeValue}");
        }

        //TODO Step only for use in the tests to check the error in scim group assign dialog
        [When(@"User clicks Submit button in scim group assign dialog")]
        public void WhenUserClicksSubmitButtonInScimGroupAssignDialog()
        {
            _driver.Component<Dialog>("scim-group-assign").GetButtonByName("Submit").Click();
        }

        [Then(@"'(.*)' error message is displayed in '(.*)' dialog")]
        public void ThenErrorMessageIsDisplayedInDialog(string textErrorMessage, string dialogName)
        {
            Verify.IsTrue(_driver.Component<Dialog>(dialogName).DisplayedErrorMessage(textErrorMessage), $"Error message with '{textErrorMessage}' text is not displayed in '{dialogName}' dialog");
        }

        [Then(@"'(.*)' header is displayed in '(.*)' dialog")]
        public void ThenHeaderIsDisplayedInDialog(string header, string dialogName)
        {
            Verify.IsTrue(_driver.Component<Dialog>(dialogName).DisplayedHeaderInDialog(header), $"'{header}' header is not displayed in '{dialogName}' dialog");
        }

        [Then(@"'(.*)' subheader is displayed in '(.*)' dialog")]
        public void ThenSubheaderIsDisplayedInDialog(string subheader, string dialogName)
        {
            Verify.IsTrue(_driver.Component<Dialog>(dialogName).DisplayedSubheaderInDialog(subheader), $"'{subheader}' subheader is not displayed in '{dialogName}' dialog");
        }

        [Then(@"'([^']*)' text is displayed in '([^']*)' dialog")]
        public void ThenTextIsDisplayedInDialog(string textValue, string dialogName)
        {
            Verify.IsTrue(_driver.Component<Dialog>(dialogName).IsTextDisplayedInDialog(textValue), $"'{textValue}' text is not displayed in '{dialogName}' dialog");
        }

        [Then(@"'(.*)' text content is displayed in '(.*)' dialog")]
        public void ThenTextContentIsDisplayedInDialog(string textContent, string dialogName)
        {
            var actualContent = _driver.Component<Dialog>(dialogName).GetContent().Text.RemoveLineBreakes();
            Verify.AreEqual(textContent, actualContent, "Text content is displayed incorrect");
        }

        [When(@"User clicks '(.*)' link in '(.*)' dialog")]
        public void WhenUserClicksLinkInDialog(string link, string dialogName)
        {
            _driver.Component<Dialog>(dialogName).GetLinkInDialog(link).Click();
        }

        [When(@"User enter '(.*)' value in the '(.*)' field of '(.*)' dialog")]
        public void WhenUserEnterValueInTheFieldOfDialog(string value, string fieldName, string dialogName)
        {
            _driver.WaitForElementToBeDisplayed(_driver.Component<Dialog>(dialogName).GetInputField(fieldName));
            value = value.AddRandom(_sessionRandom).Date();
            _driver.Component<Dialog>(dialogName).GetInputField(fieldName).ClearSendKeys(value);

            if (fieldName.Equals("Customer Name"))
            {
                _customer.Name = value;
                _customersDto.Value.Add(_customer);
            }
        }

        [When(@"User clicks '(.*)' field and presses the '(.*)' key on the keyboard of '(.*)' dialog")]
        public void WhenUserClicksFieldAndPressesTheKeyOnTheKeyboardOfDialog(string fieldName, string key, string dialogName)
        {
            _driver.Component<Dialog>(dialogName).GetInputField(fieldName).Click();
            //TODO wait after click
            Thread.Sleep(500);
            _driver.ActionsSendKeys(key);
        }

        [Then(@"'(.*)' field border is highlighted to the red color of '(.*)' dialog")]
        public void ThenFieldBorderIsHighlightedToTheRedColorOfDialog(string fieldName, string dialogName)
        {
            var fieldBorderColor = _driver.Component<Dialog>(dialogName).GetInputFiled(fieldName).GetCssValue("border");
            Verify.IsTrue(fieldBorderColor.Contains("rgb(255, 0, 0)"), $"'{fieldName}' field border color is not highlighted to the red color of '{dialogName}' dialog");
        }

        [Then(@"'(.*)' value is displayed to the '(.*)' field of '(.*)' dialog")]
        public void ThenValueIsDisplayedToTheFieldOfDialog(string value, string fieldName, string dialogName)
        {
            value = value.AddRandom(_sessionRandom).Date();
            _driver.WaitForElementToBeDisplayed(_driver.Component<Dialog>(dialogName).GetInputField(fieldName));
            var inputValue = _driver.Component<Dialog>(dialogName).GetInputField(fieldName).GetAttribute("value");

            if (fieldName.Equals("end_date") || fieldName.Equals("Expires:") || fieldName.Equals("Redemption Expiration"))
            {
                var convertedDate = DateTime.ParseExact(inputValue, "yyyy-MM-dd", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy");
                Verify.AreEqual(value, convertedDate, $"'{value}' date is not displayed in the '{fieldName}' field of '{dialogName}' dialog");
            }
            else
            {
                Verify.AreEqual(value, inputValue, $"'{value}' value is not displayed to the '{fieldName}' field of '{dialogName}' dialog");
            }
        }

        [When(@"User selects '(.*)' value in the '(.*)' selectbox field of '(.*)' dialog")]
        public void WhenUserSelectsValueInTheSelectboxFieldOfDialog(string value, string fieldName, string dialogName)
        {
            value = value.AddRandom(_sessionRandom).Date();
            var parent = _driver.Component<Dialog>(dialogName).GetFieldNameInDialog(fieldName);
            _driver.GetComponent<SelectWithSearchInDropdown>(new Properties { Parent = parent }).Click();
            _driver.Component<SelectWithSearchInDropdown>().GetSearchField().SendKeys(value);
            _driver.Component<SelectWithSearchInDropdown>().GetValueByName(value).Click();
            _purchase.CustomerName = value;
            _purchasesDto.Value.Add(_purchase);
        }

        [Then(@"'(.*)' value is displayed in '(.*)' selectbox field of '(.*)' dialog")]
        public void ThenValueIsDisplayedInSelectboxFieldOfDialog(string value, string fieldName, string dialogName)
        {
            value = value.AddRandom(_sessionRandom).Date();
            var actualValue = _driver.Component<SelectWithSearchInDropdown>(new Properties { Parent = _driver.Component<Dialog>(dialogName).GetFieldNameInDialog(fieldName) }).GetValueFromDropdownWithSearchField().Text;
            Verify.AreEqual(actualValue, value, $"'{value}' value is not displayed in '{fieldName}' selectbox field");
        }

        [When(@"User selects '(.*)' option in the '(.*)' selectbox field of '(.*)' dialog")]
        public void WhenUserSelectsOptionInTheSelectboxFieldOfDialog(string option, string selectboxFieldName, string dialogName)
        {
            _driver.Component<Dialog>(dialogName).GetSelectboxInDialog(selectboxFieldName).SelectboxSelect(option);
            _purchase.ProductId = Option(option);
            _purchasesDto.Value.Add(_purchase);
        }

        public static string Option(string option)
        {
            switch (option)
            {
                case ("Co-editing"):
                    return "COEDIT";
                case ("MindManager Teams App"):
                    return "MSTEAMSEDIT";
                case ("MindManager Subscription"):
                    return "MMSUBSCRIPTION";
                case ("MindManager Windows 21 / Mac 14"):
                    return "MMD-W21-M14";
                case ("MindManager Windows 21 / Mac 13"):
                    return "MMD-W21-M13";
                case ("MindManager Trial"):
                    return "MMTRIAL";
                case ("MindManager Windows 21"):
                    return "MMD-W21";
                case ("MindManager Teams App Viewer"):
                    return "MSTEAMSVIEW";
                case ("MindManager Windows 22"):
                    return "MMD-W22";
                case ("MindManager Windows 22 / Mac 14"):
                    return "MMD-W22-M14";
                case ("MindManager Essentials"):
                    return "MMESSENTIALS";
                case ("MindManager Mac 22"):
                    return "MMD-M14";
                case ("MindManager Reader"):
                    return "MMREADER";
                default:
                    return "NOT FOUND";
            }
        }

        [When(@"User remembers data of '(.*)' field in '(.*)' dialog")]
        public void WhenUserRemembersDataOfFieldInDialog(string fieldName, string dialogName)
        {
            _valuesText.Value = _driver.Component<Dialog>(dialogName).GetInputFiled(fieldName).GetAttribute("value");
        }

        [Then(@"'(.*)' field data is not changed in '(.*)' dialog")]
        public void ThenFieldDataIsNotChangedInDialog(string fieldName, string dialogName)
        {
            var dataField = _driver.Component<Dialog>(dialogName).GetInputFiled(fieldName).GetAttribute("value");
            Verify.AreEqual(_valuesText.Value, dataField, $"Field {fieldName}' data was changed in '{dialogName}' dialog");
        }

        [Then(@"'(.*)' value is displayed in the '(.*)' selectbox field of '(.*)' dialog")]
        public void ThenValueIsDisplayedInTheSelectboxFieldOfDialog(string value, string selectboxFieldName, string dialogName)
        {
            var selectedValue = _driver.Component<Dialog>(dialogName).GetSelectboxInDialog(selectboxFieldName).GetSelectedValueFromSelectbox();
            Verify.AreEqual(value, selectedValue, $"'{value}' value is not displayed to the '{selectboxFieldName}' selectbox field of '{dialogName}' dialog");
        }

        [When(@"User uses Ctrl_A combination for select '(.*)' field in '(.*)' dialog and clicks '(.*)' keys on keyboard")]
        public void WhenUserUsesCtrl_ACombinationForSelectFieldInDialogAndClicksKeysOnKeyboard(string fieldName, string dialogName, string keyboardButton)
        {
            _driver.Component<Dialog>(dialogName).GetInputFiled(fieldName).Click();
            _driver.ActionKeysCombinationControlA();
            _driver.ActionsSendKeys(keyboardButton);
        }

        [When(@"User uses Ctrl_A and Ctrl_C combination for copies '(.*)' field of '(.*)' dialog")]
        public void WhenUserUsesCtrl_AAndCtrl_CCombinationForCopiesFieldOfDialog(string fieldName, string dialogName)
        {
            _driver.AddedFieldByJavascript();
            _driver.Component<Dialog>(dialogName).GetInputFiled(fieldName).Click();
            _driver.ActionKeysCombinationControlA();
            _driver.ActionKeysCombinationControlAndKeyboardButton("c");
        }

        [When(@"User enters '(.*)' value in the '(.*)' field in '(.*)' dialog")]
        public void WhenUserEntersValueInTheFieldInDialog(string value, string fieldName, string dialogName)
        {
            value = value.AddRandom(_sessionRandom);
            _driver.Component<Dialog>(dialogName).GetInputField(fieldName).ClearSendKeys(value);
        }

        [When(@"User enters '([^']*)' value by character in the '([^']*)' field in '([^']*)' dialog")]
        public void WhenUserEntersValueByCharacterInTheFieldInDialog(string value, string field, string dialogName)
        {
            value = value.AddRandom(_sessionRandom);
            if (dialogName.Equals("share-file-dialog"))
            {
                _browsers.Active.Component<Dialog>(dialogName).GetInputTextArea(field, dialogName).SendKeysByCharacter(value);
            }
            else
            {
                _browsers.Active.Component<Dialog>(dialogName).GetInputField(field).SendKeysByCharacter(value);
            }
        }

        [When(@"User clears the '([^']*)' field in '([^']*)' dialog by backspace key")]
        public void WhenUserClearsTheFieldInDialog(string field, string dialogName)
        {
            _driver.Component<Dialog>(dialogName).GetInputField(field).ClearWithBackspaces();
        }

        [Then(@"'([^']*)' value is displayed in the '([^']*)' field in '([^']*)' dialog")]
        public void ThenValueIsDisplayedInTheFieldInDialog(string value, string field, string dialogName)
        {
            var actualValue = _driver.Component<Dialog>(dialogName).GetInputField(field).GetAttribute("value");
            Verify.AreEqual(value, actualValue, $"'{value}' is not displayed in '{field}' field. Actua: '{actualValue}'");
        }

        [Then(@"'([^']*)' input field has style '([^']*)' in '([^']*)' dialog")]
        public void ThenInputFieldHasStyleInDialog(string inputField, string style, string dialogName)
        {
            var inputFieldStyle = _driver.Component<Dialog>(dialogName).GetInputField(inputField).GetAttribute("style");
            Verify.IsTrue(inputFieldStyle.Contains(style), $"'{inputField}' input field does not have style '{style}'. Actual: '{inputFieldStyle}'");
        }

        [When(@"User selects '(.*)' option from the scim group dropdown in '(.*)' dialog")]
        public void WhenUserSelectsOptionFromTheScimGroupDropdownInDialog(string option, string dialog)
        {
            _driver.Component<Dialog>(dialog).ScimGroupSelect.SelectboxSelect(option);
            _driver.WaitForDataLoading();
        }

        [When(@"User checks '(.*)' radio button in '(.*)' dialog")]
        public void WhenUserChecksRadioButtonInDialog(string radioButton, string dialogName)
        {
            _driver.Component<Dialog>(dialogName).GetRadiobuttonByNameInDialog(radioButton).Click();
        }

        [Then(@"'(.*)' radio button is checked in '(.*)' dialog")]
        public void ThenRadioButtonIsCheckedInDialog(string radioButton, string dialogName)
        {
            Verify.IsTrue(_driver.Component<Dialog>(dialogName).StateRadiobutton(radioButton), $"'{radioButton}' radio button is unchecked in '{dialogName}' dialog");
        }

        [When(@"User provides '(.*)' file to '(.*)' file upload in '(.*)' dialog")]
        public void WhenUserProvidesFileToFileUploadInDialog(string pathfile, string section, string dialogName)
        {
            var page = _driver.NowAt<UnifiedComponents>();
            _driver.Component<Dialog>(dialogName).GetButtonByName(section).Click();
            _driver.WaitForElementToBeEnabled(page.FileUploadField.Last());
            page.FileUploadField.Last().SendKeys(Utils.FileSystemHelper.GeneratePathToEmbedded(pathfile));
            //Wait for file upload data
            Thread.Sleep(1000);
        }

        [Then(@"'([^']*)' section warning content message is displayed in '([^']*)' dialog for BULA terms")]
        public void ThenSectionWarningContentMessageIsDisplayedInDialog(string message, string dialogName)
        {
            var page = _driver.NowAt<UnifiedComponents>();
            Verify.IsTrue(_driver.Component<Dialog>(dialogName).BulaDialogWarningMessage.Text.Contains(message), $"Warning message '{message}' is displayed incorrectly in {dialogName} dialog for BULA terms");
        }

        [When(@"User uploads the updated CSV file")]
        public void WhenUserUploadsTheUpdatedCSVFile()
        {
            var path = _downloadedFileName.Value.First();
            var page = _driver.NowAt<UnifiedComponents>();
            _driver.Component<Dialog>("manage-user").GetButtonByName("Import CSV").Click();
            _driver.WaitForElementToBeEnabled(page.FileUploadField.Last());
            page.FileUploadField.Last().SendKeys(Utils.FileSystemHelper.GeneratePathToEmbedded(path));
            //Wait for file upload data
            Thread.Sleep(1000);
        }

        [When(@"User clicks '(.*)' link in in '(.*)' dialog")]
        public void WhenUserClicksLinkInInDialog(string link, string dialogName)
        {
            _driver.GetComponent<Dialog>(dialogName).FindElement(By.XPath($".//li//a[contains(text(),'{link}')]")).Click();
        }

        [Then(@"'([^']*)' titlebar header is displayed in '([^']*)' dialog")]
        public void ThenTitlebarHeaderIsDisplayedInDialog(string title, string dialogName)
        {
            Verify.IsTrue(_driver.Component<Dialog>(dialogName).DisplayedTitleBar(title), $"'{title}' is displayed incorrectly in '{dialogName}' dialog");
        }

        [When(@"User clicks Close button in titlebar of '([^']*)' dialog")]
        public void WhenUserClicksCloseButtonInTitlebarOfDialog(string dialogName)
        {
            _browsers.Active.Component<Dialog>(dialogName).GetTitleBarCloseButton().Click();
        }

        [Then(@"following keyboard shortcuts are displayed in '([^']*)' section in '([^']*)' dialog")]
        public void ThenFollowingKeyboardShortcutsAreDisplayedInSectionInDialog(string sectionName, string dialogName, Table table)
        {
            var tableNames = new List<KeyValuePair<string, string>>();
            foreach (DataTableRow row in table.Rows)
            {
                var arrayValue = row.Values.ToArray();
                tableNames.Add(new KeyValuePair<string, string>(arrayValue[0], arrayValue[1]));
            }
            Verify.AreEqual(tableNames, _driver.Component<Dialog>(dialogName).GetValuePairInSection(sectionName), "Shortcut Title and Shortcut Values are incorrectly displayed in table");
        }

        [Then(@"'([^']*)' topic is displayed in '([^']*)' dialog")]
        public void ThenTopicIsDisplayedInDialog(string topicName, string dialogName)
        {
            var parent = _browsers.Active.GetComponent<Dialog>(dialogName);
            Verify.IsTrue(_browsers.Active.ComponentDisplayedState<Topic>(new Properties { Parent = parent }), $"Topic '{topicName}' is not displayed in '{dialogName}' dialog ");
        }

        [Then(@"'([^']*)' Image Icon is displayed to the '([^']*)' Topic infobox in '([^']*)' Dialog")]
        public void ThenImageIconIsDisplayedToTheTopicInfoboxInDialog(string imageIcon, string topicName, string dialogName)
        {
            var parent = _browsers.Active.GetComponent<Dialog>(dialogName);
            Verify.IsTrue(_browsers.Active.Component<Topic>(new Properties { Parent = parent }).IsImageIconDisplayedInTopicInfobox(imageIcon,topicName), $"'{imageIcon}' Image Icon is not displayed to the '{topicName}' Topic infobox in '{dialogName}' Dialog");
        }

        [Then(@"'([^']*)' Icon is displayed to the '([^']*)' Topic infobox in '([^']*)' dialog")]
        public void ThenIconIsDisplayedToTheTopicInfoboxInDialog(string icon, string topicName, string dialogName)
        {
            var parent = _browsers.Active.GetComponent<Dialog>(dialogName);
            Verify.IsTrue(_browsers.Active.Component<Topic>(new Properties { Parent = parent }).IsIconDisplayedInTopicInfobox(icon, topicName), $"'{icon}' Icon is not displayed to the '{topicName}' Topic infobox in '{dialogName}' Dialog");
        }

        #region SelectWithSearchInDropdown

        [When(@"User clicks '(.*)' selectbox field of '(.*)' dialog")]
        public void WhenUserClicksSelectboxFieldOfDialog(string fieldName, string dialogName)
        {
            var parent = _driver.Component<Dialog>(dialogName).GetFieldNameInDialog(fieldName);
            _driver.GetComponent<SelectWithSearchInDropdown>(new Properties { Parent = parent }).Click();
        }

        [Then(@"dropdown with search is displayed to the User")]
        public void ThenDropdownWithSearchIsDisplayedToTheUser()
        {
            Verify.IsTrue(_driver.Component<SelectWithSearchInDropdown>().DropdownWithSearch().Displayed(), $"Dropdown with search is not displayed");
        }

        [When(@"User enters '(.*)' value in search field to dropdown with search")]
        public void WhenUserEntersValueInSearchFieldToDropdownWithSearch(string value)
        {
            value = value.AddRandom(_sessionRandom);
            _driver.Component<SelectWithSearchInDropdown>().GetSearchField().ClearSendKeys(value);

            _purchase.CustomerName = value;
            _purchasesDto.Value.Add(_purchase);
        }

        [Then(@"'(.*)' message is displayed in the dropdown with search")]
        public void ThenMessageIsDisplayedInTheDropdownWithSearch(string textMessage)
        {
            Verify.IsTrue(_driver.Component<SelectWithSearchInDropdown>().GetValueByName(textMessage).Displayed(), $"'{textMessage}' message is not displayed in the dropdown with search");
        }

        [Then(@"'(.*)' value is highlighted blue in the search results in the dropdown with search")]
        public void ThenValueIsHighlightedBlueInTheSearchResultsInTheDropdownWithSearch(string value)
        {
            value = value.AddRandom(_sessionRandom);
            Verify.IsTrue(_driver.Component<SelectWithSearchInDropdown>().GetValueByName(value).GetAttribute("class").Contains("highlighted"), $"Value '{value}' is not highlighted blue in search results");
        }

        [When(@"User clicks '(.*)' value in the search results in tne dropdown with search")]
        public void WhenUserClicksValueInTheSearchResultsInTneDropdownWithSearch(string value)
        {
            value = value.AddRandom(_sessionRandom);
            _driver.Component<SelectWithSearchInDropdown>().GetValueByName(value).Click();
        }


        #endregion

        [When(@"User remembers scim secret token for '([^']*)' dialog")]
        public void WhenUserRemembersScimSecretTokenForDialog(string dialogName)
        {
            var value = _driver.Component<Dialog>(dialogName).ScimSecretToken.GetAttribute("value");
            _secretToken.Value = value;
        }
    }
}