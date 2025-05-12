using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;

namespace MjAutomationCore.Components.Snap
{
    class CaptureQueueContent : BaseWebComponent, IWebComponent
    {
        public new By Context => By.XPath($".//div[contains(@class,'capture-queue-content')][contains(@class,'{Identifier}')]");

        protected override By Construct()
        {
            return Context;
        }
    }
}