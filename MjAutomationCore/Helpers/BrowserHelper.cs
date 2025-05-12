using MjAutomationCore.Providers;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MjAutomationCore.Helpers
{
    public static class BrowserHelper
    {
        public static void SetBrowserWindowSize(IWebDriver driver, string resolution)
        {
            if (resolution.Equals("maximized", StringComparison.OrdinalIgnoreCase))
            {
                driver.Manage().Window.Maximize();
            }
            else
            {
                var dimensions = resolution.Split('x');
                if (dimensions.Length == 2 && int.TryParse(dimensions[0], out int width) && int.TryParse(dimensions[1], out int height))
                {
                    driver.Manage().Window.Size = new System.Drawing.Size(width, height);
                }
                else
                {
                    throw new Exception($"Invalid browser resolution format. Expected format: 'WidthxHeight', got: '{resolution}'");
                }
            }
        }

        public static string GetLocaleFromTags(IEnumerable<string> tags)
        {
            if (tags.Any(tag => tag.Equals("Locale_French", StringComparison.OrdinalIgnoreCase)))
            {
                return "123.0_fr";
            }
            else if (tags.Any(tag => tag.Equals("Locale_German", StringComparison.OrdinalIgnoreCase)))
            {
                return "123.0_de";
            }
            else
            {
                throw new InvalidOperationException("No valid Locale tag found in the test tags");
            }
        }

        public static void SetBrowserVersionWithLocaleFromTags(IEnumerable<string> tags)
        {
            string locale = GetLocaleFromTags(tags);

            if (!string.IsNullOrEmpty(locale))
            {
                Browser.SetBrowserVersionWithLocale(locale);
            }
            else
            {
                throw new ArgumentException("Unable to determine locale from the provided tags");
            }
        }

        public static string GetPlatformFromTags(IEnumerable<string> tags)
        {
            if (tags.Any(tag => tag.Equals("Windows_browser", StringComparison.OrdinalIgnoreCase)))
            {
                return "Windows";
            }
            else if (tags.Any(tag => tag.Equals("Mac_browser", StringComparison.OrdinalIgnoreCase)))
            {
                return "Mac";
            }
            else
            {
                throw new InvalidOperationException("No valid platform tag found in the test tags");
            }
        }

        public static void SetPlatformBrowserVersionFromTags(IEnumerable<string> tags)
        {
            string platform = GetPlatformFromTags(tags);

            if (!string.IsNullOrEmpty(platform))
            {
                Browser.SetBrowserVersionWithPlatform(platform);
            }
            else
            {
                throw new ArgumentException("Unable to determine platform from the provided tags");
            }
        }
    }
}