using MjAutomationCore.Utils;
using OpenQA.Selenium;
using OpenQA.Selenium.Remote;
using System.Text;

namespace MjAutomationCore.Base
{
    class BaseTest : IBaseTest
    {
        public WebDriver Driver { get; set; }

        public WebDriver CreateBrowserDriver()
        {
            var driver = BrowserFactory.CreateDriver();
            CodePagesEncodingProvider.Instance.GetEncoding(437);
            Encoding.RegisterProvider(CodePagesEncodingProvider.Instance);
            IAllowsFileDetection allowsDetection = driver;
            allowsDetection.FileDetector = new LocalFileDetector();
            return driver;
        }
    }
}