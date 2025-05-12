using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;

namespace MjAutomationCore.Components.Base
{
    class CheckBoxByLabelName : BaseWebComponent, IWebComponent
    {
        protected override By Construct()
        {
            var selector = $".//label[contains(.,\"{Identifier}\")]//preceding-sibling::input[contains(@type, 'checkbox')]";
            return By.XPath(selector);
        }

        public void SetCheckboxState(bool desiredState)
        {
            bool currentState = Instance.Selected;

            if (desiredState != currentState)
            {
                Driver.ClickByJavascript(Instance);
            }
        }
    }
}