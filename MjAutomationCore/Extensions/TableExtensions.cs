using AutomationUtils.Utils;
using MjAutomationCore.DTO.WebAppDTO;
using System;
using System.Collections.Generic;
using System.Linq;
using Reqnroll;

namespace MjAutomationCore.Extensions
{
    public static class TableExtensions
    {
        public static List<string> GetHeaders(this Table table)
        {
            return table.Rows.First().Keys.ToList();
        }

        public static List<string[]> GetContent(this Table table)
        {
            var result = new List<string[]>();
            foreach (DataTableRow row in table.Rows)
            {
                var line = new List<string>();
                foreach (KeyValuePair<string, string> pair in row)
                {
                    line.Add(pair.Value.DateFormat());
                }
                result.Add(line.ToArray());
            }
            return result;
        }

        public static string GetDataByKey(this Table table, string key)
        {
            foreach (DataTableRow row in table.Rows)
            {
                foreach (KeyValuePair<string, string> pair in row)
                {
                    if (pair.Key.Equals(key))
                        return pair.Value;
                }
            }

            throw new Exception($"Unable to find element with '{key}' in the table.");
        }

        public static void CompareWith(this Table expectedTable, Table actualTable, SessionRandomValue sessionRandom)
        {
            CompareWithTable(expectedTable, actualTable, expectedTable.Header.Count, sessionRandom);
        }

        public static void CompareWith(this Table expectedTable, Table actualTable, int rowsToCompare, SessionRandomValue sessionRandom)
        {
            CompareWithTable(expectedTable, actualTable, rowsToCompare, sessionRandom);
        }

        private static void CompareWithTable(this Table expectedTable, Table actualTable, int rowsToCompare, SessionRandomValue sessionRandom)
        {
            if (rowsToCompare > actualTable.RowCount)
                throw new Exception($"Unable to compare tables. Tables have less than {rowsToCompare} rows");

            Verify.AreEqual(expectedTable.Header.Count, actualTable.Header.Count,
                "Headers count is different");

            for (int i = 0; i < rowsToCompare; i++)
            {
                var expectedDataTableRow = expectedTable.Rows[i];
                var actualDataTableRow = actualTable.Rows[i];
                for (int j = 0; j < actualTable.Header.Count; j++)
                {
                    Verify.AreEqual(expectedDataTableRow[j].AddRandom(sessionRandom).Date("yyyy-MM-dd"), actualDataTableRow[j], "Content in Tables doesn't match");
                }
            }
        }
    }
}
