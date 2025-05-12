using AutomationUtils.Utils;
using MjAutomationCore.Components.Base;
using MjAutomationCore.Components.Licensing;
using MjAutomationCore.DTO.LicensingDTO.RunTimeVariables.Salesportal;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.Extensions;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using System;
using System.Linq;
using System.Threading;
using Reqnroll;

namespace MjAutomationCore.Steps.LicensingProject.Base
{
    [Binding]
    class ActionPanelSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly SessionRandomValue _sessionRandom;
        protected readonly CustomersDto _customers;

        public ActionPanelSteps(WebDriver driver, SessionRandomValue sessionRandom, CustomersDto customers)
        {
            _driver = driver;
            _sessionRandom = sessionRandom;
            _customers = customers;
        }

        [When(@"User enters Сustomer ID '(.*)' in '(.*)' field on Action panel")]
        public void WhenUserEntersСustomerIDInFieldOnActionPanel(string сustomerName, string field)
        {
            сustomerName = сustomerName.AddRandom(_sessionRandom);
            var сustomerId = _customers.Value.First(x => x.Name.Equals(сustomerName)).Id;
            var parent = _driver.Component<ActionPanel>().Context;
            _driver.GetComponent<InputByAttribute>(field, new Properties() { ParentSelector = parent }).ClearSendKeys(сustomerId);
            _driver.ActionsSendKeys("Enter");
        }

        [When(@"User enters '(.*)' value in the '(.*)' field on Action panel")]
        public void WhenUserEntersValueInTheFieldOnActionPanel(string value, string field)
        {
            value = value.AddRandom(_sessionRandom);
            var parent = _driver.Component<ActionPanel>().Context;
            _driver.WaitForElementToBeClickable(_driver.GetComponent<InputByAttribute>(field, new Properties() { ParentSelector = parent }));
            _driver.ClearByJavascript(_driver.GetComponent<InputByAttribute>(field, new Properties() { ParentSelector = parent }));
            _driver.GetComponent<InputByAttribute>(field, new Properties() { ParentSelector = parent }).SendKeys(value);
            Thread.Sleep(500);
            _driver.ActionsSendKeys("Enter");
            Thread.Sleep(500);
        }

        [When(@"User selects '(.*)' search option on Action panel")]
        public void WhenUserSelectsSearchOptionOnActionPanel(string option)
        {
            _driver.WaitForMultipleDataLoading();     
            _driver.Component<ActionPanel>().GetSearchOption().SelectboxSelect(option);
        }

        [Then(@"'(.*)' search option is selected on Action panel")]
        public void ThenSearchOptionIsSelectedOnActionPanel(string option)
        {
            Verify.IsTrue(_driver.Component<ActionPanel>().GetSearchOption().GetSelectedValueFromSelectbox().Equals(option), $"Search option '{option}' is not Selected on Action panel");
        }

        [When(@"User clicks Remove button in '(.*)' field on Action panel")]
        public void WhenUserClicksRemoveButtonInFieldOnActionPanel(string field)
        {
            var parent = _driver.Component<ActionPanel>().Context;
            var fieldElement = _driver.GetComponent<InputByAttribute>(field, new Properties() { ParentSelector = parent });
            var elementSize = fieldElement.Size;
            _driver.ActionsMoveToElementAndClick(fieldElement, elementSize.Width - 10, elementSize.Height - 15);
        }

        [Then(@"'([^']*)' button is disabled in admin search panel")]
        public void ThenButtonIsDisabledInAdminSearchPanel(string actionButtonName)
        {
            var actionPanelComponent = _driver.Component<ActionPanel>();
            Verify.IsTrue(actionPanelComponent.GetActionButtonByName(actionButtonName).IsDisabledState(), $"Button '{actionButtonName}' is enabled in admin search panel");
        }

        [Then(@"Tooltip '([^']*)' is displayed for Setup SSO button")]
        public void ThenTooltipIsDisplayedForSetupSSOButton(string tooltipText)
        {
            var actionPanelComponent = _driver.Component<ActionPanel>();
            var getButtonDetails = actionPanelComponent.GetActionButtonByName("Setup SSO");
            var classAttributeDetails = getButtonDetails.GetAttribute("class");
            if (classAttributeDetails.Contains("generated-tooltip"))
            {
                var getTooltipdetails = getButtonDetails.GetAttribute("data-tooltip");
                Verify.AreEqual(getTooltipdetails, tooltipText, $"Tooltip '{tooltipText}' is not displayed for Setup SSO button");
            }
            else
            {
                throw new Exception($"Tooltip '{tooltipText}' is not displayed for Setup SSO button.");
            }
        }
    }
}