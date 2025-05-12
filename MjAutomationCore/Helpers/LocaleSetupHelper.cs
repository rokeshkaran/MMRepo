using Reqnroll;

namespace MjAutomationCore.Helpers
{
    [Binding]
    class LocaleSetupHelper
    {
        public static string SelectedLocale { get; private set; }

        [BeforeScenario("Locale_German")]
        public void SetGermanLocale()
        {
            SelectedLocale = "de-DE";
        }

        [BeforeScenario("Locale_French")]
        public void SetFrenchLocale()
        {
            SelectedLocale = "fr-FR";
        }
    }
}