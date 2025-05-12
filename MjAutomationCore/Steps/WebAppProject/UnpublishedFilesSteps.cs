using SeleniumAutomationUtils.SeleniumExtensions;
using AutomationUtils.Utils;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.FileManager;
using MjAutomationCore.Utils;
using OpenQA.Selenium;
using System;
using System.Linq;
using Reqnroll;
using MjAutomationCore.DTO.BaseDto.RunTimeVariables;
using MjAutomationCore.Pages.WebAppProject.MindManagerFiles;
using System.Threading;

namespace MjAutomationCore.Steps.WebAppProject
{
    [Binding]
    class UnpublishedFilesSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsers;
        private readonly SessionRandomValue _sessionRandom;

        public UnpublishedFilesSteps(BrowsersList browsers, SessionRandomValue sessionRandom)
        {
            _browsers = browsers;
            _sessionRandom = sessionRandom;
        }

        [Then(@"following files are displayed in the Unpublished file list")]
        public void ThenFollowingFilesAreUnpublished(Table table)
        {
            var page = _browsers.Active.NowAt<UnpublishedFilesPage>();
            _browsers.Active.WaitForElementsToBeDisplayed(page.UnPublishedFileList, WebDriverExtensions.WaitTime.Medium, true);
            //Delay for files
            Thread.Sleep(1000);
            var filesUnpublished = page.UnPublishedFileList.Select(x => x.Text).ToList();
            var expectedFiles = table.Rows.SelectMany(row => row.Values).Select(x => x.AddRandom(_sessionRandom)).ToList();
            Verify.IsTrue(expectedFiles.All(expectedFile => filesUnpublished.Contains(expectedFile)), "One or more files are not unpublished in the Unpublished Files List");
        }
    }
}
