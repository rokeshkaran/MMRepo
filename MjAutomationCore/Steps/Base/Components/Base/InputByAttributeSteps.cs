using AutomationUtils.Utils;
using MjAutomationCore.Components.Base;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Extensions;
using MjAutomationCore.Utils;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using Reqnroll;

namespace MjAutomationCore.Steps.Base.Components.Base
{
    [Binding]
    class InputByAttributeSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsers;
        private readonly SessionRandomValue _sessionRandom;
        private readonly ValuesText _valuesText;

        public InputByAttributeSteps(BrowsersList browsers, SessionRandomValue sessionRandom, ValuesText valuesText)
        {
            _browsers = browsers;
            _sessionRandom = sessionRandom;
            _valuesText = valuesText;
        }

        [When(@"User enters '([^']*)' value in '([^']*)' field of '([^']*)' container")]
        public void WhenUserEntersValueInFieldOfContainer(string enteredValue, string fieldName, string container)
        {
            enteredValue = enteredValue.AddRandom(_sessionRandom);
            var parentSelector = WebContainer.GetContainerSelector(container);
            _browsers.Active.GetComponent<InputByAttribute>(fieldName, new Properties() { ParentSelector = parentSelector }).ClearSendKeys(enteredValue);
        }

        [Then(@"value '([^']*)' is displayed in '([^']*)' field of '([^']*)' container")]
        public void ThenValueIsDisplayedInFieldOfContainer(string expectedValue, string fieldName, string container)
        {
            expectedValue = expectedValue.AddRandom(_sessionRandom);
            var parent = WebContainer.GetContainerSelector(container);
            var actualValue = _browsers.Active.GetComponent<InputByAttribute>(fieldName, new Properties() { ParentSelector = parent }).GetAttribute("value");
            Verify.AreEqual(actualValue, expectedValue, $"Expected value '{expectedValue}' is not displayed in '{fieldName}' field of '{container}' container");
        }

        [Then(@"'([^']*)' input filed is displayed in '([^']*)' container")]
        public void ThenInputFiledIsDisplayedInContainer(string inputFieldName, string container)
        {
            _browsers.Active.ComponentDisplayedState<InputByAttribute>(inputFieldName, new Properties() { WaitTime = WebDriverExtensions.WaitTime.Short });
            var parent = WebContainer.GetContainerSelector(container);
            var state = _browsers.Active.ComponentDisplayedState<InputByAttribute>(inputFieldName, new Properties() { ParentSelector = parent, WaitTime = WebDriverExtensions.WaitTime.Short });
            Verify.IsTrue(state, $"Input field '{inputFieldName}' is not displayed in '{container}' container");
        }

        [Then(@"'([^']*)' input field is highlighted in '([^']*)' color in '([^']*)' container")]
        public void ThenInputFieldIsHighlightedInColorInContainer(string inputFieldName, string color, string container)
        {
            var parent = WebContainer.GetContainerSelector(container);
            var actualValue = _browsers.Active.GetComponent<InputByAttribute>(inputFieldName, new Properties() { ParentSelector = parent }).GetCssValue("border");
            Verify.Contains(color, actualValue, $"Expected value '{actualValue}' is not displayed in '{color}' field of '{container}' container");
        }

        [When(@"User clicks on '([^']*)' field of '([^']*)' container")]
        public void WhenUserClicksOnFieldOfContainer(string fieldName, string container)
        {
            var parentSelector = WebContainer.GetContainerSelector(container);
            _browsers.Active.GetComponent<InputByAttribute>(fieldName, new Properties() { ParentSelector = parentSelector }).Click();
        }

        [Then(@"'(.*)' enter field is displayed to User")]
        public void ThenEnterFieldIsDisplayedToUser(string fieldName)
        {
            Verify.IsTrue(_browsers.Active.ComponentDisplayedState<InputByAttribute>(fieldName), $"Enter field '{fieldName}' is not displayed to User");
        }

        [Then(@"'(.*)' enter field is not displayed to User")]
        public void ThenEnterFieldIsNotDisplayedToUser(string fieldName)
        {
            Verify.IsFalse(_browsers.Active.ComponentDisplayedState<InputByAttribute>(fieldName), $"Enter field '{fieldName}' is displayed to User");
        }

        [Then(@"'(.*)' value is displayed to the '(.*)' field")]
        public void ThenValueIsDisplayedToTheField(string expectedValue, string fieldName)
        {
            expectedValue = expectedValue.AddRandom(_sessionRandom);
            var actualValue = _browsers.Active.GetComponent<InputByAttribute>(fieldName).GetText();
            Verify.AreEqual(actualValue, expectedValue, $"Value '{expectedValue}' is not displayed to the '{fieldName}' field");
        }

        [When(@"User clicks '(.*)' input field")]
        public void WhenUserClicksInputField(string fieldName)
        {
            _browsers.Active.GetComponent<InputByAttribute>(fieldName).Click();
        }

        [When(@"User enters '(.*)' in the '(.*)' field")]
        public void WhenUserEntersInTheField(string value, string fieldName)
        {
            var field = _browsers.Active.GetComponent<InputByAttribute>(fieldName);
            _browsers.Active.WaitForElementToBeDisplayed(field);
            value = value.AddRandom(_sessionRandom);
            if (fieldName != "password")
            {
                field.ClearSendKeys(value);
            }
            else
            {
                _browsers.Active.ClearSendKeyByJavascript(field, value);
            }
        }

        [When(@"User pastes copied key into '(.*)' field")]
        public void WhenUserPastesCopiedKeyIntoField(string fieldName)
        {
            _browsers.Active.ClearSendKeyByJavascript(_browsers.Active.GetComponent<InputByAttribute>(fieldName), _valuesText.Value);
        }

        [When(@"User clean existing value in '(.*)' field")]
        public void WhenUserCleanExistingValueInField(string fieldName)
        {
            _browsers.Active.GetComponent<InputByAttribute>(fieldName).Clear();
        }

        [Then(@"'(.*)' placeholder is displayed in '(.*)' enter field")]
        public void ThenPlaceholderIsDisplayedInEnterField(string expectedPlaceholder, string fieldName)
        {
            var actualPlaceholder = _browsers.Active.GetComponent<InputByAttribute>(fieldName).GetAttribute("placeholder");
            Verify.AreEqual(actualPlaceholder ,expectedPlaceholder, $"placeholder is not displayed in field '{fieldName}'. Actual placeholder: '{expectedPlaceholder}'");
        }

        [Then(@"'(.*)' input field is disabled on the page")]
        public void ThenInputFieldIsDisabledOnThePage(string fieldName)
        {
            Verify.IsTrue(_browsers.Active.GetComponent<InputByAttribute>(fieldName).IsDisabledState(), $"Input field '{fieldName}' is displayed enabled");
        }
    }
}