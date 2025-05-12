using AutomationUtils.Api;
using AutomationUtils.Extensions;
using MjAutomationCore.DTO.LicensingDTO.RunTimeVariables.Salesportal;
using MjAutomationCore.Providers.Licensing;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;

namespace MjAutomationCore.General.Api.Salesportal
{
    public class PurchaseApi : BaseApiMethods
    {
        public string AddNewPurchase(PurchaseDto purchase, string id)
        {
            var postRequest = new RestRequest($"subscription-purchase?apiKey={SalesPortalApiProvider.ApiKey}", Method.Post);
            postRequest.AddHeader("Content-Type", "application/json");
            postRequest.AddJsonBody(new { tenant_id = id, seats = purchase.Seats, product_id = purchase.ProductId, end_date = purchase.EndDateIso });
            var response = Client.Execute(postRequest);
            response.Validate(HttpStatusCode.OK, $"Purchase wasn't created for '{purchase.CustomerName}' customer");
            var purchaseId = JsonConvert.DeserializeObject<PurchaseDto>(response.Content).PurchaseId;
            return purchaseId;
        }

        public string AddPromoPurchase(PurchaseDto purchase, string id)
        {
            var postRequest = new RestRequest($"subscription-purchase?apiKey={SalesPortalApiProvider.ApiKey}", Method.Post);
            postRequest.AddHeader("Content-Type", "application/json");
            postRequest.AddJsonBody(new
            {
                tenant_id = id,
                seats = purchase.Seats,
                product_id = purchase.ProductId,
                purchase_type = purchase.PurchaseType,
                duration = purchase.Duration,
                product_label = purchase.ProductLabel,
                end_date = purchase.EndDateIso
            });
            
            var response = Client.Execute(postRequest);
            response.Validate(HttpStatusCode.OK, $"Purchase wasn't created for '{purchase.CustomerName}' customer");
            var purchaseId = JsonConvert.DeserializeObject<PurchaseDto>(response.Content).PurchaseId;
            return purchaseId;
        }

        public void ChangePurchaseInformation(PurchaseDto purchase, string purchaseId)
        {
            var postRequest = new RestRequest($"subscription-purchase/{purchaseId}?apiKey={SalesPortalApiProvider.ApiKey}", Method.Put);
            postRequest.AddParameter("seats", purchase.Seats);
            postRequest.AddParameter("end_date", purchase.EndDateIso);
            var response = Client.Execute(postRequest);
            response.Validate(HttpStatusCode.OK, "Response wasn't received");
        }

        public void DeletePurchaseById(string purchaseId)
        {
            var deleteRequest = new RestRequest($"subscription-purchase/{purchaseId}?apiKey={SalesPortalApiProvider.ApiKey}", Method.Delete);
            var response = Client.Execute(deleteRequest);
            response.Validate(HttpStatusCode.OK, $"Unable to execute DELETE request. URI: {response.ResponseUri}");
        }

        public void DeletePurchase(PurchaseDto purchase)
        {
            var deleteRequest = new RestRequest($"subscription-purchase/{purchase.PurchaseId}?apiKey={SalesPortalApiProvider.ApiKey}", Method.Delete);
            var response = Client.Execute(deleteRequest);
            response.Validate(HttpStatusCode.OK, $"Unable to execute DELETE request. URI: {response.ResponseUri}");
        }

        public PurchaseDto GetPurchaseDetails(PurchaseDto purchase)
        {
            var getPurchase = new RestRequest($"subscription-purchase/{purchase.PurchaseId}?apiKey={SalesPortalApiProvider.ApiKey}", Method.Get);
            var response = Client.Execute(getPurchase);
            response.Validate(HttpStatusCode.OK, "Response wasn't received");
            var purchaseResponse = JsonConvert.DeserializeObject<PurchaseDto>(response.Content);
            return purchaseResponse;
        }

        public PurchaseDto GetPurchase(PurchaseDto purchase)
        {
            var getAllPurchase = new RestRequest($"subscription-purchase?apiKey={SalesPortalApiProvider.ApiKey}", Method.Get);
            var response = Client.Execute(getAllPurchase);
            response.Validate(HttpStatusCode.OK, "Response wasn't received");
            var purchaseList = JsonConvert.DeserializeObject<List<PurchaseDto>>(response.Content);

            if (purchaseList.Any(x => x.CustomerName.Equals(purchase.CustomerName)))
            {
                var foundPurchases = purchaseList.First(x => x.CustomerName.Equals(purchase.CustomerName));
                return foundPurchases;
            }

            throw new Exception($"Customer with '{purchase.CustomerName}' name was not found");
        }


        public List<PurchaseDto> GetPurchasesFromCustomer(string customerName)
        {
            var getAllPurchase = new RestRequest($"subscription-purchase?apiKey={SalesPortalApiProvider.ApiKey}", Method.Get);
            var response = Client.Execute(getAllPurchase);
            response.Validate(HttpStatusCode.OK, "Response wasn't received");
            var purchaseList = JsonConvert.DeserializeObject<List<PurchaseDto>>(response.Content);

            if (purchaseList.Any(x => !string.IsNullOrEmpty(x.CustomerName)))
            {
                var purchases = purchaseList.FindAll(x => !string.IsNullOrEmpty(x.CustomerName)).
                    FindAll(x => x.CustomerName.Equals(customerName));

                if (purchases.Count <= 0)
                {
                    throw new Exception($"'{customerName}' сustomer has no purchases");
                }

                return purchases;
            }

            throw new Exception("There are no purchases on the Sales portal");
        }

        public bool PurchaseByNameExists(string purchase, string customerName)
        {
            try
            {
                return (GetPurchasesFromCustomer(customerName).Any(x => x.ProductId.Equals(purchase)));
            }
            catch
            {
                return false;
            }
        }
    }
}