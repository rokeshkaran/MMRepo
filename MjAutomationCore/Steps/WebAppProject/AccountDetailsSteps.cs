using AutomationUtils.Utils;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject;
using MjAutomationCore.Providers.UserProvider;
using MjAutomationCore.Utils;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject
{
    [Binding]
    public class AccountDetailsSteps : ReqnrollContext
    {
        private WebDriver _driver;
        private readonly BrowsersList _browsers;
        private readonly SessionRandomValue _sessionRandom;

        public AccountDetailsSteps(WebDriver driver, BrowsersList browsersList, SessionRandomValue sessionRandom)
        {
            _driver = browsersList.GetBrowser();
            _browsers = browsersList;
            _sessionRandom = sessionRandom;
        }

        [Then(@"'([^']*)' section is displayed on Account Details page")]
        public void ThenSectionIsDisplayedOnAccountDetailsPage(string section)
        {
            var page = _browsers.Active.NowAt<AccountDetailsPage>();
            Verify.IsTrue(page.DisplayedSection(section), $"Section '{section}' is not displayed on Account Details page");
        }

        [Then(@"checkbox '([^']*)' is unchecked in '([^']*)' section on Account Details page")]
        public void ThenCheckboxIsUncheckedInSectionOnAccountDetailsPage(string label, string section)
        {
            var page = _browsers.Active.NowAt<AccountDetailsPage>();
            Verify.IsFalse(page.GetCheckboxByLabel(label, section).Selected, $"Checkbox '{label}' is checked on {section} section on Account Details page");
        }

        [Then(@"checkbox '([^']*)' is checked in '([^']*)' section on Account Details page")]
        public void ThenCheckboxIsCheckedInSectionOnAccountDetailsPage(string label, string section)
        {
            var page = _browsers.Active.NowAt<AccountDetailsPage>();
            Verify.IsTrue(page.GetCheckboxByLabel(label, section).Selected, $"Checkbox '{label}' is unchecked on '{section}' section on Account Details page");
        }

        [Then(@"'([^']*)' section is not displayed on Account Details page")]
        public void ThenSectionIsNotDisplayedOnAccountDetailsPage(string section)
        {
            var page = _browsers.Active.NowAt<AccountDetailsPage>();
            Verify.IsFalse(page.DisplayedSection(section), $"'{section}' section is displayed on Account Details page");
        }

        [When(@"User mouses over '([^']*)' link in row with '([^']*)' label in '([^']*)' section on Account Details page")]
        public void WhenUserMousesOverLinkInRowWithLabelInSectionOnAccountDetailsPage(string link, string label, string section)
        {
            var page = _browsers.Active.NowAt<AccountDetailsPage>();
            _browsers.Active.MoveToElement(page.GetLinkInRow(link, label, section));
        }

        [Then(@"tooltip with content '([^']*)' is displayed for '([^']*)' link of row with '([^']*)' label in '([^']*)' section on Account Details page")]
        public void ThenTooltipWithContentIsDisplayedForLinkOfRowWithLabelInSectionOnAccountDetailsPage(string content, string link, string label, string section)
        {
            var page = _browsers.Active.NowAt<AccountDetailsPage>();
            var actualtooltipcontent = page.GetTooltip(link, label, section).Text.RemoveLineBreakes();
            Verify.AreEqual(content, actualtooltipcontent, "Tooltip content is not equal to Tooltip actual content on Account Details page");
        }

        [Then(@"Email address is hidden in '([^']*)' subsection in '([^']*)' section on Account Details page")]
        public void ThenEmailAddressIsHiddenInSubsectionInSectionOnAccountDetailsPage(string subsection, string section)
        {
            var page = _browsers.Active.NowAt<AccountDetailsPage>();
            var emailOnPage = page.GetEmailAddressOnPage(subsection, section);
            var usedEmail = RegularUserProvider.Email;
            Verify.AreNotEqual(emailOnPage, usedEmail, $"Email address is not hidden in Email subsection in '{section}' section on Account Details page");
        }

        [Then(@"Email address is displayed fully in '([^']*)' subsection in '([^']*)' section on Account Details page")]
        public void ThenEmailAddressIsDisplayedFullyInSubsectionInSectionOnAccountDetailsPage(string subsection, string section)
        {
            var page = _browsers.Active.NowAt<AccountDetailsPage>();
            var emailOnPage = page.GetEmailAddressOnPage(subsection, section);
            var usedEmail = RegularUserProvider.Email;
            Verify.AreEqual(emailOnPage, usedEmail, $"Email address is hidden in Email subsection in '{section}' section on Account Details page");
        }

        [Then(@"User Name '([^']*)' is displayed in '([^']*)' subsection in '([^']*)' section on Account Details page")]
        public void ThenUserNameIsDisplayedInSubsectionInSectionOnAccountDetailsPage(string UserName, string subsection, string section)
        {
            var page = _browsers.Active.NowAt<AccountDetailsPage>();
            Verify.IsTrue(page.GetAccountNameOnPage(UserName.AddRandom(_sessionRandom), subsection, section), $"User Name '{UserName}' is not displayed in '{subsection}' subsection in '{section}' section on Account Details page");
        }

        [When(@"User clicks Toggle Email icon in '([^']*)' subsection in '([^']*)' section on Account Details page")]
        public void WhenUserClicksToggleEmailIconInLSubsectionInSectionOnAccountDetailsPage(string subsection, string section)
        {
            var page = _browsers.Active.NowAt<AccountDetailsPage>();
            _driver.WaitForElementToBeDisplayed(page.GetSubsectionByHeader(subsection, section));
            page.GetSubsectionByHeader(subsection, section).FindElement(By.XPath(page.EmailToggleIcon)).Click();
        }

        [Then(@"Toggle Email icon is hidden in '([^']*)' subsection in '([^']*)' section on Account Details page")]
        public void ThenToggleEmailIconIsHiddenInSubsectionInSectionOnAccountDetailsPage(string subsection, string section)
        {
            var page = _browsers.Active.NowAt<AccountDetailsPage>();
            _driver.WaitForElementToBeDisplayed(page.GetSubsectionByHeader(subsection, section));
            page.GetSubsectionByHeader(subsection, section).FindElement(By.XPath(page.EmailToggleIcon)).Displayed();
        }

        [Then(@"Toggle Email icon changes to '([^']*)' in '([^']*)' subsection in '([^']*)' section on Account Details page")]
        public void ThenToggleEmailIconChangesToInSubsectionInSectionOnAccountDetailsPage(string togglestate, string subsection, string section)
        {
            var page = _browsers.Active.NowAt<AccountDetailsPage>();
            _driver.WaitForElementToBeDisplayed(page.GetSubsectionByHeader(subsection, section));
            var state = page.GetSubsectionByHeader(subsection, section).FindElement(By.XPath(page.EmailToggleIcon)).GetCssValue("background-image");
            Verify.IsTrue(state.Contains(togglestate), $"Toggle icon does not change state in '{subsection}' subsection in '{section}' section on Account Details page");
        }

        [Then(@"subscription account details '([^']*)' is displayed on page in '([^']*)' section on Account Details page")]
        public void ThenSubscriptionAccountDetailsIsDisplayedOnPageInSectionOnAccountDetailsPage(string label, string sectionName)
        {
            label= label.AddRandom(_sessionRandom);
            var el = _driver.NowAt<AccountDetailsPage>();
            var actualContent = el.GetAccountDetailsSubscriptionLabel(label, sectionName).Text.RemoveLineBreakes();
            Verify.AreEqual(label, actualContent, $"Subscription account details '{label}' is not displayed on page in '{sectionName}' section on Account Details page");
        }

        [Then(@"product '([^']*)' is displayed with status '([^']*)' in '([^']*)' section on Account Details page")]
        public void ThenProductIsDisplayedWithStatusInSectionOnAccountDetailsPage(string productDetails, string status, string section)
        {
            var el = _driver.NowAt<AccountDetailsPage>();
            Verify.IsTrue(el.DisplayedProductStatus(productDetails, section, status), $"Product '{productDetails}' is not displayed with '{status}' in '{section}' section on Account Details page");
        }

        [Then(@"content row with header '([^']*)' and date '([^']*)' is displayed for '([^']*)' product in '([^']*)' section on the Account Details page")]
        public void ThenContentRowWithHeaderAndDateIsDisplayedForProductInSectionOnTheAccountDetailsPage(string header, string value, string productName, string sectionName)
        {
            value = value.AddRandom(_sessionRandom).Date();
            var el = _driver.NowAt<AccountDetailsPage>();
            var valueFromDateField = el.GetProductByLabel(productName, sectionName).FindElement(By.XPath(string.Format(el.ProductExpiryDate, header))).GetText();
            Verify.AreEqual(valueFromDateField, value, $"Expiry Date '{value}' with header '{header}' is not displayed for '{productName}' in '{sectionName}' section on Account Details page");
        }

        [When(@"User clicks on Toggle arrow button for product name '([^']*)' in '([^']*)' section on Account Details page")]
        public void WhenUserClicksOnToggleButtonForProductNameInSectionOnAccountDetailsPage(string productName, string sectionName)
        {
            var el = _driver.NowAt<AccountDetailsPage>();
            el.GetProductByLabel(productName, sectionName).FindElement(By.XPath(string.Format(el.ProductToggleArrow))).Click();
        }

        [Then(@"collapsible content is visible in '([^']*)' product in '([^']*)' section on Account Details page")]
        public void ThenCollapsibleContentIsVisibleInInSectionOnAccountDetailsPage(string productName, string sectionName)
        {
            var page = _browsers.Active.NowAt<AccountDetailsPage>();
            Verify.IsTrue(page.DisplayedProductDetailState(productName, sectionName), $"Collapsible content is not visible in '{productName}' in '{sectionName}' section on Account Details page");
        }

        [Then(@"collapsible content is not visible in '([^']*)' product in '([^']*)' section on Account Details page")]
        public void ThenCollapsibleContentIsNotVisibleInInSectionOnAccountDetailsPage(string productName, string sectionName)
        {
            var page = _browsers.Active.NowAt<AccountDetailsPage>();
            Verify.IsFalse(page.DisplayedProductDetailState(productName, sectionName), $"Collapsible content is visible in '{productName}' in '{sectionName}' section on Account Details page");
        }
    }
}