using AutomationUtils.Utils;
using Microsoft.VisualBasic;
using MjAutomationCore.Components.Base;
using MjAutomationCore.Components.Buttons;
using MjAutomationCore.Extensions;
using MjAutomationCore.Providers;
using MjAutomationCore.Utils;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using System.ComponentModel;
using System.Linq;
using Reqnroll;

namespace MjAutomationCore.Steps.Base.Components.Base
{
    [Binding]
    class CheckBoxByLabelNameSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsersList;
        public CheckBoxByLabelNameSteps(BrowsersList browsersList)
        {
            _browsersList = browsersList;
        }

        [Then(@"all checkboxes with label are disabled")]
        public void ThenAllCheckboxesWithLabelAreDisabled()
        {
            var checkBoxes = _browsersList.Active.Component<CheckBoxByLabelName>().Instances;
            var displayedCheckBoxes = checkBoxes.Where(checkBox => checkBox.Displayed()).ToList();
            Verify.IsTrue(displayedCheckBoxes.All(checkBox => checkBox.IsDisabledState()), "Not all checkboxes are disabled");
        }

        [Then(@"checkbox by label '(.*)' is checked")]
        public void ThenCheckboxByLabelIsChecked(string checkboxByLabel)
        {
            Verify.IsTrue(_browsersList.Active.GetComponent<CheckBoxByLabelName>(checkboxByLabel, new Properties { Exist = TriState.True }).Selected, $"Checkbox by label '{checkboxByLabel}' is unchecked");
        }

        [Then(@"checkbox by label '(.*)' is unchecked")]
        public void ThenCheckboxByLabelIsUnchecked(string checkboxByLabel)
        {
            Verify.IsFalse(_browsersList.Active.GetComponent<CheckBoxByLabelName>(checkboxByLabel, new Properties { Displayed = TriState.True }).Selected, $"Checkbox by label '{checkboxByLabel}' is checked");
        }

        [When(@"User checks checkbox by label '(.*)'")]
        public void WhenUserChecksCheckboxByLabel(string checkboxByLabel)
        {
            _browsersList.Active.Component<CheckBoxByLabelName>(checkboxByLabel, new Properties { Exist = TriState.True }).SetCheckboxState(true);
        }

        [When(@"User unchecks checkbox by label '(.*)'")]
        public void WhenUserUnchecksCheckboxByLabel(string checkboxByLabel)
        {
            _browsersList.Active.Component<CheckBoxByLabelName>(checkboxByLabel, new Properties { Exist = TriState.True }).SetCheckboxState(false);
        }

        [When(@"User checks checkbox with label '([^']*)' in '([^']*)' container")]
        public void WhenUserChecksCheckboxWithLabelInContainer(string checkboxByLabel, string container)
        {
            var parent = WebContainer.GetContainerSelector(container);
            _browsersList.Active.Component<CheckBoxByLabelName>(checkboxByLabel, new Properties() { ParentSelector = parent, Exist = TriState.True }).SetCheckboxState(true);
        }

        [When(@"User unchecks checkbox with label '([^']*)' in '([^']*)' container")]
        public void WhenUserUnChecksCheckboxWithLabelInContainer(string checkboxByLabel, string container)
        {
            var parent = WebContainer.GetContainerSelector(container);
            _browsersList.Active.Component<CheckBoxByLabelName>(checkboxByLabel, new Properties() { ParentSelector = parent, Exist = TriState.True }).SetCheckboxState(false);
        }

        [Then(@"checkbox by label '([^']*)' is checked in '([^']*)' container")]
        public void ThenCheckboxByLabelIsCheckedInContainer(string checkboxByLabel, string container)
        {
            var parent = WebContainer.GetContainerSelector(container);
            Verify.IsTrue(_browsersList.Active.GetComponent<CheckBoxByLabelName>(checkboxByLabel, new Properties { ParentSelector = parent, Exist = TriState.True }).Selected, $"Checkbox by label '{checkboxByLabel}' is unchecked in '{container}' container");
        }

        [Then(@"checkbox by label '([^']*)' is unchecked in '([^']*)' container")]
        public void ThenCheckboxByLabelIsUnCheckedInContainer(string checkboxByLabel, string container)
        {
            var parent = WebContainer.GetContainerSelector(container);
            Verify.IsFalse(_browsersList.Active.GetComponent<CheckBoxByLabelName>(checkboxByLabel, new Properties { ParentSelector = parent, Exist = TriState.True }).Selected, $"Checkbox by label '{checkboxByLabel}' is checked in '{container}' container");
        }
    }
}