using System.Linq;
using SeleniumAutomationUtils.SeleniumExtensions;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.QA;
using MjAutomationCore.Utils;
using NUnit.Framework;
using OpenQA.Selenium.Remote;
using Reqnroll;
using OpenQA.Selenium;

namespace MjAutomationCore.Steps.WebAppProject.WebEditor
{
    [Binding]
    class TagView : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly BrowsersList _browsers;

        public TagView(WebDriver driver, BrowsersList browsersList)
        {
            _driver = browsersList.GetBrowser();
            _browsers = browsersList;
        }

        [Then(@"title '(.*)' is displayed on the Tag View page")]
        public void ThenTitleIsDisplayedOnTheTagViewPage(string title)
        {
            var page = _driver.NowAt<TagViewPage>();
            Assert.IsTrue(page.GetTitleOnTagView(title).Displayed(),$"{title} title is not displayed");
        }

        [Then(@"following columns are displayed on Tag View page")]
        public void ThenFollowingColumnsAreDisplayedOnTagViewPage(Table table)
        {
            var page = _driver.NowAt<TagViewPage>();
            var columns = page.ColumnsList.Select(column => column.Text).ToList();
            var expectedColumns = table.Rows.SelectMany(row => row.Values).ToList();
            foreach (string content in columns)
            {
                Assert.IsTrue(expectedColumns.Contains(content),
                    $"'{content}' columns are displayed incorrectly");
            }
        }

        [Then(@"following tags columns from '(.*)' group are displayed on Tag View page:")]
        public void ThenFollowingTagsColumnsFromGroupAreDisplayedOnTagViewPage(string tagsGroup, Table table)
        {
            var page = _driver.NowAt<TagViewPage>();
            var tags = page.GetTagsGroupList(tagsGroup);
            var expectedTags = table.Rows.SelectMany(row => row.Values).ToList();
            foreach (string content in tags)
            {
                Assert.IsTrue(expectedTags.Contains(content),
                    $"tags are incorrectly {tagsGroup} group");
            }
        }

        [When(@"User clicks '(.*)' button at the top of the '(.*)' column")]
        public void WhenUserClicksButtonAtTheTopOfTheColumn(string collapsedButton, string columName)
        {
            var page = _driver.NowAt<TagViewPage>();
            page.GetExpandOrCollapseButtonInColum(columName).Click();
        }

        [Then(@"'(.*)' column is collapsed")]
        public void ThenColumnIsCollapsed(string columName)
        {
            var page = _driver.NowAt<TagViewPage>();
            Assert.IsTrue(page.CollapsedColum(columName), $"{columName} is expanded");
        }

        [Then(@"'(.*)' column is expanded")]
        public void ThenColumnIsExpanded(string columName)
        {
            var page = _driver.NowAt<TagViewPage>();
            Assert.IsFalse(page.CollapsedColum(columName), $"{columName} is collapsed");
        }
    }
}
