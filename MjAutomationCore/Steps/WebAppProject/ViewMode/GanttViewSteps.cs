using AutomationUtils.Utils;
using Microsoft.IdentityModel.Tokens;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.ViewModePage;
using MjAutomationCore.Utils;
using Reqnroll;
using System.Linq;

namespace MjAutomationCore.Steps.WebAppProject.ViewMode
{
    [Binding]
    class GanttViewSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsers;
        public GanttViewSteps(BrowsersList browsersList)
        {
            _browsers = browsersList;
        }

        [Then(@"only following headers with text are displayed in Gantt Grid:")]
        public void ThenOnlyFollowingHeadersWithTextAreDisplayedInGanttGrid(Table table)
        {
            var page = _browsers.Active.NowAt<GanttViewPage>();
            var actualHeaders = page.GetHeaderTexts();
            var expectedHeaders = table.Rows.SelectMany(row => row.Values).ToList();
            Verify.AreEqual(actualHeaders, expectedHeaders, "The headers in the Gantt Grid do not match the expected headers");
        }

        [Then(@"following columns are displayed in Gantt Grid:")]
        public void ThenFollowingColumnsAreDisplayedInGanttGrid(Table table)
        {
            var page = _browsers.Active.NowAt<GanttViewPage>();
            var expectedColumn = table.Rows.SelectMany(row => row.Values).ToList();
            var actualColumn = page.GetColumnsByDataColumnName();
            Verify.AreEqual(expectedColumn, actualColumn, "The displayed columns do not match the expected columns in the Gantt Grid");
        }

        [Then(@"the following data are displayed for task '([^']*)' in Gantt Grid:")]
        public void ThenTheFollowingDataAreDisplayedForTaskInGanttGrid(string taskName, Table table)
        {
            var page = _browsers.Active.NowAt<GanttViewPage>();
            foreach (var row in table.Rows)
            {
                string columnName = row["Column"];
                string expectedValue = row["Value"];
                var actualValue = page.GetGanttGridTaskValueInColumn(taskName, columnName);
                Verify.AreEqual(expectedValue, actualValue, $"Value '{expectedValue}' is not displayed in column '{columnName}' for task '{taskName}' in Gantt Grid");
            }
        }

        [Then(@"the following icons are displayed for task '([^']*)' in Gantt Grid:")]
        public void ThenTheFollowingIconsAreDisplayedForTaskInGanttGrid(string taskName, Table table)
        {
            var page = _browsers.Active.NowAt<GanttViewPage>();
            foreach (var row in table.Rows)
            {
                string columnName = row["Column"];
                string expectedIcon = row["Icon"];
                var actualValue = page.GetGanttGridTaskIconInColumn(taskName, columnName);
                if (expectedIcon.IsNullOrEmpty())
                {
                    Verify.IsEmpty(actualValue, $"Icon '{actualValue}' is displayed in column '{columnName}' for task '{taskName}' in Gantt Grid");
                }
                else
                {
                    Verify.IsTrue(actualValue.Contains(expectedIcon), $"Icon '{expectedIcon}' is not displayed in column '{columnName}' for task '{taskName}' in Gantt Grid");
                }
            }
        }
    }
}