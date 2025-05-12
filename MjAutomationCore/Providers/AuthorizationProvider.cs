namespace MjAutomationCore.Providers
{
    class AuthorizationProvider
    {
        static string _authorization;

        public static string Authorization
        {
            get => _authorization;
            set => _authorization = $"Bearer {value}";
        }
    }
}