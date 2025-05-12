using System;
using System.Linq;
using SeleniumAutomationUtils.SeleniumExtensions;
using AutomationUtils.Utils;
using MjAutomationCore.DTO.LicensingDTO.RunTimeVariables.Salesportal;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.General.Api.Salesportal;
using Reqnroll;
using AutomationUtils.Extensions;

namespace MjAutomationCore.Steps.LicensingProject.Salesportal.BeforeAfterScenario
{
    [Binding]
    class PurchaseBeforeAfterScenario : ReqnrollContext
    {
        protected readonly RestWebClient _restClient;
        protected readonly PurchasesDto _purchases;

        public PurchaseBeforeAfterScenario(RestWebClient restClient, PurchasesDto purchases)
        {
            _restClient = restClient;
            _purchases = purchases;
        }

        [AfterScenario("Cleanup")]
        public void DeletePurchaseByName()
        {
            if (!_purchases.Value.Any())
                return;

            foreach (PurchaseDto purchase in _purchases.Value)
            {
                try
                {
                    _restClient.FrontendV1Client.InitApiMethods<PurchaseApi>().DeletePurchase(purchase);
                }
                catch (Exception e)
                {
                    Logger.Write($"Unable to delete customer view API: {e}", Logger.LogLevel.Error);
                }
            }
        }
    }
}