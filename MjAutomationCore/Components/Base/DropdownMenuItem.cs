using MjAutomationCore.Components.Slider;
using MjAutomationCore.Extensions;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using System.Collections.Generic;

namespace MjAutomationCore.Components.Base
{
    class DropdownMenuItem : BaseWebComponent, IWebComponent
    {
        public new By Context => By.XPath($".//div[contains(@class,'joint-popup') or contains(@class,'joint-theme')]" +
            $"[contains(@class,'{Identifier}') or contains(@data-type,'{Identifier}')]");

        protected override By Construct()
        {
            return Context;
        }
        
        public void SetSliderValueIndropdown(int value)
        {
            Driver.Component<RangeSlider>(new Properties() { Parent = Instance }).SetSliderValue(value);
        }

        public string GetSliderValueIndropdown()
        {
           return Driver.Component<RangeSlider>(new Properties() { Parent = Instance }).GetSliderValue();
        }

        public IList<IWebElement> GetItems()
        {
            return Driver.Component<ScrollContent>(new Properties() { Parent = Instance }).Items;
        }

        public IWebElement GetItemByName(string itemName)
        {
            return Driver.Component<ScrollContent>(new Properties() { Parent = Instance }).GetItemByName(itemName);
        }

        public bool GetItemState(string itemName)
        {
            return Driver.Component<ScrollContent>(new Properties() { Parent = Instance }).GetItemByName(itemName).IsSelected();
        }

        public IWebElement GetSwitchByLabelName(string lableName)
        {
            return Driver.Component<ScrollContent>(new Properties() { Parent = Instance }).GetSwitchByLabelName(lableName);
        }
    }
}