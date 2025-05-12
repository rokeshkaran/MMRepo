using AutomationUtils.Utils;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.MindmanagerOnlineHelp;
using MjAutomationCore.Utils;
using SeleniumAutomationUtils.SeleniumExtensions;
using Reqnroll;

namespace MjAutomationCore.Steps.MindmanagerOnlineHelp
{
    [Binding]
    class MindmanagerOnlineHelpSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsers;

        public MindmanagerOnlineHelpSteps(BrowsersList browsersList)
        {
            _browsers = browsersList;
        }

        [Then(@"header '(.*)' is displayed on MindManager online help page")]
        public void ThenHeaderIsDisplayedOnMindManagerOnlineHelpPage(string header)
        {
            var onlineHelpPage = _browsers.Active.NowAt<MindmanagerOnlineHelpPage>();
            Verify.IsTrue(onlineHelpPage.DisplayedHeader(header), $"Header '{header}' is not displayed on Mindmanager online help page");
        }

        [When(@"User clicks '([^']*)' link for '([^']*)' product on MindManager online help page")]
        public void WhenUserClicksLinkForProductOnMindManagerOnlineHelpPage(string link, string product)
        {
            var onlineHelpPage = _browsers.Active.NowAt<MindmanagerOnlineHelpPage>();
            onlineHelpPage.GetLinkByNameForProduct(link, product).Click();
        }
    }
}