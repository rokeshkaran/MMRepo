using AutomationUtils.Extensions;
using MjAutomationCore.DTO.WebAppDTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using Reqnroll;

namespace MjAutomationCore.Extensions
{
    public static class StringExtensions
    {
        public static string AddRandom(this string str, SessionRandomValue sessionRandom)
        {
            return AddRandom(str, sessionRandom.RandomString, sessionRandom.UsernameRnd, sessionRandom.RandomNumber, sessionRandom.RandomSymbol, sessionRandom.CurrentDateTime);
        }

        public static string AddRandom(this string str, string sessionRandom = "", string sessionUsernameRandom = "", string sessionRandomNumber = "", string sessionRandomSymbol = "", string sessionCurrentDateTime = "")
        {
            if (string.IsNullOrEmpty(str))
                return str;

            return str
                .Replace("SRND", sessionRandom)
                .Replace("SURND", sessionUsernameRandom)
                .Replace("RND", sessionRandomNumber)
                .Replace("RSN", sessionRandomSymbol)
                .Replace("DATE", sessionCurrentDateTime);
        }

        public static List<string> Split(this string str, string separator)
        {
            return str.Split(new string[] { separator }, StringSplitOptions.None).ToList();
        }

        static readonly Regex SpaceTrimmer = new Regex(@"\s\s+");

        public static string RemoveExtraSpaces(this string str)
        {
            try
            {
                return SpaceTrimmer.Replace(str, " ");
            }
            catch
            {
                return null;
            }
        }

        public static string RemoveLineBreakes(this string str)
        {
            return str.Replace("\\r\\n", string.Empty).Replace("\n", string.Empty).Replace("\r", string.Empty);
        }

        public static string Date(this string str, string format = "MM/dd/yyyy")
        {
            if (string.IsNullOrEmpty(str))
                return str;

            if (str.StartsWith("D(") && str.EndsWith(")"))
            {
                Regex regex = new Regex(@"(?<=\()(.*)(?=\))");
                Match m = regex.Match(str);
                var match = m.Value;
                var isNumeric = int.TryParse(match, out int n);
                if (isNumeric)
                    return DateTime.Now.AddDays(int.Parse(match)).ToString(format);
            }

            return str;
        }

        public static bool IsWeekend(this DateTime date)
        {
            return date.DayOfWeek == DayOfWeek.Saturday || date.DayOfWeek == DayOfWeek.Sunday;
        }

        public static DateTime GetNextWorkingDay(this DateTime date)
        {
            do
            {
                date = date.AddDays(1);
            } while (IsWeekend(date));
            return date;
        }

        public static string DateIso(this string str)
        {
            if (string.IsNullOrEmpty(str))
                return str;

            DateTime.TryParse(str, out var convertedDate);
            return convertedDate.ToString("yyyy-MM-ddTHH:mm:ssZ");
        }

        public static string DateFormat(this string str)
        {
            if (string.IsNullOrEmpty(str))
                return str;
            DateTime.TryParse(str, out var convertedDate);
            return convertedDate.ToString("yyyy-MM-dd");
        }

        public static Table CsvToTable(this string str)
        {
            if (string.IsNullOrEmpty(str))
                throw new Exception("Unable to convert empty string to Table");

            var fileLines = str.Replace("\"", "").SplitByLinebreak();

            if (!fileLines.Any())
                throw new Exception("File content is empty, nothing to convert to Table");

            var table = new Table(fileLines.First().Split(','));

            for (int i = 1; i < fileLines.Count; i++)
            {
                if (string.IsNullOrEmpty(fileLines[i]))
                    continue;
                table.AddRow(fileLines[i].Split(','));
            }

            return table;
        }

        public static string DecodedString(this string str)
        {
            byte[] data = Convert.FromBase64String(str);
            string decodedText = Encoding.UTF8.GetString(data);
            return (decodedText);
        }
    }
}
