using MjAutomationCore.Providers.UserProvider;
using System.Collections.Generic;

namespace MjAutomationCore.DTO.SnapDTO.RunTimeVariables
{
    class UserTokenDto
    {
        public List<KeyValuePair<string, string>> UserTokens { get; set; }

        public UserTokenDto()
        {
            UserTokens = new List<KeyValuePair<string, string>>();
        }

        public string GetToken()
        {
            var tokenID = UserTokens.Find(x => x.Key.Equals(RegularUserProvider.Email)).Value;
            return tokenID;
        }

        public string GetTokenByIndexUser(string userIndex)
        {
            var tokenID = UserTokens.Find(x => x.Key.Equals($"automationtestmm{userIndex}@meta.ua")).Value;
            return tokenID;
        }
    }
}