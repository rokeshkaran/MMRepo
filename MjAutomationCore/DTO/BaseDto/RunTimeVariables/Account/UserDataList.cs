using MjAutomationCore.DTO.BaseDto.AccountDTO;
using MjAutomationCore.General.Api.Account;
using System.Collections.Generic;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using System.Linq;
using AutomationUtils.Extensions;

namespace MjAutomationCore.DTO.BaseDto.RunTimeVariables.Account
{
    public class UserDataList
    {
        protected readonly RestWebClient _restClient;
        public List<UserDataDto> Value { get; set; }

        public UserDataList()
        {
            _restClient = new RestWebClient();
            Value = new List<UserDataDto>();
        }

        public string GetTokenFromUserDataList(string email, string password)
        {
            string token;
            if (!Value.Any(x => x.Email.Equals(email)))
            {
                token = _restClient.FrontendV1Client.InitApiMethods<SignInApiMethods>().SignInUser(email, password).IdToken;
            }
            else
            {
                token = Value.FirstOrDefault(x => x.Email.Equals(email)).IdToken;
            }
            return token;
        }
    }
}