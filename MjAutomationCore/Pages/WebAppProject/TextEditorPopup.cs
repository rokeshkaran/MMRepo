using OpenQA.Selenium;
using SeleniumAutomationUtils.Pages;

namespace MjAutomationCore.Pages.WebAppProject
{
    class TextEditorPopup : SeleniumBasePage, IContextContainer
    {
        public new By Context => By.XPath(".//div[@class='joint-popup joint-text-style-popup joint-theme-default']");
    }
}
