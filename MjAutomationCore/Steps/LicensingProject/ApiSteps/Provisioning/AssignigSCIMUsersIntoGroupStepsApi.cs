using AutomationUtils.Api;
using SeleniumAutomationUtils.SeleniumExtensions;
using MjAutomationCore.DTO.LicensingDTO.CustomerAdminPortal;
using MjAutomationCore.DTO.LicensingDTO.Provisioning;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Extensions;
using MjAutomationCore.General.Api.Provisioning;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Reqnroll;
using Reqnroll.Assist;
using static MjAutomationCore.DTO.LicensingDTO.Provisioning.AssignigSCIMUsersIntoGroupDto;
using AutomationUtils.Extensions;

namespace MjAutomationCore.Steps.LicensingProject.Provisioning
{
    [Binding]
    class AssignigSCIMUsersIntoGroupStepsApi : BaseApiMethods
    {
        protected readonly ValueSecretToken _secretToken;
        protected readonly RestWebClient _restClient;
        protected readonly SCIMGroupsDto _scimGroups;
        private readonly SessionRandomValue _sessionRandom;
        protected readonly SCIMUsersDto _scimUsers;

        public AssignigSCIMUsersIntoGroupStepsApi(ValueSecretToken secretToken, RestWebClient restClient, SessionRandomValue sessionRandom, SCIMGroupsDto scimGroups, SCIMUsersDto scimUsers)
        {
            _secretToken = secretToken;
            _restClient = restClient;
            _scimGroups = scimGroups;
            _sessionRandom = sessionRandom;
            _scimUsers = scimUsers;
        }

        [When(@"User adds '(.*)' Users from '(.*)' file to the SCIM group '(.*)' via Api")]
        public void WhenUsersAddUsersFromFileToTheSCIMGroupViaApi(int count, string pathfile, string groupName)
        {
            groupName = groupName.AddRandom(_sessionRandom);
            var groupId = _scimGroups.Value.First(x => x.Name.Equals(groupName)).Id;

            //TODO stg env
            var lines = File.ReadAllLines(@"D:\UIAutomationTesting\MjAutomationCore\Tests\TestData\SCIMUsersIdStg.txt").Take(count);
            //var lines = File.ReadAllLines(FileSystemHelper.GeneratePathToEmbedded(pathfile)).Take(count);
            //var lines = File.ReadAllLines(@"D:\UIAutomationTesting\MjAutomationCore\Tests\TestData\UsersID.txt").Take(count);

            var listId = new List<string>();

            foreach (string line in lines)
            {
                listId.Add(line.Split(", ").Last());
            }

            var userIds = new List<Values>();
            foreach (var id in listId)
            {
                userIds.Add(new Values() { value = id });
            }

            var info = new AssignigSCIMUsersIntoGroupDto()
            {
                schemas = new List<string>() { "urn:ietf:params:scim:api:messages:2.0:PatchOp" },
                Operations = new List<Operation>(){
                    new Operation()
                    {
                        op = "add",
                        path = "members",
                        value = userIds
                    }
                }
            };

            _restClient.FrontendV1Client.InitApiMethods<AssignigSCIMUsersIntoGroupApi>()
                    .CreateGroupWithMember(_secretToken, info, groupId);
        }

        [When(@"User adds '(.*)' Users from '(.*)' file to the SCIM group '(.*)' via Api one user at a time")]
        public void WhenUserAddsUsersFromFileToTheSCIMGroupViaApiOneUserAtATime(int count, string pathfile, string groupName)
        {
            groupName = groupName.AddRandom(_sessionRandom);
            var groupId = _scimGroups.Value.First(x => x.Name.Equals(groupName)).Id;

            //TODO Stg env
            var lines = File.ReadAllLines(@"D:\UIAutomationTesting\MjAutomationCore\Tests\TestData\SCIMUsersIdStg.txt").Take(count);
            //TODO QA env
            //var lines = File.ReadAllLines(@"D:\UIAutomationTesting\MjAutomationCore\Tests\TestData\UsersID.txt").Take(count);

            var listId = new List<string>();

            foreach (string line in lines)
            {
                listId.Add(line.Split(", ").Last());
            }

            foreach (var id in listId)
            {
                var info = new AssignigSCIMUsersIntoGroupDto()
                {
                    schemas = new List<string>() { "urn:ietf:params:scim:api:messages:2.0:PatchOp" },
                    Operations = new List<Operation>(){
                    new Operation()
                    {
                        op = "add",
                        path = "members",
                        value = new List<Values>()
                        {
                            new Values()
                            {
                                value = id
                            }
                        }
                    }}
                };

                _restClient.FrontendV1Client.InitApiMethods<AssignigSCIMUsersIntoGroupApi>()
                    .CreateGroupWithMember(_secretToken, info, groupId);
            }
        }

        [When(@"User adds '(.*)' Users from '(.*)' file to the SCIM group '(.*)' via Api of '(.*)' users at a time")]
        public void WhenUserAddsUsersFromFileToTheSCIMGroupViaApiOfUsersAtATime(int count, string pathfile, string groupName, int usersAt)
        {
            groupName = groupName.AddRandom(_sessionRandom);
            var groupId = _scimGroups.Value.First(x => x.Name.Equals(groupName)).Id;

            //TODO Stg env
            var lines = File.ReadAllLines(@"D:\UIAutomationTesting\MjAutomationCore\Tests\TestData\SCIMUsersIdStg.txt").Take(count);
            //TODO QA env
            //var lines = File.ReadAllLines(@"D:\UIAutomationTesting\MjAutomationCore\Tests\TestData\UsersID.txt").Take(count);

            var listId = new List<string>();

            foreach (string line in lines)
            {
                listId.Add(line.Split(", ").Last());
            }
        }

        [When(@"User '(.*)' created Users to the SCIM group '(.*)' via Api")]
        public void WhenUserCreatedUsersToTheSCIMGroupViaApi(string action, string groupName)
        {
            groupName = groupName.AddRandom(_sessionRandom);
            var groupId = _scimGroups.Value.First(x => x.Name.Equals(groupName)).Id;

            var userIds = new List<Values>();
            foreach (var user in _scimUsers.Value)
            {
                userIds.Add(new Values() { value = user.Id });
            }

            var info = new AssignigSCIMUsersIntoGroupDto()
            {
                schemas = new List<string>() { "urn:ietf:params:scim:api:messages:2.0:PatchOp" },
                Operations = new List<Operation>(){
                    new Operation()
                    {
                        op = action,
                        path = "members",
                        value = userIds
                    }
                }
            };

            _restClient.FrontendV1Client.InitApiMethods<AssignigSCIMUsersIntoGroupApi>()
                .CreateGroupWithMember(_secretToken, info, groupId);
        }

        [When(@"User '(.*)' Users to the SCIM group '(.*)' via Api")]
        public void WhenUserUsersToTheSCIMGroupViaApi(string action, string groupName, Table table)
        {
            var users = table.CreateSet<SCIMUserDto>();
            groupName = groupName.AddRandom(_sessionRandom);
            var groupId = _scimGroups.Value.First(x => x.Name.Equals(groupName)).Id;

            var userIds = new List<Values>();

            foreach (var user in users)
            {
                try
                {
                    userIds.Add(new Values()
                    {
                        value = _scimUsers.Value
                   .Find(x => x.Name.Equals(user.Name.AddRandom(_sessionRandom))).Id
                    });
                }
                catch
                {
                    throw new Exception($"The User '{ user.Name }' is not found in the created user list");
                }
            }

            var info = new AssignigSCIMUsersIntoGroupDto()
            {
                schemas = new List<string>() { "urn:ietf:params:scim:api:messages:2.0:PatchOp" },
                Operations = new List<Operation>(){
                    new Operation()
                    {
                        op = action,
                        path = "members",
                        value = userIds
                    }
                }
            };

            _restClient.FrontendV1Client.InitApiMethods<AssignigSCIMUsersIntoGroupApi>()
                .CreateGroupWithMember(_secretToken, info, groupId);
        }
    }
}