using AutomationUtils.Extensions;
using AutomationUtils.Utils;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.DTO.WebAppDTO.Clouds.Box;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.Clouds.Box;
using MjAutomationCore.Extensions;
using MjAutomationCore.General.Api.Clouds;
using System.Linq;
using Reqnroll;
using Reqnroll.Assist;

namespace MjAutomationCore.Steps.WebAppProject.ApiSteps.Clouds.Box
{
    [Binding]
    class BoxStepsApi : ReqnrollContext
    {
        protected readonly RestWebClient _restClient;
        private readonly SessionRandomValue _sessionRandom;
        protected readonly BoxFileList _boxfileList;

        public BoxStepsApi(RestWebClient restClient, SessionRandomValue sessionRandom, BoxFileList boxfileList)
        {
            _restClient = restClient;
            _sessionRandom = sessionRandom;
            _boxfileList = boxfileList;
        }

        [Given(@"User uploads following files to '([^']*)' folder of Box cloud via Api")]
        public void GivenUserUploadsFollowingFilesToFolderOfBoxCloudViaApi(string folderName, Table table)
        {
            var boxFileDataCollection = table.CreateSet<BoxFileDto>();
            var accessToken = _restClient.BoxClient.InitApiMethods<BoxApi>().GetAccessToken();
            foreach (BoxFileDto boxFileData in boxFileDataCollection)
            {
                boxFileData.FileName = boxFileData.FileName.AddRandom(_sessionRandom);
                boxFileData.FileId = _restClient.BoxClient.InitApiMethods<BoxApi>().UploadFileToFolder(accessToken, folderName, boxFileData);
                boxFileData.AccessToken = accessToken;
                boxFileData.FolderName = folderName;
            }
            _boxfileList.Files.AddRange(boxFileDataCollection);
        }

        [Then(@"file '([^']*)' exists in '([^']*)' folder in Box cloud via Api")]
        public void ThenFileExistsInFolderInBoxCloudViaApi(string fileName, string folderName)
        {
            fileName = fileName.AddRandom(_sessionRandom);
            var accessToken = _restClient.BoxClient.InitApiMethods<BoxApi>().GetAccessToken();
            var folderId = _restClient.BoxClient.InitApiMethods<BoxApi>().SearchBoxItem(accessToken, folderName, "folder").Entries.First(x => x.Name.Equals(folderName)).Id;
            var fileExists = _restClient.BoxClient.InitApiMethods<BoxApi>().IsFileInFolderExist(accessToken, folderId, fileName);
            Verify.IsTrue(fileExists, $"File with name '{fileName}' does not exist in '{folderName}' folder in Box cloud");

            // Add file details to the list
            var fileId = _restClient.BoxClient.InitApiMethods<BoxApi>().GetFilesInFolder(accessToken, folderId).Entries.First(x => x.Name.Equals(fileName)).Id;
            var data = new BoxFileDto
            {
                FileName = fileName,
                FileId = fileId,
                AccessToken = accessToken
            };
            _boxfileList.Files.Add(data);
        }
    }
}