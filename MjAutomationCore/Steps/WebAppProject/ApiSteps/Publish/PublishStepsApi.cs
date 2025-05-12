using AutomationUtils.Extensions;
using AutomationUtils.Utils;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.DTO.WebAppDTO.Publish;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.Publish;
using MjAutomationCore.Extensions;
using MjAutomationCore.General.Api.Account;
using MjAutomationCore.General.Api.Publish;
using MjAutomationCore.Helpers;
using MjAutomationCore.Providers;
using MjAutomationCore.Providers.Base;
using MjAutomationCore.Providers.Clouds.Google;
using MjAutomationCore.Providers.UserProvider;
using MjAutomationCore.Utils;
using Newtonsoft.Json;
using OpenQA.Selenium;
using System.Linq;
using Reqnroll;
using Reqnroll.Assist;

namespace MjAutomationCore.Steps.WebAppProject.Publish
{
    [Binding]
    class PublishStepsApi : ReqnrollContext
    {
        protected readonly RestWebClient _restClient;
        private readonly SessionRandomValue _sessionRandom;
        private WebDriver _driver;
        private readonly BrowsersList _browsersList;
        private PublishDto _publish;
        protected readonly PublishList _publishes;
        private ScenarioContext _scenarioContext;

        public PublishStepsApi(RestWebClient restClient, SessionRandomValue sessionRandom, WebDriver driver, BrowsersList browsersList, PublishDto publish, PublishList publishes, ScenarioContext scenarioContext)
        {
            _restClient = restClient;
            _sessionRandom = sessionRandom;
            _driver = driver;
            _publish = publish;
            _browsersList = browsersList;
            _publishes = publishes;
            _scenarioContext = scenarioContext;
        }

        [Given(@"User uploads following publish files via Api")]
        public void GivenUserUploadsFollowingPublishFilesViaApi(Table table)
       {
            var data = table.CreateSet<PublishDto>();
            foreach (PublishDto publish in data)
            {
                publish.Name = publish.Name.AddRandom(_sessionRandom);
                var token = _restClient.FrontendV1Client.InitApiMethods<SignInApiMethods>().ExtractIdToken(_restClient.FrontendV1Client.InitApiMethods<SignInApiMethods>().PostSignInRequest(RegularUserProvider.Email, RegularUserProvider.Password));
                var id = _restClient.FrontendV1Client.InitApiMethods<PublishApi>().CreatePublishId(token);
                publish.PublishId = id;
                publish.UserToken = token;
                _restClient.FrontendV1Client.InitApiMethods<PublishApi>().PublishFile(publish, token);
                AutomationUtils.Utils.Logger.Write($"Published File with name '{publish.Name}' uploaded  for test: '{_scenarioContext.ScenarioInfo.Title}'", AutomationUtils.Utils.Logger.LogLevel.Info);

            }
            _publishes.Value.AddRange(data);
        }

        [Given(@"'([^']*)' User uploads following publish files via Api")]
        public void GivenUserUploadsFollowingPublishFilesViaApi(string user, Table table)
        {
            var data = table.CreateSet<PublishDto>();
            foreach (PublishDto publish in data)
            {
                publish.Name = publish.Name.AddRandom(_sessionRandom);
                var token = _restClient.FrontendV1Client.InitApiMethods<SignInApiMethods>().ExtractIdToken(_restClient.FrontendV1Client.InitApiMethods<SignInApiMethods>().PostSignInRequest(MetaUaAccountProvider.GetFormattedLoginString(user), MetaUaAccountProvider.Password));
                var id = _restClient.FrontendV1Client.InitApiMethods<PublishApi>().CreatePublishId(token);
                publish.PublishId = id;
                publish.UserToken = token;
                _restClient.FrontendV1Client.InitApiMethods<PublishApi>().PublishFile(publish, token);
                AutomationUtils.Utils.Logger.Write($"Published File with name '{publish.Name}' uploaded  for test: '{_scenarioContext.ScenarioInfo.Title}'", AutomationUtils.Utils.Logger.LogLevel.Info);
            }
            _publishes.Value.AddRange(data);
        }

        [Then(@"published file with '([^']*)' name exists via Api")]
        public void ThenPublishedFileWithNameExistsViaApi(string fileName)
        {
            fileName = fileName.AddRandom(_sessionRandom);
            if (_publishes.Value.Any(x => x.Name.Equals(fileName)))
            {
                var publishData = _publishes.Value.First(x => x.Name.Equals(fileName));
                Verify.IsTrue(_restClient.FrontendV1Client.InitApiMethods<PublishApi>().PublishedFileExistes(publishData.Name, publishData.UserToken),
                    $"Published file with '{fileName}' name does not exit");
            }
            else
            {
                var token = _restClient.FrontendV1Client.InitApiMethods<SignInApiMethods>().ExtractIdToken(_restClient.FrontendV1Client.InitApiMethods<SignInApiMethods>().PostSignInRequest(RegularUserProvider.Email, RegularUserProvider.Password));
                Verify.IsTrue(_restClient.FrontendV1Client.InitApiMethods<PublishApi>().PublishedFileExistes(fileName, token),
                    $"Published file with '{fileName}' name does not exit");
                var ob = _restClient.FrontendV1Client.InitApiMethods<PublishApi>().GetPublishedFileByName(fileName, token);
                ob.UserToken = token;
                _publishes.Value.Add(ob);
            }
        }

        [Then(@"published file with '([^']*)' name does not exist via Api")]
        public void ThenPublishedFileWithNameDoesNotExistViaApi(string fileName)
        {
            fileName = fileName.AddRandom(_sessionRandom);
            if (_publishes.Value.Any(x => x.Name.Equals(fileName)))
            {
                var publishData = _publishes.Value.First(x => x.Name.Equals(fileName));
                Verify.IsFalse(_restClient.FrontendV1Client.InitApiMethods<PublishApi>().PublishedFileExistes(publishData.Name, publishData.UserToken),
                    $"Published file with '{fileName}' name is exits");
            }
            else
            {
                var token = _restClient.FrontendV1Client.InitApiMethods<SignInApiMethods>().ExtractIdToken(_restClient.FrontendV1Client.InitApiMethods<SignInApiMethods>().PostSignInRequest(RegularUserProvider.Email, RegularUserProvider.Password));
                Verify.IsFalse(_restClient.FrontendV1Client.InitApiMethods<PublishApi>().PublishedFileExistes(fileName, token),
                    $"Published file with '{fileName}' name is exits");
            }
        }

        [When(@"User deletes published file with '([^']*)' name via Api")]
        public void WhenUserDeletesPublishedFileWithNameViaApi(string fileName)
        {
            fileName = fileName.AddRandom(_sessionRandom);
            if (_publishes.Value.Any(x => x.Name.Equals(fileName)))
            {
                var publishedFileName = _publishes.Value.First(x => x.Name.Equals(fileName));
                _restClient.FrontendV1Client.InitApiMethods<PublishApi>().DeletePublishFile(publishedFileName.PublishId, publishedFileName.UserToken);
            }
            else
            {
                var token = _restClient.FrontendV1Client.InitApiMethods<SignInApiMethods>().ExtractIdToken(_restClient.FrontendV1Client.InitApiMethods<SignInApiMethods>().PostSignInRequest(RegularUserProvider.Email, RegularUserProvider.Password));
                var publisheId = _restClient.FrontendV1Client.InitApiMethods<PublishApi>().GetPublishedFileByName(fileName, token).PublishId;
                _restClient.FrontendV1Client.InitApiMethods<PublishApi>().DeletePublishFile(publisheId, token);
            }
        }

        [When(@"User opens published file with '([^']*)' name in browser via Api")]
        public void WhenUserOpensPublishedFileWithNameInBrowserViaApi(string fileName)
        {
            fileName = fileName.AddRandom(_sessionRandom);
            if (_publishes.Value.Any(x => x.Name.Equals(fileName)))
            {
                var publishedFile = _publishes.Value.First(x => x.Name.Equals(fileName));
                _browsersList.Active.Navigate().GoToUrl(UrlProvider.Url + "#publish/" + publishedFile.PublishId);
            }
            else
            {
                var token = _restClient.FrontendV1Client.InitApiMethods<SignInApiMethods>().ExtractIdToken(_restClient.FrontendV1Client.InitApiMethods<SignInApiMethods>().PostSignInRequest(RegularUserProvider.Email, RegularUserProvider.Password));
                var publisheId = _restClient.FrontendV1Client.InitApiMethods<PublishApi>().GetPublishedFileByName(fileName, token).PublishId;
                _browsersList.Active.Navigate().GoToUrl(UrlProvider.Url + "#publish/" + publisheId);
            }
            if (Browser.BrowserType.Equals("remote"))
            {
                CookieHelper.SetOptanonCookies(_browsersList.Active);
                _browsersList.Active.Navigate().Refresh();
            }
        }

        [Then(@"'([^']*)' publish file is open to User")]
        public void ThenPublishFileIsOpenToUser(string fileName)
        {
            fileName = fileName.AddRandom(_sessionRandom);
            var fileId = GetPublishData(fileName).PublishId;
            var currentURL = _driver.Url;
            Verify.Contains($"#publish/{fileId}", currentURL, $"File with '{fileName}' name was not opened in the browser");
        }

        [Given(@"Add data to publish update request")]
        public void GivenAddDataToPublishUpdateRequest(Table table)
        {
            _publish = table.CreateInstance<PublishDto>();
        }

        [Given(@"Add options to publish update request")]
        public void GivenAddOptionsToPublishUpdateRequest(Table table)
        {
            var option = table.CreateInstance<Option>();
            var settings = new JsonSerializerSettings
            {
                NullValueHandling = NullValueHandling.Ignore
            };
            string json = JsonConvert.SerializeObject(option, settings);
            _publish.Options = json;
        }

        [When(@"User performs publish update request for '([^']*)' published file via Api")]
        public void WhenUserPerformsPublishUpdateRequestForPublishedFileViaApi(string fileName)
        {
            _publish.PublishId = GetPublishData(fileName).PublishId;
            var settings = new JsonSerializerSettings
            {
                NullValueHandling = NullValueHandling.Ignore
            };
            var jsonRequest = JsonConvert.SerializeObject(_publish, settings);
            _restClient.FrontendV1Client.InitApiMethods<PublishApi>().ChengeOptions(jsonRequest, GetPublishData(fileName).UserToken);
        }

        public PublishDto GetPublishData(string fileName)
        {
            fileName = fileName.AddRandom(_sessionRandom);
            if (_publishes.Value.Any(x => x.Name.Equals(fileName)))
            {
                return _publishes.Value.First(x => x.Name.Equals(fileName));
            }
            else
            {
                var token = _restClient.FrontendV1Client.InitApiMethods<SignInApiMethods>().ExtractIdToken(_restClient.FrontendV1Client.InitApiMethods<SignInApiMethods>().PostSignInRequest(RegularUserProvider.Email, RegularUserProvider.Password));
                var ob = _restClient.FrontendV1Client.InitApiMethods<PublishApi>().GetPublishedFileByName(fileName, token);
                ob.UserToken = token;
                _publishes.Value.Add(ob);
                return ob;
            }
        }

        [Then(@"number of view for '([^']*)' published file has changed via Api")]
        public void ThenNumberOfViewForPublishedFileHasChangedViaApi(string fileName)
        {
            fileName = fileName.AddRandom(_sessionRandom);
            _publish.PublishId = GetPublishData(fileName).PublishId;
            var viewsCount = _restClient.FrontendV1Client.InitApiMethods<PublishApi>().GetPublishedFileByName(fileName, GetPublishData(fileName).UserToken).ViewsCount;
            Verify.AreEqual(viewsCount, "1", $"Number of view for '{fileName}' published file has changed");
        }


    }
}
