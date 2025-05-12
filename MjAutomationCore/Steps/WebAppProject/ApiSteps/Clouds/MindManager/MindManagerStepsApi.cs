using AutomationUtils.Extensions;
using AutomationUtils.Utils;
using MjAutomationCore.DTO.BaseDto.AccountDTO;
using MjAutomationCore.DTO.BaseDto.RunTimeVariables.Account;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.DTO.WebAppDTO.Clouds.MindManagerCloud.MindManagerStorageExplorer;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.Clouds.MindManager;
using MjAutomationCore.Extensions;
using MjAutomationCore.General.Api.Account;
using MjAutomationCore.General.Api.Clouds;
using MjAutomationCore.Providers.Base;
using MjAutomationCore.Providers.UserProvider;
using MjAutomationCore.Utils;
using OpenQA.Selenium;
using System.Linq;
using System.Threading;
using Reqnroll;
using Reqnroll.Assist;
using Logger = AutomationUtils.Utils.Logger;

namespace MjAutomationCore.Steps.WebAppProject.ApiSteps.Clouds.MindManager
{
    [Binding]
    public class MindManagerStepsApi
    {
        protected readonly RestWebClient _restClient;
        private readonly SessionRandomValue _sessionRandom;
        protected readonly MindManagerCloudItemList _mindManagerCloudItemList;
        private readonly MindManagerCloudItemDto _mindmanagerfile;
        protected readonly UserDataDto _userData;
        protected UserDataList _userDataList;
        private readonly WebDriver _driver;
        private ScenarioContext _scenarioContext;
        private readonly BrowsersList _browsers;


        public MindManagerStepsApi(RestWebClient restClient, SessionRandomValue sessionRandom, MindManagerCloudItemList fileList, MindManagerCloudItemDto mindmanagerfile, UserDataDto userData, WebDriver webDriver, UserDataList userDataList, ScenarioContext scenarioContext, BrowsersList browsersList)
        {
            _restClient = restClient;
            _sessionRandom = sessionRandom;
            _mindManagerCloudItemList = fileList;
            _mindmanagerfile = mindmanagerfile;
            _userData = userData;
            _driver = webDriver;
            _userDataList = userDataList;
            _scenarioContext = scenarioContext;
            _browsers = browsersList;
        }

        [Given(@"User uploads following files to '([^']*)' folder of Mind Manager cloud via Api")]
        public void GivenUserUploadsFollowingFilesToFolderOfMindManagerCloudViaApi(string folderName, Table table)
        {
            string token = _userDataList.GetTokenFromUserDataList(RegularUserProvider.Email, RegularUserProvider.Password);
            UploadFileToMMCloud(token, folderName, table);
        }

        [Given(@"'([^']*)' User uploads following files to '([^']*)' folder of Mind Manager cloud via Api")]
        public void GivenUserUploadsFollowingFilesToFolderOfMindManagerCloudViaApi(string userNumber, string folderName, Table table)
        {
            string token = _userDataList.GetTokenFromUserDataList(MetaUaAccountProvider.GetFormattedLoginString(userNumber), MetaUaAccountProvider.Password);
            UploadFileToMMCloud(token, folderName, table);
        }

        [When(@"User opens '([^']*)' Mind Manager File in browser")]
        public void WhenUserOpensMindManagerFileInBroswer(string mapName)
        {
            mapName = mapName.AddRandom(_sessionRandom);
            var mapId = _mindManagerCloudItemList.Value.FirstOrDefault(x => x.ItemName.Equals(mapName)).ItemId;
            mapId = "\"" + mapId + "\""; ;
            var mapIdBytes = System.Text.Encoding.UTF8.GetBytes(mapId);
            var test = System.Convert.ToBase64String(mapIdBytes);
            _browsers.Active.Navigate().GoToUrl(UrlProvider.Url + $"/#services/mmcloud-service/{System.Convert.ToBase64String(mapIdBytes)}");
            _browsers.Active.WaitForDataLoading();
        }

        private void UploadFileToMMCloud(string token, string folderName, Table table)
        {
            var allData = table.CreateSet<MindManagerCloudItemDto>();
            foreach (MindManagerCloudItemDto data in allData)
            {
                data.ItemName = data.ItemName.AddRandom(_sessionRandom);
                data.ItemId = _restClient.BackendV1Client.InitApiMethods<MindManagerCloudApi>().UploadFileToFolder(data, folderName.AddRandom(_sessionRandom), token);
                data.Token = token;
                AutomationUtils.Utils.Logger.Write($"File with name '{data.ItemName}' uploaded  for test: '{_scenarioContext.ScenarioInfo.Title}'", AutomationUtils.Utils.Logger.LogLevel.Info);
            }
            _mindManagerCloudItemList.Value.AddRange(allData);
            Thread.Sleep(3000);//Wait for file updated to AWS to complete
        }

        [Then(@"newly created map is saved in '([^']*)' folder on MindManager Cloud via Api")]
        public void ThenMapIsSavedInFolderOnMindManagerCloudViaApi(string folderPath)
        {
            string token = _userDataList.GetTokenFromUserDataList(RegularUserProvider.Email, RegularUserProvider.Password);
            var actualFileLoc = _restClient.BackendV1Client.InitApiMethods<MindManagerCloudApi>().GetItemPathByNameAndFolder(_mindmanagerfile.ItemName, folderPath, token);
            Verify.AreEqual(actualFileLoc, folderPath, $"Map location is not '{folderPath}'. Actual: '{actualFileLoc}'");
        }

        [When(@"User create '([^']*)' folder in '([^']*)' directory of Mind Manager Cloud via API")]
        public void WhenUserCreateFolderInDirectoryOfMindManagerCloudViaAPI(string folderName, string directory)
        {
            folderName = folderName.AddRandom(_sessionRandom);
            var token = _userDataList.GetTokenFromUserDataList(RegularUserProvider.Email, RegularUserProvider.Password);
            var folderdetails = _restClient.BackendV1Client.InitApiMethods<MindManagerCloudApi>().CreateFolder(folderName, directory, token);
            folderdetails.Token = token;
            _mindManagerCloudItemList.Value.Add(folderdetails);
        }

        [When(@"User remembers mindmanager cloud template map details from '([^']*)' directory via API")]
        public void WhenUserRemembersMindmanagerCloudTemplateMapDetailsFromDirectoryViaAPI(string directory)
        {
            var token = _userDataList.GetTokenFromUserDataList(RegularUserProvider.Email, RegularUserProvider.Password);
            _mindmanagerfile.ItemName = _driver.Title + ".mmap";
            _mindmanagerfile.ItemId = _restClient.BackendV1Client.InitApiMethods<MindManagerCloudApi>().GetItemIdByNameAndFolder(_mindmanagerfile.ItemName, directory, token);
            _mindmanagerfile.Token = token;
            _mindManagerCloudItemList.Value.Add(_mindmanagerfile);
            Logger.Write($"File with name '{_mindmanagerfile.ItemName}' has been saved to MindManager Cloud", Logger.LogLevel.Info);
        }

        [When(@"'([^']*)' User remembers mindmanager cloud template map details from '([^']*)' directory via API")]
        public void WhenUserRemembersMindmanagerCloudTemplateMapDetailsFromDirectoryViaAPI(string userIndex, string directory)
        {
            var token = _userDataList.GetTokenFromUserDataList(MetaUaAccountProvider.GetFormattedLoginString(userIndex), MetaUaAccountProvider.Password);
            _mindmanagerfile.ItemName = _driver.Title + ".mmap";
            _mindmanagerfile.ItemId = _restClient.BackendV1Client.InitApiMethods<MindManagerCloudApi>().GetItemIdByNameAndFolder(_mindmanagerfile.ItemName, directory, token);
            _mindmanagerfile.Token = token;
            _mindManagerCloudItemList.Value.Add(_mindmanagerfile);
            Logger.Write($"File with name '{_mindmanagerfile.ItemName}' has been saved to MindManager Cloud", Logger.LogLevel.Info);
        }

        [When(@"User remembers '([^']*)' mindmanager cloud item details from '([^']*)' directory via API")]
        public void WhenUserRemembersMindmanagerCloudSubfolderInFolderDetailsViaAPI(string item, string directory)
        {
            //Wait for file/folder to available in API
            Thread.Sleep(3000);
            var itemName = item.AddRandom(_sessionRandom);
            var token = _userDataList.GetTokenFromUserDataList(RegularUserProvider.Email, RegularUserProvider.Password);
            directory = directory.AddRandom(_sessionRandom);
            _mindmanagerfile.ItemName = itemName;
            _mindmanagerfile.ItemId = _restClient.BackendV1Client.InitApiMethods<MindManagerCloudApi>().GetItemIdByNameAndFolder(_mindmanagerfile.ItemName, directory, token);
            _mindmanagerfile.Token = _userData.IdToken;
            _mindManagerCloudItemList.Value.Add(_mindmanagerfile);
            Logger.Write($"Item with name '{_mindmanagerfile.ItemName}' and id '{_mindmanagerfile.ItemId}' has been saved to MindManager Cloud", Logger.LogLevel.Info);
        }

        [Then(@"'([^']*)' mindmanager cloud item is saved in '([^']*)' folder from '([^']*)' directory via API")]
        public void ThenMindmanagerCloudItemIsSavedInFolderFromDirectoryViaAPI(string itemName, string folder, string directory)
        {
            itemName = itemName.AddRandom(_sessionRandom);
            var accessToken = _userDataList.GetTokenFromUserDataList(RegularUserProvider.Email, RegularUserProvider.Password);
            var allItems = _restClient.BackendV1Client.InitApiMethods<MindManagerCloudApi>().GetItemsByDirectoryAndFolder(accessToken, directory, folder).ItemDetails;
            Verify.IsTrue(allItems.Any(x => x.ItemName.Equals(itemName)), $"'{itemName}' item is not stored in '{folder}' folder");
        }

        [Then(@"'([^']*)' files count is located in '([^']*)' folder on Mind Manager сloud for regular user via API")]
        public void ThenFilesCountIsLocatedInFolderOnMindManagerСloudForRegularUserViaAPI(int count, string folder)
        {
            var token = _userDataList.GetTokenFromUserDataList(RegularUserProvider.Email, RegularUserProvider.Password);
            var apiCount = _restClient.BackendV1Client.InitApiMethods<MindManagerCloudApi>().GetItemsByDirectoryAndFolder(token, "own", folder).ItemDetails.Count;
            Verify.AreEqual(count, apiCount, $"Files count is '{apiCount}' rather than '{count}' files in Mind Manager cloud '{folder}' folder");
        }

        [Then(@"'([^']*)' mindmanager cloud item is NOT saved in '([^']*)' folder from '([^']*)' directory via API")]
        public void ThenMindmanagerCloudItemIsNotSavedInFolderFromDirectoryViaAPI(string itemName, string folder, string directory)
        {
            itemName = itemName.AddRandom(_sessionRandom);
            var accessToken = _userDataList.GetTokenFromUserDataList(RegularUserProvider.Email, RegularUserProvider.Password);
            var allItems = _restClient.BackendV1Client.InitApiMethods<MindManagerCloudApi>().GetItemsByDirectoryAndFolder(accessToken, directory, folder).ItemDetails;
            Verify.IsFalse(allItems.Any(x => x.ItemName.Equals(itemName)), $"'{itemName}' item is not stored in '{folder}' folder");
        }

        [When(@"User shares '([^']*)' MindManager cloud file with '([^']*)' permission to '([^']*)' user email via API")]
        public void WhenUserSharesMindManagerCloudFileWithPermissionToUserEmailViaAPI(string mapName, string permission, string email)
        {
            var token = _userDataList.GetTokenFromUserDataList(RegularUserProvider.Email, RegularUserProvider.Password);
            var mapId = _mindManagerCloudItemList.Value.FirstOrDefault(x => x.ItemName.Equals(mapName.AddRandom(_sessionRandom))).ItemId;
            if (int.TryParse(email, out _))
            {
                email = MetaUaAccountProvider.GetFormattedLoginString(email);
            }
            _restClient.BackendV1Client.InitApiMethods<MindManagerCloudApi>().ShareMapLinkInEmail(token, email.AddRandom(_sessionRandom), permission, mapId);
        }
    }
}