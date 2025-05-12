using AutomationUtils.Utils;
using MjAutomationCore.DTO.SnapDTO.RunTimeVariables;
using MjAutomationCore.DTO.SnapDTO.SnapUser;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.General.Api.Snap;
using System;
using System.Linq;
using Reqnroll;
using AutomationUtils.Extensions;

namespace MjAutomationCore.Steps.SnapProject.BeforeAfterScenario
{
    [Binding]
    class SnapUserBeforeAfterScenario : ReqnrollContext
    {
        protected readonly RestWebClient _restClient;
        protected readonly UserTokenDto _userToken;
        protected readonly RecipientDto _recipient;
        protected readonly SnapRecipientsListDto _recipientList;
        public SnapUserBeforeAfterScenario(RestWebClient restClient, UserTokenDto userToken, RecipientDto recipient, SnapRecipientsListDto recipientList)
        {
            _restClient = restClient;
            _userToken = userToken;
            _recipient = recipient;
            _recipientList = recipientList;
        }

        [AfterScenario("SnapUserCleanup")]
        public void DeleteCustomerByName()
        {
            if (!_recipientList.Value.Any())
                return;

            var recipientList = _restClient.FrontendV1Client.InitApiMethods<SnapAddManageUsersApi>().
                GetRecipientList(_recipient.Token);

            foreach (var recipient in recipientList.Value)
            {
                var ob = _recipientList.Value.First(x => x.Email.Equals(recipient.Email));
                ob.Name = recipient.Name;
                ob.UserId = recipient.UserId;
                ob.Status = recipient.Status;
            }

            foreach (RecipientDto recipient in _recipientList.Value)
            {
                try
                {
                    _restClient.FrontendV1Client.InitApiMethods<SnapAddManageUsersApi>()
                        .DeleteRecipient(recipient.UserId, recipient.Token);
                }
                catch (Exception e)
                {
                    Logger.Write($"Unable to delete Recipient via API: {e}", Logger.LogLevel.Error);
                }
            }
        }
    }
}
