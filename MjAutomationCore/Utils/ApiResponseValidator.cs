using AutomationUtils.Extensions;
using RestSharp;
using System.Net;

namespace MjAutomationCore.Utils
{
    public class ApiResponseValidator
    {
        public static void ValidateResponse(RestResponse response)
        {
            response.Validate(HttpStatusCode.OK, $"Error: Unexpected response status code. Expected: {HttpStatusCode.OK}. Received: {response.StatusCode}. More info: {response.Content}");
        }
    }
}