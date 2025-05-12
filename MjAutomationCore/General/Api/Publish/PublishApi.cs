using AutomationUtils.Api;
using AutomationUtils.Extensions;
using MjAutomationCore.DTO.WebAppDTO.Publish;
using MjAutomationCore.Utils;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading;

namespace MjAutomationCore.General.Api.Publish
{
    internal class PublishApi : BaseApiMethods
    {
        public string CreatePublishId(string token)
        {
            var request = new RestRequest("/publish/id", Method.Get);
            request.AddHeader("Authorization", $"Bearer {token}");
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, "Response wasn't received");
            return JsonConvert.DeserializeObject<PublishDto>(response.Content).Id;
        }

        public void PublishFile(PublishDto publish, string token)
        {
            var request = new RestRequest("publish/file", Method.Post);
            request.AddHeader("Authorization", "Bearer " + token);
            request.AddParameter("Content-Type", "multipart/form-data");
            request.AddParameter("name", publish.Name);
            request.AddParameter("publishId", publish.PublishId);
            request.AddFile("map", FileSystemHelper.GeneratePathToPublishedFilesFolder(publish.PublishFile));
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, "Response wasn't received");
        }

        public List<PublishDto> GetPublishList(string token)
        {
            var request = new RestRequest("/publish/files", Method.Get);
            request.AddHeader("Authorization", $"Bearer {token}");
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, "Response wasn't received");
            var publishList = JsonConvert.DeserializeObject<List<PublishDto>>(response.Content);
            return publishList;
        }

        public PublishDto GetPublishedFileByName(string fileName, string token)
        {
            if (GetPublishList(token).FindAll(x => !string.IsNullOrEmpty(x.Name)).Any(x => x.Name.Equals(fileName)))
            {
                return GetPublishList(token).First(x => x.Name.Equals(fileName));
            }

            throw new Exception($"Published file with '{fileName}' name was not found");
        }

        public bool PublishedFileExistes(string fileName, string token)
        {
            try
            {
                return !(GetPublishedFileByName(fileName, token) is null);
            }
            catch
            {
                return false;
            }
        }

        public void ChengeOptions(string jsonBody, string token)
        {
            var request = new RestRequest($"publish/file/attributes", Method.Put);
            request.AddHeader("Authorization", $"Bearer {token}");
            request.AddJsonBody(jsonBody);
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, "Response wasn't received");
        }

        public void DeletePublishFile(string publishId, string token)
        {
            var request = new RestRequest($"publish/file?publishId={publishId}", Method.Delete);
            request.AddHeader("Authorization", $"Bearer {token}");
            RestResponse response = null;
            for (int i = 0; i < 30; i++)
            {
                response = Client.Execute(request);
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
            throw new Exception($"Published file wasn't deleted. Exception: {response.Content}");
        }

        public PublishDto PublishStatus(string publishId, string token)
        {
            var request = new RestRequest($"publish/file/status?publishId={publishId}", Method.Get);
            request.AddHeader("Authorization", $"Bearer {token}");
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, "Response wasn't received");
            return JsonConvert.DeserializeObject<PublishDto>(response.Content);
        }
    }
}