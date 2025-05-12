using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

namespace MjAutomationCore.Helpers
{
    public class TagHelper
    {
        public static string NormalizeTestCaseId(string testCase)
        {
            return Regex.Replace(testCase, "[^0-9]", "");
        }

        public static string GetTagByPrefix(string[] tags, string prefix)
        {
            return tags.ToList().Find(x => x.StartsWith(prefix));
        }

        public static List<string> GetNumericIDsFromTag(string tag)
        {
            if (!string.IsNullOrEmpty(tag))
            {
                List<string> ids = new List<string>();
                string regexpr = @"\d{0,6}\d+\.*\d*";

                Match match = Regex.Match(tag, regexpr);
                while (match.Success)
                {
                    ids.Add(match.Value);
                    match = match.NextMatch();
                }
                return ids;
            }
            else
            {
                return null;
            }
        }
    }
}