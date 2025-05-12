using MjAutomationCore.Helpers;
using MjAutomationCore.Providers;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Edge;
using OpenQA.Selenium.Firefox;
using OpenQA.Selenium.Remote;
using OpenQA.Selenium.Safari;
using SeleniumAutomationUtils.SeleniumExtensions;
using System;
using System.IO;
using System.Reflection;

namespace MjAutomationCore.Utils
{
    public static class BrowserFactory
    {
        public static WebDriver CreateDriver(string targetBrowser = "")
        {
            targetBrowser = string.IsNullOrEmpty(targetBrowser) ? Browser.TargetBrowser : targetBrowser;

            switch (Browser.BrowserType)
            {
                case "local":
                    return CreateLocalDriver(targetBrowser);
                case "remote":
                    return CreateRemoteDriver(targetBrowser);

                default:
                    throw new Exception($"Browser type '{Browser.BrowserType}' was not identified");
            }
        }

        private static WebDriver CreateLocalDriver(string targetBrowser)
        {
            string selectedLocale = LocalBrowserLanguage.Lang ?? "en-US";// Default to "en-US"

            switch (targetBrowser)
            {
                case "chrome":
                    var chromeOptions = new ChromeOptions();

                    chromeOptions.AddUserProfilePreference("download.default_directory", "/home/selenium/Downloads");
                    chromeOptions.AddArgument("--safebrowsing-disable-download-protection");
                    //options.AddArguments("--incognito");
                    //options.AddExtension(@"D:\UIAutomationTesting\MjAutomationCore\Tests\TestData\MindManager-Snap.crx");
                    chromeOptions.AddUserProfilePreference("download.prompt_for_download", false);
                    chromeOptions.AddUserProfilePreference("download.directory_upgrade", true);
                    chromeOptions.AddUserProfilePreference("safebrowsing.enabled", true);
                    chromeOptions.AddArgument("no-sandbox");
                    if (!string.IsNullOrEmpty(selectedLocale))
                    {
                        chromeOptions.AddArgument($"--lang={selectedLocale}");
                    }
                    var driver = new ChromeDriver(Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location), chromeOptions);
                    return driver;

                case "firefox":
                    var firefoxOptions = new FirefoxOptions();
                    if (!string.IsNullOrEmpty(selectedLocale))
                    {
                        firefoxOptions.SetPreference("intl.accept_languages", $"{selectedLocale}");
                    }
                    return new FirefoxDriver(firefoxOptions);

                case "edge":
                    var edgeOptions = new EdgeOptions();
                    if (!string.IsNullOrEmpty(selectedLocale))
                    {
                        edgeOptions.AddArgument($"--lang={selectedLocale}");
                    }
                    return new EdgeDriver(edgeOptions);
                case "safari":
                    var safariOptions = new SafariOptions();
                    var safariDriver = new RemoteWebDriver(new Uri("http://44444/wd/hub/"), safariOptions);
                    return safariDriver;
                default:
                    throw new Exception($"Browser type '{Browser.TargetBrowser}' was not identified");
            }
        }

        private static RemoteWebDriver CreateRemoteDriver(string targetBrowser)
        {
            string selectedLocale = LocaleSetupHelper.SelectedLocale ?? "en-US";// Default to "en-US"
            // Get browser version with locale from configuration
            string browserVersionWithLocale = Browser.BrowserVersionWithLocale;
            // Get platform-browser version from configuration
            string browserVersionWithPlatform = Browser.BrowserVersionWithPlatform;
            switch (targetBrowser)
            {
                case "chrome":
                    var chromeOptions = new ChromeOptions();
                    chromeOptions.AddUserProfilePreference("download.default_directory", PathProvider.RemoteDownloadsFolder);
                    chromeOptions.AddUserProfilePreference("download.prompt_for_download", false);
                    chromeOptions.AddUserProfilePreference("download.directory_upgrade", true);
                    chromeOptions.AddUserProfilePreference("safebrowsing.enabled", false);
                    chromeOptions.AddArgument("--no-sandbox");
                    chromeOptions.AddArgument("--log-path=path/to/log.txt");
                    // Set language only if the browser version does not end with _de or _fr
                    if (!browserVersionWithLocale.Contains("_"))
                    {
                        chromeOptions.AddArgument($"--lang={selectedLocale}");
                    }
                    if (browserVersionWithPlatform.Equals("Windows"))
                    {
                        chromeOptions.AddArgument("--user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/0.0");
                    }
                    if (browserVersionWithPlatform.Equals("Mac"))
                    {
                        chromeOptions.AddArgument("--user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/0.0");
                    }
                    chromeOptions.BrowserVersion = browserVersionWithLocale;
                    chromeOptions.SetLoggingPreference(LogType.Browser, LogLevel.All);
                    var chromeDriver = new RemoteWebDriver(new Uri(Browser.HubUri), chromeOptions);
                    chromeDriver.AllowFileDetection();

                    return chromeDriver;

                case "firefox":
                    var firefoxOptions = new FirefoxOptions();
                    firefoxOptions.BrowserVersion = browserVersionWithLocale; // Set browser version with locale
                    return new RemoteWebDriver(new Uri(Browser.HubUri), firefoxOptions);

                case "edge":
                    var edgeOptions = new EdgeOptions();
                    edgeOptions.BrowserVersion = browserVersionWithLocale; // Set browser version with locale
                    if (browserVersionWithPlatform.Equals("Windows"))
                    {
                        edgeOptions.AddArgument("--user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Edg/0.0");
                    }
                    if (browserVersionWithPlatform.Equals("Mac"))
                    {
                        edgeOptions.AddArgument("--user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Edg/0.0");
                    }
                    return new RemoteWebDriver(new Uri(Browser.HubUri), edgeOptions);

                case "safari":
                    var safariOptions = new SafariOptions();
                    safariOptions.BrowserVersion = browserVersionWithLocale; // Set browser version with locale
                    var safariDriver = new RemoteWebDriver(new Uri(Browser.HubUri), safariOptions);
                    return safariDriver;

                default:
                    throw new Exception($"Browser type '{Browser.TargetBrowser}' was not identified");
            }
        }
    }
}