using AutomationUtils.Extensions;
using AutomationUtils.Utils;
using Microsoft.Extensions.Azure;
using Microsoft.Graph.Models;
using MjAutomationCore.DTO.BaseDto.EmailDetails;
using MjAutomationCore.DTO.LicensingDTO.RunTimeVariables.Email;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Extensions;
using MjAutomationCore.General.Api.Email;
using MjAutomationCore.Helpers;
using MjAutomationCore.Providers.Email;
using System;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading;
using Reqnroll;
using Reqnroll.Assist;
using static Dropbox.Api.Team.UsersSelectorArg;

namespace MjAutomationCore.Steps.Base.EmailNotification
{
    [Binding]
    class EmailNotificationSteps : ReqnrollContext
    {
        protected readonly RestWebClient _restClient;
        protected readonly EmailDetailsDto _emailDetails;
        private readonly SessionRandomValue _sessionRandom;
        private readonly OutlookEmailsDto _outlookEmailList;

        public EmailNotificationSteps(RestWebClient restClient, EmailDetailsDto emailDetails, SessionRandomValue sessionRandom, OutlookEmailsDto outlookEmailList)
        {
            _restClient = restClient;
            _emailDetails = emailDetails;
            _sessionRandom = sessionRandom;
            _outlookEmailList= outlookEmailList;
        }

        [Then(@"User receives an email at '([^']*)' with the following details:")]
        public void ThenUserReceivesAnEmailAtWithTheFollowingDetails(string recipient, Table table)
        {
            var emailDetails = table.CreateInstance<EmailDetailsDto>();
            var email = EmailHelper.WaitForEmailWithSubject(recipient, GmailProvider.CodePasswordEmail, emailDetails.Header);
            Verify.AreEqual(emailDetails.Header, email.Subject, $"Expected email subject to be '{emailDetails.Header}' but was '{email.Subject}'");
            Verify.AreEqual(emailDetails.Body, email.TextBody.RemoveLineBreaks(), $"Expected email body to be '{emailDetails.Body}' but was '{email.TextBody}'");
        }

        [Then(@"User receives an outlook email at '([^']*)' with the following details:")]
        public void ThenUserReceivesAnOutlookEmailAtWithTheFollowingDetails(string recipient, Table table)
        {
            var emailDetailsSet = table.CreateSet<EmailDetailsDto>();
            foreach (var emailDetails in emailDetailsSet)
            {
                string body = emailDetails.Body.Replace("SRND", _sessionRandom.RandomString);
                for (int j = 0; j <= 10; j++)
                {
                    var matchingEmails = _restClient.BackendV1Client.InitApiMethods<OutlookGraphApi>().GetEmailsOutlookBySubject(recipient, emailDetails.Header);
                    foreach (var matchingEmail in matchingEmails)
                    {
                        if (matchingEmail != null)
                        {
                            string emailBodyWithoutHtmlTags = Regex.Replace(matchingEmail.Body?.Content, "<.*?>", "");
                            string emailBodyRemoveTrim = emailBodyWithoutHtmlTags.RemoveLineBreaks().Trim();
                            if (emailDetails.Header.Contains(matchingEmail.Subject) && body.Contains(emailBodyRemoveTrim))
                            {
                                Verify.AreEqual(matchingEmail.Subject, emailDetails.Header, $"Expected email subject to be '{emailDetails.Header}' but was '{matchingEmail.Subject}'");
                                Verify.AreEqual(body, emailBodyRemoveTrim, $"Expected email body to be '{body}' but was '{emailBodyRemoveTrim}'");
                                _outlookEmailList.Value.Add(matchingEmail);
                                return;
                            }
                        }
                    }
                    if (j == 10)
                    {
                        break;
                    }

                    Thread.Sleep(5000); // Wait 5 seconds before checking inbox again
                }
                throw new Exception($"Account activation email can not be found in '{recipient}' inbox");
            }
        }
    }
}