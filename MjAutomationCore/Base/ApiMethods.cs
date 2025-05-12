using AutomationUtils.Api;
using MjAutomationCore.Base.API.Exceptions;
using RestSharp;
using System.Net;

namespace MjAutomationCore.Base
{
    public abstract class ApiMethods : BaseApiMethods
    {
        public void CheckStatusCode(RestRequest request, RestResponse response, HttpStatusCode httpStatusCode = HttpStatusCode.OK)
        {
            if (!response.StatusCode.Equals(httpStatusCode))
            {
                throw new ApiRequestException(Client, request, response);
            }
        }
    }
}