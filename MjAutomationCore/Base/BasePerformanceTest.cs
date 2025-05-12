using MjAutomationCore.Providers;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Threading;

namespace MjAutomationCore.Base
{
    class BasePerformanceTest
    {
        protected delegate void ScenarioMethod(RestClient client);
        protected void Run(ScenarioMethod scenario)
        {
            Stopwatch startTime = new Stopwatch();
            var timeOfStartRun = new DateTime(DateTime.UtcNow.Year, DateTime.UtcNow.Month, DateTime.UtcNow.Day,
                DateTime.UtcNow.Hour, DateTime.UtcNow.Minute, DateTime.UtcNow.Second);
            if (int.Parse(PerformanceConfig.ExecutionTime).Equals(0))
            {
                var threads = new List<Thread>();
                for (int i = 0; i < PerformanceConfig.UsersCount; i++)
                {
                    threads.Add(new Thread(() => Executor(scenario)));
                }
                foreach (Thread thread in threads)
                {
                    Thread.Sleep(PerformanceConfig.RampupTime * 1000);
                    thread.Start();
                }
            }
            else
            {
                startTime.Start();
                while (startTime.Elapsed < TimeSpan.FromSeconds(double.Parse(PerformanceConfig.ExecutionTime)))
                {
                    var threads = new List<Thread>();
                    for (int i = 0; i < PerformanceConfig.UsersCount; i++)
                    {
                        threads.Add(new Thread(() => Executor(scenario)));
                    }
                    foreach (var thread in threads)
                    {
                        thread.Start();
                        Thread.Sleep(PerformanceConfig.RampupTime * 1000);
                    }
                }
                startTime.Stop();
            }
        }
        private void Executor(ScenarioMethod scenario)
        {
            RestClient client = new RestClient("https://cloud-staging.mindmanager.com/api/v1/");
            Thread.Sleep(PerformanceConfig.DelayBeforeRequests);
            for (int i = 0; i < PerformanceConfig.ExecutionCount; i++)
            {
                scenario(client);
            }
        }
    }
}
