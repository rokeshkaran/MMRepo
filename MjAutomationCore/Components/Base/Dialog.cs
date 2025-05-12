using MjAutomationCore.Utils;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MjAutomationCore.Components.Base
{
    class Dialog : BaseWebComponent, IWebComponent
    {
        public By Container => By.XPath($".//div[contains(@class,'dialog')][contains(@class,'{Identifier}') or @data-type='{Identifier}' or @id='{Identifier}']//*[contains(@class,'fg')]");

        protected override By Construct()
        {
            return Container;
        }

        [FindsBy(How = How.XPath, Using = ".//*[@class='dialog-text' or @class='body']")]
        public IWebElement DialogText { get; set; }

        [FindsBy(How = How.XPath, Using = ".//*[@class='body']/img")]
        public IWebElement TopicImageViewerMode { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'info-dialog')][contains(@class,'warning')]")]
        public IWebElement DialogWarningMessage { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='error-bula-accept'] ")]
        public IWebElement BulaDialogWarningMessage { get; set; }

        [FindsBy(How = How.XPath, Using = ".//select[@class='scim-group-select']")]
        public IWebElement ScimGroupSelect { get; set; }

        [FindsBy(How = How.XPath, Using = ".//input[@name='scim_secret_token']")]
        public IWebElement ScimSecretToken { get; set; }

        [FindsBy(How = How.XPath, Using = ".//input[@class='confirm-input']")]
        public IWebElement ConfirmInputField { get; set; }

        [FindsBy(How = How.XPath, Using = ".//button[@class='dialog-close-button' or @class='btn-close' or @class='btn-close center-button']")]
        public IWebElement DialogCloseButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//button[contains(@id,'cancel-button')]")]
        public IWebElement DialogCancelButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//span")]
        public IWebElement FormLicenseDialogDeleteSpan { get; set; }

        [FindsBy(How = How.XPath, Using = ".//b[contains(@class,'delete-id')]")]
        public IWebElement FormLicenseDialogDeleteId { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div")]
        public IWebElement FormLicenseDialogDeleteDiv { get; set; }

        [FindsBy(How = How.XPath, Using = ".//*[contains(@class,'box-content')]")]
        public IList<IWebElement> BoxContentSections { get; set; }

        public IWebElement GetButtonByName(string buttonName)
        {
            var selector = By.XPath($".//button[text()='{buttonName}'] | .//*[@class='{buttonName}'] | .//button/span[text()='{buttonName}']");
            if (!Driver.IsElementInElementDisplayed(Instance, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"'{buttonName}' button is not displayed in Dialog");
            }
            return Instance.FindElement(selector);
        }

        public bool IsButtonDisplayed(string buttonName)
        {
            try
            {
                return Driver.IsElementDisplayed(GetButtonByName(buttonName));
            }
            catch
            {
                return false;
            }
        }

        public bool DisplayedErrorMessage(string textErrorMessage)
        {
            var selector = By.XPath($"(.//p[@class='dialog-content section-errors'][text()='{textErrorMessage}']) | (.//div[contains(@class,'info-dialog-section icon-warning')]//p[text()='{textErrorMessage}'])");
            if (!Driver.IsElementInElementDisplayed(Instance, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Error message with '{textErrorMessage}' text is not displayed in Dialog");
            }

            return true;
        }

        public bool DisplayedHeaderInDialog(string header)
        {
            var selector = By.XPath($".//h2[text()='{header}']");
            if (!Driver.IsElementInElementDisplayed(Instance, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"'{header}' header is not displayed in Dialog");
            }

            return true;
        }

        public bool DisplayedSubheaderInDialog(string subheader)
        {
            var subHeader = By.XPath($"(.//h3[@class='dialog-subheader']/b[text()='{subheader}'] | .//h3[@class='dialog-subheader'][text()='{subheader}'])");

            if (Driver.IsElementInElementDisplayed(Instance, subHeader, WebDriverExtensions.WaitTime.Short))
            {
                return true;
            }

            throw new Exception($"'{subheader}' subheader is not displayed in Dialog");
        }

        public IWebElement GetContent()
        {
            var selector = By.XPath(".//p");
            if (!Driver.IsElementInElementDisplayed(Instance, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Section content is not displayed in Dialog");
            }

            return Instance.FindElement(selector);
        }

        public bool IsTextDisplayedInDialog(string textValue)
        {
            var selector = By.XPath($".//p[contains(., '{textValue}')]");
            if (!Driver.IsElementInElementDisplayed(Instance, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Expected text '{textValue}' is not displayed in the '{Identifier}' dialog");
            }

            return true;
        }

        public IWebElement GetLinkInDialog(string link)
        {
            var selector = By.XPath($".//a[@target][text()='{link}']");
            if (!Driver.IsElementInElementDisplayed(Instance, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"'{link}' link is not displayed in Dialog");
            }

            return Instance.FindElement(selector);
        }

        public IWebElement GetFieldNameInDialog(string fieldName)
        {
            var selector = By.XPath($".//label[text()='{fieldName}']");
            if (!Driver.IsElementInElementDisplayed(Instance, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Filed '{fieldName}' is not displayed in Dialog");
            }
            return Instance.FindElement(selector);
        }

        public IWebElement GetInputFiled(string filedName)
        {
            var selector = By.XPath($"./following-sibling::input[1]");
            if (!Driver.IsElementInElementDisplayed(GetFieldNameInDialog(filedName), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Input field '{filedName}' is not displayed in Dialog");
            }
            return GetFieldNameInDialog(filedName).FindElement(selector);
        }

        public IWebElement GetSelectContainer(string filedName)
        {
            var selector = By.XPath($"./following-sibling::span[contains(@class,'select2-container')]");
            if (!Driver.IsElementInElementDisplayed(GetFieldNameInDialog(filedName), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Select container '{filedName}' is not displayed in Dialog");
            }
            return GetFieldNameInDialog(filedName).FindElement(selector);
        }

        public IWebElement GetSelectboxInDialog(string filedName)
        {
            var selector = By.XPath($"./following-sibling::select[@name]");
            if (!Driver.IsElementInElementDisplayed(GetFieldNameInDialog(filedName), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Selectbox '{filedName}' is not displayed in Dialog");
            }
            return GetFieldNameInDialog(filedName).FindElement(selector);
        }

        public IWebElement GetButtonByNameInDialog(string buttonName)
        {
            var selector = By.XPath($".//button[text()='{buttonName}']");
            if (!Driver.IsElementInElementDisplayed(Instance, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Button '{buttonName}' is not displayed in Dialog");
            }

            return Instance.FindElement(selector);
        }

        public IWebElement GetRadiobuttonByNameInDialog(string radiobuttonName)
        {
            var selector = By.XPath($".//div[@class='dialog-add-manage-users-actions']//label[text()='{radiobuttonName}']/preceding-sibling::input[@type='radio']");
            if (!Driver.IsElementInElementDisplayed(Instance, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Radiobutton '{radiobuttonName}' is not displayed in Dialog");
            }

            return Instance.FindElement(selector);
        }

        public bool StateRadiobutton(string radiobuttonName)
        {
            if (GetRadiobuttonByNameInDialog(radiobuttonName).IsAttributePresent("checked"))
            {
                return true;
            }

            else return false;
        }

        public IWebElement GetSectionByName(string sectionName)
        {
            var selector = By.XPath($".//p[text()='{sectionName}']//parent::div");
            if (!Driver.IsElementInElementDisplayed(Instance, selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Section '{sectionName}' is not displayed in the '{Identifier}' dialog");
            }
            return Instance.FindElement(selector);
        }

        public IWebElement GetSelectBoxBySection(string sectionName)
        {
            var section = GetSectionByName(sectionName);
            var selector = By.XPath($".//following-sibling::*//*[contains(@class,'joint-select-box')]");
            if (!Driver.IsElementInElementDisplayed(section, selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Select box is not displayed in section '{sectionName}' in the '{Identifier}' dialog");
            }
            return section.FindElement(selector);
        }

        public IWebElement GetSelectBoxByLabelInSection(string sectionName, string label)
        {
            var section = GetBoxContentSectionByName(sectionName);
            var selector = By.XPath($".//label[text()='{label}']//following-sibling::*//*[contains(@class,'joint-select-box')] | .//*[@class='{label}'] | .//*[text()='{label}']//preceding-sibling::*//*[contains(@class,'joint-select-box')]");
            if (!Driver.IsElementInElementDisplayed(section, selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Select box with label '{label}' is not displayed in section '{sectionName}' ");
            }
            return section.FindElement(selector);
        }
        public IWebElement GetSelectBoxByText(string text)
        {
            var selector = By.XPath($".//*[text()='{text}']//preceding-sibling::*//*[contains(@class,'select-box-option-content')]");
            if (!Driver.IsElementInElementDisplayed(Instance, selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Select box next to '{text}' text is not displayed");
            }
            return Instance.FindElement(selector);
        }

        public IWebElement GetBoxContentSectionByName(string sectionName)
        {            
            var selector = By.XPath($".//p");
            if (BoxContentSections.Any(x => x.FindElement(selector).Text.Equals(sectionName)))
            {
                return BoxContentSections.First(x => x.FindElement(selector).Text.Equals(sectionName));
            }
            throw new Exception($"Box сontent section '{sectionName}' is not displayed in '{Identifier}' dialog");         
        }

        public IWebElement GetShortcutSectionByName(string sectionName)
        {
            var selector = By.XPath($".//p[text()='{sectionName}']//parent::div//div[contains(@class,'shortcut-item-container')]");
            if (!Driver.IsElementInElementDisplayed(Instance, selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Shortcut container '{sectionName}' is not displayed in Dialog");
            }
            return Instance.FindElement(selector);
        }

        public List<IWebElement> GetShortcutItemList(string sectionName)
        {
            var selector = By.XPath($".//div[@class='shortcut-item']/div[1]/p");
            return GetShortcutSectionByName(sectionName).FindElements(selector).ToList();
        }

        public List<IWebElement> GetValueList(string sectionName)
        {
            var selector = By.XPath($".//div[@class='shortcut-item']/div[2]/p");
            return GetShortcutSectionByName(sectionName).FindElements(selector).ToList();
        }

        public List<KeyValuePair<string,string>> GetValuePairInSection(string sectionName)
        {
            var dataList = new List<KeyValuePair<string, string>>();
            List<string> shortcutItemList = GetShortcutItemList(sectionName).Select(x => x.Text).ToList();
            List<string> values = GetValueList(sectionName).Select(x => x.Text).ToList();

            return shortcutItemList.ToDictionary(x => x, x => values[shortcutItemList.IndexOf(x)]).ToList();
        }

        public IWebElement GetTitleBarCloseButton()
        {
            return Driver.Component<Titlebar>(new Properties() { Parent = Instance }).GetTitleBarCloseButton();
        }

        public bool DisplayedTitleBar(string titleBar)
        {
            return Driver.GetComponent<Titlebar>(new Properties() { Parent = Instance }).Text.Equals(titleBar); 
        }

        public IWebElement GetInputField(string inputName)
        {
            return Driver.GetComponent<InputByAttribute>(inputName, new Properties() { Parent = Instance });
        }

        public IWebElement GetInputTextArea(string input, string dialogName)
        {
            var selector = By.XPath($".//textarea[@type='{input}']");
            if (!Driver.IsElementInElementDisplayed(Instance, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"'{input}' input is not displayed in {dialogName} Dialog");
            }
            return Instance.FindElement(selector);
        }
    }
}
