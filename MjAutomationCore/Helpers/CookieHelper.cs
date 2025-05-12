using AutomationUtils.Utils;
using OpenQA.Selenium;
using System;

namespace MjAutomationCore.Helpers
{
    public class CookieHelper
    {

        private const string OptanonConsentCookieName = "OptanonConsent";
        private const string OptanonAlertBoxClosedCookieName = "OptanonAlertBoxClosed";

        // Method to set cookies to prevent OneTrust banner
        public static void SetOptanonCookies(WebDriver driver)
        {
            DeleteExistingCookie(driver, OptanonConsentCookieName);

            string optanonConsentValue = GenerateOptanonConsentValue();
            SetCookie(driver, OptanonConsentCookieName, optanonConsentValue);

            // Set OptanonAlertBoxClosed cookie with expiry date
            DateTime expiryDate = DateTime.UtcNow.AddDays(30);
            SetCookieWithExpiry(driver, OptanonAlertBoxClosedCookieName, expiryDate);
        }

        private static void DeleteExistingCookie(WebDriver driver, string cookieName)
        {
            try
            {
                driver.Manage().Cookies.DeleteCookieNamed(cookieName);
            }
            catch (Exception ex)
            {
                Logger.Write($"Failed to delete cookie {cookieName}: {ex.Message}");
            }
        }

        private static void SetCookie(WebDriver driver, string name, string value)
        {
            try
            {
                driver.Manage().Cookies.AddCookie(new Cookie(name, value));
            }
            catch (Exception ex)
            {
                Logger.Write($"Failed to set cookie {name}: {ex.Message}");
            }
        }

        private static void SetCookieWithExpiry(WebDriver driver, string name, DateTime expiryDate)
        {
            try
            {
                driver.Manage().Cookies.AddCookie(new Cookie(name, expiryDate.ToString("R"), ".mindmanager.com", "/", expiryDate));
            }
            catch (Exception ex)
            {
                Logger.Write($"Failed to set cookie {name}: {ex.Message}");
            }
        }

        private static string GenerateOptanonConsentValue()
        {
            DateTime currentTime = DateTime.UtcNow;
            // Convert the current time to a string representation in the RFC1123 format
            string datestamp = currentTime.ToString("R");
            return $"isGpcEnabled=0&datestamp={datestamp}&groups=C0002%3A1%2CC0003%3A1%2CC0001%3A1%2CC0004%3A1&hosts=H66%3A1%2CH177%3A1%2CH157%3A1%2CH160%3A1%2CH16%3A1%2CH79%3A1%2CH104%3A1%2CH184%3A1%2CH29%3A1%2CH68%3A1%2CH45%3A1%2CH63%3A1%2CH91%3A1%2CH48%3A1%2CH108%3A1%2CH89%3A1%2CH2%3A1%2CH90%3A1%2CH176%3A1%2CH124%3A1%2CH149%3A1%2CH191%3A1%2CH92%3A1%2CH93%3A1%2CH95%3A1%2CH151%3A1%2CH152%3A1%2CH7%3A1%2CH263%3A1%2CH8%3A1%2CH67%3A1%2CH155%3A1%2CH156%3A1%2CH96%3A1%2CH97%3A1%2CH98%3A1%2CH268%3A1%2CH161%3A1%2CH162%3A1%2CH132%3A1%2CH99%3A1%2CH13%3A1%2CH100%3A1%2CH14%3A1%2CH163%3A1%2CH137%3A1%2CH101%3A1%2CH72%3A1%2CH140%3A1%2CH102%3A1%2CH19%3A1%2CH166%3A1%2CH21%3A1%2CH51%3A1%2CH22%3A1%2CH168%3A1%2CH169%3A1";
        }
    }
}