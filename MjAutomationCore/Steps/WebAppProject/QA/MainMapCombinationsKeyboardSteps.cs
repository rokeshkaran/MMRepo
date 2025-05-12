using MjAutomationCore.Extensions;
using MjAutomationCore.Utils;
using OpenQA.Selenium;
using System.Threading;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.QA
{
    [Binding]
    class MainMapCombinationsKeyboardSteps : ReqnrollContext
    {
        private readonly WebDriver _driver;
        private readonly BrowsersList _browsers;

        public MainMapCombinationsKeyboardSteps(WebDriver driver, BrowsersList browsersList)
        {
            _driver = browsersList.GetBrowser();
            _browsers = browsersList;
        }

        [When(@"User presses the '(.*)' key on the keyboard")]
        public void WhenUserPressesTheKeyOnTheKeyboard(string button)
        {
            _browsers.Active.ActionsSendKeys(button);
        }

        [When(@"User enters text '(.*)' using keyboard")]
        public void WhenUserEntersTextUsingKeyboard(string value)
        {
            _browsers.Active.SendKeysByActions(value);
        }

        [When(@"User presses and hold the '(.*)' key on the keyboard")]
        public void WhenUserPressesAndHoldTheKeyOnTheKeyboard(string button)
        {
            _browsers.Active.ActionsClickAndHoldSendKeys(button);
        }

        [When(@"User presses the Shift and '([^']*)' key combination on the keyboard")]
        public void WhenUserPressesTheShiftAndKeyCombinationOnTheKeyboard(string key)
        {
            _browsers.Active.ActionKeyCombinationShiftAndKeyboardButton(key);
        }

        [When(@"User presses the Ctrl and '([^']*)' key combination on the keyboard")]
        public void WhenUserPressesTheCtrlAndKeyCombinationOnTheKeyboard(string key)
        {
            _browsers.Active.ActionKeyCombinationCtrlAndKeyboardButton(key);
        }

        [When(@"User presses the Ctrl_Enter combination key on the keyboard")]
        public void WhenUserPressesTheCtrl_EnterCombinationKeyOnTheKeyboard()
        {
            _browsers.Active.ActionsSendKeysCombinationsControlEnter();
        }

        [When(@"User presses the Ctrl_Shift_Delete combination key on the keyboard")]
        public void WhenUserPressesTheCtrl_Shift_DeleteCombinationKeyOnTheKeyboard()
        {
            _browsers.Active.ActionKeyCombinationControlShiftDelete();
        }

        [When(@"User presses the Shift_Enter combination key on the keyboard")]
        public void WhenUserPressesTheShift_EnterCombinationKeyOnTheKeyboard()
        {
            _browsers.Active.ActionKeyCombinationShiftEnter();
        }

        [When(@"User presses the Ctrl_Shift_Enter combination key on the keyboard")]
        public void WhenUserPressesTheCtrl_Shift_EnterCombinationKeyOnTheKeyboard()
        {
            _browsers.Active.ActionKeyCombinationControlShiftEnter();
        }

        #region CtrlAndKeyboardButton

        [When(@"User presses the Ctrl_B combination key on the keyboard")]
        public void WhenUserPressesTheCtrl_BCombinationKeyOnTheKeyboard()
        {
            _browsers.Active.ActionKeysCombinationControlAndKeyboardButton("b");
        }

        [When(@"User presses the Ctrl_I combination key on the keyboard")]
        public void WhenUserPressesTheCtrl_ICombinationKeyOnTheKeyboard()
        {
            _browsers.Active.ActionKeysCombinationControlAndKeyboardButton("i");
        }

        [When(@"User presses the CTRL_SHIFT_GreaterThan combination key on the keyboard")]
        public void WhenUserPressesTheCTRL_SHIFT_GreaterThanCombinationKeyOnTheKeyboard()
        {
            _browsers.Active.ActionKeysCombinationControlAndKeyboardButton(">");
        }

        [When(@"User presses the CTRL_SHIFT_LessThan combination key on the keyboard")]
        public void WhenUserPressesTheCTRL_SHIFT_LessThanCombinationKeyOnTheKeyboard()
        {
            _browsers.Active.ActionKeysCombinationControlAndKeyboardButton("<");
        }


        [When(@"User presses the Ctrl_U combination key on the keyboard")]
        public void WhenUserPressesTheCtrl_UCombinationKeyOnTheKeyboard()
        {
            _browsers.Active.ActionKeysCombinationControlAndKeyboardButton("u");
        }

        [When(@"User presses the Ctrl_C combination key on the keyboard")]
        public void WhenUserPressesTheCtrl_CCombinationKeyOnTheKeyboard()
        {
            _browsers.Active.ActionKeysCombinationControlAndKeyboardButton("c");
        }

        [When(@"User presses the Ctrl_V combination key on the keyboard")]
        public void WhenUserPressesTheCtrl_VCombinationKeyOnTheKeyboard()
        {
            _browsers.Active.ActionKeysCombinationControlAndKeyboardButton("v");
        }

        [When(@"User presses the Ctrl_X combination key on the keyboard")]
        public void WhenUserPressesTheCtrl_XCombinationKeyOnTheKeyboard()
        {
            _browsers.Active.ActionKeysCombinationControlAndKeyboardButton("x");
        }

        [When(@"User presses the Ctrl_F combination key on the keyboard")]
        public void WhenUserPressesTheCtrl_FCombinationKeyOnTheKeyboard()
        {
            _browsers.Active.ActionKeysCombinationControlAndKeyboardButton("f");
        }

        [When(@"User presses the Ctrl_K combination key on the keyboard")]
        public void WhenUserPressesTheCtrl_KCombinationKeyOnTheKeyboard()
        {
            _browsers.Active.ActionKeysCombinationControlAndKeyboardButton("k");
        }

        [When(@"User presses the Ctrl_Z combination key on the keyboard")]
        public void WhenUserPressesTheCtrl_ZCombinationKeyOnTheKeyboard()
        {
            _browsers.Active.ActionKeysCombinationControlAndKeyboardButton("z");
        }

        [When(@"User presses the Ctrl_Y combination key on the keyboard")]
        public void WhenUserPressesTheCtrl_YCombinationKeyOnTheKeyboard()
        {
            _browsers.Active.ActionKeysCombinationControlAndKeyboardButton("y");
        }

        [When(@"User presses the CTRL_M combination key on the keyboard")]
        public void WhenUserPressesTheCTRL_MCombinationKeyOnTheKeyboard()
        {
            _browsers.Active.ActionKeysCombinationControlAndKeyboardButton("m");
        }

        [When(@"User presses the CTRL_O combination key on the keyboard")]
        public void WhenUserPressesTheCTRL_OCombinationKeyOnTheKeyboard()
        {
            _browsers.Active.ActionKeysCombinationControlAndKeyboardButton("o");
        }

        #endregion

        [When(@"User presses the CTRL_SHIFT_I combination key on the keyboard")]
        public void WhenUserPressesTheCTRL_SHIFT_ICombinationKeyOnTheKeyboard()
        {
            _browsers.Active.ActionKeysCombinationControlShiftI();
        }

        [When(@"User presses the CTRL_SHIFT_S combination key on the keyboard")]
        public void WhenUserPressesTheCTRL_SHIFT_SCombinationKeyOnTheKeyboard()
        {
            _browsers.Active.ActionKeysCombinationControlShiftS();
        }

        [When(@"User presses the Ctrl_F3 combination key on the keyboard")]
        public void WhenUserPressesTheCtrl_F3CombinationKeyOnTheKeyboard()
        {
            _browsers.Active.ActionKeysCombinationControlF3();
        }

        [When(@"User presses the Ctrl_F5 combination key on the keyboard")]
        public void WhenUserPressesTheCtrl_F5CombinationKeyOnTheKeyboard()
        {
            _browsers.Active.ActionKeysCombinationControlF5();
        }

        [When(@"User presses Left_CTRL key on keyboard")]
        public void WhenUserPressesLeft_CTRLKeyOnKeyboard()
        {
            _browsers.Active.ActionsKeyDownLeftControl();
        }

        [When(@"User releases Left_CTRL key on keyboard")]
        public void WhenUserReleasesLeft_CTRLKeyOnKeyboard()
        {
            _browsers.Active.ActionsKeyUpLeftControl();
        }

        [When(@"User releases '([^']*)' key on keyboard")]
        public void WhenUserReleasesKeyOnKeyboard(string button)
        {
            _browsers.Active.ActionsKeyUpReleaseKey(button);
            Thread.Sleep(500);
        }

        [When(@"User releases all keys on keyboard")]
        public void WhenUserReleasesAllKeysOnKeyboard()
        {
            _browsers.Active.ActionsRelease();
            Thread.Sleep(500);
        }

        [When(@"User presses the Ctrl_A combination key on the keyboard")]
        public void WhenUserPressesTheCtrl_ACombinationKeyOnTheKeyboard()
        {
            _browsers.Active.ActionKeysCombinationControlA();
        }

        [When(@"User presses the CTRL_SHIFT_R combination key on the keyboard")]
        public void WhenUserPressesTheCTRL_SHIFT_RCombinationKeyOnTheKeyboard()
        {
            _browsers.Active.ActionKeysCombinationControlShiftR();
            _browsers.Active.MoveByOffset(1, 20, 50);
        }

        [When(@"User presses the CTRL_SHIFT_B combination key on the keyboard")]
        public void WhenUserPressesTheCTRL_SHIFT_BCombinationKeyOnTheKeyboard()
        {
            _browsers.Active.ActionKeysCombinationControlShiftB();
        }

        [When(@"User selects from `(.*)` to '(.*)' the text symbol in '(.*)' topic")]
        public void WhenUserSelectsFromToTheTextSymbolInTopic(int symbol, int count, string topicName)
        {
            _browsers.Active.ActionsSendKeys("Home");
            _browsers.Active.ActionKeysCombinationShiftArrowRight(count);
        }

        [When(@"User presses the Ctrl_Plus combination key on the keyboard")]
        public void WhenUserPressesTheCtrl_PlusCombinationKeyOnTheKeyboard()
        {
            _browsers.Active.ActionKeysCombinationControlPlus();
        }

        [When(@"User presses the Ctrl_Minus combination key on the keyboard")]
        public void WhenUserPressesTheCtrl_MinusCombinationKeyOnTheKeyboard()
        {
            _browsers.Active.ActionKeysCombinationControlMinus();
        }

        [When(@"User presses Ctrl key on keyboard and scroll mouse wheel up")]
        public void WhenUserPressesCtrlKeyOnKeyboardAndScrollMouseWheelUp()
        {
            _browsers.Active.ActionCtrlKeyAndScrollMouseWheelUp();
        }

        [When(@"User presses Ctrl key on keyboard and scroll mouse wheel down")]
        public void WhenUserPressesCtrlKeyOnKeyboardAndScrollMouseWheelDown()
        {
            _browsers.Active.ActionCtrlKeyAndScrollMouseWheelDown();
        }

        [When(@"User presses Cmd key on keyboard and scroll mouse wheel up")]
        public void WhenUserPressesCmdKeyOnKeyboardAndScrollMouseWheelUp()
        {
            _browsers.Active.ActionCmdKeyAndScrollMouseWheelUp();
        }

        [When(@"User presses Cmd key on keyboard and scroll mouse wheel down")]
        public void WhenUserPressesCmdKeyOnKeyboardAndScrollMouseWheelDown()
        {
            _browsers.Active.ActionCmdKeyAndScrollMouseWheelDown();
        }

        [When(@"User presses the Ctrl_ArrowRight combination key on the keyboard")]
        public void WhenUserPressesTheCtrl_ArrowRightCombinationKeyOnTheKeyboard()
        {
            _browsers.Active.ActionKeysCombinationControlArrowRight();
        }

        [When(@"User presses the ALT_N combination key on the keyboard")]
        public void WhenUserPressesTheALT_NCombinationKeyOnTheKeyboard()
        {
            _browsers.Active.ActionKeysCombinationAltN();
        }

    }
}