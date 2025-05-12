using AutomationUtils.Extensions;
using AutomationUtils.Utils;

namespace MjAutomationCore.Providers
{
    class PerformanceConfig
    {
        public static int UsersCount = int.Parse(Config.Read.ByKey("performanceTestsCountOfUsers"));
        public static int ExecutionCount = int.Parse(Config.Read.ByKey("performanceTestsCountIfExecution"));
        public static int DelayBeforeRequests = int.Parse(Config.Read.ByKey("delayBeforeRequests"));
        public static int RampupTime = int.Parse(Config.Read.ByKey("performanceTestsRumpupTime"));
        public static string ExecutionTime = Config.Read.ByKey("performanceTestsExecutionTime");
    }
}