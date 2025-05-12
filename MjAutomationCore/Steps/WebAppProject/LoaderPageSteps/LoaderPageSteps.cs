using Reqnroll;
using OpenQA.Selenium;
using AutomationUtils.Utils;
using MjAutomationCore.Pages.WebAppProject.LoaderPage;
using SeleniumAutomationUtils.SeleniumExtensions;
using static System.Net.Mime.MediaTypeNames;
using MjAutomationCore.Providers;
using RestSharp;
using MjAutomationCore.Utils;

namespace MjAutomationCore.Steps.WebAppProject.LoaderPageSteps
{
    [Binding]
    class LoaderPageSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly BrowsersList _browsers;

        public LoaderPageSteps(WebDriver driver, BrowsersList browsersList)
        {
            _driver = driver;
            _browsers = browsersList;
        }

        [Then(@"'([^']*)' logo is displayed on the loading map progress bar")]
        public void ThenLogoIsDisplayedOnTheLoadingMapProgressBar(string Image)
        {
            var page = _driver.NowAt<LoaderPage>();
            Verify.IsTrue(page.DisplayedImageOnLoadingProgressBar(Image), $"'{Image}' logo is not displayed on loading progress bar");
        }

        [Then(@"saving is displayed on the map loading progress bar")]
        public void ThenSavingIsDisplayedOnTheMapLoadingProgressBar()
        {
            var page = _driver.NowAt<LoaderPage>();
            Verify.IsTrue(_driver.IsElementDisplayed(page.LoaderProgressBarContentname, WebDriverExtensions.WaitTime.Medium), $"Map loading progress bar is not displayed");
            Verify.IsTrue(page.LoaderProgressBarContentname.Text.Contains("Saving"), $"Saving is not displayed on map loading progress bar");
        }

        [Then(@"MindManager '([^']*)' wordmark logo is displayed on the loading map progress bar in folow colors")]
        public void ThenLogoIsDisplayedOnTheLoadingMapProgressBarInFolowColors(string Image, Table table)
        {
            var page = _browsers.Active.NowAt<LoaderPage>();
            var imagLink = page.LoaderProgressBarImage.GetAttribute("src");
            var request = new RestRequest(imagLink, Method.Get);
            RestResponse response = new RestClient().Execute(request);
            foreach (var row in table.Rows)
            {
                string Color = row["color"];
                Verify.IsTrue(response.Content.Contains(Color), $"The logo is not displayed on the loading progress bar in the expected color '{Color}'");
            }
        }
    }
}
