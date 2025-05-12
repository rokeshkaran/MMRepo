using Microsoft.VisualBasic;
using MjAutomationCore.Components.Base;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.BackgroundObjectLlist;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.QA;
using MjAutomationCore.Pages.WebAppProject.ToolPanel;
using MjAutomationCore.Utils;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.BackgroundObjects
{
    [Binding]
    class ImageSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsers;
        private readonly BackgroundObjectList _backgroundObjectList;

        public ImageSteps(BrowsersList browsersList, BackgroundObjectList backgroundObjectList)
        {
            _browsers = browsersList;
            _backgroundObjectList = backgroundObjectList;
        }

        [When(@"User uploads '([^']*)' image from Tool panel to '([^']*)','([^']*)' position on Canvas")]
        public void WhenUserUploadsImageFromToolPanelToPositionOnCanvas(string image, int оffsetX, int оffsetY)
        {
            var page = _browsers.Active.NowAt<ToolPanelPage>();
            _browsers.Active.ClickByActions(page.GetButtonByNameOnToolsPanel("Insert Image"));
            _browsers.Active.GetComponent<FileInputField>("add-image-input", new Properties { Displayed = TriState.False, Exist = TriState.True }).SendKeys(Utils.FileSystemHelper.GeneratePathToEmbedded(image));
            //TODO Image upload waiting
            Thread.Sleep(1000);
            _browsers.Active.MoveByOffsetAndClick(оffsetX, оffsetY);

            var canvas = _browsers.Active.NowAt<WebEditorPage>();
            var lastAddedBackgroundObject = canvas.BackgroundObjectsOnPage.Last();
            var imageId = lastAddedBackgroundObject.GetAttribute("id");
            var lastAddedBackgroundObjectRef = canvas.ImageOnCanvas.Last();
            var imageRef = lastAddedBackgroundObjectRef.GetAttribute("xlink:href");

            _backgroundObjectList.Value.Add(new KeyValuePair<string, string>(image, imageId));
            _backgroundObjectList.ImageRef.Add(new KeyValuePair<string, string>(image, imageRef));

            if (_browsers.Active.IsElementDisplayed(lastAddedBackgroundObject))
            {
                lastAddedBackgroundObject.Click();
            }
        }

        [When(@"User remembers '([^']*)' image on Canvas")]
        public void WhenUserRemembersImageOnCanvas(string image)
        {
            var canvas = _browsers.Active.NowAt<WebEditorPage>();
            var lastAddedBackgroundObject = canvas.BackgroundObjectsOnPage.Last();
            var imageId = lastAddedBackgroundObject.GetAttribute("id");
            var lastAddedBackgroundObjectRef = canvas.ImageOnCanvas.Last();
            var imageRef = lastAddedBackgroundObjectRef.GetAttribute("xlink:href");

            _backgroundObjectList.Value.Add(new KeyValuePair<string, string>(image, imageId));
            _backgroundObjectList.ImageRef.Add(new KeyValuePair<string, string>(image, imageRef));
        }

    }
}
