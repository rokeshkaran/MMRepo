using System.Linq;
using System.Threading;
using SeleniumAutomationUtils.SeleniumExtensions;
using MjAutomationCore.Extensions;
using OpenQA.Selenium.Remote;
using OpenQA.Selenium;

namespace MjAutomationCore.Pages.BaseProject.Mailinator
{
    public class MailinatorMail
    {
        public string From { get; set; }
        public string To { get; set; }
        public string Subject { get; set; }
        public string Body { get; set; }
    }

    class Mailinator
    {
        private string _url = "https://www.mailinator.com/v3/#/#inboxpane";
        private string _userEmail;

        private WebDriver _driver;

        public Mailinator(WebDriver driver, string email)
        {
            _driver = driver;
            _userEmail = email.Contains("@") ? email.Split("@").FirstOrDefault() : email;
        }

        public MailinatorMail GetLastEmail()
        {
            Mutex m = new Mutex();
            m.WaitOne();

            _driver.OpenInNewTab(_url);

            var page = _driver.NowAt<MailinatorPage>();
            Thread.Sleep(900);

            _driver.ClearByJavascript(page.EmailTextbox);
            Thread.Sleep(900);
            _driver.SendKeyByJavascript(page.EmailTextbox, _userEmail);
            Thread.Sleep(900);

            page.GoButton.Click();

            page.WaitForEmails();

            var mail = page.GetLastEmail();

            _driver.Close();
            _driver.SwitchTo().Window(_driver.WindowHandles.First());

            m.ReleaseMutex();

            return mail;
        }
    }
}