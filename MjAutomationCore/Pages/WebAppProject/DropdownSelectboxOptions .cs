using SeleniumAutomationUtils.SeleniumExtensions;
using OpenQA.Selenium;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using SeleniumAutomationUtils.Pages;

namespace MjAutomationCore.Pages.WebAppProject
{
    class DropdownSelectboxOptions : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'rendered')]")]
        public IWebElement DropdownMenuOptions { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By> { };
        }

        public IList<IWebElement> GetContentValueInDopdownOptionList()
        {
            var selector = By.XPath("./div[contains(@class,'select-box-option-content')]");
            if (!Driver.IsElementInElementDisplayed(DropdownMenuOptions, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"value does not exist in drop down menu option");
            }
            return DropdownMenuOptions.FindElements(selector);
        }

        public IWebElement GetDropDownMenuOption(string value)
        {
            IWebElement option = null;
            try
            {
                if (GetContentValueInDopdownOptionList().Any(x => x.Text.Equals(value)))
                {
                    option = GetContentValueInDopdownOptionList().First(x => x.Text.Equals(value));
                }
                else
                {
                    var allEl = GetContentValueInDopdownOptionList().ToList().FindAll(x => x.FindElement(By.XPath("./*/*")).IsAttributePresent("stroke-dasharray"));
                    option = allEl.First(el => el.FindElement(By.XPath("./*/*")).GetAttribute("stroke-dasharray").Equals(value));
                }
            }
            catch (InvalidOperationException e)
            {
                throw new InvalidOperationException($"'{value}' value is not exist in drop down menu option");
            }
            return option;
        }
    }
}