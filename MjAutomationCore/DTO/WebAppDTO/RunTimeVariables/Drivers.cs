using System.Collections.Generic;
using OpenQA.Selenium.Remote;

namespace MjAutomationCore.DTO.WebAppDTO.RunTimeVariables
{
    public class Drivers
    {
        public List<RemoteWebDriver> Value { get; set; }

        public Drivers()
        {
            Value = new List<RemoteWebDriver>();
        }
    }
}
