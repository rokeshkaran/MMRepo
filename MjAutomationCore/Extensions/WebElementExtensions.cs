using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;

namespace MjAutomationCore.Extensions
{
    public static class WebElementExtensions
    {
        #region Selectbox

        public static void SelectboxSelectByContains(this IWebElement selectbox, string option, bool ignoreCase = false)
        {
            if (string.IsNullOrEmpty(option))
                return;

            var selectElement = new SelectElement(selectbox);
            IList<IWebElement> options = selectElement.Options;
            for (int i = 0; i < options.Count; i++)
            {
                if (ignoreCase)
                {
                    if (options[i].Text.IndexOf(option, StringComparison.OrdinalIgnoreCase) >= 0)
                    {
                        selectElement.SelectByIndex(i);
                        break;
                    }
                }
                else
                {
                    if (options[i].Text.Contains(option))
                    {
                        selectElement.SelectByIndex(i);
                        break;
                    }
                }
            }
        }

        public static string GetSelectedValueFromSelectbox(this IWebElement selectbox)
        {
            var selectElement = new SelectElement(selectbox);
            return selectElement.SelectedOption.Text;
        }

        #endregion

        public static string GetClassName(this IWebElement element)
        {
            return element.GetAttribute("class");
        }
        public static bool IsInvalid(this IWebElement element)
        {
            string className = element.GetClassName();
            return GetClassName(element) != null ? className.Contains("invalid") : false;
        }

        public static bool IsSelected(this IWebElement element)
        {
            string className = element.GetClassName();
            return className != null && (className.Contains("selected") || className.Contains("checked")) ? true : false;
        }

        public static bool IsDisabledState(this IWebElement element)
        {
            string className = element.GetClassName();
            bool hasDisabledClass = className != null && className.Contains("disabled");
            bool hasDisabledAttribute = !string.IsNullOrEmpty(element.GetAttribute("disabled"));

            return hasDisabledClass || hasDisabledAttribute;
        }

        public static bool IsActive(this IWebElement element)
        {
            string className = element.GetClassName();
            return GetClassName(element) != null ? className.Contains("active") : false;
        }
    }
}