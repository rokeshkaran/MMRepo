using System.Collections.Generic;
using System.Linq;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumAutomationUtils.Pages;
using OpenQA.Selenium;
using SeleniumExtras.PageObjects;

namespace MjAutomationCore.Pages.WebAppProject.FileManager
{
    class FileManagerContentPage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[@class='file-manager']")]
        public IWebElement FileManager { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='maps-container']//div[@data-no-matching-files]")]
        public IWebElement MatchingFiles { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='maps-container']//div[contains(@class,'map map-file')][not(contains(@class,'hidden'))]")]
        public IList<IWebElement> PublishedFileList { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class, 'maps-delete')]")]
        public IWebElement MapsDeleteButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class, 'no-files')]")]
        public IWebElement NoFilesIcon { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class, 'map-group-actions')]")]
        public IWebElement MapGroupActions { get; set; }

        public string MapNameSelector = ".//div[@class='map-name']";

        public string ButtonSelector = ".//div[@class='map-actions']/div[@class='file-main-action'][text()='{0}']";

        public string IconButtonSelector = ".//div[@class='map-actions']/div[contains(@class,'map-action')][@data-tooltip='{0}']";

        public string ViewCountSelector = ".//div[@class='map-actions']/*[@data-tooltip='Views' and text()='{0}']";

        public string DownArrow = ".//div[@class='map-actions']/div[@class='map-action map-other']";

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            {
                SelectorFor(this, p=> p.FileManager)
            };
        }

        public IWebElement GetRowByName(string fileName)
        {
            Driver.WaitForElementsToBeDisplayed(PublishedFileList);
            return PublishedFileList.ToList().Find(x => x.FindElement(By.XPath(MapNameSelector)).Text.Equals(fileName));
        }

        public IWebElement GetButtonByNameInRow(string fileName, string buttonName)
        {
            var selector = By.XPath(string.Format(ButtonSelector, buttonName));
            if (!Driver.IsElementInElementDisplayed(GetRowByName(fileName), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new NoSuchElementException($"Button '{buttonName}' is not displayed in row with '{fileName}' file name");
            }
            return GetRowByName(fileName).FindElement(selector);
        }

        public IWebElement GetViewCountByNameInRow(string fileName, string viewCount)
        {
            var selector = By.XPath(string.Format(ViewCountSelector, viewCount));
            if (!Driver.IsElementInElementDisplayed(GetRowByName(fileName), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new NoSuchElementException($"View Count of '{viewCount}' is not displayed in row with '{fileName}' file name");
            }
            return GetRowByName(fileName).FindElement(selector);
        }

        public IWebElement GetIconButtonInRow(string fileName, string iconButton)
        {
            var selector = By.XPath(string.Format(IconButtonSelector, iconButton));
            if (!Driver.IsElementInElementDisplayed(GetRowByName(fileName), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new NoSuchElementException($"Icon button '{iconButton}' is not displayed in row with '{fileName}' file name");
            }
            return GetRowByName(fileName).FindElement(selector);
        }
        public bool IsButtonEnabled(string button)
        {
            var selector = By.XPath($".//div[contains(@class, 'map-group-actions')]//div[contains(@class, '{button}')]/parent::*");
            return !Driver.FindElement(selector).GetAttribute("class").Contains("disabled");
        }

        public bool IsMarkedAsFavourite(string button, string file)
        {
            return GetIconButtonInRow(file, button).GetAttribute("class").Contains("on");
        }
    }
}