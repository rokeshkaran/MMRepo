using AutomationUtils.Utils;
using MjAutomationCore.Components.Base;
using MjAutomationCore.DTO.WebAppDTO.Publish;
using MjAutomationCore.Extensions;
using MjAutomationCore.Utils;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using Reqnroll;

namespace MjAutomationCore.Components.TextAccelerator
{
    class TextAcceleratorPopup : BaseWebComponent, IWebComponent
    {
        public new By Context => By.XPath($".//div[contains(@class,'text-accelerator')][contains(@class,'{Identifier}')]");

        [FindsBy(How = How.XPath, Using = ".//input[@type='select-multiple']")]
        public IWebElement InputField { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='selectize-dropdown multi']")]
        public IWebElement TextAcceleratorDropdownMenu { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='selectize-dropdown multi']//div[contains(@class,'option') or contains(@class,'active')]")]
        public IList<IWebElement> TextAcceleratorDropdownMenuItemOptions { get; set; }

        protected override By Construct()
        {
            return Context;
        }

        public IWebElement GetTextAcceleratorOptionByArrowKey(string option)
        {
            for (int i = 0; i < TextAcceleratorDropdownMenuItemOptions.Count; i++)
            {
                Driver.ActionsSendKeys("Down");
                if (TextAcceleratorDropdownMenuItemOptions.ElementAt(i).Text.Equals(option))
                {
                    if (TextAcceleratorDropdownMenuItemOptions.ElementAt(i).IsActive())
                    {
                        return TextAcceleratorDropdownMenuItemOptions.ElementAt<IWebElement>(i);
                    }
                }
            }
            throw new Exception($"Option '{option}' is not displayed in Text Accelerator");
        }

        public bool TextAcceleratorOptionSelected(string option)
        {
            return GetTextAcceleratorOptionByArrowKey(option).IsSelected();
        }

        public IWebElement GetTextAcceleratorOption(string option)
        {
            if (TextAcceleratorDropdownMenuItemOptions.Any(x => x.Text.Equals(option)))
            {
                return TextAcceleratorDropdownMenuItemOptions.First(x => x.Text.Equals(option));
            }
            throw new Exception($"Option '{option}' is not displayed in Text Accelerator");
        }

        public IList<IWebElement> GetTextAcceleratorOptions()
        {
            return TextAcceleratorDropdownMenuItemOptions.ToList();
        }
    }
}