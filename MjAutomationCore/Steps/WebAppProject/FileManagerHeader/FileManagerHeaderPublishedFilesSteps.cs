using SeleniumAutomationUtils.SeleniumExtensions;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.FileManagerHeader;
using MjAutomationCore.Utils;
using System.Threading;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.FileManagerHeader
{
    [Binding]
    class FileManagerHeaderPublishedFilesSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsers;
        private readonly SessionRandomValue _random;

        public FileManagerHeaderPublishedFilesSteps(BrowsersList browsers, SessionRandomValue random)
        {
            _browsers = browsers;
            _random = random;
        }

        [When(@"User clicks '([^']*)' button icon on maps toolbar")]
        public void WhenUserClicksButtonIconOnMapsToolbar(string buttonIcon)
        {
            var page = _browsers.Active.NowAt<FileManagerHeaderPublishedFilesPage>();
            page.GetButtonIconOnMapToolbar(buttonIcon).Click();
        }
    }
}
