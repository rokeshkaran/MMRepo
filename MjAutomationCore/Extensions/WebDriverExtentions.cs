using MjAutomationCore.Base;
using MjAutomationCore.Utils;
using OpenQA.Selenium;
using OpenQA.Selenium.Interactions;
using OpenQA.Selenium.Support.UI;
using SeleniumAutomationUtils.SeleniumExtensions;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Reflection;
using System.Threading;

namespace MjAutomationCore.Extensions
{
    static class WebDriverExtentions
    {
        private const int WaitTimeoutSeconds = 15;
        private const int NumberOfTimesToWait = 2;
        private const int waitTimeoutInSeconds = 30;
        private static readonly TimeSpan WaitTimeout = TimeSpan.FromSeconds(WaitTimeoutSeconds);
        private static readonly TimeSpan PollingInterval = TimeSpan.FromSeconds(5);

        //For cases with _driver.FindBy
        public static void ExecuteAction(this WebDriver driver, Action actionToDo)
        {
            for (int i = 0; i < 5; i++)
            {
                try
                {
                    actionToDo.Invoke();
                    return;
                }
                catch (NoSuchElementException)
                {
                    Thread.Sleep(1000);
                }
                catch (StaleElementReferenceException)
                {
                    Thread.Sleep(1000);
                }
                catch (NullReferenceException)
                {
                    Thread.Sleep(1000);
                }
                catch (TargetInvocationException)
                {
                    Thread.Sleep(1000);
                }
                catch (ElementClickInterceptedException)
                {
                    Thread.Sleep(1000);
                }
            }
        }

        public static void SendKeysByActions(this WebDriver driver, string text)
        {
            Actions action = new Actions(driver);
            action.SendKeys(text).Build().Perform();
        }
        public static T NowAt<T>(this WebDriver driver) where T : SeleniumBasePage, new()
        {
            try
            {
                var page = new T { Driver = driver, Actions = new Actions(driver) };
                driver.WaitForLoadingElements(page, null);
                page.InitElements();
                return page;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw new Exception($"Unable to init page: {e}");
            }
        }

        public static string CreateScreenshot(this WebDriver driver, string fileName)
        {
            if (driver == null || ((IHasSessionId)driver).SessionId == null)
            {
                return string.Empty;
            }
            try
            {
                FileSystemHelper.EnsureScreensotsFolderExists();
                var formatedFileName = fileName.Replace("\\", string.Empty).Replace("/", string.Empty).Replace("\"", "'");
                var filePath = FileSystemHelper.GetPathForScreenshot(formatedFileName);
                var screenshot = ((ITakesScreenshot)driver).GetScreenshot();
                screenshot.SaveAsFile(filePath);
                Logger.Write($"Check screenshot by folklowing path: {filePath}");
                return filePath;
            }
            catch (Exception e)
            {
                Logger.Write($"Unable to get screenshot: {e.Message}");
                return string.Empty;
            }
        }

        public static void QuitDriver(this WebDriver driver)
        {
            try
            {
                Logger.Write("Trying to quit Browser...");
                driver.Manage().Cookies.DeleteAllCookies();
                driver.Close();
                driver.Quit();
                Logger.Write("Browser closed successfully.");
            }
            catch (Exception e)
            {
                Logger.Write("Browser was not closed successfully:");
                Logger.Write(e);
            }
        }

        public static void ActionsClickAndHold(this WebDriver driver, IWebElement element)
        {
            Actions action = new Actions(driver);
            action.ClickAndHold(element).Build().Perform();
        }

        public static void ActionsContextClickAndHold(this WebDriver driver, IWebElement element)
        {
            Actions action = new Actions(driver);
            action.MoveToElement(element).Perform();
            ActionBuilder actionBuilder = new ActionBuilder();
            PointerInputDevice mouse = new PointerInputDevice(PointerKind.Mouse, "default mouse");
            actionBuilder.AddAction(mouse.CreatePointerDown(MouseButton.Right));
            ((IActionExecutor)driver).PerformActions(actionBuilder.ToActionSequenceList());
        }

        public static void ActionsReleaseElement(this WebDriver driver, IWebElement element)
        {
            Actions action = new Actions(driver);
            action.Release(element).Build().Perform();
        }

        public static void ActionsRelease(this WebDriver driver)
        {
            Actions action = new Actions(driver);
            action.Release().Build().Perform();
        }

        public static void ActionsPressHoldAndClick(this WebDriver driver, IWebElement element, IWebElement element2)
        {
            Actions actions = new Actions(driver);
            actions.MoveToElement(element).Click(element).KeyDown(Keys.LeftControl).MoveToElement(element2).Click(element2).KeyUp(Keys.LeftControl).Build().Perform();
        }

        public static void ActionsKeyDownLeftControl(this WebDriver driver)
        {
            Actions actions = new Actions(driver);
            actions.KeyDown(Keys.LeftControl).Build().Perform();
        }

        public static void ActionsKeyUpLeftControl(this WebDriver driver)
        {
            Actions actions = new Actions(driver);
            actions.KeyUp(Keys.LeftControl).Build().Perform();
        }

        public static void ActionsKeyUpReleaseKey(this WebDriver driver, string button)
        {
            Actions actions = new Actions(driver);
            actions.KeyUp(PressButtonByName(button)).Build().Perform();
        }

        public static void ActionsPressAndHoldAndThreeClicks(this WebDriver driver, IWebElement element, IWebElement element2, IWebElement element3)
        {
            Actions actions = new Actions(driver);
            actions.MoveToElement(element).Click(element).KeyDown(Keys.LeftControl).MoveToElement(element2).Click(element2).KeyDown(Keys.LeftControl).MoveToElement(element3).Click(element3).KeyUp(Keys.LeftControl).Build().Perform();
        }

        public static void MoveToElementAndMoveByOffsetActionCTRLClick(this WebDriver driver, IWebElement element, int moveCount)
        {
            Actions action = new Actions(driver);
            action.MoveToElement(element).Perform();
            for (int j = 0; j < moveCount; j++)
            {
                action.MoveByOffset(1, 5);
                Thread.Sleep(200);
            }
            action.KeyDown(Keys.LeftControl).Click().KeyUp(Keys.LeftControl).Build().Perform();
        }

        public static void ActionsClickAndHoldMoveByOffsettRelease(this WebDriver driver, IWebElement element, int moveCount)
        {
            Actions action = new Actions(driver);
            action.ClickAndHold(element).Build().Perform();
            for (int j = 0; j < moveCount; j++)
            {
                action.MoveByOffset(10, 10).Build().Perform();
                Thread.Sleep(200);
            }
            action.Release().Build().Perform();
        }

        public static void ActionsClickAndHoldMoveByOffsett(this WebDriver driver, IWebElement element, int moveCount)
        {
            Actions action = new Actions(driver);
            action.ClickAndHold(element).Build().Perform();
            for (int j = 0; j < moveCount; j++)
            {
                action.MoveByOffset(15, 15).Build().Perform();
                Thread.Sleep(200);
            }
            action.Release().Build().Perform();
        }

        #region Combinations Keyboard

        public static void ActionsSendKeys(this WebDriver driver, string button)
        {
            Actions action = new Actions(driver);
            action.SendKeys(PressButtonByName(button)).Build().Perform();
        }

        public static void ActionsClickAndHoldSendKeys(this WebDriver driver, string button)
        {
            Actions action = new Actions(driver);
            action.KeyDown(PressButtonByName(button)).Build().Perform();
        }

        public static string PressButtonByName(string button)
        {
            switch (button)
            {
                case ("Enter"):
                    return Keys.Enter;
                case ("Alt"):
                    return Keys.Alt;
                case ("Shift"):
                    return Keys.LeftShift;
                case ("Esc"):
                    return Keys.Escape;
                case ("Delete"):
                    return Keys.Delete;
                case ("Backspase"):
                    return Keys.Backspace;
                case ("Space"):
                    return Keys.Space;
                case ("Ctrl"):
                    return Keys.Control;
                case ("Command"):
                    return Keys.Command;
                case ("Backspace"):
                    return Keys.Backspace;
                case ("Insert"):
                    return Keys.Insert;
                case ("Home"):
                    return Keys.Home;
                case ("End"):
                    return Keys.End;
                case ("ArrowLeft"):
                    return Keys.ArrowLeft;
                case ("ArrowRight"):
                    return Keys.ArrowRight;
                case ("PageUp"):
                    return Keys.PageUp;
                case ("PageDown"):
                    return Keys.PageDown;
                case ("ArrowDown"):
                    return Keys.ArrowDown;
                case ("ArrowUp"):
                    return Keys.ArrowUp;
                case ("F2"):
                    return Keys.F2;
                case ("F3"):
                    return Keys.F3;
                case ("F4"):
                    return Keys.F4;
                case ("Down"):
                    return Keys.Down;
                case ("Up"):
                    return Keys.Up;
                case ("Left"):
                    return Keys.Left;
                case ("Right"):
                    return Keys.Right;
                case ("A"):
                    return (button);
                case ("u"):
                    return (button);
                case (","):
                    return (button);
                case ("Plus"):
                    return Keys.Add;
                case ("Subtract"):
                    return Keys.Subtract;
                default:
                    return "NOT FOUND";
            }
        }

        public static void ActionKeyCombinationControlShiftEnter(this WebDriver driver)
        {
            Actions keysAction = new Actions(driver);
            keysAction.KeyDown(Keys.LeftControl).KeyDown(Keys.LeftShift).SendKeys(Keys.Enter).KeyUp(Keys.LeftControl).KeyUp(Keys.LeftShift).Build().Perform();
        }

        public static void ActionKeyCombinationControlShiftDelete(this WebDriver driver)
        {
            Actions keysAction = new Actions(driver);
            keysAction.KeyDown(Keys.LeftControl).KeyDown(Keys.LeftShift).KeyDown(Keys.Delete).
                KeyUp(Keys.LeftControl).KeyUp(Keys.LeftShift).KeyUp(Keys.Delete).Build().Perform();
        }

        public static void ActionKeyCombinationShiftEnter(this WebDriver driver)
        {
            Actions keysAction = new Actions(driver);
            keysAction.KeyDown(Keys.LeftShift).SendKeys(Keys.Enter).
                KeyUp(Keys.LeftShift).Build().Perform();
        }
        public static void ActionTripleClick(this WebDriver driver, IWebElement element)
        {
            Actions keysAction = new Actions(driver);
            keysAction.Click(element).DoubleClick().Build().Perform();
        }

        public static void ActionKeyCombinationShiftAndKeyboardButton(this WebDriver driver, string key)
        {
            Actions keysAction = new Actions(driver);
            keysAction.KeyDown(Keys.LeftShift).SendKeys(PressButtonByName(key)).KeyUp(Keys.LeftShift).Build().Perform();
        }

        public static void ActionKeyCombinationCtrlAndKeyboardButton(this WebDriver driver, string key)
        {
            Actions keysAction = new Actions(driver);
            keysAction.KeyDown(Keys.LeftControl).SendKeys(PressButtonByName(key)).KeyUp(Keys.LeftControl).Build().Perform();
        }

        public static void ActionKeysCombinationControlAndKeyboardButton(this WebDriver driver, string key)
        {
            Actions keyAction = new Actions(driver);
            keyAction.KeyDown(Keys.LeftControl).SendKeys(key);
            keyAction.KeyUp(Keys.LeftControl).Perform();
        }

        public static void ActionKeysCombinationControlF3(this WebDriver driver)
        {
            Actions keyAction = new Actions(driver);
            keyAction.KeyDown(Keys.LeftControl).KeyDown(Keys.F3);
            keyAction.KeyUp(Keys.LeftControl).KeyUp(Keys.F3).Perform();
        }

        public static void ActionKeysCombinationControlF5(this WebDriver driver)
        {
            Actions keyAction = new Actions(driver);
            keyAction.KeyDown(Keys.LeftControl).KeyDown(Keys.F5);
            keyAction.KeyUp(Keys.LeftControl).KeyUp(Keys.F5).Perform();
        }

        public static void ActionKeysCombinationAltN(this WebDriver driver)
        {
            Actions keyAction = new Actions(driver);
            keyAction.KeyDown(Keys.Alt).SendKeys("n").Perform();
        }

        public static void ActionKeysCombinationControlA(this WebDriver driver)
        {
            driver.ActionsRelease();
            Actions keyAction = new Actions(driver);
            keyAction.KeyDown(Keys.LeftControl).SendKeys("a");
            keyAction.KeyUp(Keys.LeftControl).Perform();
            driver.ActionsRelease();
        }

        public static void ActionKeysCombinationControlArrowDown(this WebDriver driver)
        {
            Actions action = new Actions(driver);
            action.KeyDown(Keys.LeftControl).KeyDown(Keys.ArrowDown).Perform();
            action.KeyUp(Keys.LeftControl).KeyUp(Keys.ArrowDown).Perform();
        }

        public static void ActionKeysCombinationControlArrowRight(this WebDriver driver)
        {
            Actions action = new Actions(driver);
            action.KeyDown(Keys.LeftControl).KeyDown(Keys.ArrowRight);
            action.KeyUp(Keys.LeftControl).KeyUp(Keys.ArrowRight).Perform();
        }

        public static void ActionKeysCombinationControlPlus(this WebDriver driver)
        {
            Actions keyAction = new Actions(driver);
            keyAction.KeyDown(Keys.LeftControl).SendKeys("+");
            keyAction.KeyUp(Keys.LeftControl).Perform();
        }

        public static void ActionKeysCombinationControlMinus(this WebDriver driver)
        {
            Actions keyAction = new Actions(driver);
            keyAction.KeyDown(Keys.LeftControl).SendKeys("-");
            keyAction.KeyUp(Keys.LeftControl).Perform();
        }

        public static void ActionCtrlKeyAndScrollMouseWheelUp(this WebDriver driver)
        {
            Actions action = new Actions(driver);
            action.KeyDown(Keys.LeftControl).KeyDown(Keys.Add).Perform();
            action.KeyUp(Keys.LeftControl).KeyUp(Keys.Add).Perform();
        }

        public static void ActionCtrlKeyAndScrollMouseWheelDown(this WebDriver driver)
        {
            Actions action = new Actions(driver);
            action.KeyDown(Keys.LeftControl).KeyDown(Keys.Subtract).Perform();
            action.KeyUp(Keys.LeftControl).KeyUp(Keys.Subtract).Perform();
        }

        public static void ActionCmdKeyAndScrollMouseWheelUp(this WebDriver driver)
        {
            Actions action = new Actions(driver);
            action.KeyDown(Keys.Command).KeyDown(Keys.Add).Perform();
            action.KeyUp(Keys.Command).KeyUp(Keys.Add).Perform();
        }
        public static void ActionCmdKeyAndScrollMouseWheelDown(this WebDriver driver)
        {
            Actions action = new Actions(driver);
            action.KeyDown(Keys.Command).KeyDown(Keys.Subtract).Perform();
            action.KeyUp(Keys.Command).KeyUp(Keys.Subtract).Perform();
        }

        public static void ActionKeysCombinationShiftArrowRight(this WebDriver driver, int count)
        {
            for (int j = 0; j < count; j++)
            {
                Actions action = new Actions(driver);
                action.KeyDown(Keys.Shift).SendKeys(PressButtonByName("ArrowRight")).KeyUp(Keys.Shift).Perform();
            }
        }

        public static void ActionKeysCombinationControlShiftR(this WebDriver driver)
        {
            Actions keyAction = new Actions(driver);
            keyAction.KeyDown(Keys.LeftControl).KeyDown(Keys.LeftShift).SendKeys("R").KeyUp(Keys.LeftControl).KeyUp(Keys.LeftShift).Perform();
        }

        public static void ActionKeysCombinationControlShiftB(this WebDriver driver)
        {
            Actions keyAction = new Actions(driver);
            keyAction.KeyDown(Keys.LeftControl).KeyDown(Keys.LeftShift).SendKeys("B").KeyUp(Keys.LeftControl).KeyUp(Keys.LeftShift).Perform();
        }

        public static void ActionKeysCombinationControlShiftS(this WebDriver driver)
        {
            Actions keyAction = new Actions(driver);
            keyAction.KeyDown(Keys.LeftControl).KeyDown(Keys.LeftShift).SendKeys("S").KeyUp(Keys.LeftControl).KeyUp(Keys.LeftShift).Perform();
        }

        public static void ActionKeysCombinationControlShiftI(this WebDriver driver)
        {
            Actions keyAction = new Actions(driver);
            keyAction.KeyDown(Keys.LeftControl).KeyDown(Keys.LeftShift).SendKeys("I").KeyUp(Keys.LeftControl).KeyUp(Keys.LeftShift).Perform();
        }

        public static void ActionsMoveToElementAndClick(this WebDriver driver, IWebElement element, int offSetX, int offSetY)
        {
            Actions actions = new Actions(driver);
            actions.MoveToElement(element, offSetX, offSetY).Perform();
            actions.Click().Perform();
        }

        public static void ActionsClickByOffSet(this WebDriver driver, int offSetX, int offSetY)
        {
            Actions actions = new Actions(driver);
            var body = driver.FindElement(By.XPath(".//body"));
            actions.MoveToElement(body, offSetX, offSetY).Click().Build().Perform();
        }

        public static void ActionsLeftClickElementByOffSet(this WebDriver driver, IWebElement element, int offSetX, int offSetY)
        {
            Actions actions = new Actions(driver);
            actions.MoveToElement(element, offSetX, offSetY).ContextClick().Build().Perform();
        }

        public static void ActionsClickAndHoldByOffset(this WebDriver driver, int offSetX, int offSetY)
        {
            Actions actions = new Actions(driver);
            var body = driver.FindElement(By.XPath(".//body"));
            actions.MoveToElement(body, offSetX, offSetY).ClickAndHold().Build().Perform();
        }

        public static void ActionsSendKeysCombinationsControlEnter(this WebDriver driver)
        {
            Actions action = new Actions(driver);
            action.KeyDown(Keys.LeftControl).SendKeys(Keys.Enter).KeyUp(Keys.LeftControl).Build().Perform();
        }

        public static void SendKeysByCharacter(this IWebElement textbox, string text)
        {
            foreach (char c in text)
            {
                textbox.SendKeys(c.ToString());
                Thread.Sleep(200);
            }
        }

        #endregion

        public static void ActionMoveByOffsetAndDoubleRightClick(this WebDriver driver, int offSetX, int offSetY)
        {
            Actions actions = new Actions(driver);
            actions.MoveByOffset(offSetX, offSetY).Perform();
            actions.ContextClick().Perform();
            driver.ActionsRelease();
        }

        public static void MoveByOffset(this WebDriver driver, int moveCount, int offSetX, int offSetY)
        {
            Actions keyAction = new Actions(driver);
            for (int j = 0; j < moveCount; j++)
            {
                keyAction.MoveByOffset(offSetX, offSetY).Perform();
                Thread.Sleep(500);
            }
        }

        public static void ActionsClickAndHoldAndMoveToOffset(this WebDriver driver, IWebElement element, int offSetX, int offSetY)
        {
            Actions action = new Actions(driver);
            action.ClickAndHold(element).MoveByOffset(offSetX, offSetY).Build().Perform();
        }

        public static void ActionsDragAndDropToOffset(this WebDriver driver, IWebElement element, int offSetX, int offSetY)
        {
            Actions action = new Actions(driver);
            action.DragAndDropToOffset(element, offSetX, offSetY).Build().Perform();
        }

        public static void ActionsClickAndHoldElementToOffset(this WebDriver driver, IWebElement FromElement, int offSetX, int offSetY)
        {
            Actions action = new Actions(driver);
            action.MoveToElement(FromElement).ClickAndHold(FromElement).MoveByOffset(offSetX, offSetY).Build().Perform();
            action.ClickAndHold(FromElement).MoveByOffset(offSetX, offSetY).MoveByOffset(offSetX, offSetY).Perform();
        }

        public static void ActionsDragElementToOffset(this WebDriver driver, IWebElement FromElement, int offSetX, int offSetY)
        {
            Actions action = new Actions(driver);
            action.ClickAndHold(FromElement).MoveByOffset(offSetX, offSetY).Build();
            action.DragAndDropToOffset(FromElement, offSetX, offSetY).Perform();
        }

        public static void ActionsDragElementToElement(this WebDriver driver, IWebElement FromElement, IWebElement ToElement, int X = 10, int Y = 10)
        {
            Actions action = new Actions(driver);
            action.MoveToElement(FromElement).ClickAndHold(FromElement).MoveByOffset(X, Y).MoveToElement(ToElement).Build().Perform();
        }

        public static void ActionsDragElementAroundThenMoveToSecondElement(this WebDriver driver, IWebElement FromElement, IWebElement ToElement)
        {
            Actions action = new Actions(driver);
            action.MoveToElement(FromElement).ClickAndHold(FromElement).Build().Perform();
            Thread.Sleep(200);
            for (int j = 0; j < 5; j++)
            {
                action.MoveByOffset(15, 15).Build().Perform();
                action.MoveToElement(ToElement).Build().Perform();
                Thread.Sleep(200);
            }
            action.MoveToElement(ToElement).Build().Perform();
        }

        public static void ActionsDragElementToOffsetAndDropOntoAnotherElement(this WebDriver driver, IWebElement FromElement, IWebElement ToElement, int X = 5, int Y = 5)
        {
            Actions action = new Actions(driver);
            action.MoveToElement(FromElement).ClickAndHold(FromElement).MoveByOffset(X, Y).MoveToElement(ToElement).DragAndDrop(FromElement, ToElement).Build().Perform();
        }

        public static void ActionsDragElementAndDropOntoElement(this WebDriver driver, IWebElement FromElement, IWebElement ToElement)
        {
            Actions action = new Actions(driver);
            action.ClickAndHold(FromElement).MoveToElement(ToElement).Build();
            action.DragAndDrop(FromElement, ToElement).Perform();
        }

        public static void ActionMoveToElement(this WebDriver driver, IWebElement element)
        {
            Actions action = new Actions(driver);
            action.MoveToElement(element).Build().Perform();
        }

        public static void ActionMoveToElementAndMoveByOffsetClick(this WebDriver driver, IWebElement element, int offSetX, int offSetY)
        {
            Actions action = new Actions(driver);
            action.MoveToElement(element).MoveByOffset(offSetX, offSetY).Click().Build().Perform();
        }

        public static void MoveByOffsetAndClick(this WebDriver driver, int offSetX, int offSetY)
        {
            Actions keyAction = new Actions(driver);
            keyAction.MoveByOffset(offSetX, offSetY).Perform();
            keyAction.Click().Perform();
        }

        public static void MoveByOffsetAndClickAndHold(this WebDriver driver, int offSetX, int offSetY)
        {
            Actions keyAction = new Actions(driver);
            keyAction.MoveByOffset(offSetX, offSetY).Perform();
            keyAction.ClickAndHold().Perform();
        }

        public static void WaitForLoadingElements(this WebDriver driver, SeleniumBasePage page, By bySelector)
        {
            var bys = bySelector != null ? new List<By> { bySelector } : page.GetPageIdentitySelectors();

            foreach (var by in bys)
            {
                driver.WaitForElementsToBeExists(by);
            }

            page.InitElements();
        }

        #region Wait for Data Loading

        public static void WaitForDataLoading(this WebDriver driver)
        {
            Thread.Sleep(400);
            driver.WaitForElementToBeNotDisplayed(By.XPath(".//div[@id='loading'][@style='display: block;'] | .//div[@class='loader'][@style='display: block;']"), WebDriverExtensions.WaitTime.ExtraLong);
        }

        public static void WaitForMultipleDataLoading(this WebDriver driver)
        {
            var selector = By.XPath(".//div[@id='loading'][@style='display: block;'] | .//div[@class='loader'][@style='display: block;']");
            for (var i = 0; i <= 3; i++)
            {
                if (driver.IsElementDisplayed(selector))
                {
                    driver.WaitForElementToBeNotDisplayed(selector, WebDriverExtensions.WaitTime.Medium);
                }
                Thread.Sleep(400);
            }
        }

        #endregion

        #region Actions

        public static void TripleClick(this WebDriver driver, IWebElement element)
        {
            for (int j = 0; j < 3; j++)
            {
                Actions action = new Actions(driver);
                action.Click(element).Perform();
            }
        }

        public static void ConsecutiveTripleClick(this WebDriver driver, IWebElement element)
        {
            Actions action = new Actions(driver);
            action.MoveToElement(element).Click().Click().Click().Build().Perform();
        }

        public static void ActionsMoveToElementByOffset(this WebDriver driver, IWebElement element, int offSetX, int offSetY)
        {
            Actions actions = new Actions(driver);
            actions.MoveToElement(element, offSetX, offSetY).Build().Perform();
        }

        public static void MoveToElementAndMoveByOffsetClick(this WebDriver driver, IWebElement element, int moveCount)
        {
            Actions action = new Actions(driver);
            action.MoveToElement(element).Perform();
            for (int j = 0; j < moveCount; j++)
            {
                action.MoveByOffset(1, 5);
                Thread.Sleep(200);
            }
            action.Click().Build().Perform();
        }
        #endregion

        #region Actions with Javascript

        public static void UpdateCanvasFlags(this WebDriver driver, string status)
        {
            IJavaScriptExecutor js = (IJavaScriptExecutor)driver;
            js.ExecuteScript("mm.user.updateCanvasFlags('cloudTemplatesTakeATour','arguments[0]')", status);
            //wait for update
            Thread.Sleep(1000);
        }

        public static void WaitForDocumentReadyState(this WebDriver driver)
        {
            IJavaScriptExecutor js = (IJavaScriptExecutor)driver;
            for (int i = 0; i < 10; i++)
            {
                if (js.ExecuteScript($"return document.readyState").Equals("complete"))
                {
                    break;
                }
                Thread.Sleep(1000);
            }
        }
        public static void SetTimeForAutoSaveDialogWithJavascript(this WebDriver driver, double time)
        {
            IJavaScriptExecutor ex = (IJavaScriptExecutor)driver;
            double minutes = time / 60;
            ex.ExecuteScript($"gDesigner.setSetting('auto_save_interval', {minutes})");
        }
        public static void MinimizeMaximizeTutorialCard(this WebDriver driver, string status)
        {
            IJavaScriptExecutor ex = (IJavaScriptExecutor)driver;
            ex.ExecuteScript("mm.App.application.dispatchStatePatch({navigationPanel: {tutorialCard: {collapsed: 'arguments[0]'}}})", status);
        }

        public static void ClearSendKeyByJavascript(this WebDriver driver, IWebElement element, string str)
        {
            IJavaScriptExecutor ex = (IJavaScriptExecutor)driver;
            ex.ExecuteScript("arguments[0].value = '';", element);
            ex.ExecuteScript($"arguments[0].value = '{str}';", element);
        }

        public static void SetItemInLocalStorage(this WebDriver driver, string item, string value)
        {
            IJavaScriptExecutor js = (IJavaScriptExecutor)driver;
            js.ExecuteScript($"localStorage.setItem('{item}','{value}');", item, value);
        }

        public static void SetAutosave(this WebDriver driver)
        {
            IJavaScriptExecutor js = (IJavaScriptExecutor)driver;
            js.ExecuteScript($"mm.Coeditor.setAutosave(false)");
        }

        public static void MoveToElementByJavaScript(this WebDriver driver, IWebElement element, int offSetX, int offSetY)
        {
            IJavaScriptExecutor js = (IJavaScriptExecutor)driver;
            js.ExecuteScript("function simulate(f,c,d,e){var b,a=null;for(b in eventMatchers)if(eventMatchers[b].test(c)){a=b;break}if(!a)return!1;document.createEvent?(b=document.createEvent(a),a=='HTMLEvents'?b.initEvent(c,!0,!0):b.initMouseEvent(c,!0,!0,document.defaultView,0,d,e,d,e,!1,!1,!1,!1,0,null),f.dispatchEvent(b)):(a=document.createEventObject(),a.detail=0,a.screenX=d,a.screenY=e,a.clientX=d,a.clientY=e,a.ctrlKey=!1,a.altKey=!1,a.shiftKey=!1,a.metaKey=!1,a.button=1,f.fireEvent('on'+c,a));return!0} var eventMatchers={HTMLEvents:/^(?:load|unload|abort|error|select|change|submit|reset|focus|blur|resize|scroll)$/,MouseEvents:/^(?:click|dblclick|mouse(?:down|up|over|move|out))$/}; " +
            "simulate(arguments[0],'mousedown',0,0); simulate(arguments[0],'mousemove',arguments[1],arguments[2]); simulate(arguments[0],'mouseup',arguments[1],arguments[2]); ",
            element, offSetX, offSetY);
        }

        public static void DragAndDropByJavaScript(this WebDriver driver, IWebElement elementFrom, IWebElement elementTo)
        {
            IJavaScriptExecutor js = (IJavaScriptExecutor)driver;
            js.ExecuteScript("function createEvent(typeOfEvent) {\n" + "var event =document.createEvent(\"CustomEvent\");\n"
                                                                     + "event.initCustomEvent(typeOfEvent,true, true, null);\n" + "event.dataTransfer = {\n" + "data: {},\n"
                                                                     + "setData: function (key, value) {\n" + "this.data[key] = value;\n" + "},\n"
                                                                     + "getData: function (key) {\n" + "return this.data[key];\n" + "}\n" + "};\n" + "return event;\n"
                                                                     + "}\n" + "\n" + "function dispatchEvent(element, event,transferData) {\n"
                                                                     + "if (transferData !== undefined) {\n" + "event.dataTransfer = transferData;\n" + "}\n"
                                                                     + "if (element.dispatchEvent) {\n" + "element.dispatchEvent(event);\n"
                                                                     + "} else if (element.fireEvent) {\n" + "element.fireEvent(\"on\" + event.type, event);\n" + "}\n"
                                                                     + "}\n" + "\n" + "function simulateHTML5DragAndDrop(element, destination) {\n"
                                                                     + "var dragStartEvent =createEvent('dragstart');\n" + "dispatchEvent(element, dragStartEvent);\n"
                                                                     + "var dropEvent = createEvent('drop');\n"
                                                                     + "dispatchEvent(destination, dropEvent,dragStartEvent.dataTransfer);\n"
                                                                     + "var dragEndEvent = createEvent('dragend');\n"
                                                                     + "dispatchEvent(element, dragEndEvent,dropEvent.dataTransfer);\n" + "}\n" + "\n"
                                                                     + "var source = arguments[0];\n" + "var destination = arguments[1];\n"
                                                                     + "simulateHTML5DragAndDrop(source,destination);", elementFrom, elementTo);
        }

        public static void DragAndDropByJavaScript2(this WebDriver driver, IWebElement source, IWebElement target)
        {
            IJavaScriptExecutor js = (IJavaScriptExecutor)driver;
            js.ExecuteScript("function createEvent(typeOfEvent) {\n" +
"var event = document.createEvent(CustomEvent);\n" + "event.initCustomEvent(typeOfEvent, true, true, null);\n" +
" event.dataTransfer = {\n" +
" data: {},\n" +
" setData: function (key, value) {\n" +
" this.data[key] = value;\n" +
" },\n" +
" getData: function (key) {\n" +
" return this.data[key];\n" +
" }\n" +
" };\n" +
" return event;\n" +
"}\n" +
"\n" +
"function dispatchEvent(element, event, transferData) {\n" +
" if (transferData !== undefined) {\n" +
" event.dataTransfer = transferData;\n" +
" }\n" +
" if (element.dispatchEvent) {\n" +
" element.dispatchEvent(event);\n" +
" } else if (element.fireEvent) {\n" +
" element.fireEvent(on + event.type,event);\n" +
" }\n" +
"}\n" +
"\n" +
"function simulateHTML5DragAndDrop(element, target) {\n" +
" var dragStartEvent =createEvent('dragstart');\n" +
" dispatchEvent(element, dragStartEvent);\n" +
" var dropEvent = createEvent('drop');\n" +
" dispatchEvent(target, dropEvent,dragStartEvent.dataTransfer);\n" +
" var dragEndEvent = createEvent('dragend'); \n" +
" dispatchEvent(element, dragEndEvent,dropEvent.dataTransfer);\n" +
"}\n" +
"\n" +
"var source = arguments[0];\n" +
"var target = arguments[1];\n" +
"simulateHTML5DragAndDrop(source,target);", source, target);
        }

        public static void AddedFieldByJavascript(this WebDriver driver)
        {
            IJavaScriptExecutor js = (IJavaScriptExecutor)driver;
            js.ExecuteScript("var elemDiv = document.createElement('input'); elemDiv.type ='text'; elemDiv.setAttribute('clipboard','cb_text'); window.document.body.insertBefore(elemDiv, window.document.body.firstChild);");
        }

        public static void AddFileUploadFieldByJavascript(this WebDriver driver)
        {
            IJavaScriptExecutor js = (IJavaScriptExecutor)driver;
            js.ExecuteScript("var elemDiv = document.createElement('input'); elemDiv.type ='file'; window.document.body.insertBefore(elemDiv, window.document.body.lastChild);");
        }

        public static void ClearSessionStorageByJavascript(this WebDriver driver)
        {
            IJavaScriptExecutor js = (IJavaScriptExecutor)driver;
            js.ExecuteScript("sessionStorage.clear();");
        }

        public static void OpenNewBrowserByJavascript(this WebDriver driver, string url)
        {
            IJavaScriptExecutor js = (IJavaScriptExecutor)driver;
            js.ExecuteScript("window.open();", url);
        }

        public static void ScrollGridToTheRight(this WebDriver driver, IWebElement gridElement)
        {
            IJavaScriptExecutor js = (IJavaScriptExecutor)driver;
            ((IJavaScriptExecutor)driver).ExecuteScript("arguments[0].scrollLeft = 500;", new object[1] { gridElement });
        }

        public static void ScrollUp(this WebDriver driver)
        {
            IJavaScriptExecutor js = (IJavaScriptExecutor)driver;
            js.ExecuteScript("window.scrollTo(1000, 1000);");
        }

        public static void CloseDialogByJavascript(this WebDriver driver)
        {
            IJavaScriptExecutor js = (IJavaScriptExecutor)driver;
            js.ExecuteScript("app.util.closeDialog();");
        }

        #endregion

        #region Frames

        public static void SwitchToFrame(this WebDriver driver, int frameNumber)
        {
            WebDriverWait wait = new WebDriverWait(driver, WaitTimeout);
            driver.SwitchTo().DefaultContent();
            wait.Until(x => x.FindElements(By.TagName("iframe")).Count > frameNumber);
            var frames = driver.FindElements(By.TagName("iframe")).Where(frame => frame.GetAttribute("aria-hidden") != "true").ToList();
            driver.SwitchTo().Frame(frames[frameNumber]);
        }

        public static void SwitchToSpecificFrame(this WebDriver driver, IWebElement frameElement)
        {
            WebDriverWait wait = new WebDriverWait(driver, WaitTimeout);
            driver.SwitchTo().DefaultContent();
            wait.Until(x => x.FindElements(By.TagName("iframe")).Count > 0);
            driver.SwitchTo().Frame(frameElement);
        }

        public static void SwitchToFrame(this WebDriver driver, string frameIdName)
        {
            WebDriverWait wait = new WebDriverWait(driver, WaitTimeout);
            driver.SwitchTo().DefaultContent();
            wait.Until(x => x.FindElements(By.Id(frameIdName)));
            driver.SwitchTo().Frame(frameIdName);
        }

        #endregion

        public static List<string> GetAllRequests(this WebDriver driver)
        {
            var allRequests = new List<string>();
            var scriptToExecute =
                "var performance = window.performance || window.mozPerformance || window.msPerformance || window.webkitPerformance || {}; var network = performance.getEntries() || {}; return network;";
            var netData = driver.ExecuteScript(scriptToExecute);
            var collection = (IList)netData;
            foreach (object o in collection)
            {
                var innerCollection = (Dictionary<string, object>)o;
                foreach (KeyValuePair<string, object> keyValuePair in innerCollection)
                    if (keyValuePair.Key.Equals("name") && !string.IsNullOrEmpty(keyValuePair.Value.ToString()) &&
                        keyValuePair.Value.ToString().Contains("http"))
                        allRequests.Add(keyValuePair.Value.ToString());
            }

            return allRequests;
        }
    }
}