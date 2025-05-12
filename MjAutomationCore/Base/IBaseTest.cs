using OpenQA.Selenium;
using Reqnroll;

namespace MjAutomationCore.Base
{
    public interface IBaseTest
    {
        WebDriver Driver { get; set; }

        WebDriver CreateBrowserDriver();
    }
}
