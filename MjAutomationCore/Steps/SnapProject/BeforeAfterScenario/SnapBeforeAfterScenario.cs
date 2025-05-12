using AutomationUtils.Extensions;
using AutomationUtils.Utils;
using MjAutomationCore.DTO.BaseDto.AccountDTO;
using MjAutomationCore.DTO.SnapDTO.RunTimeVariables;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.General.Api.Snap;
using System;
using System.Linq;
using Reqnroll;

namespace MjAutomationCore.Steps.SnapProject.BeforeAfterScenario
{
    [Binding]
    class SnapBeforeAfterScenario : ReqnrollContext
    {
        protected readonly RestWebClient _restClient;
        protected readonly SnapsDto _snaps;

        public SnapBeforeAfterScenario(RestWebClient restClient, SnapsDto snaps)
        {
            _restClient = restClient;
            _snaps = snaps;
        }

        [AfterScenario("Snap_Cleanup")]
        public void DeleteCaptureItem()
        {
            if (!_snaps.Value.Any())
                return;

            foreach (SnapDto snap in _snaps.Value)
            {
                try
                {
                    _restClient.FrontendV1Client.InitApiMethods<SnapApi>().DeleteCaptureItem(snap, snap.Token);
                }
                catch (Exception e)
                {
                    Logger.Write($"Unable to delete snap view API: {e}", Logger.LogLevel.Error);
                }
            }
        }
    }
}
