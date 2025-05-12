using System.Collections.Generic;
using System.Linq;
using SeleniumAutomationUtils.SeleniumExtensions;
using MjAutomationCore.Base;
using MjAutomationCore.Extensions;
using OpenQA.Selenium;
using SeleniumExtras.PageObjects;

namespace MjAutomationCore.Pages.WebAppProject.QA
{
    class MyFilesCloudPage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[@class='user-panel']/img[contains(@class,'avatar')]")]
        public IWebElement ImgAvatar { get; set; }

        [FindsBy(How = How.XPath, Using = ".//button[contains(@class,'settings')]")]
        public IWebElement SettingsButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@style='display: none;'][text()='No content found.']")]
        public IWebElement MessageTitleCloudPage { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@id='contentManager']//div[text()='File Options']")]
        public IWebElement FileOptionsTitle { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'option-az')]//div[contains(@class,'checkmark-icon')]")]
        public IWebElement CheckMarkIconOnCloudPage { get; set; }

        [FindsBy(How = How.XPath, Using = ".//input[contains(@class,'search')]")]
        public IList<IWebElement> SearchFieldOnCloudPage { get; set; }

        [FindsBy(How = How.XPath,Using = ".//button[contains(@class,'clear-search active')][@style='visibility: visible;']")]
        public IWebElement ButtonClearSearchField { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='content-item file']//div[contains(@class,'next-icon')]")]
        public IWebElement NextButtonForCloudFile { get; set; }

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            {
                SelectorFor(this, p => p.ImgAvatar)
            };
        }

        public List<string> GetСloudsFilesFromList()
        {
            var by = By.XPath($".//div[@class='content-item file']//div[@class='title']");
            Driver.WaitForElementToBeDisplayed(by);
            return Driver.FindElements(by).Select(x => x.Text).ToList();
        }

        public void GetFileOptionsByName(string tabName)
        {
            var tabSelector = $".//div[@class='main']/div[text()='{tabName}']";
            Driver.WaitForDataLoading();
            Driver.FindElement(By.XPath(tabSelector)).Click();
        }
    }
}