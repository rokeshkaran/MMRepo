using RestSharp;

namespace MjAutomationCore.Utils
{
    public class ApiResponseHelper
    {
        private RestResponse _response;

        public void SetResponse(RestResponse response)
        {
            _response = response;
        }

        public RestResponse GetResponse()
        {
            return _response;
        }
    }
}