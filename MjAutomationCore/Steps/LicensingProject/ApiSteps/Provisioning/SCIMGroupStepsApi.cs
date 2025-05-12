using AutomationUtils.Api;
using SeleniumAutomationUtils.SeleniumExtensions;
using MjAutomationCore.DTO.LicensingDTO.CustomerAdminPortal;
using MjAutomationCore.DTO.LicensingDTO.Provisioning;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Extensions;
using MjAutomationCore.General.Api.Provisioning;
using System.Linq;
using Reqnroll;
using Reqnroll.Assist;
using AutomationUtils.Extensions;

namespace MjAutomationCore.Steps.LicensingProject.Provisioning
{
    [Binding]
    class SCIMGroupStepsApi : BaseApiMethods
    {
        private readonly SessionRandomValue _sessionRandom;
        protected readonly ValueSecretToken _secretToken;
        protected readonly RestWebClient _restClient;
        protected readonly SCIMGroupDto _scimGroup;
        protected readonly SCIMGroupsDto _scimGroups;

        public SCIMGroupStepsApi(ValueSecretToken secretToken, RestWebClient restClient, SCIMGroupDto scimGroup, SCIMGroupsDto scimGroups, SessionRandomValue sessionRandom)
        {
            _sessionRandom = sessionRandom;
            _secretToken = secretToken;
            _restClient = restClient;
            _scimGroup = scimGroup;
            _scimGroups = scimGroups;
        }

        [When(@"User creates SCIM Groups via Api")]
        public void WhenUserCreatesSCIMGroupsViaApi(Table table)
        {
            CreatingGroup(table);
        }

        [When(@"User creates SCIM Groups via Api for throttling using '(.*)' secret token")]
        public void WhenUserCreatesSCIMGroupsViaApiForThrottlingUsingSecretToken(string token, Table table)
        {
            _secretToken.Value = token;
            CreatingGroup(table);
        }

        public void CreatingGroup(Table table)
        {
            var groups = table.CreateSet<SCIMGroupDto>();
            foreach (SCIMGroupDto group in groups)
            {
                group.Name = group.Name.AddRandom(_sessionRandom);
                var groupId = _restClient.FrontendV1Client.InitApiMethods<SCIMGroupApi>().CreatingSCIMGroup(_secretToken, group);
                group.Id = groupId;
            }

            _scimGroups.Value.AddRange(groups);
        }

        [When(@"User remove '(.*)' group via Api")]
        public void WhenUserRemoveGroupViaApi(string groupName)
        {
            RemoveGroup(groupName);
        }

        [When(@"User remove '(.*)' group via Api for throttling using '(.*)' secret token")]
        public void WhenUserRemoveGroupViaApiForThrottlingUsingSecretToken(string groupName, string token)
        {
            _secretToken.Value = token;
            RemoveGroup(groupName);
        }

        public void RemoveGroup(string groupName)
        {
            groupName = groupName.AddRandom(_sessionRandom);
            var groupId = _scimGroups.Value.First(x => x.Name.Equals(groupName)).Id;
            _restClient.FrontendV1Client.InitApiMethods<SCIMGroupApi>().RemoveGroupById(_secretToken, groupId);
        }
    }
}