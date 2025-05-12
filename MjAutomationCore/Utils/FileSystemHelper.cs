using MjAutomationCore.Providers;
using OpenQA.Selenium;
using OpenQA.Selenium.Remote;
using RestSharp;
using SeleniumAutomationUtils.SeleniumExtensions;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Threading;

namespace MjAutomationCore.Utils
{
    class FileSystemHelper
    {
        public static void EnsureScreensotsFolderExists()
        {
            var folder = GetScreenshotFolder();
            if (!Directory.Exists(folder))
            {
                Directory.CreateDirectory(folder);
            }
        }

        public static string WaitForFileWithNameContainingToBeDownloaded(string partOfFileName, int attempts = 15)
        {
            var directory = new DirectoryInfo(GetPathForDownloadsFolder());
            for (int i = 0; i < attempts; i++)
            {
                if (IsFolderContainsFileContainingName(directory, partOfFileName))
                    return GetLastFileWithNameContains(partOfFileName);

                Thread.Sleep(1000);
            }

            throw new Exception($"File containing '{partOfFileName}' name was not downloaded in {attempts} seconds");
        }

        //For remote download only FULL file name
        public static string WaitForFileWithNameContainingToBeDownloaded(string partOfFileName, RemoteWebDriver driver, int attempts = 15)
        {
            if (Browser.BrowserType.Equals("local"))
            {
                var directory = new DirectoryInfo(PathProvider.DownloadsFolder);

                for (int i = 0; i < attempts; i++)
                {
                    if (IsFolderContainsFileContainingName(directory, partOfFileName))
                        return GetLastFileWithNameContains(partOfFileName);

                    Thread.Sleep(1000);
                }
            }
            else
            {
                Thread.Sleep(4000);
                SessionId session = driver.SessionId;
                RestClient client = new RestClient(Browser.HubUri.Replace("wd/hub", string.Empty));
                RestRequest request = new RestRequest($"/download/{session}/{partOfFileName}");
                var response = client.Get(request);
                if (response.StatusCode != HttpStatusCode.OK)
                {
                    throw new Exception($"'{partOfFileName}' file was not downloaded");
                }
                var download = client.DownloadData(request);

                var dir = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);
                var tempDir = Path.Combine(dir, $"TempDownloadDirectory_{Guid.NewGuid().ToString("N").ToUpper()}");
                //Create temp dir for downloaded file
                Directory.CreateDirectory(tempDir);
                var filePath = Path.Combine(tempDir, partOfFileName);
                File.WriteAllBytes(filePath, download.ToArray());
                return filePath;
            }

            throw new Exception($"File containing '{partOfFileName}' name was not downloaded in {attempts} seconds");
        }

        public static string GetLastFileWithNameContains(string partOfFileName)
        {
            var directory = new DirectoryInfo(GetPathForDownloadsFolder());

            if (!IsFolderContainsFileContainingName(directory, partOfFileName))
            {
                throw new Exception($"File containing '{partOfFileName}' name was not found");
            }

            var file = directory.GetFiles()
                .OrderByDescending(f => f.LastWriteTime)
                .First(x => x.Name.Contains(partOfFileName)).FullName;

            return file;
        }

        public static bool IsFileDownloaded(string filePath)
        {
            for (var i = 0; i < 45; i++)
            {
                if (!File.Exists(filePath))
                {
                    Thread.Sleep(1000);
                }
                else
                {
                    return true;
                }
            }

            Logger.Write($"Downloaded file was not found: {filePath}");
            return false;
        }

        public static string GetPathForDownloadsFolder()
        {
            var downloadFolder = ConfigReader.ByKey("downloadsFolder");
            return downloadFolder.Equals("DEFAULT_DOWNLOADS_FOLDER") ? Environment.ExpandEnvironmentVariables(@"%USERPROFILE%\Downloads") : downloadFolder;
        }

        private static bool IsFolderContainsFileContainingName(DirectoryInfo directory, string partOfFileName)
        {
            return directory.GetFiles().OrderByDescending(f => f.LastWriteTime).Any(x => x.Name.Contains(partOfFileName));
        }

        public static string GetPathForScreenshot(string testName)
        {
            var date = DateTime.Now.ToString("yyyy_MM_dd_hh_mm_ss");
            var fileName = $"{testName}_{date}.png";

            return Path.Combine(GetScreenshotFolder(), fileName);
        }

        public static string GeneratePathToEmbedded(string pathPart)
        {
            if (string.IsNullOrEmpty(pathPart))
                throw new Exception("Path not set");

            string executingAssemblyFolder = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);
            var pathParts = new List<string>() { executingAssemblyFolder, "Tests", "TestData" };
            pathParts.AddRange(pathPart.Split('\\'));
            var fullPath = Path.Combine(pathParts.ToArray());
            return fullPath;
        }

        public static string GeneratePathToPublishedFilesFolder(string pathPart)
        {
            if (string.IsNullOrEmpty(pathPart))
                throw new Exception("Path not set");

            string executingAssemblyFolder = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);
            var pathParts = new List<string>() { executingAssemblyFolder, "Tests", "TestData", "PublishedFiles" };
            pathParts.AddRange(pathPart.Split('\\'));
            var fullPath = Path.Combine(pathParts.ToArray());
            return fullPath;
        }

        public static string GeneratePathToDropBoxFilesFolder(string pathPart)
        {
            string executingAssemblyFolder = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);
            var pathParts = new List<string>() { executingAssemblyFolder, "Tests", "TestData", "DropBoxFiles" };
            pathParts.AddRange(pathPart.Split('\\'));
            var fullPath = Path.Combine(pathParts.ToArray());
            return fullPath;
        }

        public static string GeneratePathToCloudFiles(string pathPart, string folder = "")
        {
            if (string.IsNullOrEmpty(pathPart))
                throw new Exception("Cloud folder path not set");

            string executingAssemblyFolder = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);
            var pathParts = new List<string>() { executingAssemblyFolder, "Tests", "TestData", folder };
            pathParts.AddRange(pathPart.Split('\\'));
            var fullPath = Path.Combine(pathParts.ToArray());
            return fullPath;
        }

        private static string GetScreenshotFolder()
        {
            return ConfigReader.ByKey("screenshotsFolder");
        }

        public static long GetFileSize(string filePath)
        {
            long length = new FileInfo(filePath).Length;

            return length;
        }

        public static double GetFileSizeInMB(string filePath)
        {
            double length = new FileInfo(filePath).Length;
            double mb = length / (1024 * 1024);
            return Math.Round(mb, 2);
        }

        public static string GetPathOfTheDownloadedFile(WebDriver driver, string fileName)
        {
            if (Browser.BrowserType.Equals("local"))
            {
                var directory = new DirectoryInfo(PathProvider.DownloadsFolder);

                return GetLastFileWithNameContains(fileName);
            }
            else
            {
                var hubUri = Browser.HubUri;
                Logger.Write($"{hubUri} hubUri");
                List<string> fileList = driver.GetDownloadedFiles(hubUri);
                fileName = fileList.Find(x => x.Contains(fileName));

                SessionId session = driver.SessionId;
                RestClient client = new RestClient(hubUri.Replace("wd/hub", string.Empty));
                RestRequest request = new RestRequest($"/download/{session}/{fileName}");

                var response = client.Get(request);
                var download = client.DownloadData(request);
                var dir = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);
                var tempDir = Path.Combine(dir, $"TempDownloadDirectory_{Guid.NewGuid().ToString("N").ToUpper()}");
                //Create temp dir for downloaded file
                Directory.CreateDirectory(tempDir);
                var filePath = Path.Combine(tempDir, fileName);
                File.WriteAllBytes(filePath, download.ToArray());

                return filePath;
            }
        }
    }
}
