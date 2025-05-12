using MjAutomationCore.Components.Buttons;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Pages;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;

namespace MjAutomationCore.Pages.WebAppProject.SideToolbox
{
    class SideToolboxPage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[@id='sideToolbox']")]
        public IWebElement SideToolbox { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@id='sideToolbox']//div[string-length(@data-tooltip)>0][@data-state!='hidden']")]
        public IList<IWebElement> SidePanelTemplatesList { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='side-toolbox-button ellipsis']")]
        public IWebElement EllipsisButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@id='sideToolbox']//div[@class='side-toolbox-button snap']")]
        public IWebElement SnapButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@id='sideToolbox']//div[@class='side-toolbox-button filter']")]
        public IWebElement FilterButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='zoom-control']//button[@class='btn btn-zoom-out']")]
        public IWebElement ZoomOutButtonOnZoomBar { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='zoom-control']//button[@class='btn btn-zoom-in']")]
        public IWebElement ZoomInButtonOnZoomBar { get; set; }

        [FindsBy(How = How.XPath, Using = ".//span[@class='zoom-percentage']")]
        public IWebElement ZoomPercentage { get; set; }

        public string BackgroundImagePreview = ".//div[@class='background-image-preview__image']";

        [FindsBy(How = How.XPath, Using = ".//div[@class='background-image-preview__remove']")]
        public IWebElement BackgroundImagePreviewRemoveButton { get; set; }

        public string SideToolboxPopup = "side-toolbox-popup";

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            {
                SelectorFor(this, p => p.SideToolbox)
            };
        }

        public string GetZoomPercentage()
        {
            if (!Driver.IsElementDisplayed(ZoomPercentage, WebDriverExtensions.WaitTime.Second))
            {
                throw new Exception($"Zoom percentage is not displayed on side toolbox");
            }
            return ZoomPercentage.Text;
        }

        public bool IsBackgroundImagePreviewDisplayed()
        {
            try
            {
                return Driver.IsElementDisplayed(By.XPath(BackgroundImagePreview), WebDriverExtensions.WaitTime.Short);
            }
            catch
            {
                return false;
            }
        }

        public IWebElement GetButtonByName(string buttonName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Short)
        {
            var selector = By.XPath($".//div[@data-tooltip='{buttonName}']");

            if (!Driver.IsElementInElementDisplayed(SideToolbox, selector, waitTime))
            {
                throw new Exception($"Button '{buttonName}' is not displayed on side toolbox");
            }

            return SideToolbox.FindElement(selector);
        }

        public bool DisplayedButton(string buttonName)
        {
            try
            {
                return GetButtonByName(buttonName, WebDriverExtensions.WaitTime.Second).Displayed();
            }
            catch
            {
                return false;
            }
        }

        public bool DisplayedStateButton(string button, string state)
        {
            return GetButtonByName(button).GetAttribute("data-state").Equals(state);
        }

        public IWebElement GetNumberOfEditorsOnButton(string numberOfEditors, string buttonName)
        {
            var selector = By.XPath($"./div[@class='notification'][text()='{numberOfEditors}']");
            if (!Driver.IsElementInElementDisplayed(GetButtonByName(buttonName), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Number of editors '{buttonName}' is not displaued on '{buttonName}' button");
            }

            return GetButtonByName(buttonName).FindElement(selector);
        }
    }
}