using AutomationUtils.Api;
using AutomationUtils.Extensions;
using Microsoft.Graph.Models;
using MjAutomationCore.DTO.WebAppDTO.Clouds.OneDrive;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.Clouds.SharePoint;
using MjAutomationCore.Providers.Clouds.OneDrive;
using Newtonsoft.Json;
using RestSharp;
using System.IO;
using System.Net;
using FileSystemHelper = MjAutomationCore.Utils.FileSystemHelper;


namespace MjAutomationCore.General.Api.Clouds
{
    public class OneDriveApi : BaseApiMethods
    {
        public string GetAccessToken()
        {
            RestRequest request = new RestRequest($"{OneDriveAppApiProvider.AccessTokenUrl}/{OneDriveAppApiProvider.TenantID}/oauth2/v2.0/token", Method.Post);
            request.AddHeader("Content-Type", "application/x-www-form-urlencoded");
            request.AddParameter("grant_type", "client_credentials");
            request.AddParameter("client_id", $"{OneDriveAppApiProvider.ClientID}");
            request.AddParameter("client_secret", $"{OneDriveAppApiProvider.ClientSecret}");
            request.AddParameter("scope", $"{OneDriveAppApiProvider.Scope}");
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, "Response wasn't received");
            return JsonConvert.DeserializeObject<OneDriveTokenDTO>(response.Content).AccessToken;
        }

        public string UploadFileToFolder(string userEmail, string accessToken, string folderName, OneDriveItemDto file)
        {
            var request = new RestRequest($"/{userEmail}/drive/root:/{folderName}/{file.FileName}:/content", Method.Put);
            request.AddHeader("Authorization", "Bearer " + accessToken);
            request.AddHeader("Content-Type", "application/octet-stream");
            request.AddParameter("application/octet-stream", File.ReadAllBytes(FileSystemHelper.GeneratePathToCloudFiles(file.FilePath, "OneDriveFiles")), ParameterType.RequestBody);
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.Created, $"Failed to upload file '{file.ItemName}' to folder '{folderName}' in OneDrive. Status Code: '{response.StatusCode}'");
            return JsonConvert.DeserializeObject<OneDriveItemDto>(response.Content).ItemId;
        }

        public void DeleteItemById(string userEmail, string accessToken, string itemId)
        {
            var request = new RestRequest($"/{userEmail}/drive/items/{itemId}", Method.Delete);
            request.AddHeader("Authorization", "Bearer " + accessToken);
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.NoContent, $"Failed to delete OneDrive item with id: '{itemId}'. Status Code: '{response.StatusCode}'");
        }

        public string CreateFolder(string userEmail, string accessToken, string folderName, string parentFolderName)
        {
            var jsonBody = new
            {
                name = folderName,
                folder = new { }
            };
            var request = new RestRequest($"/{userEmail}/drive/root:/{parentFolderName}:/children", Method.Post);
            request.AddHeader("Authorization", "Bearer " + accessToken);
            request.AddHeader("Content-Type", "application/json");
            request.AddJsonBody(Newtonsoft.Json.JsonConvert.SerializeObject(jsonBody));
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.Created, $"Failed to create folder '{folderName}' in OneDrive. Status Code: '{response.StatusCode}'");
            return JsonConvert.DeserializeObject<OneDriveItemDto>(response.Content).ItemId;
        }

        public OneDriveItemDto GetItemDetailsByPath(string userEmail, string accessToken, string itemPath)
        {
            var request = new RestRequest($"/{userEmail}/drive/root:/{itemPath}", Method.Get);
            request.AddHeader("Authorization", "Bearer " + accessToken);
            request.AddHeader("Content-Type", "application/json");
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, $"Failed to get item details with path '{itemPath}' in OneDrive. Status Code: '{response.StatusCode}'");
            return JsonConvert.DeserializeObject<OneDriveItemDto>(response.Content);
        }
    }
}
