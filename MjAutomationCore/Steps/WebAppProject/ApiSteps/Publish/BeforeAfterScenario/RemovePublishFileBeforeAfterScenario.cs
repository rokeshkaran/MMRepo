using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.Publish;
using MjAutomationCore.General.Api.Publish;
using System;
using System.Linq;
using Reqnroll;
using AutomationUtils.Extensions;
using MjAutomationCore.DTO.BaseDto.RunTimeVariables.Account;

namespace MjAutomationCore.Steps.WebAppProject.Publish.BeforeAfterScenario
{
    [Binding]
    class RemovePublishFileBeforeAfterScenario : Reqnroll.Steps
    {
        protected readonly RestWebClient _restClient;
        protected readonly PublishList _publishList;

        public RemovePublishFileBeforeAfterScenario(RestWebClient restClient, PublishList publishList, UserDataList userDataList)
        {
            _restClient = restClient;
            _publishList = publishList;
        }

        [AfterScenario("Cleanup")]
        public void DeletePublishedFile()
        {
            if (!_publishList.Value.Any())
            {
                return;
            }

            try
            {
                UpdatePublishedFileList();
            }
            catch (Exception e)
            {
                AutomationUtils.Utils.Logger.Write($"Published File List can not be updated before file clean up. Exception: {e}", AutomationUtils.Utils.Logger.LogLevel.Error);
                throw;
            }

            foreach (var publishFile in _publishList.Value)
            {
                try
                {
                    _restClient.FrontendV1Client.InitApiMethods<PublishApi>().DeletePublishFile(publishFile.PublishId, publishFile.UserToken);
                }
                catch (Exception e)
                {
                    AutomationUtils.Utils.Logger.Write($"Published file '{publishFile.Name}' with name wasn't deleted. Exception: {e}", AutomationUtils.Utils.Logger.LogLevel.Info);
                }
            }
        }

        private void UpdatePublishedFileList()
        {
            var token = _publishList.Value.Where(x => x.UserToken != null).Select(x => x.UserToken).FirstOrDefault();
            var currentPublishFileList =_restClient.FrontendV1Client.InitApiMethods<PublishApi>().GetPublishList(token);
            _publishList.Value.RemoveAll(x => !currentPublishFileList.Select(y => y.PublishId).Contains(x.PublishId));
        }
    }
}
