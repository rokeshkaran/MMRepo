using MjAutomationCore.Components.Base;
using MjAutomationCore.Utils;
using OpenQA.Selenium;
using OpenQA.Selenium.Interactions;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using static SeleniumAutomationUtils.SeleniumExtensions.WebDriverExtensions;

namespace MjAutomationCore.Base
{
    public abstract class SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//body")]
        public IWebElement BodyContainer { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='paper-container']")]
        public IWebElement PaperContainer { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class, 'paper-editable')]")]
        public IWebElement PaperContainerEditable { get; set; }

        [FindsBy(How = How.XPath, Using = ".//*[@cursor='text']/*[contains(@class,'v-line') or contains(@class,'focused')] | .//*[contains(@class,'focused')]")]
        public IWebElement CursorInTopic { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'joint-tooltip')]/div[@class='tooltip-content']")]
        public IWebElement TooltipContent { get; set; }

        [FindsBy(How = How.XPath, Using = ".//iframe[not(@title='reCAPTCHA') and not(ancestor-or-self::*[contains(@style,'display: none;')]) and not(@class='ot-text-resize') and not(contains(@title,'onetrust'))]")]
        public IList<IWebElement> Iframe { get; set; }

        #region ColorPicker

        public string ColorButton = ".//following-sibling::div[@class='sp-replacer sp-light']//div[contains(@style,'background-color')]";

        public string DropDownArrowInColorButton = ".//following-sibling::div[@class='sp-replacer sp-light']//div[@class='sp-dd']";

        #endregion

        #region BaseMessageScreen

        public bool GetMessageHeader(string textHeader)
        {
            var selector = By.XPath($".//div[@class='message-screen']//div[@class='header']/h3[text()='{textHeader}']");
            return Driver.IsElementDisplayed(selector);
        }

        public bool GetMessageContent(string textContent)
        {
            var selector = By.XPath($".//div[@class='message-screen']//div[@class='content']//*[text()='{textContent}']");
            return Driver.IsElementDisplayed(selector,WebDriverExtensions.WaitTime.Medium);
        }

        #endregion

        #region PublishedPages

        [FindsBy(How = How.XPath, Using = ".//div[@class='section']//div[@class='logo-wrapper']")]
        public IWebElement LogoImageOnPage { get; set; }

        [FindsBy(How = How.XPath, Using = ".//input[@type ='text']")]
        public IWebElement GetCopyText { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='trial-message']//*[@class='trial-message-subscribe-link']")]
        public IWebElement LinkOnSubscribe { get; set; }

        public IWebElement GetButtonByNameBase(string buttonName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.ExtraLong)
        {
            var inputButton = By.XPath($".//input[contains(@class,'button')][@value=\"{buttonName}\"]");
            var button = By.XPath($".//*[contains(@class,'button')][contains(translate(text(), ' ', ' '),\"{buttonName}\")]");

            Driver.WaitForElementsToBeDisplayed(new List<By>() { inputButton, button }, waitTime, false);

            var inputButtonElements = Driver.FindElements(inputButton);
            if (inputButtonElements.Any())
            {
                return inputButtonElements.First();
            }
            else
            {
                var buttonElements = Driver.FindElements(button);
                var buttonElement = buttonElements.First(x => x.Text.TrimStart(' ').TrimEnd(' ').Equals(buttonName));
                return buttonElement;
            }
        }

        public bool DisplayedButtonByName(string buttonName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.ExtraLong)
        {
            try
            {
                return GetButtonByNameBase(buttonName, waitTime).Displayed();
            }
            catch
            {
                return false;
            }
        }

        #endregion

        public IWebElement GetFieldByName(string fieldName, string section = "")
        {
            var sectionSelector = string.IsNullOrEmpty(section) ?
                String.Empty : $".//h5[contains(text(),'{section}')]//following-sibling::div[@class='content']";
            var selector = By.XPath($"{sectionSelector}//*[contains(text(),'{fieldName}')]//parent::div//div[contains(@class,'input')]");
            return Driver.FindElement(selector);
        }

        public IWebElement GetTextAreaByClass(string className)
        {
            var selector = By.XPath($".//textarea[contains(@class, '{className}')][not(contains(@style, 'display: none;'))]");
            return Driver.FindElement(selector);
        }
        public WebDriver Driver { get; set; }

        public Actions Actions { get; set; }

        public void InitElements()
        {
            PageFactory.InitElements(Driver, this);
        }

        public virtual List<By> GetPageIdentitySelectors()
        {
            return GetType()
                .GetProperties()
                .Select(p => p.GetFirstDecoration<FindsByAttribute>())
                .Where(a =>
                    ((object)a) != null
                    && a != null)
                .Select(Utils.ByFactory.From)
                .ToList();
        }

        public By SelectorFor<TPage, TProperty>(TPage page, Expression<Func<TPage, TProperty>> expression)
        {
            var attribute = Extensions.ReflectionExtensions.ResolveMember(page, expression).GetFirstDecoration<FindsByAttribute>();
            return Utils.ByFactory.From(attribute);
        }
        public string GetStringByFor<TProperty>(Expression<Func<TProperty>> expression)
        {
            var attribute = ReflectionExtensions.ResolveMember(expression).GetFirstDecoration<FindsByAttribute>();
            return ByFactory.From(attribute).ToString().Split(": ").Last();
        }
    }
}
