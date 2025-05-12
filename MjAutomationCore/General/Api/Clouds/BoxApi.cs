using AutomationUtils.Api;
using AutomationUtils.Extensions;
using MjAutomationCore.DTO.WebAppDTO.Clouds.Box;
using MjAutomationCore.Providers.Clouds.Box;
using MjAutomationCore.Utils;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;
using System;
using System.Linq;
using System.Net;
using System.Threading;

namespace MjAutomationCore.General.Api.Clouds
{
    class BoxApi : BaseApiMethods
    {
        public string GetAccessToken()
        {
            RestRequest request = new RestRequest($"{BoxAppApiProvider.AccessTokenUrl}", Method.Post);
            request.AddHeader("Content-Type", "application/x-www-form-urlencoded");
            request.AddParameter("grant_type", "client_credentials");
            request.AddParameter("client_id", $"{BoxAppApiProvider.ClientID}");
            request.AddParameter("client_secret", $"{BoxAppApiProvider.ClientSecret}");
            request.AddParameter("box_subject_type", $"user");
            request.AddParameter("box_subject_id", $"{BoxAppApiProvider.UserId}");
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, "Response wasn't received");
            return JsonConvert.DeserializeObject<BoxTokenResponseDto>(response.Content).AccessToken;
        }

        public BoxSearchResponseDto SearchBoxItem(string accessToken, string itemName, string itemType)
        {
            RestRequest request = new RestRequest(BoxAppApiProvider.ApiUrl + $"/search?query=\"{itemName}\"&type={itemType}", Method.Get);
            request.AddHeader("Authorization", "Bearer " + accessToken);
            request.AddHeader("Content-Type", "application/json;odata=verbose");
            request.AddHeader("Accept", "application/json");
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, $"Failed to receive a valid response. Expected: {HttpStatusCode.OK}. Received: {response.StatusCode}");
            return DeserializeSearchResponse(response.Content);
        }

        public BoxSearchResponseDto GetFilesInFolder(string accessToken, string folderId)
        {
            RestRequest request = new RestRequest(BoxAppApiProvider.ApiUrl + $"/folders/{folderId}/items", Method.Get);
            request.AddHeader("Authorization", "Bearer " + accessToken);
            request.AddHeader("Content-Type", "application/json;odata=verbose");
            request.AddHeader("Accept", "application/json");
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, $"Failed to receive a valid response. Expected: {HttpStatusCode.OK}. Received: {response.StatusCode}");
            return DeserializeSearchResponse(response.Content);
        }

        private BoxSearchResponseDto DeserializeSearchResponse(string responseContent)
        {
            return JsonConvert.DeserializeObject<BoxSearchResponseDto>(responseContent);
        }

        public bool IsFileInFolderExist(string accessToken, string folderId, string fileName)
        {
            var folderContents = GetFilesInFolder(accessToken, folderId);
            if (folderContents.Entries == null || folderContents.Entries.Count == 0)
            {
                return false;
            }
            foreach (var item in folderContents.Entries)
            {
                if (item.Name == fileName)
                {
                    return true;
                }
            }
            return false;
        }

        public string UploadFileToFolder(string accessToken, string folderName, BoxFileDto file)
        {
            //Get folder Id
            var folderId = SearchBoxItem(accessToken, folderName, "folder").Entries.First(x => x.Name.Equals(folderName)).Id;

            //create nested json attribute
            JObject attributeJson = new JObject();
            attributeJson["name"] = file.FileName;
            JObject parent = new JObject();
            parent["id"] = folderId;
            attributeJson["parent"] = parent;

            var request = new RestRequest(BoxAppApiProvider.UploadApiUrl + $"/files/content", Method.Post);
            request.AddHeader("Authorization", "Bearer " + accessToken);
            request.AlwaysMultipartFormData = true;
            request.AddParameter("attributes", attributeJson.ToString());
            request.AddFile("file", FileSystemHelper.GeneratePathToCloudFiles(file.FilePath, "BoxFiles"));
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.Created, $"Failed to upload file '{file.FileName}' to folder '{folderName}' in Box. Status Code: '{response.StatusCode}'");
            return JsonConvert.DeserializeObject<BoxSearchResponseDto>(response.Content).Entries.First(s => s.Name.Equals(file.FileName)).Id;
        }

        public void RemoveFileByID(string accessToken, string fileId)
        {
            RestRequest request = new RestRequest(BoxAppApiProvider.ApiUrl + $"/files/{fileId}", Method.Delete);
            request.AddHeader("Authorization", "Bearer " + accessToken);
            for (int i = 0; i < 30; i++)
            {
                var response = Client.Execute(request);
                if (response.StatusCode == HttpStatusCode.NoContent)
                {
                    response.Validate(HttpStatusCode.NoContent, $"Failed to delete file id '{fileId}");
                    return;
                }
                else
                {
                    Thread.Sleep(1000);
                }
            }
            throw new Exception($"Failed to delete file id '{fileId}' after 30 attempts");
        }
    }
}