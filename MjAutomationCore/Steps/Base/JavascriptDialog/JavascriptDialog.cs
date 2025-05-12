using AutomationUtils.Utils;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.Extensions;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using System.Threading;
using Reqnroll;

namespace MjAutomationCore.Steps.Base.JavascriptDialog
{
    [Binding]
    class JavascriptDialog : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly SessionRandomValue _sessionRandom;

        public JavascriptDialog(WebDriver driver, SessionRandomValue sessionRandom)
        {
            _driver = driver;
            _sessionRandom = sessionRandom;
        }

        [Then(@"text '(.*)' is displayed in dialog popup")]
        public void ThenTextIsDisplayedInDialogPopup(string expectedText)
        {
            _driver.WaitForAlert();
            expectedText = expectedText.AddRandom(_sessionRandom);
            for (int i = 0; i < 10; i++)
            {
                try
                {
                    string text = _driver.SwitchTo().Alert().Text;
                    Verify.AreEqual(expectedText, text, $"Text {expectedText} is not displayed in dialog popup");
                    return;
                }
                catch (NoAlertPresentException)
                {
                    Thread.Sleep(1000);
                }
            }
        }

        [Then(@"dialog popup with text '(.*)' is displayed to User")]
        public void ThenDialogPopupWithTextIsDisplayedToUser(string expectedText)
        {
            Verify.IsTrue(IsAlertPresent(), "dialog popup is not displayed");
            expectedText = expectedText.AddRandom(_sessionRandom);
            for (int i = 0; i < 10; i++)
            {
                try
                {
                    string text = _driver.SwitchTo().Alert().Text;
                    Verify.AreEqual(expectedText, text, $"Text {expectedText} is not displayed in dialog popup");
                    return;
                }
                catch (NoAlertPresentException)
                {
                    Thread.Sleep(1000);
                }
            }
        }

        [When(@"User clicks Ok button in dialog popup")]
        public void WhenUserClicksOkButtonInDialogPopup()
        {
            _driver.WaitForAlert();
            _driver.SwitchTo().Alert().Accept();
            _driver.WaitForDataLoading();
        }

        [Then(@"dialog popup is displayed to User")]
        public void ThenDialogPopupIsDisplayedToUser()
        {
            Verify.IsTrue(IsAlertPresent(), "dialog popup is not displayed");
        }

        [Then(@"dialog popup is not displayed to User")]
        public void ThenDialogPopupIsNotDisplayedToUser()
        {
            Thread.Sleep(500);
            Verify.IsFalse(IsAlertPresent(), "dialog popup is displayed");
            _driver.WaitForDataLoading();
        }

        private bool IsAlertPresent()
        {
            try
            {
                _driver.SwitchTo().Alert();
                return true;
            }
            catch (NoAlertPresentException)
            {
                return false;
            }
        }
    }
}