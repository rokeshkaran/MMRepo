using MjAutomationCore.Base;
using OpenQA.Selenium;
using SeleniumExtras.PageObjects;
using System.Collections.Generic;
using System.Linq;

namespace MjAutomationCore.Pages.WebAppProject.ViewModePage
{
    class GanttViewPage : SeleniumBasePage
    {

        [FindsBy(How = How.XPath, Using = ".//div[@role='columnheader'][not(contains(@class,'gantt_grid_column_resize_wrap'))]")]
        public IList<IWebElement> GetGanttGridHeaders { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'gantt_row')]")]
        public IList<IWebElement> GanttGridTaskRowsList { get; set; }

        private const string GanttCellContentSelector = ".//div[contains(@class, 'gantt_cell') and @data-column-name='{0}']/div[contains(@class, 'gantt_tree_content')]";

        public List<string> GetColumnsByDataColumnName()
        {
            return GetGanttGridHeaders
                .Select(element => element.GetAttribute("data-column-name"))
                .Where(columnName => !string.IsNullOrEmpty(columnName))
                .ToList();
        }

        public List<string> GetHeaderTexts()
        {
            return GetGanttGridHeaders
                .Select(header => header.Text.Trim())
                .Where(text => !string.IsNullOrEmpty(text))
                .ToList();
        }

        public string GetGanttGridTaskValueInColumn(string taskName, string columnName)
        {
            var taskId = GetGanttGridTaskIdByTaskName(taskName);
            var taskElement = GetGanttGridRowByTaskId(taskId);
            string columnXpath = string.Format(GanttCellContentSelector, columnName);
            var ganttCellContent = taskElement.FindElement(By.XPath(columnXpath));
            string actualText = ganttCellContent.Text.Trim();

            if (string.IsNullOrEmpty(actualText))
            {
                actualText = ganttCellContent.FindElement(By.XPath("./div")).Text.Trim();
            }

            return actualText;
        }

        public string GetGanttGridTaskIconInColumn(string taskName, string columnName)
        {
            var taskId = GetGanttGridTaskIdByTaskName(taskName);
            var taskElement = GetGanttGridRowByTaskId(taskId);
            string columnXPath = string.Format(GanttCellContentSelector, columnName);
            var ganttCellContent = taskElement.FindElement(By.XPath(columnXPath));
            var imgElements = ganttCellContent.FindElements(By.XPath("./*[@src]"));
            return imgElements.Any() ? imgElements.First().GetAttribute("src") : "";
        }

        public string GetGanttGridTaskIdByTaskName(string taskName)
        {
            return GanttGridTaskRowsList.FirstOrDefault(row => row.GetAttribute("aria-label").Split(' ')[0].Contains(taskName)).GetAttribute("data-task-id");
        }

        public IWebElement GetGanttGridRowByTaskId(string taskId)

        {
            return GanttGridTaskRowsList.FirstOrDefault(task => task.GetAttribute("data-task-id").Equals(taskId));
        }
    }
}