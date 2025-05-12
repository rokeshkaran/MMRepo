using System.Linq;

namespace MjAutomationCore.Helpers
{
    public class VersionHelper
    {
        public static bool CompareVersions(string version1, string version2)
        {
            var v1 = version1.Split('.').Select(int.Parse).ToArray();
            var v2 = version2.Split('.').Select(int.Parse).ToArray();

            for (int i = 0; i < v1.Length; i++)
            {
                if (v1[i] < v2[i])
                    return true;
                else if (v1[i] > v2[i])
                    return false;
            }

            return false;
        }
    }
}