using OpenQA.Selenium;
using SeleniumAutomationUtils.Pages;

namespace MjAutomationCore.Pages.WebAppProject.SidePanel
{
    class AddLinkPanelPage : BaseSidePanelPage, IContextContainer
    {
        public new By Context => By.XPath(".//div[@class='inspector-dialog add-link']");
    }
}