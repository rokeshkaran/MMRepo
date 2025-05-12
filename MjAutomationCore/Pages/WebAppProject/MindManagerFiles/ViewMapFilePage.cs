using System.Collections.Generic;
using System.Linq;
using SeleniumAutomationUtils.SeleniumExtensions;
using MjAutomationCore.Base;
using OpenQA.Selenium;
using SeleniumExtras.PageObjects;

namespace MjAutomationCore.Pages.WebAppProject.MindManagerFiles
{
    public class ViewMapFilePage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[@class='joint-paper-grid']")]
        public IWebElement ViewMapFileGrid { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class, 'input-date')]/input")]
        public IWebElement PopUpInputDateField { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div/input[@type='select-multiple']")]
        public IWebElement PopUpResourcesField { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@id='lightbox']//img")]
        public IWebElement AttachmentImage { get; set; }

        [FindsBy(How = How.XPath, Using = ".//*[contains(@class, 'filter-toggle')]")]
        public IWebElement FilterOnOffButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='saved-filter-button']")]
        public IWebElement SavedFiltedSwitcher { get; set; }
        
        [FindsBy(How = How.XPath, Using = ".//span[@class='saved-filter-button-label']")]
        public IWebElement SavedFiltedSwitcherLabel { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            {
                SelectorFor(this, p => p.ViewMapFileGrid)
            };
        }

        public IWebElement GetValueInSeclionName(string sectionName)
        {
            var selector = By.XPath($".//div[@class='properties-property']/div[text()='{sectionName}']/following::input[@type='text']");
            return Driver.FindElement(selector);
        }

        public IList<IWebElement> GetTextFromSideMenuPopUp(string text)
        {
            var selector = By.XPath($".//*[contains(@class,'group')]//*[text()='{text}']");
            return Driver.FindElements(selector);
        }

        public bool IsTopcikHighlighted(string topicName)
        {
            var text = topicName.Split(' ')
                .Aggregate(string.Empty, (current, s) => current + $"[contains(text(),'{s}')]");
            var topicSelector = By.XPath($".//div[contains(@class,'joint-paper-scroller')]/ancestor::div//*{text}");
            Driver.WaitForElementToBeDisplayed(topicSelector);
            var topicLocation = Driver.FindElement(topicSelector).Location;

            var highlightSelector = By.XPath(".//*[@class='search-highlights']/*[@fill='yellow']");
            Driver.WaitForElementToBeDisplayed(highlightSelector);
            Driver.IsElementExists(highlightSelector);
            var highlightLocation = Driver.FindElement(highlightSelector).Location;
            var resultX = topicLocation.X - 30 <= highlightLocation.X && highlightLocation.X <= topicLocation.X + 30;
            var resultY = topicLocation.Y - 20 <= highlightLocation.Y && highlightLocation.Y <= topicLocation.Y + 20;
            return resultX && resultY;
        }
    }
}