using AutomationUtils.Extensions;
using AutomationUtils.Utils;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.Clouds.SharePoint;
using MjAutomationCore.Extensions;
using MjAutomationCore.General.Api.Clouds;
using System;
using System.Globalization;
using Reqnroll;
using Reqnroll.Assist;

namespace MjAutomationCore.Steps.WebAppProject.ApiSteps.Clouds
{
    [Binding]
    class SharePointStestApi : ReqnrollContext
    {
        protected readonly RestWebClient _restClient;
        private readonly SessionRandomValue _sessionRandom;
        protected readonly SharePointFileList _fileList;
        private readonly SharePointFileModifiedTime _modifiedFile;

        private ScenarioContext _scenarioContext;

        public SharePointStestApi(RestWebClient restClient, SessionRandomValue sessionRandom, SharePointFileList fileList, SharePointFileModifiedTime modifiedFile, ScenarioContext scenarioContext)
        {
            _restClient = restClient;
            _sessionRandom = sessionRandom;
            _fileList = fileList;
            _modifiedFile = modifiedFile;
            _scenarioContext = scenarioContext;
        }

        [Given(@"User uploads following files to '([^']*)' folder of SharePoint cloud via Api")]
        public void GivenUserUploadsFollowingFilesToFolderOfSharePointCloudViaApi(string folderName, Table table)
        {
            var allData = table.CreateSet<SharePointFileDto>();
            var accessToken = _restClient.SharePointClient.InitApiMethods<SharePointApi>().GetAccessToken();
            foreach (SharePointFileDto data in allData)
            {
                try
                {
                    data.FileName = data.FileName.AddRandom(_sessionRandom);
                    _restClient.SharePointClient.InitApiMethods<SharePointApi>().UploadFileToFolder(accessToken, folderName, data);
                    data.AccessToken = accessToken;
                    data.FolderName = folderName;
                    AutomationUtils.Utils.Logger.Write($"File with name '{data.FileName}' uploaded  for test: '{_scenarioContext.ScenarioInfo.Title}'", AutomationUtils.Utils.Logger.LogLevel.Info);
                }
                catch (Exception ex)
                {
                    Logger.Write($"Error uploading file {data.FileName}: {ex.Message}");
                }
            }

            _fileList.Value.AddRange(allData);
        }

        [Then(@"modified time for '([^']*)' file is changed on Sharepoint cloud storage")]
        public void ThenModifiedTimeForFileIsChangedOnSharepointCloudStorage(string folderName)
        {
            folderName = folderName.AddRandom(_sessionRandom);
            var accessToken = _restClient.SharePointClient.InitApiMethods<SharePointApi>().GetAccessToken();
            var value = _restClient.SharePointClient.InitApiMethods<SharePointApi>().GetFileModified(accessToken, folderName);
            var convertedDate = DateTime.ParseExact(value, "M/d/yyyy h:mm:ss tt", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd h:mm:ss tt");            
            Verify.AreNotEqual(_modifiedFile.ModifiedTime,convertedDate, $"Modified time for '{folderName}' is not changed on Sharepoint cloud storage. Actual File Modified Time:{convertedDate}. Saved File Modified Time :{_modifiedFile.ModifiedTime}");
        }

        [Then(@"file size for '([^']*)' file is changed on Sharepoint cloud storage")]
        public void ThenFileSizeForFileIsChangedOnSharepointCloudStorage(string filePath)
        {
            filePath = filePath.AddRandom(_sessionRandom);
            var accessToken = _restClient.SharePointClient.InitApiMethods<SharePointApi>().GetAccessToken();
            var actualFileSize = _restClient.SharePointClient.InitApiMethods<SharePointApi>().GetFileSizeModified(accessToken, filePath);
            Verify.AreNotEqual(_modifiedFile.ModifiedFileSize, actualFileSize, $"File size for '{filePath}' has not changed on Sharepoint cloud storage. Actual File size:{actualFileSize}. Saved File file size :{_modifiedFile.ModifiedFileSize}");
        }

        [When(@"User remembers modified time for '([^']*)' file on Sharepoint cloud storage")]
        public void WhenUserRemembersModifiedTimeForFileOnSharepointCloudStorage(string filePath)
        {
            filePath = filePath.AddRandom(_sessionRandom);
            var accessToken = _restClient.SharePointClient.InitApiMethods<SharePointApi>().GetAccessToken();
            var value = _restClient.SharePointClient.InitApiMethods<SharePointApi>().GetFileModified(accessToken, filePath);
            _modifiedFile.ModifiedTime = DateTime.ParseExact(value, "M/d/yyyy h:mm:ss tt", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd h:mm:ss tt");
        }

        [When(@"User remembers file size for '([^']*)' file on Sharepoint cloud storage")]
        public void WhenUserRemembersFileSizeForFileOnSharepointCloudStorage(string filePath)
        {
            filePath = filePath.AddRandom(_sessionRandom);
            var accessToken = _restClient.SharePointClient.InitApiMethods<SharePointApi>().GetAccessToken();
            _modifiedFile.ModifiedFileSize = _restClient.SharePointClient.InitApiMethods<SharePointApi>().GetFileSizeModified(accessToken, filePath);
        }

        [Then(@"'([^']*)' file name with path '([^']*)' exist on Sharepoint cloud storage via Api")]
        public void ThenFileNameWithPathExistOnSharepointCloudStorageViaApi(string fileName, string folderName)
        {
            fileName = fileName.AddRandom(_sessionRandom);
            var accessToken = _restClient.SharePointClient.InitApiMethods<SharePointApi>().GetAccessToken();
            Verify.IsTrue(_restClient.SharePointClient.InitApiMethods<SharePointApi>().IsFileExistOnSharePoint(accessToken, folderName, fileName),
              $"'{fileName}' name does not exist in '{folderName}' on Sharepoint cloud storage via Api");
            SharePointFileDto data = new SharePointFileDto();
            data.FileName = fileName;
            data.AccessToken = accessToken;
            data.FolderName = folderName;
            _fileList.Value.Add(data);
        }
    }
}
