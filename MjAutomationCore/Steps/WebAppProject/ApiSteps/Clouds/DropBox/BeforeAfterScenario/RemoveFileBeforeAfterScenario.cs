using Dropbox.Api;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.Clouds.DropBox;
using System;
using System.Linq;
using Reqnroll;
using System.Threading.Tasks;

namespace MjAutomationCore.Steps.WebAppProject.ApiSteps.Clouds.DropBox.BeforeAfterScenario
{
    [Binding]
    class RemoveFileBeforeAfterScenario
    {
        private readonly DropBoxFileList _dropboxfileList;

        public RemoveFileBeforeAfterScenario(DropBoxFileList DropboxFileList)
        {
            _dropboxfileList = DropboxFileList;
        }

        [AfterScenario("Cleanup")]
        public async Task DeleteFileFromDropBoxCloud()
        {
            if (!_dropboxfileList.Value.Any()) return;

            foreach (var file in _dropboxfileList.Value)
            {
                try
                {
                    var dropboxConfig = new DropboxClientConfig("API_CLIENT_IDENTIFIER");
                    var dropboxClient = new DropboxClient(file.AccessToken, dropboxConfig);
                    var deleteResult = await dropboxClient.Files.DeleteV2Async($"/{file.FileName}");
                }
                catch (Exception e)
                {
                    AutomationUtils.Utils.Logger.Write($"File with name '{file.FileName}' wasn't deleted. Exception: {e}", AutomationUtils.Utils.Logger.LogLevel.Info);
                }
            }
        }
    }
}
