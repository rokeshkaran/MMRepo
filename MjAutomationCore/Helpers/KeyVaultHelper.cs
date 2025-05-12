using AutomationUtils.Utils;
using Azure.Core;
using Azure.Identity;
using Azure.Security.KeyVault.Secrets;
using MjAutomationCore.Providers;
using MjAutomationCore.Providers.AzureProviders;
using System;
using System.Collections.Generic;

public static class KeyVaultHelper
{
    private static readonly SecretClient _secretClient;
    static KeyVaultHelper()
    {
        _secretClient = CreateSecretClient(KeyVaultProvider.KeyVaultUri, GetKeyVaultCredential());
    }

    public static string GetSecretValue(Enum secretEnum)
    {
        string secretName = secretEnum.ToString();
        if (Browser.BrowserType != "remote")
        {
            string environmentVariableValue = GetEnvironmentVariableValue(secretName);
            if (!string.IsNullOrEmpty(environmentVariableValue))
                return environmentVariableValue;
        }

        return GetKeyVaultSecretValue(secretName);
    }

    private static string GetEnvironmentVariableValue(string variableName)
    {
        return Environment.GetEnvironmentVariable(variableName, EnvironmentVariableTarget.Process);
    }

    private static string GetKeyVaultSecretValue(string secretName)
    {
        try
        {
            KeyVaultSecret secret = _secretClient.GetSecret(secretName);

            if (secret != null)
            {
                Environment.SetEnvironmentVariable(secretName, secret.Value, EnvironmentVariableTarget.Process);
                return secret.Value;
            }

            throw new KeyNotFoundException($"Secret '{secretName}' not found in Key Vault");
        }
        catch (Azure.RequestFailedException ex)
        {
            Logger.Write($"Azure Key Vault request failed: {ex.Message}", ex);
            throw;
        }
        catch (Exception ex)
        {
            Logger.Write($"An unexpected error occurred: {ex.Message}", ex);
            throw;
        }
    }

    private static SecretClient CreateSecretClient(string keyVaultUrl, TokenCredential credential)
    {
        return new SecretClient(new Uri(keyVaultUrl), credential);
    }

    private static TokenCredential GetKeyVaultCredential()
    {
        string clientId = null;
        string tenantId = null;
        string clientSecret = null;

        if (Browser.BrowserType == "remote")
        {
            clientId = Environment.GetEnvironmentVariable(AzureServicePrincipalCredentials.ClientId);
            tenantId = Environment.GetEnvironmentVariable(AzureServicePrincipalCredentials.TenantId);
            clientSecret = Environment.GetEnvironmentVariable(AzureServicePrincipalCredentials.ClientSecret);
        }

        if (clientId != null && tenantId != null && clientSecret != null)
        {
            return new ClientSecretCredential(tenantId, clientId, clientSecret);
        }
        return new DefaultAzureCredential(true);
    }

    public static void SetAllKeyVaultSecrets(SecretClient _secretClient)
    {
        var allSecrets = _secretClient.GetPropertiesOfSecrets();

        foreach (var secretProperties in allSecrets)
        {
            var secret = _secretClient.GetSecret(secretProperties.Name);
            Environment.SetEnvironmentVariable(secret.Value.Name, secret.Value.Value, EnvironmentVariableTarget.User);
        }
    }
}