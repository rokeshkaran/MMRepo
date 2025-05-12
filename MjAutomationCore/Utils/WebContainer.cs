using MjAutomationCore.Base;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Pages;
using System;
using System.Linq;
using System.Reflection;

namespace MjAutomationCore.Utils
{
    public static class WebContainer
    {
        public static string GetSelector(string className)
        {
            var assembly = Assembly.GetExecutingAssembly();
            var type = assembly.GetTypes().FirstOrDefault(x => x.Name == className);
            var container = Activator.CreateInstance(type) as IWebContainer;
            return container.ContainerSelector;
        }

        public static By GetContainerSelector(string className)
        {
            return GetComponent(className).Context;
        }

        //TODO needs updating
        //public static By GetFrameSelector(string className)
        //{
        //    return GetComponent(className).Frame;
        //}

        private static IContextContainer GetComponent(string className)
        {
            var assembly = Assembly.GetExecutingAssembly();
            var type = assembly.GetTypes().FirstOrDefault(x => x.Name == className);
            var container = Activator.CreateInstance(type) as IContextContainer;
            return container;
        }
    }
}