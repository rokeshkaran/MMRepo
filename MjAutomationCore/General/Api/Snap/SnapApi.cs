using AutomationUtils.Api;
using MjAutomationCore.DTO.SnapDTO.RunTimeVariables;
using MjAutomationCore.Utils;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;

namespace MjAutomationCore.General.Api.Snap
{
    class SnapApi : BaseApiMethods
    {
        public string UploadCapture(SnapDto snap, string token)
        {
            var postRequest = new RestRequest("capture", Method.Post);

            postRequest.AddHeader("Authorization", "Bearer " + token);
            postRequest.AddHeader("Accept", "application/json");
            postRequest.AddParameter("type", snap.Type);
            postRequest.AddParameter("source", snap.Source);
            postRequest.AddParameter("text", snap.Text);
            if (!string.IsNullOrEmpty(snap.Link))
            {
                postRequest.AddParameter("link", snap.Link);
            }
            if (!string.IsNullOrEmpty(snap.Note))
            {
                postRequest.AddParameter("note", snap.Note);
            }
            if (!string.IsNullOrEmpty(snap.File))
            {
                postRequest.AddFile("attachment", FileSystemHelper.GeneratePathToEmbedded(snap.File));
            }
            var response = Client.Execute(postRequest);

            if (!response.StatusCode.Equals(HttpStatusCode.OK))
            {
                throw new Exception($"Error response '{response.StatusCode}' status code. Capture was not upload");
            }

            return JsonConvert.DeserializeObject<SnapDto>(response.Content).Id;
        }

        public SnapDto GetAllCaptureItems(SnapsDto snaps, SnapDto snap, string token)
        {
            for (int i = 0; i < 10000; i += 100)
            {
                var getAllCaptureItem = new RestRequest($"capture?sinceId={snaps.Value.First().Id}&offset={snaps.Value.First().Id}&limit=1000", Method.Get);
                getAllCaptureItem.AddHeader("Authorization", "Bearer " + token);

                var response = Client.Execute(getAllCaptureItem);

                var captureItemList = JsonConvert.DeserializeObject<List<SnapDto>>(response.Content);

                if (!captureItemList.Any())
                    break;

                if (captureItemList.Any(x => x.Text.Equals(snap.Text)))
                {
                    var captureItem = captureItemList.First(x => x.Text.Equals(snap.Text));
                    return captureItem;
                }
            }

            throw new Exception(/**/);
        }

        public void DeleteCaptureItem(SnapDto snap, string token)
        {
            var request = new RestRequest($"capture/{snap.Id}", Method.Delete);

            request.AddHeader("Authorization", "Bearer " + token);

            var response = Client.Execute(request);

            if (!response.StatusCode.Equals(HttpStatusCode.OK))
            {
                throw new Exception($"Error response '{response.StatusCode}' status code");
            }
        }
    }
}