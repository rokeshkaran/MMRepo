using SeleniumAutomationUtils.SeleniumExtensions;
using MjAutomationCore.Components.Licensing;
using Reqnroll;
using OpenQA.Selenium;
using MjAutomationCore.Extensions;
using AutomationUtils.Utils;
using MjAutomationCore.Components.Base;
using SeleniumAutomationUtils.Components;

namespace MjAutomationCore.Steps.LicensingProject.Components
{
    [Binding]
    class PaginationSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        public PaginationSteps(WebDriver driver)
        {
            _driver = driver;
        }

        [When(@"User selects '(.*)' value from '(.*)' menu in Pagination section")]
        public void WhenUserSelectsValueFromMenuInPaginationSection(string value, string menu)
        {
            _driver.MoveToElement(_driver.Component<Pagination>().GetOptionInMenu(menu));
            _driver.Component<Pagination>().GetOptionInMenu(menu).SelectboxSelect(value);
        }

        [When(@"User clicks '(.*)' button in Pagination section")]
        public void WhenUserClicksButtonInPaginationSection(string button)
        {
            _driver.Component<Pagination>().GetButtonByName(button).Click();
        }

        [Then("'(.*)' value is displayed in '(.*)' page number field in Pagination section")]
        public void ThenValueIsDisplayedInPageNumberField(string number, string name)
        {
            _driver.WaitForDataLoading();
            var parent = _driver.GetComponent<Pagination>();
            var actualNumber = _driver.GetComponent<InputByAttribute>(name, new Properties() { Parent = parent }).GetAttribute("value");
            Verify.AreEqual(number, actualNumber, $"'{number}' is not displayed in '{name}' field. Actua: '{actualNumber}'");
        }
    }
}
