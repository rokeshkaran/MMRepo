using AutomationUtils.Utils;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.MindManagerFiles;
using MjAutomationCore.Utils;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using System;
using System.Linq;
using System.Threading;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject
{
    [Binding]
    class BasePagesPublishedSteps : ReqnrollContext
    {
        private WebDriver _driver;
        private readonly BrowsersList _browsersList;
        private readonly ValuesText _valuesText;

        public BasePagesPublishedSteps(WebDriver driver, BrowsersList browsersList, ValuesText valuesText)
        {
            _driver = browsersList.GetBrowser();
            _browsersList = browsersList;
            _valuesText = valuesText;
        }

        [Then(@"header '(.*)' is displayed on page")]
        public void ThenHeaderIsDisplayedOnPage(string title)
        {

            for (int i = 0; i < 30; i++)
            {
                var page = _driver.NowAt<BaseExtensionsPage>();
                try
                {
                    if (page.Iframe.Any())
                    {
                        _driver.SwitchToSpecificFrame(page.Iframe[0]);
                    }

                    if (_driver.IsElementExists(page.Page))
                    {
                        Verify.IsTrue(page.GetTitleOnPage(title).Displayed(), $"{title} is not displayed on page");
                        _driver.SwitchTo().DefaultContent();
                        return;
                    }
                }
                finally { Thread.Sleep(1000); }
            }
            _driver.SwitchTo().DefaultContent();
            throw new Exception("Page is not displayed");
        }

        [When(@"User clicks on the '(.*)' button and opens in a new browser tab")]
        public void WhenUserClicksOnTheButtonAndOpensInANewBrowserTab(string buttonName)
        {
            for (int i = 0; i < 30; i++)
            {
                var page = _browsersList.Active.NowAt<BaseExtensionsPage>();
                try
                {
                    if (page.Iframe.Any())
                    {
                        _browsersList.Active.SwitchToSpecificFrame(page.Iframe[0]);
                    }

                    if (_browsersList.Active.IsElementExists(page.Page))
                    {
                        page.GetButtonByNameBase(buttonName).Click();
                        _browsersList.Active.InsertFromClipboard(page.GetCopyText);
                        var getText = page.GetCopyText.GetAttribute("value");
                        _valuesText.Value = getText;
                        _browsersList.Active.OpenInNewTab(getText);
                        _browsersList.Active.SwitchTo().Window(_driver.WindowHandles.Last());
                        _browsersList.Active.SwitchTo().DefaultContent();
                        return;
                    }
                }
                finally { Thread.Sleep(1000); }
            }
            _browsersList.Active.SwitchTo().DefaultContent();
            throw new Exception("Page is not displayed");
        }

        [When(@"User clicks '([^']*)' button on the page")]
        public void WhenUserClicksButtonOnThePage(string buttonName)
        {
            for (int i = 0; i < 30; i++)
            {
                var page = _driver.NowAt<BaseExtensionsPage>();
                try
                {
                    if (page.Iframe.Any())
                    {
                        _driver.SwitchToSpecificFrame(page.Iframe[0]);
                    }

                    if (_driver.IsElementExists(page.Page))
                    {
                        page.GetButtonByNameBase(buttonName).Click();
                        _driver.SwitchTo().Window(_driver.WindowHandles.Last());
                        _driver.SwitchTo().DefaultContent();
                        return;
                    }
                }
                finally { Thread.Sleep(1000); }
            }
            _driver.SwitchTo().DefaultContent();
            throw new Exception("Page is not displayed");
        }

    }
}
