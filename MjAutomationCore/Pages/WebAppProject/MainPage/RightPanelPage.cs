using AutomationUtils.Utils;
using MjAutomationCore.Base;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;

namespace MjAutomationCore.Pages.WebAppProject.MainPage
{
    class RightPanelPage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'right')]")]
        public IWebElement RightPanel { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'form-errors')]")]
        public IWebElement ErrorMessage { get; set; }

        [FindsBy(How = How.XPath, Using = ".//button[@class='visit-store primary']")]
        public IWebElement VisitStoreButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//a[@class='email-verification-change-email']")]
        public IWebElement СhangeEmailLabel { get; set; }

        [FindsBy(How = How.XPath, Using = ".//span[contains(@class,'error-license-key-already-used')]")]
        public IWebElement ErrorMessageAlreadyUseLicenseKey { get; set; }

        [FindsBy(How = How.XPath, Using = ".//span[contains(@class,'error-license-key-invalid')]")]
        public IWebElement ErrorMessageInvalidLicenseKey { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='form long']")]
        public IWebElement ViewEmailVerificationForm { get; set; }

        [FindsBy(How = How.XPath, Using = ".//a[contains(@class, 'signout-button')]")]
        public IWebElement SignOutButton { get; set; }

        public string SectionHeader = ".//h1[contains(@class,'section-header')] | .//div[contains(@class,'license-help')]/h2 | .//h2[contains(@class,'section-header')] | .//h3[contains(@class,'section-header')]";

        public string SectionSubheader = ".//h3[contains(@class,'subheader') or contains(@class,'form-row form-text long') or contains(@class,'section-header')]";

        public string TextMessege = ".//p";
        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            { };
        }

        public IWebElement GetHyperlinkOnRightPanel(string hyperlinkText)
        {
            var selector = $".//a[contains(text(), '{hyperlinkText}')]";
            if (!Driver.IsElementInElementDisplayed(RightPanel, By.XPath(selector), WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"'{hyperlinkText}' hyperlink is not displayed on right panel");
            }
            return RightPanel.FindElement(By.XPath(selector));
        }

        public IWebElement GetHyperlinkInTextOnRightPanel(string hyperlinkName, IWebElement textwithHyperlink)
        {
            var selector = $".//a[contains(text(), '{hyperlinkName}')]";
            if (!Driver.IsElementInElementDisplayed(RightPanel, By.XPath(selector), WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"{hyperlinkName} hyperlink is not displayed on right panel");
            }
            return textwithHyperlink.FindElement(By.XPath(selector));
        }

        public IList<IWebElement> GetHeaderOnRightPanel()
        {            
            for (int i = 0; i < 15; i++)
            {
                if (Iframe.Any())
                {
                    Driver.SwitchToFrame(0);
                }
                if (Driver.IsElementInElementDisplayed(RightPanel, By.XPath(SectionHeader), WebDriverExtensions.WaitTime.Short))
                {
                    try
                    {
                        return RightPanel.FindElements(By.XPath(SectionHeader));
                    }
                    catch(StaleElementReferenceException)
                    {
                        continue;
                    }                    
                }
                Thread.Sleep(200);
            }
            throw new Exception("Header is not displayed on right panel");
        }
        public bool DisplayedHeader(string header)
        {
            for (int i = 0; i < 30; i++)
            {
                if (GetHeaderOnRightPanel().Any(x => x.Text.Equals(header)))
                {
                    break;
                }
                else
                {
                    Thread.Sleep(500);
                }
            }
            return GetHeaderOnRightPanel().Any(x => x.Text.Equals(header));
        }

        public IList<IWebElement> GetSubheaderOnRightPanel()
        {
            if (!Driver.IsElementInElementDisplayed(RightPanel, By.XPath(SectionSubheader), WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception("Subheader is not displayed on page");
            }
            return RightPanel.FindElements(By.XPath(SectionSubheader));
        }
        public bool DisplayedSubheader(string subheader)
        {
            for (int i = 0; i < 30; i++)
            {
                if (GetSubheaderOnRightPanel().Any(x => x.Text.Equals(subheader)))
                {
                    break;
                }
                else
                {
                    Thread.Sleep(500);
                }
            }
            return GetSubheaderOnRightPanel().Any(x => x.Text.Equals(subheader));
        }

        public IList<IWebElement> GetTextOnRightPanel()
        {
            if (!Driver.IsElementInElementDisplayed(RightPanel, By.XPath(TextMessege), WebDriverExtensions.WaitTime.Second))
            {
                throw new Exception("Message is not displayed on page");
            }
            return RightPanel.FindElements(By.XPath(TextMessege));
        }

        public bool DisplayedText(string textMessege)
        {
            for (int i = 0; i < 10; i++)
            {
                if (GetTextOnRightPanel().Any(x => x.Text.Equals(textMessege)))
                {
                    break;
                }
                else
                {
                    Thread.Sleep(1000);
                }
            }
            return GetTextOnRightPanel().Any(x => x.Text.Equals(textMessege));
        }

        public void VerifyTextUnderHeaders(IList<IWebElement> headers, IList<IWebElement> paragraphs, Dictionary<string, string> expectedHeaderParagraphPairs)
        {
            for (int i = 0; i < headers.Count; i++)
            {
                var headerText = headers[i].Text;
                var paragraphText = paragraphs[i].Text.Replace("\n", "").Replace("\r", "").Replace("<br>", "");

                if (expectedHeaderParagraphPairs.ContainsKey(headerText))
                {
                    var expectedText = expectedHeaderParagraphPairs[headerText];
                    Verify.AreEqual(expectedText, paragraphText, $"The text under the header '{headerText}' does not match the expected value.");
                }
                else
                {
                    throw new Exception($"The header '{headerText}' was not found in the expected values.");
                }
            }
        }
    }
}