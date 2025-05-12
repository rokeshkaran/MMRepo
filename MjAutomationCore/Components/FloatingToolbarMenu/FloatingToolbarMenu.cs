using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MjAutomationCore.Components.FloatingToolbarMenu
{
    class FloatingToolbarMenu : BaseWebComponent, IWebComponent
    {
        public string Container => ".//div[@class='joint-popup joint-floating-toolbar joint-theme-default']";

        protected override By Construct()
        {
            var selector = By.XPath(Container);
            return selector;
        }

        //Changes needs to be done for buttons of the floating toolbar
        //as soon as the button class name are changed to reflect side panel button class name
        public IWebElement GetButtonByName(string button)
        {
            var selector = By.XPath($".//div[@data-tooltip='{button}']");
            return Instance.FindElement(selector);
        }
    }
}
