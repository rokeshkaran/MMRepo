using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MjAutomationCore.Components.Slider
{
    class RangeSlider : BaseWebComponent, IWebComponent
    {
        public By Container => By.XPath($".//input[contains(@class,'input-range-zoom')]");

        protected override By Construct()
        {
            return Container;
        }

        public void SetSliderValue(int val)
        {
            for (int i = 1; i <= val; i++)
            {
                if (val < 0)
                {
                    Instance.SendKeys(Keys.ArrowLeft);
                }
                else
                {
                    Instance.SendKeys(Keys.ArrowRight);
                }
            }
        }

        public string GetSliderValue()
        {
            return Instance.GetAttribute("value");
        }
    }
}
