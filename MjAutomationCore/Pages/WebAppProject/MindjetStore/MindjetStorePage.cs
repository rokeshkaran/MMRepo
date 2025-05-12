using MjAutomationCore.Base;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MjAutomationCore.Pages.WebAppProject.MindjetStore
{
    class MindjetStorePage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//main[@role='main']")]
        public IWebElement MindjetStoreMainPage { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@id='deliveryListenerStateId_chosen']")]
        public IWebElement CountryField { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'chosen-with-drop')]//div[@class='chosen-drop']")]
        public IWebElement MultiselectDropdown { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            {
                SelectorFor(this, p => p.MindjetStoreMainPage)
            };
        }

        public bool ErrorMessegeWithText(string messege, string text)
        {
            var selector = By.XPath($".//div[@class='block']//h1[text()='{messege}']/../../div[@class='blockHeadline']/following-sibling::div[@class='blockContent']/span[text()='{text}']");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Medium))
                throw new Exception($"Errore messege {messege} with {text} is not displayed");
            return Driver.IsElementDisplayed(selector);
        }

        public IWebElement GetButtonByName(string buttonName)
        {
            var selector = By.XPath($".//div[contains(@id,'cleverSubmit')]//input[@value='{buttonName}']");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Medium))
                throw new Exception($"Button {buttonName} is not displayed");
            return Driver.FindElement(selector);
        }

        public IWebElement GetSelecteContainerByName(string name)
        {
            var selector = By.XPath($".//span[text()='{name}']/parent::a[@class='chosen-single']/parent::div[contains(@class,'inputSelect')]");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Medium))
                throw new Exception($"{name} field is not displayed");
            return Driver.FindElement(selector);
        }

        public IList<IWebElement>GetElementsInDropdown()
        {
            var selector = By.XPath(".//ul[contains(@class,'chosen-results')]/li");
            Driver.WaitForElementInElementToBeDisplayed(MultiselectDropdown, selector);
            var elements = MultiselectDropdown.FindElements(selector);
            return elements;
        }

        public void SelectElementInDropdown(string value)
        {
            var el = GetElementsInDropdown().First(x => x.Text.Equals(value));
            Driver.MoveToElement(el);
            el.Click();
        }
    }
}