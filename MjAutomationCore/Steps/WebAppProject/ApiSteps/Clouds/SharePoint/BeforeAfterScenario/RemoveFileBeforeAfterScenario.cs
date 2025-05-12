using AutomationUtils.Extensions;
using AutomationUtils.Utils;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.Clouds.SharePoint;
using MjAutomationCore.General.Api.Clouds;
using System;
using System.Linq;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.ApiSteps.Clouds.BeforeAfterScenario
{
    [Binding]
    public class RemoveFileBeforeAfterScenario
    {
        protected readonly RestWebClient _restClient;
        private readonly SharePointFileList _fileList;

        public RemoveFileBeforeAfterScenario(RestWebClient restClient, SharePointFileList fileList)
        {
            _restClient = restClient;
            _fileList = fileList;
        }

        [AfterScenario("Cleanup")]
        public void DeleteFileFromSharePointCloud()
        {
            if (!_fileList.Value.Any()) return;
            foreach (var file in _fileList.Value)
            {
                try
                {
                    _restClient.SharePointClient.InitApiMethods<SharePointApi>().RemoveFileFromFolder(file.AccessToken, file.FolderName, file.FileName);
                }
                catch (Exception e)
                {
                    AutomationUtils.Utils.Logger.Write($"File with name '{file.FileName}' wasn't deleted. Exception: {e}", AutomationUtils.Utils.Logger.LogLevel.Info);
                }
            }
        }
    }
}
