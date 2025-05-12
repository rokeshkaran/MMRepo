using System;
using System.Collections.Generic;
using SeleniumAutomationUtils.SeleniumExtensions;
using OpenQA.Selenium;
using SeleniumExtras.PageObjects;
using SeleniumAutomationUtils.Pages;

namespace MjAutomationCore.Pages.WebAppProject.MenuToolbar
{
    class MenuToolbarBasePage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[@class='search toolbar-component']")]
        public IWebElement SearchButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='search-controls']/a[@class='search-prev']")]
        public IWebElement PrevButtonOnSearchToolbar { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='search-controls']/a[@class='search-next']")]
        public IWebElement NextButtonOnSearchToolbar { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'search')]//input[@class='search-input']")]
        public IWebElement InputFieldOnSearchToolbar { get; set; }

        [FindsBy(How = How.XPath, Using = ".//a[contains(@class,'logo-icon')] | .//a[contains(@class,'toolbar-logo')]")]

        public IWebElement LogoImageOnToolbar { get; set; }
        
        [FindsBy(How = How.XPath, Using = ".//*[contains(@id,'toolbar-file-name')]")]
        public IWebElement MapNameOnToolbar { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='auto-save']")]
        public IWebElement AutosaveLabel { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='auto-save']//*[@class='mm-switch']//span[@class='slider']")]
        public IWebElement AutosaveSwitcher { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            { };
        }

        public IWebElement GetButtonByNameOnToolbar(string buttonName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Medium)
        {
            var selector = By.XPath($".//div[contains(@id,'toolbar')]//span[text()='{buttonName}']/parent::*");
            if (!Driver.IsElementDisplayed(selector, waitTime))
            {
                throw new Exception($"Button '{buttonName}' is not displayed on Toolbar");
            }
            return Driver.FindElement(selector);
        }

        public bool DisplayedButton(string buttonName)
        {
            try
            {
                return GetButtonByNameOnToolbar(buttonName, WebDriverExtensions.WaitTime.Second).Displayed();
            }
            catch
            {
                return false;
            }
        }

        public bool DisplayedLogoOnToolbar()
        {
            var logo = LogoImageOnToolbar.GetAttribute("style").Contains("background-image");
            return logo;
        }

        #region SearchToolbar

        public IWebElement GetSearchControlLabel(string label)
        {
            var selector = By.XPath($".//div[@class='search-controls']/span[text()='{label}']");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Search control label '{label}' is not dipslayed on Search toolbar");
            }

            return Driver.FindElement(selector);
        }

        #endregion

        #region Autosave
        public bool DisplayedAutosaveLabel()
        {
            var lable = AutosaveLabel.GetAttribute("style");
            return lable.Equals(string.Empty);
        }

        public string GetSwitcherByName(string switcher)
        {
            var selector = $"./span[text()='{switcher}']";
            return selector;
        }

        public bool GetSwitchStatusForAutosave(string switcher)
        {
            var status = AutosaveSwitcher.FindElement(By.XPath(GetSwitcherByName(switcher)));
            return Driver.IsElementDisplayed(status);
        }

        #endregion

    }
}