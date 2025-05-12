using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.QA;
using NUnit.Framework;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using System.Drawing;
using System.Threading;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.WebEditor
{
    [Binding]
    class PrintAreaSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly LocationWebDto _locWeb;

        public PrintAreaSteps(WebDriver driver, LocationWebDto locWeb)
        {
            _driver = driver;
            _locWeb = locWeb;
        }

        [Then(@"Print Preview screen is displayed to the User")]
        public void ThenPrintPreviewScreenIsDisplayedToTheUser()
        {
            var page = _driver.NowAt<PrintAreaPage>();
            _driver.WaitForElementToBeDisplayed(page.PrintPreviewHeader);
            Assert.IsTrue(page.PrintPreviewHeader.Displayed(), "Print Preview screen is not displayed");
        }

        [Then(@"basic Print Area screen is displayed to the User")]
        public void ThenBasicPrintAreaScreenIsDisplayedToTheUser()
        {
            var page = _driver.NowAt<PrintAreaPage>();
            page.BasicPrintArea.Displayed();
        }

        [When(@"User clicks '(.*)' button on Print Preview screen")]
        public void WhenUserClicksButtonOnPrintPreviewScreen(string buttonName)
        {
            var page = _driver.NowAt<PrintAreaPage>();
            page.GetButtonByName(buttonName).Click();
        }


        [When(@"User remembers size basic Print Area screen")]
        public void WhenUserRemembersSizeBasicPrintAreaScreen()
        {
            var page = _driver.NowAt<PrintAreaPage>();
            var size = page.BasicPrintArea.Location;
            var resultX = size.X;
            var resultY = size.Y;
            Point point = new Point(resultX, resultY);
            _locWeb.Location = point;
        }

        [Then(@"'(.*)' color is displayed on Print Border Area")]
        public void ThenColorIsDisplayedOnPrintBorderArea(string value)
        {
            var page = _driver.NowAt<PrintAreaPage>();
            var border = page.PrintBorderColor.GetCssValue("stroke");
        }

        [Then(@"'(.*)' checkbox is checked in Print Preview popup")]
        public void ThenCheckboxIsCheckedInPrintPreviewPopup(string checkboxName)
        {
            var page = _driver.NowAt<PrintAreaPage>();
            Assert.IsTrue(page.GetCheckedCheckboxByName(checkboxName), $"{checkboxName} checkbox is unchecked");
        }

        [When(@"User clicks '(.*)' checkbox in Print Preview popup")]
        public void WhenUserClicksCheckboxInPrintPreviewPopup(string checkboxName)
        {
            var page = _driver.NowAt<PrintAreaPage>();
            _driver.ClickByJavascript(page.GetCheckboxByName(checkboxName));
            Thread.Sleep(500);
        }

        [Then(@"'(.*)' checkbox is unchecked in Print Preview popup")]
        public void ThenCheckboxIsUncheckedInPrintPreviewPopup(string checkboxName)
        {
            var page = _driver.NowAt<PrintAreaPage>();
            Assert.IsTrue(page.GetUncheckedCheckboxByName(checkboxName), $"{checkboxName} checkbox is checked");
        }

    }
}
