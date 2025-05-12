using AutomationUtils.Extensions;
using AutomationUtils.Utils;
using MjAutomationCore.DTO.BaseDto.RunTimeVariables;
using MjAutomationCore.DTO.LicensingDTO.ExportedData;
using MjAutomationCore.DTO.LicensingDTO.RunTimeVariables.Salesportal;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.Extensions;
using MjAutomationCore.Providers;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading;
using Reqnroll;
using Reqnroll.Assist;

namespace MjAutomationCore.Steps.Base.DownloadFile
{
    [Binding]
    class DownloadFileSteps : ReqnrollContext
    {
        private WebDriver _driver;
        private readonly DownloadedFileName _downloadedFileName;
        private readonly SessionRandomValue _sessionRandom;
        public DownloadFileSteps(WebDriver driver, DownloadedFileName downloadedFileName, SessionRandomValue sessionRandom)
        {
            _driver = driver;
            _downloadedFileName = downloadedFileName;
            _sessionRandom = sessionRandom;
        }

        [Then(@"User checks that file '([^']*)' was downloaded")]
        public void ThenUserChecksThatFileWasDownloaded(string fileName)
        {
            fileName = fileName.AddRandom(_sessionRandom);
            if (Browser.BrowserType.Equals("local"))
            {
                Thread.Sleep(5000);
                string downloadedFileName = Utils.FileSystemHelper.GetLastFileWithNameContains(fileName);
                _downloadedFileName.Value.Add(downloadedFileName);

                if (string.IsNullOrEmpty(downloadedFileName))
                {
                    throw new Exception($"File with name '{fileName}' didn't download");
                }

                Verify.IsTrue(downloadedFileName.Contains(fileName), $"Name of the downloaded file is incorrect. Downloaded file: {downloadedFileName}");
            }
            else
            {
                for (int i = 0; i < 100; i++)
                {
                    try
                    {
                        List<string> fileList = _driver.GetDownloadedFiles(Browser.HubUri);
                        if (fileList.Any())
                        {
                            string downloadedFileName = fileList.First(x => x.Contains(fileName));
                            string filePath = Utils.FileSystemHelper.GetPathOfTheDownloadedFile(_driver, fileName);
                            _downloadedFileName.Value.Add(filePath);
                            Verify.IsTrue(filePath.Contains(fileName), $"File with name '{fileName}' didn't download");
                            return;
                        }
                    }
                    catch { }
                    Thread.Sleep(1000);
                }

                throw new Exception($"File with name '{fileName}' didn't download");
            }
        }

        [Then(@"'(.*)' downloaded file has '(.*)' MB size")]
        public void ThenDownloadedFileHasMBSize(string fileName, double size)
        {
            string filePath = Utils.FileSystemHelper.GetPathOfTheDownloadedFile(_driver, fileName);
            for (int i = 0; i < 30; i++)
            {
                if (filePath.Contains(fileName))
                    break;
                //Wait for Complete File to download
                Thread.Sleep(1000);
            }
            double fileSizeByte = Utils.FileSystemHelper.GetFileSizeInMB(filePath);
            Verify.AreEqual(fileSizeByte, size, "file size is incorrect");
        }

        [Then(@"User verifies '([^']*)' rows in '([^']*)' downloaded file")]
        public void ThenUserVerifiesRowsInDownloadedFile(int rows, string fileName, Table table)
        {
            try
            {
                var filePath = Utils.FileSystemHelper.GetPathOfTheDownloadedFile(_driver, fileName);
                var content = File.ReadAllText(filePath);
                var actualTable = content.CsvToTable();
                var expectedTable = table;
                expectedTable.CompareWith(actualTable, rows, _sessionRandom);
            }
            catch (Exception e)
            {
                throw new Exception("Verification failed", e);
            }
        }

        [When(@"User updates data in the '([^']*)' exported file")]
        public void WhenUserUpdatesDataInTheExportedFile(string file, Table table)
        {
            var datas = table.CreateSet<ExportedDataDto>();

            var filePath = _downloadedFileName.Value.First(x => x.ContainsText(file));
            if (!File.Exists(filePath))
            {
                throw new FileNotFoundException("File not found", filePath);
            }

            var lines = new List<string>();

            var headers = $"{nameof(ExportedDataDto.UserEmail)},{nameof(ExportedDataDto.Status)},{nameof(ExportedDataDto.LastLogin)},{nameof(ExportedDataDto.ScimGroup)}";
            lines.Add(headers);

            foreach (var data in datas)
            {
                var line = $"{data.UserEmail.AddRandom(_sessionRandom)},{data.Status},{data.LastLogin:yyyy-MM-dd},{data.ScimGroup}";

                lines.Add(line);
            }

            try
            {
                File.WriteAllText(filePath, string.Join(Environment.NewLine, lines));
            }
            catch (Exception ex)
            {
                throw new Exception($"Error writing file: {ex.Message}");
            }
        }
    }
}