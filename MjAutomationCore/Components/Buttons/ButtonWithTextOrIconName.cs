using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;

namespace MjAutomationCore.Components.Buttons
{
    class ButtonWithTextOrIconName : BaseWebComponent, IWebComponent
    {
        protected override By Construct()
        {
            var selector = By.XPath($".//div[contains(@class,'select-button-group-button')]/*[contains(@src,'{Identifier}') or text()='{Identifier}' or contains(@style,'{Identifier}')]/parent::div");
            return selector;
        }
    }
}