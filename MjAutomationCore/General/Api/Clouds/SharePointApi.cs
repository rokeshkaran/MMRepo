using AutomationUtils.Api;
using AutomationUtils.Extensions;
using MjAutomationCore.DTO.WebAppDTO.Clouds;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.Clouds.SharePoint;
using MjAutomationCore.Providers.Clouds;
using MjAutomationCore.Utils;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;
using System;
using System.IO;
using System.Net;
using System.Threading;

namespace MjAutomationCore.General.Api.Clouds
{
    class SharePointApi : BaseApiMethods
    {
        public string GetAccessToken()
        {
            RestRequest request = new RestRequest($"{SharePointAppApiProvider.AccessTokenUrl}/{SharePointAppApiProvider.TenantID}/tokens/OAuth/2", Method.Post);
            request.AddHeader("Content-Type", "application/x-www-form-urlencoded");
            request.AddParameter("grant_type", "client_credentials");
            request.AddParameter("client_id", $"{SharePointAppApiProvider.ClientID}@{SharePointAppApiProvider.TenantID}");
            request.AddParameter("client_secret", $"{SharePointAppApiProvider.ClientSecret}");
            request.AddParameter("resource", $"{SharePointAppApiProvider.ResourceID}/{SharePointAppApiProvider.SiteDomain}@{SharePointAppApiProvider.TenantID}");
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, "Response wasn't received");
            return JsonConvert.DeserializeObject<SharePointDetailsDto>(response.Content).AccessToken;
        }

        public void UploadFileToFolder(string accessToken, string folderName, SharePointFileDto file)
        {
            var request = new RestRequest($"/_api/web/GetFolderByServerRelativeUrl('{folderName}')/Files/add(url='{file.FileName}',overwrite=true)", Method.Post);
            request.AddHeader("Authorization", "Bearer " + accessToken);
            request.AddHeader("Accept", "application/json;odata=verbose");
            request.AddHeader("Content-Type", "multipart/form-data");
            request.AddParameter("application/pdf", File.ReadAllBytes(FileSystemHelper.GeneratePathToCloudFiles(file.FilePath, "SharePointFiles")), ParameterType.RequestBody);
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, $"Failed to upload file '{file.FileName}' to folder '{folderName}' in SharePoint. Status Code: '{response.StatusCode}'");
        }

        public void CreateFolder(string accessToken, string folderName)
        {
            RestRequest request = new RestRequest("/_api/web/folders", Method.Post);
            request.AddHeader("Authorization", "Bearer " + accessToken);
            request.AddHeader("Accept", "application/json;odata=verbose");
            request.AddHeader("Content-Type", "application/json;odata=verbose");
            string requestBody = "{\"__metadata\":{\"type\":\"SP.Folder\"},\"ServerRelativeUrl\":\"Shared%20Documents/QAFolder/" + folderName + "\"}";
            request.AddParameter("application/json;odata=verbose", requestBody, ParameterType.RequestBody);
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.Created, "Response wasn't received");
        }

        public void RemoveFileFromFolder(string accessToken, string folderName, string fileName)
        {
            RestRequest request = new RestRequest($"/_api/web/GetFileByServerRelativeUrl('/sites/milan/{folderName}/{fileName}')", Method.Post);
            request.AddHeader("Authorization", "Bearer " + accessToken);
            request.AddHeader("Content-Type", "application/json;odata=verbose");
            request.AddHeader("X-HTTP-Method", "DELETE");
            for (int i = 0; i < 30; i++)
            {
                var response = Client.Execute(request);
                if (response.StatusCode == HttpStatusCode.OK)
                {
                    response.Validate(HttpStatusCode.OK, "Response wasn't received");
                    return;
                }
                else
                {
                    Thread.Sleep(1000);
                }
            }
            throw new Exception($"Failed to delete file '{fileName}' after 30 attempts");
        }

        public string GetFileModified(string accessToken, string fileName)
        {
            RestRequest request = new RestRequest($"/_api/web/GetFileByServerRelativeUrl('/sites/milan/{fileName}')/ListItemAllFields/Modified", Method.Get);
            request.AddHeader("Authorization", "Bearer " + accessToken);
            request.AddHeader("Content-Type", "application/json;odata=verbose");
            request.AddHeader("Accept", "application/json");
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, "Response wasn't received");
            var responseContent = JsonConvert.DeserializeObject<JObject>(response.Content);
            return responseContent["value"].ToString();
        }
        public string GetFileSizeModified(string accessToken, string fileName)
        {
            RestRequest request = new RestRequest($"/_api/web/GetFileByServerRelativeUrl('/sites/milan/{fileName}')/ListItemAllFields/File/Length", Method.Get);
            request.AddHeader("Authorization", "Bearer " + accessToken);
            request.AddHeader("Content-Type", "application/json;odata=verbose");
            request.AddHeader("Accept", "application/json");
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, "Response wasn't received");
            var responseContent = JsonConvert.DeserializeObject<JObject>(response.Content);
            return responseContent["value"].ToString();
        }

        public bool IsFileExistOnSharePoint(string accessToken, string folderName,string fileName)
        {
            RestRequest request = new RestRequest($"/_api/web/GetFileByServerRelativeUrl('/sites/milan/{folderName}/{fileName}')", Method.Get);
            request.AddHeader("Authorization", "Bearer " + accessToken);
            request.AddHeader("Content-Type", "application/json;odata=verbose");
            request.AddHeader("Accept", "application/json");
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, "Response wasn't received");
            return response.StatusCode == HttpStatusCode.OK ? true : false;
        }

        public void CheckOutFileinFolder(string accessToken, string folderName, string fileName)
        {
            RestRequest request = new RestRequest($"/_api/web/GetFileByServerRelativeUrl('/sites/milan/{folderName}/{fileName}')/checkout()", Method.Post);
            request.AddHeader("Authorization", "Bearer " + accessToken);
            request.AddHeader("Content-Type", "application/json;odata=verbose");
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, $"File '{fileName}' is not CheckedOut in folder '{folderName}' in SharePoint. Status Code: '{response.StatusCode}'");
        }

        public void CheckinFileinFolder(string accessToken, string folderName, string fileName)
        {
            RestRequest request = new RestRequest($"/_api/web/GetFileByServerRelativeUrl('/sites/milan/{folderName}/{fileName}')/checkin(comment='Checked in', checkInType=1)", Method.Post);
            request.AddHeader("Authorization", "Bearer " + accessToken);
            request.AddHeader("Content-Type", "application/json;odata=verbose");
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, $"File '{fileName}' is not CheckedIn in folder '{folderName}' in SharePoint. Status Code: '{response.StatusCode}'");
        }
    }
}