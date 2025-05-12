using AutomationUtils.Extensions;
using MjAutomationCore.DTO.BaseDto.RunTimeVariables.Account;
using MjAutomationCore.DTO.SnapDTO;
using MjAutomationCore.DTO.SnapDTO.RunTimeVariables;
using MjAutomationCore.DTO.SnapDTO.SnapUser;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.General.Api.Snap;
using MjAutomationCore.Providers.Base;
using System;
using System.Linq;
using Reqnroll;

namespace MjAutomationCore.Steps.SnapProject
{
    [Binding]
    class SnapAddManageUsersStepsApi : ReqnrollContext
    {
        protected readonly RestWebClient _restClient;
        protected readonly ValueIdToken _idToken;
        protected readonly UserTokenDto _userToken;
        protected readonly SnapRecipientsListDto _recipientList;
        protected readonly RecipientDto _recipient;
        protected UserDataList _userDataList;

        public SnapAddManageUsersStepsApi(RestWebClient restClient, ValueIdToken idToken,
            UserTokenDto userToken, SnapRecipientsListDto recipientList, RecipientDto recipient, UserDataList userDataList)
        {
            _restClient = restClient;
            _idToken = idToken;
            _userToken = userToken;
            _recipientList = recipientList;
            _recipient = recipient;
            _userDataList = userDataList;
        }

        [When(@"User sends request for capture queue items to '(.*)' users via Api")]
        public void WhenUserSendsRequestForCaptureQueueItemsToUsersViaApi(string users)
        {
            var token = _userToken.GetToken();
            foreach (string rce in users.Split(", ").ToList())
            {
                _recipientList.Value.Add(new RecipientDto() { Email = rce, Token = token });
            }
            _restClient.FrontendV1Client.InitApiMethods<SnapAddManageUsersApi>().RequestAccessToSendCaptureItems(_recipientList, _userToken.GetToken());
            _recipient.Token = token;
        }

        [When(@"'([^']*)' User accepts request from email '([^']*)' for capture queue items via Api")]
        public void WhenUserAcceptsRequestFromEmailForCaptureQueueItemsViaApi(string userIndex, string email)
        {
            var token = _userDataList.GetTokenFromUserDataList(MetaUaAccountProvider.GetFormattedLoginString(userIndex), MetaUaAccountProvider.Password);
            var senderList = _restClient.FrontendV1Client.InitApiMethods<SnapAddManageUsersApi>().GetSenderListInvites(token);
            var sender = senderList.Senders.FirstOrDefault(s => s.Email.Equals(email, StringComparison.OrdinalIgnoreCase));
            _restClient.FrontendV1Client.InitApiMethods<SnapAddManageUsersApi>().AcceptsAccessToReceiveCaptureItems(sender.RequestKey, token);
        }

        [When(@"'([^']*)' User sends request for capture queue items to '([^']*)' users via Api")]
        public void WhenUserSendsRequestForCaptureQueueItemsToUsersViaApi(string userIndex, string users)
        {
            var token = _userDataList.GetTokenFromUserDataList(MetaUaAccountProvider.GetFormattedLoginString(userIndex), MetaUaAccountProvider.Password);
            foreach (string rce in users.Split(", ").ToList())
            {
                _recipientList.Value.Add(new RecipientDto() { Email = rce, Token = token });
            }
            _restClient.FrontendV1Client.InitApiMethods<SnapAddManageUsersApi>().RequestAccessToSendCaptureItems(_recipientList, token);
            _recipient.Token = token;
        }
    }
}