using MjAutomationCore.Providers;
using RestSharp;

namespace MjAutomationCore.Extensions
{
    public static class RestRequestExtensions
    {
        public static RestRequest AddAuthorization(this RestRequest request)
        {
            request.AddHeader("Authorization", AuthorizationProvider.Authorization);
            return request;
        }
    }
}