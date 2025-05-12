using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.QA;
using NUnit.Framework;
using OpenQA.Selenium;
using System.Linq;
using System.Threading;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.QA
{
    [Binding]
    class PublishTypeSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly ValuesText _valuesText;

        public PublishTypeSteps(WebDriver driver, ValuesText valuesText)
        {
            _driver = driver;
            _valuesText = valuesText;
        }

        [Then(@"Publish page is displayed in the new tab")]
        public void ThenPublishPageIsDisplayedInTheNewTab()
        {
            Thread.Sleep(1500);
            _driver.SwitchTo().Window(_driver.WindowHandles.Last());
            _driver.WaitForDataLoading();
            var map = _driver.NowAt<PublishTypePage>();
            Assert.IsTrue(map.LogoImage(), "logo is not displayed on Page");
        }

        [When(@"User click subscribe link on Page")]
        public void WhenUserClickSubscribeLinkOnPage()
        {
            var link = _driver.NowAt<PublishTypePage>();
            link.LinkOnSubscribe.Click();
        }
    }
}