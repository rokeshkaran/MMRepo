using AutomationUtils.Utils;
using MjAutomationCore.Components.Base;
using MjAutomationCore.Components.Licensing;
using MjAutomationCore.Utils;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using Reqnroll;

namespace MjAutomationCore.Steps.LicensingProject.Components
{
    [Binding]
    class SectionContentGroupTitleSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsersList;
        public SectionContentGroupTitleSteps(BrowsersList browsersList)
        {
            _browsersList = browsersList;
        }

        [When(@"User checks '(.*)' checkbox in '(.*)' section")]
        public void WhenUserChecksCheckboxInSection(string checkbox, string section)
        {
            var parent = _browsersList.Active.Component<SectionContentGroupTitle>(section).Context;
            _browsersList.Active.Component<CheckBoxByLabelName>(checkbox, new Properties() { ParentSelector = parent }).SetCheckboxState(true);
        }

        [When(@"User checks '(.*)' checkbox in section with '(.*)' title")]
        public void WhenUserChecksCheckboxInSectionWithTitle(string checkbox, string sectionTitle)
        {
            UserChecksCheckboxInSectionWithTitle(checkbox, sectionTitle, true);
        }

        [When(@"User unchecks '(.*)' checkbox in section with '(.*)' title")]
        public void WhenUserUnchecksCheckboxInSectionWithTitle(string checkbox, string sectionTitle)
        {
            UserChecksCheckboxInSectionWithTitle(checkbox, sectionTitle, false);
        }

        public void UserChecksCheckboxInSectionWithTitle(string checkbox, string sectionTitle, bool state)
        {
            var parent = _browsersList.Active.Component<SectionContentGroupTitle>(sectionTitle).Context;
            _browsersList.Active.Component<CheckBoxByLabelName>(checkbox, new Properties() { ParentSelector = parent }).SetCheckboxState(state);
        }

        [Then(@"'(.*)' checkbox is checked in section with '(.*)' title")]
        public void ThenCheckboxIsCheckedInSectionWithTitle(string checkbox, string sectionTitle)
        {
            _browsersList.Active.WaitForElementToBeDisplayed(_browsersList.Active.GetComponent<SectionContentGroupTitle>(sectionTitle));
            var parent = _browsersList.Active.Component<SectionContentGroupTitle>(sectionTitle).Context;
            Verify.IsTrue(_browsersList.Active.GetComponent<CheckBoxByLabelName>(checkbox, new Properties() { ParentSelector = parent }).Selected, $"'{checkbox}' checkbox is displayed as unchecked in section with '{sectionTitle}' title");
        }

        [Then(@"'(.*)' checkbox is unchecked in section with '(.*)' title")]
        public void ThenCheckboxIsUncheckedInSectionWithTitle(string checkbox, string sectionTitle)
        {
            _browsersList.Active.WaitForElementToBeDisplayed(_browsersList.Active.GetComponent<SectionContentGroupTitle>(sectionTitle));
            var parent = _browsersList.Active.Component<SectionContentGroupTitle>(sectionTitle).Context;
            Verify.IsFalse(_browsersList.Active.GetComponent<CheckBoxByLabelName>(checkbox, new Properties() { ParentSelector = parent }).Selected, $"'{checkbox}' checkbox is displayed as checked in section with '{sectionTitle}' title");
        }

        [When(@"User unchecks '(.*)' checkbox in section content group with '(.*)' header")]
        public void WhenUserUnchecksCheckboxInSectionContentGroupWithHeader(string checkbox, string sectionHeader)
        {
            var parentGroupHeader = _browsersList.Active.Component<SectionContentGroupHeader>(sectionHeader).Context;
            var section = _browsersList.Active.Component<SectionContentGroup>(new Properties() { ParentSelector = parentGroupHeader }).Context;
            _browsersList.Active.Component<CheckBoxByLabelName>(checkbox, new Properties() { ParentSelector = section }).SetCheckboxState(false);
        }

        [Then(@"'(.*)' checkbox is checked in section content group with '(.*)' header")]
        public void ThenCheckboxIsCheckedInSectionContentGroupWithHeader(string checkbox, string sectionHeader)
        {
            var parentGroupHeader = _browsersList.Active.Component<SectionContentGroupHeader>(sectionHeader).Context;
            var section = _browsersList.Active.Component<SectionContentGroup>(new Properties() { ParentSelector = parentGroupHeader }).Context;
            _browsersList.Active.WaitForElementToBeDisplayed(_browsersList.Active.GetComponent<CheckBoxByLabelName>(checkbox, new Properties() { ParentSelector = section }));
            Verify.IsTrue(_browsersList.Active.GetComponent<CheckBoxByLabelName>(checkbox, new Properties() { ParentSelector = section }).Selected, $"Checkbox '{checkbox}' is unchecked in section content group with '{sectionHeader}' header");
        }

        [Then(@"'(.*)' checkbox is unchecked in section content group with '(.*)' header")]
        public void ThenCheckboxIsUncheckedInSectionContentGroupWithHeader(string checkbox, string sectionHeader)
        {
            var parentGroupHeader = _browsersList.Active.Component<SectionContentGroupHeader>(sectionHeader).Context;
            var section = _browsersList.Active.Component<SectionContentGroup>(new Properties() { ParentSelector = parentGroupHeader }).Context;
            Verify.IsFalse(_browsersList.Active.GetComponent<CheckBoxByLabelName>(checkbox, new Properties() { ParentSelector = section }).Selected, $"Checkbox '{checkbox}' is checked in section content group with '{sectionHeader}' header");
        }
    }
}
