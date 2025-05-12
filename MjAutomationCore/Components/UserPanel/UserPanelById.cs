using OpenQA.Selenium;
using SeleniumAutomationUtils.Components;
using SeleniumExtras.PageObjects;

namespace MjAutomationCore.Components.UserPanel
{
    class UserPanelById : BaseWebComponent
    {
        public new By Context => By.XPath($".//div[@id='{Identifier}']//div[@class='user-panel']");

        [FindsBy(How = How.XPath, Using = ".//img[@class='user-avatar']")]
        public IWebElement UserAvatar { get; set; }

        [FindsBy(How = How.XPath, Using = ".//span[@class='user-name']")]
        public IWebElement UserName { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='arrow-down']")]
        public IWebElement ArrowDown { get; set; }

        protected override By Construct()
        {
            return Context;
        }
    }
}