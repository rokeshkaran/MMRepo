using AutomationUtils.Api;
using MjAutomationCore.DTO.SnapDTO;
using MjAutomationCore.DTO.SnapDTO.RunTimeVariables;
using MjAutomationCore.Utils;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.Linq;
using System.Net;

namespace MjAutomationCore.General.Api.Snap
{
    class SnapTeamApi : BaseApiMethods
    {
        public string CreateTeam(SnapTeamDto.Team team, string token)
        {
            var postRequest = new RestRequest("capture-team", Method.Post);

            postRequest.AddHeader("Authorization", "Bearer " + token);
            postRequest.AddHeader("Accept", "application/json");
            postRequest.AddParameter("name", team.Name);
            var response = Client.Execute(postRequest);

            if (!response.StatusCode.Equals(HttpStatusCode.OK))
            {
                throw new Exception($"Error response '{response.StatusCode}' status code. Team was not created");
            }

            return JsonConvert.DeserializeObject<SnapTeamDto.Team>(response.Content).TeamId;
        }

        public void DeleteTeam(SnapTeamDto.Team team, string token)
        {
            var deleteRequest = new RestRequest($"capture-team/{team.TeamId}", Method.Delete);
            deleteRequest.AddHeader("Authorization", "Bearer " + token);
            var response = Client.Execute(deleteRequest);

            if (!response.StatusCode.Equals(HttpStatusCode.OK))
            {
                throw new Exception($"Error response '{response.StatusCode}' status code. Team was not found or authenticated user is not the owner");
            }
        }

        public void AddMembersToTeam(string teamName, SnapTeamsDto teams, TeamMembersDto members, string token)
        {
            var teamID = teams.Value.Find(x => x.Name.Equals(teamName)).TeamId;
            var request = new RestRequest($"capture-team/{teamID}", Method.Post);
            request.AddHeader("Authorization", "Bearer " + token);
            request.AddJsonBody(new { members = members.Member.ToArray() });
            var response = Client.Execute(request);

            if (!response.StatusCode.Equals(HttpStatusCode.OK))
            {
                throw new Exception($"Error response '{response.StatusCode}' status code. Members not added to the team");
            }
        }

        public SnapTeamDto GetListOfTeams(string token)
        {
            var request = new RestRequest($"/capture-team?pending=true", Method.Get);
            request.AddHeader("Authorization", "Bearer " + token);
            var response = Client.Execute(request);

            if (!response.StatusCode.Equals(HttpStatusCode.OK))
            {
                throw new Exception($"Error response '{response.StatusCode}' status code.");
            }

            var customerList = JsonConvert.DeserializeObject<SnapTeamDto>(response.Content);
            return customerList;
        }

        public void GetTeamInformationIncludingListOfMembers(string teamName, SnapTeamsDto teams, ValueIdToken idToken)
        {
            var teamID = teams.Value.First(x => x.Name.Equals(teamName)).TeamId;
            var request = new RestRequest($"capture-team/{teamID}", Method.Get);
            request.AddHeader("Authorization", "Bearer " + idToken.FirstUser);
        }

        public void AcceptRequestToBecomeMemberOfTeam(string token, string team)
        {
            var key = GetListOfTeams(token).Teams.Find(x => x.Name.Equals(team)).RequestKey;
            var request = new RestRequest($"capture-team-user-accept", Method.Post);
            request.AddHeader("Authorization", "Bearer " + token);
            request.AddJsonBody(new { requestKey = key });
            var response = Client.Execute(request);

            if (!response.StatusCode.Equals(HttpStatusCode.OK))
            {
                throw new Exception($"Error response '{response.StatusCode}' status code. Request is not accepted.");
            }
        }

        public void DeclineRequestToBecomeMemberOfTeam(string token, string team)
        {
            var key = GetListOfTeams(token).Teams.Find(x => x.Name.Equals(team)).RequestKey;
            var request = new RestRequest($"capture-team-user-accept/{key}", Method.Delete);
            request.AddHeader("Authorization", "Bearer " + token);
            var response = Client.Execute(request);

            if (!response.StatusCode.Equals(HttpStatusCode.OK))
            {
                throw new Exception($"Error response '{response.StatusCode}' status code.");
            }
        }

        public string UploadCaptureToTeam(SnapDto snap, string teamName, SnapTeamsDto teams, string token)
        {
            var postRequest = new RestRequest("capture", Method.Post);

            postRequest.AddHeader("Authorization", "Bearer " + token);
            postRequest.AddHeader("Accept", "application/json");
            postRequest.AddParameter("type", snap.Type);
            postRequest.AddParameter("source", snap.Source);
            postRequest.AddParameter("text", snap.Text);
            var teamID = teams.Value.First(x => x.Name.Equals(teamName)).TeamId;
            postRequest.AddParameter("team_id", teamID);
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
    }
}