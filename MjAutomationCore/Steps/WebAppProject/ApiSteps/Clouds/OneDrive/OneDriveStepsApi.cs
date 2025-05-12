using MjAutomationCore.DTO.WebAppDTO;
using System;
using Reqnroll;
using OpenQA.Selenium;
using AutomationUtils.Extensions;
using MjAutomationCore.General.Api.Clouds;
using Reqnroll.Assist;
using MjAutomationCore.DTO.WebAppDTO.Clouds.OneDrive;
using MjAutomationCore.Extensions;
using AutomationUtils.Utils;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.Clouds.OneDrive;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Providers.Clouds.OneDrive;
using Azure.Core;
using System.Collections.Generic;
using MjAutomationCore.Providers.Clouds.SharePoint;

namespace MjAutomationCore.Steps.WebAppProject.ApiSteps.Clouds.OneDrive
{
    [Binding]
    public class OneDriveStepsApi
    {
        protected readonly RestWebClient _restClient;
        private readonly SessionRandomValue _sessionRandom;
        private OneDriveItemList _oneDriveItemList;
        private ScenarioContext _scenarioContext;

        public OneDriveStepsApi(RestWebClient restClient, SessionRandomValue sessionRandom, WebDriver driver, ScenarioContext scenarioContext, OneDriveItemList oneDriveItemList)
        {
            _restClient = restClient;
            _sessionRandom = sessionRandom;
            _oneDriveItemList = oneDriveItemList;
            _scenarioContext = scenarioContext;
        }

        [Given(@"User uploads following files to '([^']*)' folder of OneDrive cloud via Api")]
        public void GivenUserUploadsFollowingFilesToFolderOfOneDriveCloudViaApi(string folderName, Table table)
        {
            var allData = table.CreateSet<OneDriveItemDto>();
            var accessToken = _restClient.OneDriveGraphApi.InitApiMethods<OneDriveApi>().GetAccessToken();
            var userEmail = OneDriveProvider.OneDriveUserLogin;
            foreach (OneDriveItemDto data in allData)
            {
                try
                {
                    data.FileName = data.FileName.AddRandom(_sessionRandom);
                    data.ItemId = _restClient.OneDriveGraphApi.InitApiMethods<OneDriveApi>().UploadFileToFolder(userEmail, accessToken, folderName, data);
                    data.AccessToken = accessToken;
                    data.ParentFolderName = folderName;
                    data.UserEmail = userEmail;
                    Logger.Write($"OneDrive File with name '{data.ItemName}' uploaded  for test: '{_scenarioContext.ScenarioInfo.Title}'", AutomationUtils.Utils.Logger.LogLevel.Info);
                }
                catch (Exception ex)
                {
                    throw new Exception($"Error uploading OneDrive file {data.ItemName}: {ex.Message}");
                }
            }
            _oneDriveItemList.Value.AddRange(allData);
        }


        [Given(@"User '([^']*)' uploads following files to '([^']*)' folder of OneDrive cloud via Api")]
        public void GivenUserUploadsFollowingFilesToFolderOfOneDriveCloudViaApi(string userNumber, string folderName, Table table)
        {
            var allData = table.CreateSet<OneDriveItemDto>();
            var accessToken = _restClient.OneDriveGraphApi.InitApiMethods<OneDriveApi>().GetAccessToken();
            var userEmail = SharePointProvider.GetSharepointLogin(userNumber);
            foreach (OneDriveItemDto data in allData)
            {
                try
                {
                    data.FileName = data.FileName.AddRandom(_sessionRandom);
                    data.ItemId = _restClient.OneDriveGraphApi.InitApiMethods<OneDriveApi>().UploadFileToFolder(userEmail, accessToken, folderName, data);
                    data.AccessToken = accessToken;
                    data.ParentFolderName = folderName;
                    data.UserEmail = userEmail;
                    Logger.Write($"OneDrive File with name '{data.ItemName}' uploaded  for test: '{_scenarioContext.ScenarioInfo.Title}'", AutomationUtils.Utils.Logger.LogLevel.Info);
                }
                catch (Exception ex)
                {
                    throw new Exception($"Error uploading OneDrive file {data.ItemName}: {ex.Message}");
                }
            }
            _oneDriveItemList.Value.AddRange(allData);
        }

        //Examples:
        //Path for file   = "For QA automation/RuntimeData File/auto_test_SRND.mmap"
        //Path for folder = "For QA automation/RuntimeData File"
        [Then(@"item with Path '([^']*)' exists in OneDrive cloud via Api")]
        public void ThenItemWithPathExistsInOneDriveCloudViaApi(string itemPath)
        {
            itemPath = itemPath.AddRandom(_sessionRandom);
            var accessToken = _restClient.OneDriveGraphApi.InitApiMethods<OneDriveApi>().GetAccessToken();
            var userEmail = OneDriveProvider.OneDriveUserLogin;
            var itemDetails = _restClient.OneDriveGraphApi.InitApiMethods<OneDriveApi>().GetItemDetailsByPath(userEmail, accessToken, itemPath);
            itemDetails.AccessToken = accessToken;
            itemDetails.UserEmail = userEmail;
            Verify.IsNotEmpty(itemDetails.ItemId, $"Item with Path '{itemPath}' does not exists in OneDrive cloud");
            _oneDriveItemList.Value.Add(itemDetails);
        }

        //Example:
        //Directory = "For QA automation/RuntimeData File"
        [Given(@"User create new folder '([^']*)' in '([^']*)' directory in OneDrive cloud via Api")]
        public void GivenUserCreateFolderInFolderInOneDriveCloudViaApi(string folderName, string parentFolderName)
        {
            var folderDetails = new OneDriveItemDto();
            var accessToken = _restClient.OneDriveGraphApi.InitApiMethods<OneDriveApi>().GetAccessToken();
            var userEmail = OneDriveProvider.OneDriveUserLogin;
            try
            {
                folderDetails.ItemName = folderName.AddRandom(_sessionRandom);
                folderDetails.ItemId = _restClient.OneDriveGraphApi.InitApiMethods<OneDriveApi>().CreateFolder(userEmail, accessToken, folderDetails.ItemName, parentFolderName);
                folderDetails.AccessToken = accessToken;
                folderDetails.ParentFolderName = parentFolderName;
                folderDetails.UserEmail = userEmail;
                _oneDriveItemList.Value.Add(folderDetails);
                Logger.Write($"OneDrive Folder with name '{folderDetails.ItemName}' uploaded  for test: '{_scenarioContext.ScenarioInfo.Title}'", AutomationUtils.Utils.Logger.LogLevel.Info);
            }
            catch (Exception ex)
            {
                throw new Exception($"Error creating OneDrive folder {folderDetails.ItemName}: {ex.Message}");
            }
        }
    }
}
