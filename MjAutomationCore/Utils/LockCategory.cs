using MjAutomationCore.Providers;
using MjAutomationCore.Providers.Base;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading;

namespace MjAutomationCore.Utils
{
    class LockCategory
    {
        static readonly RestClient client = new RestClient(UrlProvider.DeployServiceURL);

        private static bool IsTagExistInCurrentSession(string expectedTag)
        {
            var text = string.Empty;
            var testsTags = GetTags();
            foreach (List<string> list in testsTags)
            {
                text += String.Join(", ", list.ToArray()) + "\r\n";
            }

            var result = testsTags.Any(x => x.Any(y => y.Contains(expectedTag)));
            //Logger
            //if (result)
            //{
            //    Logger.Write("=======>");
            //    Logger.Write($"TAG '{expectedTag}' is in the list:");
            //    Logger.Write(text);
            //    Logger.Write("<=======");
            //}
            return result;
        }

        private static List<string> GetDoNotRunWithTags()
        {
            List<string> doNotRunWithTag = new List<string>();
            var tags = GetTags();
            foreach (List<string> tagsList in tags)
            {
                foreach (string s in tagsList)
                {
                    if (s.Contains("Do_Not_Run_With"))
                        doNotRunWithTag.Add(s.Replace("Do_Not_Run_With_", string.Empty));
                }
            }

            return doNotRunWithTag;
        }

        public static void AwaitTags(List<string> categories)
        {
            if (GetTags().Any())
            {
                //If test contains tag that depends on other tags
                if (categories.Any(x => x.Contains("Do_Not_Run_With")))
                {
                    var lockTags = categories.Where(x => x.Contains("Do_Not_Run_With_"))
                        .Select(x => x.Replace("Do_Not_Run_With_", string.Empty));
                    //Check that there is no tests with mentioned tag
                    if (lockTags != null && lockTags.Any() && lockTags.Any(IsTagExistInCurrentSession))
                    {
                        while (GetTags().Any() && lockTags.Any(IsTagExistInCurrentSession))
                        {
                            Thread.Sleep(5000);
                            Logger.Write("1. Tag exists in the context");
                        }
                    }
                }

                //If test contains tag with which we can't run
                if (IsTagExistInCurrentSession("Do_Not_Run_With"))
                {
                    while (GetDoNotRunWithTags().Intersect(categories).Any() && GetTags().Any())
                    {
                        Thread.Sleep(5000);
                        Logger.Write("2. Do_Not_Run_With in the context");
                    }
                }
            }
        }

        public static void RemoveTestTags(string testName)
        {
            Exception ex = null;
            for (int i = 0; i < 3; i++)
            {
                try
                {
                    var request = new RestRequest($"/tags/{EnvironmentProvider.Env},{testName}", Method.Delete);
                    request.AddHeader("Accept", "application/json");
                    request.AddJsonBody(new { Name = testName, AddingTime = DateTime.UtcNow, Tags = new List<string>(), Environment = EnvironmentProvider.Env });
                    RestResponse response = client.Execute(request);
                    Logger.Write($"Test name: '{testName}'");
                    Logger.Write($"Response status code: '{response.StatusCode}'");
                    if (response.StatusCode.Equals(HttpStatusCode.OK))
                    {
                        return;
                    }
                }
                catch (Exception e)
                {
                    Thread.Sleep(2000);
                    ex = e;
                }
            }

            var exceptionMessage = $"Unable to clean test tags";
            throw new Exception(ex != null ? $"{exceptionMessage}: {ex}" : exceptionMessage);
        }

        private static List<List<string>> GetTags()
        {
            Exception ex = null;
            for (int i = 0; i < 3; i++)
            {
                try
                {
                    var request = new RestRequest("/tags", Method.Get);
                    request.AddQueryParameter("env", EnvironmentProvider.Env);
                    RestResponse response = client.Execute(request);
                    var tags = JsonConvert.DeserializeObject<List<List<string>>>(response.Content);
                    return tags;
                }
                catch (Exception e)
                {
                    Thread.Sleep(2000);
                    ex = e;
                }
            }

            var exceptionMessage = $"Unable to get tags from API";
            throw new Exception(ex != null ? $"{exceptionMessage}: {ex}" : exceptionMessage);
        }

        public static void AddTags(string testName, List<string> tags)
        {
            Exception ex = null;
            for (int i = 0; i < 3; i++)
            {
                try
                {
                    var request = new RestRequest("/tags", Method.Post);
                    request.AddHeader("Accept", "application/json");
                    request.AddJsonBody(new { Name = testName, AddingTime = DateTime.UtcNow, Tags = tags, Environment = EnvironmentProvider.Env });
                    RestResponse response = client.Execute(request);
                    if (response.StatusCode.Equals(HttpStatusCode.OK))
                    {
                        return;
                    }
                }
                catch (Exception e)
                {
                    Thread.Sleep(2000);
                    ex = e;
                }
            }

            var exceptionMessage = $"Unable to add test tags";
            throw new Exception(ex != null ? $"{exceptionMessage}: {ex}" : exceptionMessage);
        }
    }
}