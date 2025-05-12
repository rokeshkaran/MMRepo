using AutomationUtils.Utils;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.Linq;

namespace MjAutomationCore.Base.API.Exceptions
{
    class ApiRequestException : Exception
    {
        public ApiRequestException(RestClient client, RestRequest request, RestResponse response)
            : base("Exception thrown while executing API request")
        {
            LogRequest(client, request, response);
        }

        private void LogRequest(RestClient client, RestRequest request, RestResponse response)
        {
            var requestToLog = new
            {
                resource = request.Resource,
                parameters = request.Parameters.Select(parameter => new
                {
                    name = parameter.Name,
                    value = parameter.Value,
                    type = parameter.Type.ToString()
                }),
                method = request.Method.ToString(),
                uri = client.BuildUri(request),
            };

            var responseToLog = new
            {
                statusCode = response.StatusCode,
                content = response.Content,
                headers = response.Headers,
                responseUri = response.ResponseUri,
                errorMessage = response.ErrorMessage
            };

            Logger.Write(JsonConvert.SerializeObject(requestToLog, Formatting.Indented));
            Logger.Write(JsonConvert.SerializeObject(responseToLog, Formatting.Indented));
        }
    }
}