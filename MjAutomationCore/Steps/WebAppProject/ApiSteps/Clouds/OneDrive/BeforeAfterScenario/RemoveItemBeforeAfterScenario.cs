using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.Clouds.MindManager;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Reqnroll;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.Clouds.OneDrive;
using MjAutomationCore.DTO.BaseDto.RunTimeVariables.Account;
using RestSharp;
using AutomationUtils.Extensions;
using MjAutomationCore.General.Api.Clouds;

namespace MjAutomationCore.Steps.WebAppProject.ApiSteps.Clouds.OneDrive.BeforeAfterScenario
{   
    [Binding]
    public class RemoveItemBeforeAfterScenario
    {   
        protected readonly RestWebClient _restClient;
        private readonly OneDriveItemList _oneDriveItemList;
        private ScenarioContext _scenarioContext;

        public RemoveItemBeforeAfterScenario(RestWebClient restClient, OneDriveItemList oneDriveItemList, ScenarioContext scenarioContext)
        {
            _restClient = restClient;
            _scenarioContext = scenarioContext;
            _oneDriveItemList = oneDriveItemList;
        }
        [AfterScenario("Cleanup")]
        public void DeleteItemFromOneDrive()
        {
            if (!_oneDriveItemList.Value.Any()) return;
            foreach (var item in _oneDriveItemList.Value)
            {
                try
                {
                    _restClient.OneDriveGraphApi.InitApiMethods<OneDriveApi>().DeleteItemById(item.UserEmail,item.AccessToken ,item.ItemId);
                }
                catch (Exception e)
                {
                    AutomationUtils.Utils.Logger.Write($"OneDrive item with name '{item.ItemName}' and id '{item.ItemId}' wasn't deleted for test: '{_scenarioContext.ScenarioInfo.Title}'. Exception: {e}", AutomationUtils.Utils.Logger.LogLevel.Info);
                }
            }
        }
    }
}
