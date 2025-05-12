using Reqnroll.BoDi;
using MjAutomationCore.DTO.BaseDto.RunTimeVariables;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Extensions;
using MjAutomationCore.Helpers;
using MjAutomationCore.Providers;
using MjAutomationCore.Utils;
using NUnit.Framework;
using OpenQA.Selenium;
using Reqnroll;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using xRetry.Exceptions;
using Xunit;

namespace MjAutomationCore.Base
{
    [Binding]
    class BeforeAfterActions : BaseTest
    {
        private readonly IObjectContainer _objectContainer;
        private readonly ScenarioContext _scenarioContext;
        private readonly BrowsersList _browsersList;
        private readonly TestInfo _testInfo;
        private readonly Files _files;
        protected readonly RestWebClient _restClient;
        Stopwatch sw = new Stopwatch();
        private bool IgnoreTestFlag = false;
        private bool SkippedTestFlag = false;
        private string QaseComment = "";
        private Exception BeforeScenarioException { get; set; }

        public BeforeAfterActions(IObjectContainer objectContainer, ScenarioContext scenarioContext,
            BrowsersList browsersList, TestInfo testInfo, Files files, RestWebClient restClient)
        {
            this._objectContainer = objectContainer;
            this._scenarioContext = scenarioContext;
            _browsersList = browsersList;
            _testInfo = testInfo;
            _files = files;
            _restClient = restClient;
        }

        [BeforeScenario()]
        public void OnStartUp()
        {
            sw.Start();
            _testInfo.StartTime = DateTime.Now;
            _testInfo.Name = GetTestName();
            _testInfo.Tags = GetTags();
            LockCategory.AwaitTags(_testInfo.Tags);
            LockCategory.AddTags(_testInfo.Name, _testInfo.Tags);

            //Check if the test is running on a remote
            if (Browser.BrowserType.Equals("remote"))
            {
                //Check if the test scenario has JIRA tags
                if (_testInfo.Tags.Any(x => x.Contains("JIRA")))
                {
                    //Extract JIRA IDs from the test scenario tags
                    List<string> jiraIds = Helpers.TagHelper.GetNumericIDsFromTag(Helpers.TagHelper.GetTagByPrefix(_scenarioContext.ScenarioInfo.Tags, "JIRA"));
                    if (jiraIds != null && jiraIds.Count > 0)
                    {
                        foreach (string jiraId in jiraIds)
                        {
                            //If the JIRA issue is not in a 'done' status skip the test
                            if (JiraHelper.ShouldSkipTest(jiraId))
                            {
                                IgnoreTestFlag = true;
                                QaseComment = $"Blocked: 'https://mindjet.atlassian.net/browse/MMCV-{jiraId}' is not in a done status";
                                throw new SkipException($"Skipping the test because 'https://mindjet.atlassian.net/browse/MMCV-{jiraId}' is not in a done status");
                            }
                            else if (JiraHelper.IsApplicationBuildVersionLowerThanResolvedInJiraIssue(jiraId))
                            {
                                IgnoreTestFlag = true ;
                                QaseComment = $"Blocked: environment version is being run is lower than the resolved in build version for 'https://mindjet.atlassian.net/browse/MMCV-{jiraId}'";
                                throw new SkipException($"Skipping the test because the version of the environment in which the test is being run is lower than the resolved in build version for JIRA issue 'https://mindjet.atlassian.net/browse/MMCV-{jiraId}'");
                            }
                        }
                    }
                    else
                    {
                        throw new ArgumentException("JIRA tag does not contain any valid numeric IDs.");
                    }
                }

                if (_testInfo.Tags.Any(x => x.Contains("Build")))
                {
                    var buildTags = _testInfo.Tags.Where(tag => tag.Contains("Build")).ToList();
                    if (buildTags.Any())
                    {
                        var lastBuildTag = buildTags.Last();

                        var currentBuildVersion = ApplicationVersionHelper.GetCurrentBuildVersion();

                        var requiredVersion = ApplicationVersionHelper.ExtractVersionFromTag(lastBuildTag);

                        if (requiredVersion == null)
                        {
                            throw new ArgumentException($"Build version tag has an invalid format. Please ensure that the tag contains a version number in the format 'build_x.x.x'. Current tag: {lastBuildTag}");
                        }

                        if (!ApplicationVersionHelper.IsVersionValid(requiredVersion, currentBuildVersion))
                        {
                            SkippedTestFlag = true;
                            QaseComment = $"Skipped:  because required build version {requiredVersion} is not available. Current build version is {currentBuildVersion}.";
                            throw new SkipTestException($"Test skipped because required build version {requiredVersion} is not available. Current build version is {currentBuildVersion}.");
                        }
                    }
                }

                if (_testInfo.Tags.Any(tag => tag.StartsWith("Locale_")))
                {
                    //Set browser version and locale based on test tags
                    BrowserHelper.SetBrowserVersionWithLocaleFromTags(_testInfo.Tags);
                }
                    
                if (_testInfo.Tags.Any(tag => tag.EndsWith("_browser")))
                {
                    //Set platform-browser version based on test tags
                    BrowserHelper.SetPlatformBrowserVersionFromTags(_testInfo.Tags);
                }
            }
            {
                //Create browser if not API test
                if (!_testInfo.Tags.Contains("API"))
                {
                    var driverInstance = CreateBrowserDriver();

                    #region Check that alive driver was created

                    if (driverInstance == null)
                        throw new Exception("Driver was not created");

                    try
                    {
                        var body = driverInstance.FindElement(By.TagName("body"));
                    }
                    catch (Exception e)
                    {
                        throw new Exception($"Driver was not created: {e}");
                    }

                    #endregion

                    //Set browser size
                    BrowserHelper.SetBrowserWindowSize(driverInstance, Browser.Resolution);

                    _objectContainer.RegisterInstanceAs(driverInstance);
                    _browsersList.AddDriver(driverInstance);
                }
            }
        }

        [AfterScenario()]
        public void OnTearDown()
        {
            var testName = string.Empty;
            var testStatusString = string.Empty;
            List<string> tagsQase = new List<string>();
            var qaseReport = ReportProvider.Report.Equals("qase");
            sw.Stop();
            var elapsedTime = sw.ElapsedMilliseconds;

            if (qaseReport)
            {
                tagsQase = Helpers.TagHelper.GetNumericIDsFromTag(Helpers.TagHelper.GetTagByPrefix(_scenarioContext.ScenarioInfo.Tags, "Qase"));
            }

            try
            {
                var driver = _browsersList.GetBrowser();

                try
                {
                    if (qaseReport)
                    {
                        testStatusString = GetStatusString();
                    }
                    if (testStatusString.Equals("failed") && !_testInfo.Tags.Contains("API"))
                    {
                        testName = GetTestName();
                        if (!string.IsNullOrEmpty(testName))
                        {
                            var path = driver.CreateScreenshot(testName);
                            _files.Value.Add(new KeyValuePair<string, string>(testName, path));
                        }
                    }
                }
                catch (Exception e)
                {
                    AutomationUtils.Utils.Logger.Write(e);
                }

                if (!_testInfo.Tags.Contains("API"))
                {
                    foreach (WebDriver browser in _browsersList.GetAllBrowsers())
                    {
                        try
                        {
                            //Log the URL before quitting the browser
                            string currentUrl = browser.Url;
                            browser?.QuitDriver();
                            AutomationUtils.Utils.Logger.Write($"Closing window at: {currentUrl}");
                        }
                        catch (Exception e)
                        {
                            AutomationUtils.Utils.Logger.Write($"Unable to close driver: {e}");
                        }
                    }
                }
            }
            catch (ObjectContainerException e)
            {
                //There are no driver in the context
                AutomationUtils.Utils.Logger.Write(e + "There are no driver in the context");
            }
            catch (Exception e)
            {
                AutomationUtils.Utils.Logger.Write(e);
            }

            // Clear BrowserVersionWithLocale after each scenario
            Browser.SetBrowserVersionWithLocale(null);

            // Create Qase report when running tests remotely
            if (qaseReport && !Browser.BrowserType.Equals("local"))
            {
                if (tagsQase != null && tagsQase.Any())
                {
                    try
                    {
                        foreach (string id in tagsQase)
                        {
                            QaseReporters.PostTestStatus(new TestStatusQase()
                            {
                                BuildId = TeamCityConfigProvider.BuildNumber,
                                BuildName = TeamCityConfigProvider.BuildName,
                                ProjectName = TeamCityConfigProvider.ProjectName,
                                Name = testName,
                                Status = testStatusString,
                                Id = id,
                                Environment = EnvironmentProvider.Env,
                                Browser = Browser.TargetBrowser,
                                ProjectCode = QaseReportProvider.ReportProvider(GetTags()),
                                ElapsedTime = elapsedTime,
                                Comment = QaseComment
                                //FileScreenshot = _files.Value.First(x=>x.Key.Equals(testName)).Value
                            });
                        }
                    }

                    catch { }

                    LockCategory.RemoveTestTags(_testInfo.Name);
                }
            }
        }

        [BeforeTestRun]
        public static void OnTestsStart()
        {
            if (bool.Parse(ConfigReader.ByKey("browsersCleanup")))
                KillDriverProcesses.Do();
        }

        [AfterTestRun]
        public static void OnTestsComplete()
        {
            if (bool.Parse(ConfigReader.ByKey("browsersCleanup")))
                KillDriverProcesses.Do();
        }

        private string GetTestName()
        {
            var testName = _scenarioContext.ScenarioInfo.Title;
            var iterator = _scenarioContext.ScenarioInfo.Arguments.GetEnumerator();
            if (iterator.MoveNext())
            {
                testName = $"{testName}";
            }
            return testName;
        }

        public List<string> GetTags()
        {
            try
            {
                List<string> testTags = TestContext.CurrentContext.Test.Properties["Category"].Select(x => x.ToString()).ToList();

                //If we are not able to get nUnit tags the try to get them from SpecFlow
                if (!testTags.Any())
                    testTags = _scenarioContext.ScenarioInfo.Tags.ToList();

                return testTags;
            }
            catch (Exception e)
            {
                throw new Exception($"Unable to get Tags from context: {e}");
            }
        }

        private string GetStatusString()
        {
            if(IgnoreTestFlag) { return "blocked"; }
            if(SkippedTestFlag) { return "skipped"; }
            return (BeforeScenarioException != null || _scenarioContext.TestError != null) ? "failed" : "passed";
        }
    }
}