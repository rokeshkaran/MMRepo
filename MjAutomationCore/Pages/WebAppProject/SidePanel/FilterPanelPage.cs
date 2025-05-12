using MjAutomationCore.Extensions;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Pages;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;

namespace MjAutomationCore.Pages.WebAppProject.SidePanel
{
    class FilterPanelPage : BaseSidePanelPage, IContextContainer
    {
        public new By Context => By.XPath(".//div[@id='powerFilter']");

        [FindsBy(How = How.XPath, Using = ".//div[@class='saved-filter active']/span[text()='Saved Filter']")]
        public IWebElement SavedFilterSection { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='side-panel-group']//div[@class='btn-checkbox selected']")]
        public IList<IWebElement> CheckedCheckboxInFilterPopUp { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='side-panel-group']//div[@class='btn-checkbox']")]
        public IList<IWebElement> UncheckedCheckboxInFilterPopUp { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='menu']//*[@class='icon']")]
        public IWebElement FilterArrow { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='panel-container']//div[contains(@class,'btn-checkbox')]")]
        public IList<IWebElement> CheckboxList { get; set; }

        public string RemoveHistoryItem = "./following-sibling::div[contains(@class,'item-remove')]";

        public string EmptyContent = "./following-sibling::div[@class='content']/span[@class='empty-content']";

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By> { };
        }

        public bool DisplayedFilterPanel()
        {
            return Driver.IsElementDisplayed(Context, WebDriverExtensions.WaitTime.Short);
        }

        public bool AllCheckboxesChecked()
        {
            foreach (IWebElement element in CheckboxList)
            {
                if (!element.IsSelected())
                {
                    return false;
                }
            }
            return true;
        }

        public IWebElement GetRadioButtonInFilterPopup(string buttonName)
        {
            var selector = By.XPath($".//div[@class='match-toggle-buttons']/div[@data-match='{buttonName}']");
            return Driver.FindElement(selector);
        }
    }
}