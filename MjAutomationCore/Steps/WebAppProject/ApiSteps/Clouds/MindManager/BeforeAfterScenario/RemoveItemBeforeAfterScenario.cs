using AutomationUtils.Extensions;
using MjAutomationCore.DTO.BaseDto.AccountDTO;
using MjAutomationCore.DTO.BaseDto.RunTimeVariables.Account;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.Clouds.MindManager;
using MjAutomationCore.General.Api.Clouds;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.ApiSteps.Clouds.MindManager.BeforeAfterScenario
{
    [Binding]
    public class RemoveItemBeforeAfterScenario
    {
        protected readonly RestWebClient _restClient;
        private readonly MindManagerCloudItemList _itemList;
        private ScenarioContext _scenarioContext;
        protected readonly UserDataDto _userData;
        protected readonly UserDataList _userDataList;

        public RemoveItemBeforeAfterScenario(RestWebClient restClient, MindManagerCloudItemList itemList, UserDataDto userData, ScenarioContext scenarioContext, UserDataList userDataList)
        {
            _restClient = restClient;
            _itemList = itemList;
            _userData = userData;
            _scenarioContext = scenarioContext;
            _userDataList = userDataList;
        }

        [AfterScenario("Cleanup")]
        public void DeleteItemFromMMCloud()
        {
            if (!_itemList.Value.Any()) return;
            foreach (var file in _itemList.Value)
            {
                try
                {
                    _restClient.BackendV1Client.InitApiMethods<MindManagerCloudApi>().RemoveItemById(file.ItemId, file.Token);
                }
                catch (Exception e)
                {
                    AutomationUtils.Utils.Logger.Write($"File with name '{file.ItemName}' and id '{file.ItemId}' wasn't deleted for test: '{_scenarioContext.ScenarioInfo.Title}'. Exception: {e}", AutomationUtils.Utils.Logger.LogLevel.Info);
                }
            }
        }
    }
}
