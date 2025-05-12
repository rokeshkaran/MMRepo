using MjAutomationCore.Utils;

namespace MjAutomationCore.Providers
{
    class KeyVaultProvider
    {
        public static string KeyVaultUri = ConfigReader.ByKey("keyVaultUrl");
    }
}
