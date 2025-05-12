using AutomationUtils.Api;
using SeleniumAutomationUtils.SeleniumExtensions;
using AutomationUtils.Utils;
using MjAutomationCore.DTO.LicensingDTO.CustomerAdminPortal;
using MjAutomationCore.DTO.LicensingDTO.Provisioning;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Extensions;
using MjAutomationCore.General.Api.Provisioning;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading;
using Reqnroll;
using Reqnroll.Assist;
using AutomationUtils.Extensions;

namespace MjAutomationCore.Steps.LicensingProject.Provisioning
{
    [Binding]
    class SCIMUsersStepsApi : BaseApiMethods
    {
        protected readonly ValueSecretToken _secretToken;
        protected readonly RestWebClient _restClient;
        protected readonly SCIMUsersDto _scimUsers;
        private readonly SessionRandomValue _sessionRandom;

        public SCIMUsersStepsApi(ValueSecretToken secretToken, RestWebClient restClient, SCIMUsersDto scimUsers, SessionRandomValue sessionRandom)
        {
            _secretToken = secretToken;
            _restClient = restClient;
            _scimUsers = scimUsers;
            _sessionRandom = sessionRandom;
        }

        [When(@"User creates '(.*)' SCIM Users via Api")]
        public void WhenUserCreatesSCIMUsersViaApi(int numberUsers)
        {
            var users = new List<SCIMUserDto>();
            for (int j = 0; j < numberUsers; j++)
            {
                users.Add(new SCIMUserDto()
                {
                    Name = $"automation_{AutomationUtils.Utils.TestDataGenerator.RandomNum(99999999, 10000000)}test_{AutomationUtils.Utils.TestDataGenerator.RandomNum(999999999, 100000000)}@hehehehe.nrtrptrptrptrptrp.com"
                });
            }
            CreateUsers(users);
        }

        [When(@"User creates SCIM Users via Api")]
        public void WhenUserCreatesSCIMUsersViaApi(Table table)
        {
            var users = table.CreateSet<SCIMUserDto>().ToList();
            CreateUsers(users);
        }

        private void CreateUsers(List<SCIMUserDto> users)
        {
            foreach (SCIMUserDto user in users)
            {
                //TODO delay between requests
                Thread.Sleep(300);
                user.Name = user.Name.AddRandom(_sessionRandom);
                var userID = _restClient.FrontendV1Client.InitApiMethods<SCIMUsersApi>()
                    .CreatingSCIMUsers(_secretToken, user.Name);
                user.Id = userID;
            }

            _scimUsers.Value.AddRange(users);

            //TODO write users to file
            //WriteFiles(users);
        }

        public static void WriteFiles(List<SCIMUserDto> users)
        {
            var dataList = new List<KeyValuePair<string, string>>();
            foreach (var user in users)
            {
                dataList.Add(new KeyValuePair<string, string>(user.Name, user.Id));
            }

            var valueList = new List<string>();
            foreach (KeyValuePair<string, string> data in dataList)
            {
                var result = string.Join(", ", data.Key, data.Value);
                valueList.Add(result);
            }

            File.WriteAllLines(@"D:\UIAutomationTesting\MjAutomationCore\Tests\TestData\SCIMUsersIdStg.txt", valueList);
            //File.WriteAllLines(@"D:\UIAutomationTesting\MjAutomationCore\Tests\TestData\UsersID.txt", valueList);
        }
    }
}