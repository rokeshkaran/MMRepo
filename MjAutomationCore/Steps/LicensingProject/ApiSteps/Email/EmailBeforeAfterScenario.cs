using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.Publish;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.General.Api.Publish;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Reqnroll;
using MjAutomationCore.DTO.BaseDto.RunTimeVariables;
using AutomationUtils.Extensions;
using MjAutomationCore.General.Api.Email;
using MjAutomationCore.DTO.LicensingDTO.RunTimeVariables.Email;

namespace MjAutomationCore.Steps.LicensingProject.ApiSteps.Email
{
    [Binding]
    class EmailBeforeAfterScenario : Reqnroll.Steps
    {
        protected readonly RestWebClient _restClient;
        private readonly OutlookEmailsDto _outlookEmailList;


        public EmailBeforeAfterScenario(RestWebClient restClient, OutlookEmailsDto outlookEmailList)
        {
            _restClient = restClient;
            _outlookEmailList =outlookEmailList;
        }

        [AfterScenario("CleanupOutlookEmail")]
        public void DeleteEmail()
        {
            if (!_outlookEmailList.Value.Any())
            {
                return;
            }
            foreach (OutlookEmailResponseDto outlookEmail in _outlookEmailList.Value)
            {
                try
                {
                    _restClient.FrontendV1Client.InitApiMethods<OutlookGraphApi>().DeleteEmail(outlookEmail.Id);
                }
                catch (Exception e)
                {
                    AutomationUtils.Utils.Logger.Write($"Email Id'{outlookEmail.Id}' wasn't deleted. Exception: {e}", AutomationUtils.Utils.Logger.LogLevel.Info);
                }
            }
        }
    }
}
