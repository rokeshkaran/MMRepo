using System.Collections.Generic;
using SeleniumAutomationUtils.SeleniumExtensions;
using MjAutomationCore.Base;
using OpenQA.Selenium;
using System;
using System.Linq;
using OpenQA.Selenium.Support.UI;
using System.Threading;
using MjAutomationCore.Providers;
using MjAutomationCore.Extensions;

namespace MjAutomationCore.Pages.WebAppProject.QA
{
    class InviteOthersToCoEditPage : SeleniumBasePage
    {
        public WebDriverWait WebDriverWaitwait { get; private set; }

        public override List<By> GetPageIdentitySelectors()
        {
            Thread.Sleep(2000);
            var frameSelector = SelectorFor(this, p => p.Iframe);
            var frames = Driver.FindElements(frameSelector);
            if (frames.Any())
            {
                Driver.SwitchToSpecificFrame(frames[0]);
            }
            return new List<By>
            {
                SelectorFor(this, p => p.LogoImageOnPage)
            };
        }

        public bool GetTitleOnPage(string title)
        {
            var selector = By.XPath($".//body[@class='context-wide context-publishing']//*[text()='{title}']");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Title {title} is not displayed on page");
            }

            return Driver.IsElementDisplayed(selector);
        }

        public IWebElement GetCheckboxByName(string checkboxName)
        {
            var selector = By.XPath(".//div[contains(@class,'checkbox-wrapper')]//label");
            Driver.WaitForElementsToBeDisplayed(selector, WebDriverExtensions.WaitTime.Medium, false);
            var checkbox = Driver.FindElements(selector).First(x => x.Text.Equals(checkboxName));
            return checkbox;
        }

        public bool GetCheckboxState(string checkboxName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Short)
        {
            var state = Driver.GetPseudoElementValue(GetCheckboxByName(checkboxName), WebDriverExtensions.Pseudo.Before, "display");
            return state.Equals("block");
        }

        public void SetCheckboxState(string checkboxName, bool desiredState)
        {
            if (desiredState)
            {
                if (!GetCheckboxState(checkboxName))
                {
                    Driver.ClickByJavascript(GetCheckboxByName(checkboxName));
                }
            }
            else
            {
                if (GetCheckboxState(checkboxName))
                {
                    Driver.ClickByJavascript(GetCheckboxByName(checkboxName));
                }
            }
        }
    }
}