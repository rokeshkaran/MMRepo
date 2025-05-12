using MjAutomationCore.Components.Base;
using MjAutomationCore.Components.Snap;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using Reqnroll;

namespace MjAutomationCore.Steps.SnapProject.Components
{
    [Binding]
    class CaptureQueueContentSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        public CaptureQueueContentSteps(WebDriver driver)
        {
            _driver = driver;
        }

        [When(@"User enter '(.*)' value in '(.*)' field of '(.*)' content")]
        public void WhenUserEnterValueInFieldOfContent(string value, string field, string content)
        {
            var parent = _driver.Component<CaptureQueueContent>(content).Context;
            _driver.GetComponent<InputByAttribute>(field, new Properties() { ParentSelector = parent }).ClearSendKeys(value);
        }
    }
}