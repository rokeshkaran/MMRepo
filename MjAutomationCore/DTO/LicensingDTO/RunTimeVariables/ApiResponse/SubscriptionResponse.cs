using Newtonsoft.Json;
using System;

namespace MjAutomationCore.DTO.LicensingDTO.RunTimeVariables.ApiResponse
{
    public class SubscriptionResponse

    {
        [JsonProperty("eligible")] public bool Eligible { get; set; }

        [JsonProperty("reason")] public string Reason { get; set; }

        [JsonProperty("subscription")] public Subscription Subscription { get; set; }

        [JsonProperty("trial")] public bool Trial { get; set; }
    }

    public class Subscription
    {
        [JsonProperty("id")] public int Id { get; set; }

        [JsonProperty("user_id")] public string UserId { get; set; }

        [JsonProperty("user_email")] public string UserEmail { get; set; }

        [JsonProperty("subscription_id")] public string SubscriptionId { get; set; }

        [JsonProperty("purchase_id")] public string PurchaseId { get; set; }

        [JsonProperty("status")] public string Status { get; set; }

        [JsonProperty("end_date")] public DateTime EndDate { get; set; }

        [JsonProperty("customer_name")] public string CustomerName { get; set; }

        [JsonProperty("ref_id")] public string RefId { get; set; }

        [JsonProperty("product_id")] public string ProductId { get; set; }

        [JsonProperty("product_label")] public string ProductLabel { get; set; }

        [JsonProperty("source")] public string Source { get; set; }

        [JsonProperty("tenant_id")] public string TenantId { get; set; }

        [JsonProperty("device_id")] public string DeviceId { get; set; }

        [JsonProperty("license_model")] public string LicenseModel { get; set; }

        [JsonProperty("purchase_status")] public string PurchaseStatus { get; set; }

        [JsonProperty("purchase_type")] public string PurchaseType { get; set; }

        [JsonProperty("scim_user_id")] public string ScimUserId { get; set; }

        [JsonProperty("tenant_type")] public string TenantType { get; set; }

        [JsonProperty("created_at")] public DateTime CreatedAt { get; set; }

        [JsonProperty("updated_at")] public DateTime UpdatedAt { get; set; }

        [JsonProperty("stock_purchase_id")] public string StockPurchaseId { get; set; }
    }
}