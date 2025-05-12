using Newtonsoft.Json;
using System.Collections.Generic;
using MjAutomationCore.DTO.LicensingDTO.RunTimeVariables;
using AutomationUtils.Extensions;
using System;

namespace MjAutomationCore.DTO.LicensingDTO.RunTimeVariables.Email
{
    public class OutlookEmailResponseDto
    {
        [JsonProperty("@odata.context")]
        public string ODataContext { get; set; }

        [JsonProperty("@odata.nextLink")]
        public string ODataNextLink { get; set; }

        [JsonProperty("@odata.etag")]
        public string ODataEtag { get; set; }

        [JsonProperty("id")]
        public string Id { get; set; }

        [JsonProperty("createdDateTime")]
        public DateTime CreatedDateTime { get; set; }

        [JsonProperty("lastModifiedDateTime")]
        public DateTime LastModifiedDateTime { get; set; }

        [JsonProperty("changeKey")]
        public string ChangeKey { get; set; }

        [JsonProperty("categories")]
        public string[] Categories { get; set; }

        [JsonProperty("receivedDateTime")]
        public DateTime ReceivedDateTime { get; set; }

        [JsonProperty("sentDateTime")]
        public DateTime SentDateTime { get; set; }

        [JsonProperty("hasAttachments")]
        public bool HasAttachments { get; set; }

        [JsonProperty("internetMessageId")]
        public string InternetMessageId { get; set; }

        [JsonProperty("subject")]
        public string Subject { get; set; }

        [JsonProperty("bodyPreview")]
        public string BodyPreview { get; set; }

        [JsonProperty("importance")]
        public string Importance { get; set; }

        [JsonProperty("parentFolderId")]
        public string ParentFolderId { get; set; }

        [JsonProperty("conversationId")]
        public string ConversationId { get; set; }

        [JsonProperty("conversationIndex")]
        public string ConversationIndex { get; set; }

        [JsonProperty("isDeliveryReceiptRequested")]
        public object IsDeliveryReceiptRequested { get; set; }

        [JsonProperty("isReadReceiptRequested")]
        public bool IsReadReceiptRequested { get; set; }

        [JsonProperty("isRead")]
        public bool IsRead { get; set; }

        [JsonProperty("isDraft")]
        public bool IsDraft { get; set; }

        [JsonProperty("webLink")]
        public string WebLink { get; set; }

        [JsonProperty("inferenceClassification")]
        public string InferenceClassification { get; set; }

        [JsonProperty("body")]
        public Body Body { get; set; }

        [JsonProperty("sender")]
        public Sender Sender { get; set; }

        [JsonProperty("toRecipients")]
        public Recipient[] ToRecipients { get; set; }

        [JsonProperty("ccRecipients")]
        public Recipient[] CcRecipients { get; set; }

        [JsonProperty("bccRecipients")]
        public Recipient[] BccRecipients { get; set; }

        [JsonProperty("replyTo")]
        public object[] ReplyTo { get; set; }

        [JsonProperty("flag")]
        public Flag Flag { get; set; }
    }

    public class Body
    {
        [JsonProperty("contentType")]
        public string ContentType { get; set; }

        [JsonProperty("content")]
        public string Content { get; set; }
    }

    public class Sender
    {
        [JsonProperty("emailAddress")]
        public EmailAddress EmailAddress { get; set; }
    }

    public class EmailAddress
    {
        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("address")]
        public string Address { get; set; }
    }

    public class Recipient
    {
        [JsonProperty("emailAddress")]
        public EmailAddress EmailAddress { get; set; }
    }

    public class Flag
    {
        [JsonProperty("flagStatus")]
        public string FlagStatus { get; set; }
    }
}

