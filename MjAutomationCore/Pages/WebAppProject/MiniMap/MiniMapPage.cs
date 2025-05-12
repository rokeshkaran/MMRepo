using Microsoft.Extensions.Configuration.EnvironmentVariables;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Pages;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;
using MjAutomationCore.Extensions;
using MjAutomationCore.Providers;

namespace MjAutomationCore.Pages.WebAppProject.MiniMap
{
    class MiniMapPage : SeleniumBasePage
    {
        const string Selector = ".//div[contains(@class,'joint-navigation-panel')]";
        public new By Context => By.XPath(Selector);

        [FindsBy(How = How.XPath, Using = Selector)]
        public IWebElement NavigationPanel { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='mini-map-icon']")]
        public IWebElement MiniMapButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'current-view')]")]
        public IWebElement CurrentView { get; set; }

        public string CloseButton = ".//div[contains(@class,'close')]";

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            { };
        }

        public bool DisplayedNavigationPanel(string navigationPanelName)
        {
            var state = NavigationPanel.GetAttribute("class").Contains(navigationPanelName);
            return state;
        }

        public IWebElement GetNavigationPanelByName(string navigationPanelName)
        {
            if(NavigationPanel.GetAttribute("class").Contains(navigationPanelName))
            {
                return NavigationPanel;
            }
            throw new Exception($"Navigation Panel with name '{navigationPanelName}' is not displayed");             
        }

        public IWebElement GetCloseButtonByPanelName(string PanelName)
        {
            return GetNavigationPanelByName(PanelName).FindElement(By.XPath(CloseButton));
        }

        public bool IsMiniMapButtonEnable()
        {
            var icon = MiniMapButton.GetCssValue("background-image");
            if (icon.Contains("base64"))
            {
                string[] strlist = icon.Split(",", 2);
                var encoded = strlist[1].Remove(strlist[1].Length - 2);
                var decoded = encoded.DecodedString();
                if (decoded.Contains("fill=\"#0067CB\""))
                {
                    return true;
                }
                else decoded.Contains("fill=\"#C8C7C8\"");
                {
                    return false;
                }
            }
            throw new Exception($"Image displayed incorrect");
        }

        public bool IsIconDisplayedInNavigationPanel(string iconName)
        {
            try
            {
                var selector = By.XPath($".//div[contains(@class,'mini-map-icon')]");
                return NavigationPanel.FindElement(selector).Displayed();
            }
            catch
            {
                return false;
            }
        }
    }
}
