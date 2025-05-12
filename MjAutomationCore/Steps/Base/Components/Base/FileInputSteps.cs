using Microsoft.VisualBasic;
using MjAutomationCore.Components.Base;
using MjAutomationCore.Utils;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using System.Threading;
using Reqnroll;

namespace MjAutomationCore.Steps.Base.Components.Base
{
    [Binding]
    class FileInputSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsers;

        public FileInputSteps(BrowsersList browsers)
        {
            _browsers = browsers;
        }

        [When(@"User uploads '([^']*)' file through '([^']*)' input")]
        public void WhenUserUploadsFileThroughInput(string pathfile, string input)
        {
            _browsers.Active.GetComponent<FileInputField>(input, new Properties { Displayed = TriState.False, Exist = TriState.True })
                .SendKeys(FileSystemHelper.GeneratePathToEmbedded(pathfile));
            //TODO File upload waiting
            Thread.Sleep(1000);
        }
    }
}