using AutomationUtils.Api;
using AutomationUtils.Extensions;
using MjAutomationCore.DTO.WebAppDTO.Clouds.DropBox;
using MjAutomationCore.Providers.Clouds.Dropbox;
using MjAutomationCore.Utils;
using Newtonsoft.Json;
using RestSharp;
using System.Net;

namespace MjAutomationCore.General.Api.Clouds
{
    class DropBoxApi : BaseApiMethods
    {
        public string GetAccessToken()
        {
            RestRequest request = new RestRequest($"{DropboxAppApiProvider.AccessTokenUrl}", Method.Post);
            request.AddParameter("refresh_token", DropboxAppApiProvider.DropboxRefreshToken);
            request.AddParameter("client_id", $"{DropboxAppApiProvider.ClientKey}");
            request.AddParameter("client_secret", $"{DropboxAppApiProvider.ClientSecret}");
            request.AddParameter("grant_type", "refresh_token");
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, "Response wasn't received");
            return JsonConvert.DeserializeObject<DropBoxTokenResponseDto>(response.Content).AccessToken;
        }
        public void UploadFileToDropbox(string accessToken, string filePath, string dropboxFileName)
        {
            string DropBoxFileName = "/" + dropboxFileName;
            string FilePath = filePath;

            // Create RestRequest for file upload
            RestRequest request = new RestRequest($"{DropboxAppApiProvider.Url + "files/upload"}", Method.Post);
            request.AddHeader("Authorization", "Bearer " + accessToken);
            request.AddHeader("Dropbox-API-Arg", "{\"autorename\":false,\"mode\":\"add\",\"mute\":false,\"path\":\"" + DropBoxFileName + "\",\"strict_conflict\":false}");
            request.AddHeader("Content-Type", "application/octet-stream");

            // Load file content
            byte[] fileBytes = System.IO.File.ReadAllBytes(FileSystemHelper.GeneratePathToDropBoxFilesFolder(FilePath));

            // Attach file content to the request body
            request.AddParameter("application/octet-stream", fileBytes, ParameterType.RequestBody);

            // Execute request
            var response = Client.Execute(request);
            response.Validate(HttpStatusCode.OK, $"Failed to upload file '{DropBoxFileName}' to DropBox. Status Code: '{response.StatusCode}'");
        }
    }
}