using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.Extensions;
using System.Threading.Tasks;
using Reqnroll;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.Clouds.DropBox;
using Reqnroll.Assist;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using AutomationUtils.Extensions;
using MjAutomationCore.General.Api.Clouds;

namespace MjAutomationCore.Steps.WebAppProject.ApiSteps.Clouds.DropBox
{
    [Binding]
    class DropBoxStepsApi : ReqnrollContext
    {
        private readonly SessionRandomValue _sessionRandom;
        protected readonly DropBoxFileList _DropboxfileList;
        protected readonly RestWebClient _restClient;
        private string accessToken;

        public DropBoxStepsApi(RestWebClient restClient, SessionRandomValue sessionRandom, DropBoxFileList DropboxfileList)
        {
            _restClient = restClient;
            _sessionRandom = sessionRandom;
            _DropboxfileList = DropboxfileList;
        }

        [When(@"the user uploads the following files to Dropbox via Api")]
        public async Task WhenTheUserUploadsTheFollowingFilesToDropboxViaApi(Table fileTable)
        {
            accessToken = _restClient.DropBoxClient.InitApiMethods<DropBoxApi>().GetAccessToken();
            var allData = fileTable.CreateSet<DropBoxFileDto>();
            foreach (DropBoxFileDto data in allData)
            {
                data.FileName = data.FileName.AddRandom(_sessionRandom);
                data.FilePath = data.FilePath;
                data.AccessToken = accessToken;
                _restClient.DropBoxClient.InitApiMethods<DropBoxApi>().UploadFileToDropbox(data.AccessToken, data.FilePath, data.FileName);
            }
            _DropboxfileList.Value.AddRange(allData);
        }
    }
}
