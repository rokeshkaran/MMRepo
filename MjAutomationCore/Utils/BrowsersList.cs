using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
namespace MjAutomationCore.Utils
{
    public class BrowsersList
    {
        private List<WebDriver> _drivers = new List<WebDriver>();

        private Thread _pingDriversThread = null;

        public WebDriver Active { get; private set; }

        public WebDriver GetBrowser()
        {
            return Active;
        }

        internal object Navigate()
        {
            throw new NotImplementedException();
        }

        //id starts from 0 where zero is the main browser
        public WebDriver GetBrowser(int id)
        {
            //Drop current driver
            Active = null;

            if (id > _drivers.Count - 1)
            {
                throw new Exception($"Unable to get driver with {id} id");
            }

            //Set new current driver
            Active = _drivers[id];

            //Start ping thread if not yet started
            if (_pingDriversThread == null)
            {
                _pingDriversThread = new Thread(PingDrivers);
            }

            return Active;
        }

        public void AddDriver(WebDriver driver)
        {
            _drivers.Add(driver);

            Active = driver;
        }

        public List<WebDriver> GetAllBrowsers()
        {
            //Stop ping
            _pingDriversThread?.Interrupt();
            //_pingDriversThread?.Abort();
            return _drivers;
        }

        public void PingDrivers()
        {
            try
            {
                var driversForPing = _drivers.Where(x => !x.Equals(Active));

                foreach (WebDriver driver in driversForPing)
                {
                    try
                    {
                        driver.IsElementExists(By.XPath(".//body"));
                    }
                    catch (Exception e)
                    {
                        Logger.Write(e);
                    }
                }

                Thread.Sleep(5000);
            }
            catch (Exception e)
            {
                Logger.Write(e);
            }
        }
    }
}