using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.QA;
using MjAutomationCore.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using System.Linq;
using Reqnroll;
using static SeleniumAutomationUtils.SeleniumExtensions.WebDriverExtensions;

namespace MjAutomationCore.Steps.WebAppProject.QA
{
    [Binding]
    class NewTabSteps : ReqnrollContext
    {
        private WebDriver _driver;
        private readonly BrowsersList _browsersList;

        public NewTabSteps(WebDriver driver, BrowsersList browsersList)
        {
            _driver = browsersList.GetBrowser();
            _browsersList = browsersList;
        }

        [When(@"User clicks '(.*)' template on Create new page")]
        public void WhenUserClicksTemplateOnCreateNewPage(string templateName)
        {
            var page = _driver.NowAt<NewTabPage>();
            _driver.WaitForElementsToBeDisplayed(page.TemplateList, WaitTime.Medium, false);
            _driver.ClickByActions(page.TemplateList.First(temp => temp.Text.Equals(templateName)));
        }

        [Then(@"following Themes are displayed for selected Template:")]
        public void ThenFollowingThemesAreDisplayedForSelectedTemplate(Table table)
        {
            var page = _driver.NowAt<NewTabPage>();
            var ThemsList = page.ThemeList.Select(x => x.GetAttribute("src")).ToList();
            var expectedThemsList = table.Rows.SelectMany(row => row.Values).ToList();

            foreach (string expected in expectedThemsList)
            {
                Assert.IsTrue(ThemsList.Any(x => x.Contains(expected)), $"Themes '{expected}' is not displayed");
            }
        }

        [When(@"User clicks Create button on the Create New page")]
        public void WhenUserClicksCreateButtonOnTheCreateNewPage()
        {
            var page = _browsersList.Active.NowAt<NewTabPage>();
            _browsersList.Active.WaitForElementToBeDisplayed(page.CreateButton, WaitTime.Long);
            _browsersList.Active.MoveToElement(page.CreateButton);
            _browsersList.Active.ClickByActions(page.CreateButton);
        }

        [Then(@"'(.*)' template is highlighted blue border on Create new page")]
        public void ThenTemplateIsHighlightedBlueBorderOnCreateNewPage(string templateName)
        {
            var page = _driver.NowAt<NewTabPage>();
            var colorBorder = page.TemplateList.First(temp => temp.Text.Contains(templateName)).GetCssValue("box-shadow");
            Assert.IsTrue(colorBorder.Contains("rgb(82, 173, 231)"), $"Template {templateName} is not highlighted blue border");
        }
    }
}