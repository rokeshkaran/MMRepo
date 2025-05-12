using AutomationUtils.Extensions;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.Clouds.Box;
using MjAutomationCore.General.Api.Clouds;
using System;
using System.Linq;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.ApiSteps.Clouds.Box.BeforeAfterScenario
{
    [Binding]
    public  class RemoveFileBeforeAfterScenario
    {
        protected readonly RestWebClient _restClient;
        private readonly BoxFileList _boxFileList;

        public RemoveFileBeforeAfterScenario(RestWebClient restClient, BoxFileList boxFileList)
        {
            _restClient = restClient;
            _boxFileList = boxFileList;
        }

        [AfterScenario("Cleanup")]
        public void DeleteFileFromBoxCloud()
        {
            if (!_boxFileList.Files.Any()) return;
            
            foreach (var file in _boxFileList.Files)
            {
                try
                {
                    _restClient.BoxClient.InitApiMethods<BoxApi>().RemoveFileByID(file.AccessToken, file.FileId);
                }
                catch (Exception e)
                {
                    AutomationUtils.Utils.Logger.Write($"File with name '{file.FileName}' wasn't deleted. Exception: {e}", AutomationUtils.Utils.Logger.LogLevel.Info);
                }
            }
            
        }
    }
}
