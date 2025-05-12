using AutomationUtils.Api;
using SeleniumAutomationUtils.SeleniumExtensions;
using MjAutomationCore.DTO.LicensingDTO.CustomerAdminPortal;
using MjAutomationCore.DTO.LicensingDTO.RunTimeVariables.Salesportal;
using RestSharp;
using System.Linq;
using System.Net;
using AutomationUtils.Extensions;

namespace MjAutomationCore.General.Api.CustomerAdminPortal
{
    class SubscriptionActionApi : BaseApiMethods
    {
        public void SubscriptionAction(string admin, CustomersDto customers, string token, SubscriptionActionDTO subscription)
        {
            var customer = customers.Value.First(x => x.Name.Equals(admin));
            var request = new RestRequest($"subscription?tenantId={customer.Id}", Method.Post);
            request.AddHeader("Authorization", $"Bearer {token}");
            var id = customer.Purchases.First(x => x.ProductId.Equals(subscription.PurchaseId)).PurchaseId;
            request.AddJsonBody(new
            {
                actionType = subscription.ActionType,
                email = subscription.Email.ToArray(),
                purchaseId = id
            });
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, "Users have not been added a subscription");
        }
    }
}