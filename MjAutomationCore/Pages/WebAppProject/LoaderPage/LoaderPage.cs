using MjAutomationCore.Extensions;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Pages;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;

namespace MjAutomationCore.Pages.WebAppProject.LoaderPage
{
    class LoaderPage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[@id='loader']/*[@class='progress-bar']//*[@class='logo-img']")]
        public IWebElement LoaderProgressBarImage { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@id='loader']/*[@class='progress-bar']//*[@class='progress-bar-content-name']")]
        public IWebElement LoaderProgressBarContentname{ get; set; }

        public bool DisplayedImageOnLoadingProgressBar(string Image)
        {
            if (Driver.IsElementDisplayed(LoaderProgressBarImage, WebDriverExtensions.WaitTime.Short))
            {
                var ImageDetails = LoaderProgressBarImage.GetAttribute("src");
                if (ImageDetails.Contains("base64"))
                {
                    string[] strlist = ImageDetails.Split(",", 2);
                    var encoded = strlist[1].Remove(strlist[1].Length - 2);
                    var decoded = encoded.DecodedString();
                    if (decoded.Contains(Image))
                    {
                        return true;
                    }
                    return false;
                }
                if (ImageDetails.Contains(Image))
                {
                    return true;
                }
                return false;
            }
            return false;
        }
    }
}
