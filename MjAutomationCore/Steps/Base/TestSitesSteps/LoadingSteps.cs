using MjAutomationCore.Extensions;
using MjAutomationCore.Utils;
using Reqnroll;

namespace MjAutomationCore.Steps.Base.TestSitesSteps
{
    [Binding]
    public sealed class LoadingSteps
    {
        private readonly BrowsersList _browsers;

        public LoadingSteps(BrowsersList browsers)
        {
            _browsers = browsers;
        }

        [When(@"User waits for data loading")]
        public void WhenUserWaitsForDataLoading()
        {
            _browsers.Active.WaitForDataLoading();
        }
    }
}