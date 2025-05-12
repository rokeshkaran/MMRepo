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
    public class CustomerApi : BaseApiMethods
    {
        public CustomerDto AddNewCustomer(CustomerDto customer)
        {
            var postRequest = new RestRequest($"subscription-tenant?apiKey={SalesPortalApiProvider.ApiKey}", Method.Post);
            postRequest.AddParameter("name", customer.Name);
            postRequest.AddParameter("type", customer.Type);
            var response = Client.Execute(postRequest);
            response.Validate(HttpStatusCode.OK, "Customer was not created");

            return JsonConvert.DeserializeObject<CustomerDto>(response.Content);
        }

        public void UpdatingExistingCustomer(CustomerDto customer, string customerId)
        {
            var request = new RestRequest($"subscription-tenant/{customerId}?apiKey={SalesPortalApiProvider.ApiKey}", Method.Put);
            request.AddParameter("name", customer.Name);
            request.AddParameter("type", customer.Type);

            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, "Сustomer data has not been updated");
        }

        public void DeleteCustomer(CustomerDto customer)
        {
            var deleteRequest = new RestRequest($"subscription-tenant/{customer.Id}?apiKey={SalesPortalApiProvider.ApiKey}", Method.Delete);
            var response = Client.Execute(deleteRequest);
            response.Validate(HttpStatusCode.OK, "Сustomer is not deleted");
        }

        public CustomerDto GetCustomerDetails(CustomerDto customer)
        {
            for (int i = 0; i < 60000; i += 100)
            {
                var getAllCustomers = new RestRequest($"subscription-tenant?apiKey={SalesPortalApiProvider.ApiKey}&offset={i}&limit=100", Method.Get);
                var response = Client.Execute(getAllCustomers);
                response.Validate(HttpStatusCode.OK, "Unable to get customer info");
                var customerList = JsonConvert.DeserializeObject<List<CustomerDto>>(response.Content);

                if (!customerList.Any())
                {
                    break;
                }
                else if (customerList.Any(x => x.Name.Equals(customer.Name)))
                {
                    var foundCustomer = customerList.First(x => x.Name.Equals(customer.Name));
                    return foundCustomer;
                }
            }

            throw new Exception($"Customer with '{customer.Name}' name was not found");
        }

        public CustomerDto GetCustomerDetailsByName(string customerName)
        {
            for (int i = 0; i < 60000; i += 100)
            {
                var getAllCustomers = new RestRequest($"subscription-tenant?apiKey={SalesPortalApiProvider.ApiKey}&offset={i}&limit=1000", Method.Get);

                var response = Client.Execute(getAllCustomers);

                var customerList = JsonConvert.DeserializeObject<List<CustomerDto>>(response.Content);


                if (customerList.FindAll(x => !string.IsNullOrEmpty(x.Name)).Any(x => x.Name.Equals(customerName)))
                {
                    var foundCustomer = customerList.First(x => x.Name.Equals(customerName));
                    return foundCustomer;
                }
            }

            throw new Exception($"Customer with '{customerName}' name was not found");
        }

        public bool CastomerExistes(string customerName)
        {
            try
            {
                return !(GetCustomerDetailsByName(customerName) is null);
            }
            catch
            {
                return false;
            }
        }

        public CustomerDto GetCustomerById(string customerId)        
        {
            var getAllCustomers = new RestRequest($"subscription-tenant/{customerId}?apiKey={SalesPortalApiProvider.ApiKey}", Method.Get);
            var response = Client.Execute(getAllCustomers);
            response.Validate(HttpStatusCode.OK, "Unable to get customer info");
            var customer = JsonConvert.DeserializeObject<CustomerDto>(response.Content);
            return customer;
        }

        public bool CastomerExistesOnPortal(string customerName)
        {
            try
            {
                return !(GetCustomerById(customerName) is null);
            }
            catch
            {
                return false;
            }
        }

        public void TransferLicenses(string PurchaseId, string customerId)
        {
            var postRequest = new RestRequest($"subscription-purchase/{PurchaseId}/transfer?apiKey={SalesPortalApiProvider.ApiKey}", Method.Post);
            postRequest.AddParameter("tenant_id", customerId);
            var response = Client.Execute(postRequest);
            response.Validate(HttpStatusCode.OK, $"Error: Unexpected response status code. Expected: {HttpStatusCode.OK}. Received: {response.StatusCode}");
        }
    }
}