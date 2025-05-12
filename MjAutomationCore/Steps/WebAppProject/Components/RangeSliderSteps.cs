using MjAutomationCore.Components.Base;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.SidePanel;
using MjAutomationCore.Utils;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.Components
{
    [Binding]
    class RangeSliderSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly BrowsersList _browsers;

        public RangeSliderSteps(WebDriver driver, BrowsersList browsersList)
        {
            _driver = browsersList.GetBrowser();
            _browsers = browsersList;
        }

        [When(@"User enters '([^']*)' value to '([^']*)' field in '([^']*)' section of '([^']*)' side panel with '([^']*)' header via slider")]
        public void WhenUserEntersValueToFieldInSectionOfSidePanelWithHeaderViaSlider(int value, string field, string section, string panelName, string header)
        {
            var panel = _browsers.Active.NowAt<SidePanel>();
            _browsers.Active.MoveToElement(panel.GetFieldNameInSection(field, panelName, header, section));
            panel.GetFieldNameInSectionToggle(field, panelName, header, section).Click();
            _browsers.Active.Component<DropdownMenuItem>(field.ToLower()).SetSliderValueIndropdown(value);            
            _driver.ActionsSendKeys("Enter");
        }
    }
}
