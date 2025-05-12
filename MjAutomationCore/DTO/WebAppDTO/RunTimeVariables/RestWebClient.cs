using MjAutomationCore.AppConfig.CloudServiceCredentials;
using MjAutomationCore.Providers;
using MjAutomationCore.Providers.Clouds.Box;
using MjAutomationCore.Providers.Clouds.OneDrive;
using MjAutomationCore.Providers.Clouds.SharePoint;
using MjAutomationCore.Providers.Email;
using MjAutomationCore.Utils;
using RestSharp;

namespace MjAutomationCore.DTO.WebAppDTO.RunTimeVariables
{
    public class RestWebClient
    {
        public RestClient FrontendV1Client { get; }
        public RestClient FrontendV2Client { get; }
        public RestClient BackendV1Client { get; }
        public RestClient BackendV2Client { get; }
        public RestClient SharePointClient { get; }
        public RestClient BoxClient { get; }
        public RestClient DropBoxClient { get; }
        public RestClient JiraClient { get; }
        public RestClient OutlookGraphApi { get; }
        public RestClient OneDriveGraphApi { get; }

        public RestWebClient()
        {
            FrontendV1Client = new RestClient($"{EndpointUrlProvider.EndpointUrlForEnvironment("1")}");
            FrontendV2Client = new RestClient($"{EndpointUrlProvider.EndpointUrlForEnvironment("2")}");
            BackendV1Client = new RestClient($"{EndpointUrlProvider.EndpointUrlForEnvironment("1", true)}");
            BackendV2Client = new RestClient($"{EndpointUrlProvider.EndpointUrlForEnvironment("2", true)}");
            SharePointClient = new RestClient(SharePointSiteUrlProvider.SharePointMilanSite);
            BoxClient = new RestClient(BoxAppApiProvider.ApiUrl);
            JiraClient = new RestClient(JiraProvider.Url);
            OutlookGraphApi = new RestClient(OutlookGraphApiProvider.EndPointURL);
            OneDriveGraphApi = new RestClient(OneDriveAppApiProvider.EndPointURL);
        }
    }
}