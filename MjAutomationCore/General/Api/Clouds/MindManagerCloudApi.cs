using AutomationUtils.Api;
using AutomationUtils.Extensions;
using MjAutomationCore.DTO.WebAppDTO.Clouds.MindManagerCloud.MindManagerStorageExplorer;
using MjAutomationCore.Utils;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading;
using Reqnroll;

namespace MjAutomationCore.General.Api.Clouds
{
    public class MindManagerCloudApi : BaseApiMethods
    {
        public RestResponse GetAllItemsByFolder(string folder,string accessToken)
        {
            RestRequest request;
            if (folder == "/")
            {
                request = new RestRequest("storage/", Method.Get);
            }
            else
            {
                request = new RestRequest($"storage/{folder}/", Method.Get);
            }
           
            request.AddHeader("Authorization", "Bearer " + accessToken);
            request.AddParameter("action", "list");
            request.AddParameter("limit", "200");
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, $"Response wasn't received.Items in folder: {folder} can not be retrieved");
            return response;          
        }

        public MindManagerDirectoryDetails GetItemsByDirectoryAndFolder(string accessToken , string directory, string folder)
        {
            var allItems = GetAllItemsByFolder(folder,accessToken);
            if(directory == "own")
                return ApiResponseDeserialiserByType<MindManagerItemDirectory>(allItems).OwnDirectory;
            else
                //Owner == Shared
                return ApiResponseDeserialiserByType<MindManagerItemDirectory>(allItems).SharedDirectory;
        }

        public void RemoveItemById(string itemId, string accessToken)
        {
            var request = new RestRequest($"storage/{itemId}", Method.Delete);
            request.AddHeader("Authorization", "Bearer " + accessToken);
            RestResponse response = null;
            for (int i = 0; i < 5; i++)
            {
                try
                {
                    response = Client.Execute(request);
                    if (response.StatusCode == HttpStatusCode.OK)
                    {
                        AutomationUtils.Utils.Logger.Write($"File with id: '{itemId}' has been deleted", AutomationUtils.Utils.Logger.LogLevel.Info);
                        return;
                    }
                }
                catch
                {
                    //Wait 1 second before each retry in the above loop
                    Thread.Sleep(1000);
                }
            }
            throw new Exception($"Failed to delete file with id '{itemId}' after 5 attempts. Error: {response.Content}");
        }

        public string GetItemIdByNameAndFolder(string itemName, string folder, string accessToken)
        {
            for (int i = 0; i < 3; i++)
            {
                try
                {
                    var allItems = GetItemsByDirectoryAndFolder(accessToken, "own", folder).ItemDetails;
                    return allItems.Where(x => x.ItemName.Equals(itemName)).Select(s => s.ItemId).First();
                }
                catch
                {   
                    //Wait 1 second before each retry in the above loop
                    Thread.Sleep(1000);
                }
            }
            throw new Exception($"Item '{itemName}' can not be found in folder '{folder}' after 3 attempts '");          
        }

        public string GetItemPathByNameAndFolder(string itemName, string folderPath, string accessToken)
        {
            var allItems = GetItemsByDirectoryAndFolder(accessToken, "own", folderPath).ItemDetails;
            return allItems.Where(x => x.ItemName.Equals(itemName)).Select(s => s.ItemPath).FirstOrDefault();
        }

        public MindManagerCloudItemDto CreateFolder(string folderName,string location, string accessToken)
        {
            RestRequest request;
            if(location.Equals("/"))
            {
                request = new RestRequest($"storage/{folderName}?type=folder", Method.Post);
            }
            else
            {
                request = new RestRequest($"storage/{location}/{folderName}?type=folder", Method.Post);
            }
            request.AddHeader("Authorization", "Bearer " + accessToken);
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, "Response wasn't received.Folder can not be created.");
            return ApiResponseDeserialiserByType<MindManagerCloudItemDto>(response);
        }

        public string UploadFileToFolder(MindManagerCloudItemDto fileDetails, string location, string accessToken)
        {
            var uploadDetails = GetFileUploadDetails(fileDetails, location, accessToken);
            UploadFileToFolderViaAWS(uploadDetails.AwsUrl, fileDetails.ItemPath);
            return uploadDetails.ItemId;
        }

        public MindManagerCloudItemDto GetFileUploadDetails(MindManagerCloudItemDto fileDetails, string location, string accessToken)
        {
            RestRequest request;
            if (location.Equals("/")) // "/" refers to root folder of mindmanager cloud
            {
                request = new RestRequest($"storage/{fileDetails.ItemName}?type=file", Method.Post);
            }
            else
            {
                request = new RestRequest($"storage/{location}/{fileDetails.ItemName}?type=file", Method.Post);
            }
            request.AddHeader("Authorization", "Bearer " + accessToken);
            var response = Client.Execute(request);
            ApiResponseValidator.ValidateResponse(response);
            return ApiResponseDeserialiserByType<MindManagerCloudItemDto>(response);
        }

        public void UploadFileToFolderViaAWS(string awsUrl, string filePath)
        {
            RestRequest request = new RestRequest(awsUrl , Method.Put);
            request.AddParameter("application/octet-stream", File.ReadAllBytes(Utils.FileSystemHelper.GeneratePathToCloudFiles(filePath, "MindManagerCloudFiles")), ParameterType.RequestBody);
            var response = Client.Execute(request);
            ApiResponseValidator.ValidateResponse(response);
        }

        private dynamic ApiResponseDeserialiserByType<T>(RestResponse response)
        {
            return JsonConvert.DeserializeObject<T>(response.Content);
        }

        public RestResponse ShareMapLinkInEmail(string accessToken, string email, string permission, string mapId)
        {
            var jsonBody = new
            {
                permissions = new[] {
                        new  { email = email, permission = permission },
                }
            };

            RestRequest request = new RestRequest($"storage/{mapId}?action=share", Method.Put);
            request.AddHeader("Authorization", "Bearer " + accessToken);
            request.AddHeader("Content-Type", "application/json");
            request.AddJsonBody(Newtonsoft.Json.JsonConvert.SerializeObject(jsonBody));
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, $"Response wasn't received.Map can not be shared to '{email}'");
            return response;
        }

    }
}