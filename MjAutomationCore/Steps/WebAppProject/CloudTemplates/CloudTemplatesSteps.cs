using AutomationUtils.Utils;
using MjAutomationCore.Components.Base;
using MjAutomationCore.Components.Licensing;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.Extensions;
using MjAutomationCore.Pages.WebAppProject.CloudTemplates;
using MjAutomationCore.Utils;
using SeleniumAutomationUtils.Components;
using SeleniumAutomationUtils.SeleniumExtensions;
using System.Drawing;
using System.Linq;
using System.Threading;
using Reqnroll;

namespace MjAutomationCore.Steps.WebAppProject.CloudTemplates
{
    [Binding]
    class CloudTemplatesSteps : ReqnrollContext
    {
        private readonly BrowsersList _browsers;
        private readonly LocationWebDto _locWeb;

        public CloudTemplatesSteps(BrowsersList browsersList, LocationWebDto locWeb)
        {
            _browsers = browsersList;
            _locWeb = locWeb;
        }

        #region CloudTemplatePage

        [Then(@"cloud templates page is displayed to User")]
        public void ThenCloudTemplatesPageIsDisplayedToUser()
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            Verify.IsTrue(page.CloudTemplates.Displayed(), "Cloud templates page is not displayed to User");
        }
        #endregion

        #region Search
        [When(@"User hovers over search bar on cloud template page")]
        public void WhenUserHoversOverSearchBarOnCloudTemplatePage()
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            _browsers.Active.MoveToElement(page.CloudTemplatesSearchBar);
        }

        [Then(@"search bar is highlighted with '([^']*)' color border on cloud template page")]
        public void ThenSearchBarIsHighlightedWithBorderOnCloudTemplatePage(string expectedBorder)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            var actualBorder = page.CloudTemplatesSearchBar.GetCssValue("border");
            Verify.IsTrue(actualBorder.Contains(expectedBorder), $"Search bar is not highlighted on template page.Actual Border: '{actualBorder}'.Expected Border:'{expectedBorder}'");
        }

        [Then(@"search bar is not highlighted with '([^']*)' color border on cloud template page")]
        public void ThenSearchBarIsNotHighlightedWithColorBorderOnCloudTemplatePage(string expectedBorder)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            var actualBorder = page.CloudTemplatesSearchBar.GetCssValue("border");
            Verify.IsFalse(actualBorder.Contains(expectedBorder), $"Search bar is highlighted on template page.Actual Border: '{actualBorder}'.Expected Border:'{expectedBorder}'");
        }

        [Then(@"search bar is displayed on the cloud template page")]
        public void ThenSearchBarIsDisplayedOnTheCloudTemplatePage()
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            _browsers.Active.WaitForElementToBeDisplayed(page.CloudTemplatesSearchBar);
            Verify.IsTrue(page.CloudTemplatesSearchBar.Displayed,"Search bar is not displayed on the cloud template page");
        }

        [Then(@"'([^']*)' title is displayed on search results page")]
        public void ThenTitleIsDisplayedOnSearchResultsPage(string title)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            _browsers.Active.WaitForElementToBeDisplayed(page.ContentHeaderTitle);
            Verify.IsTrue(page.ContentHeaderTitle.GetText().Contains(title), $"Title '{title}' is not displayed on search results page");
            Verify.IsTrue(page.ContentHeaderTitle.Displayed(), $"Title is not displayed on search results page");
        }

        [Then(@"list of templates is displayed as matching result:")]
        public void ThenListOfTemplatesIsDisplayedAsMatchingResult(Table table)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            _browsers.Active.WaitForElementsToBeDisplayed(page.GetTemplateListsFromSearchResults());
            var templatesList = page.GetTemplateListsFromSearchResults().Select(x => x.Text).ToList();
            var expectedtemplatesList = table.Rows.SelectMany(row => row.Values).ToList();
            Verify.AreEqual(templatesList, expectedtemplatesList, "List of templates is not displayed as matching result");
        }

        [When(@"user enters '([^']*)' in search input field '([^']*)' on the cloud template page")]
        public void WhenUserEntersInSearchInputFieldOnTheCloudTemplatePage(string value, string inputFieldValue)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            var parent = _browsers.Active.NowAt<CloudTemplatesPage>().Context;
            _browsers.Active.WaitForElementToBeDisplayed(page.CloudTemplatesSearchBar);
            page.CloudTemplatesSearchBar.Click();
            _browsers.Active.GetComponent<InputByAttribute>(inputFieldValue, new Properties { ParentSelector = parent }).ClearSendKeys(value);
            _browsers.Active.GetComponent<InputByAttribute>(inputFieldValue, new Properties { ParentSelector = parent }).Click();
        }

        [Then(@"suggestion result is displayed in search bar:")]
        public void ThenSuggestionResultIsDisplayedInSearchBar(Table table)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            _browsers.Active.WaitForElementsToBeDisplayed(page.GetTemplatesSuggestionsList());
            var templatesList = page.GetTemplatesSuggestionsList().Select(x => x.Text).ToList();
            var expectedtemplatesList = table.Rows.SelectMany(row => row.Values).ToList();
            Verify.AreEqual(templatesList, expectedtemplatesList, "Suggestion results is not displayed in search bar");
        }

        [Then(@"search text '([^']*)' is still visible in search input field '([^']*)' on the cloud template page")]
        public void ThenSearchTextIsStillVisibleInSearchInputFieldOnTheCloudTemplatePage(string searchText, string inputFieldValue)
        {
            var parent = _browsers.Active.NowAt<CloudTemplatesPage>().Context;
            var searchInputValue = _browsers.Active.GetComponent<InputByAttribute>(inputFieldValue, new Properties { ParentSelector = parent }).GetAttribute("value");
            Verify.IsTrue(searchInputValue.Contains(searchText), $"Search text '{searchText}' is not visible in search bar");
        }

        [Then(@"suggestion list is not visible in search bar on the cloud template page")]
        public void ThenSuggestionListIsNotVisibleInSearchBarOnTheCloudTemplatePage()
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            Verify.IsFalse(page.DisplayedSearchFlyoutSuggestionList(), "The suggestion list is visible in search bar on the cloud template page");
        }

        [When(@"User clicks on close button in search bar on the cloud template page")]
        public void WhenUserClicksOnCloseButtonInSearchBarOnTheCloudTemplatePage()
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            page.CloudTemplatesSearchBarCloseButton.Click();
        }

        [When(@"User hovers over on suggested result '([^']*)' in search bar on the cloud template page")]
        public void WhenUserHoversOverOnSuggestedResultInSearchBarOnTheCloudTemplatePage(string suggestedResult)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            _browsers.Active.MoveToElement(page.GetTemplatesSearchListByName(suggestedResult));
        }

        [When(@"User click on suggested result '([^']*)' in suggestion list from search results on the cloud template page")]
        public void WhenUserClickOnSuggestedResultInSuggestionListFromSearchResultsOnTheCloudTemplatePage(string suggestedResult)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            _browsers.Active.HoverAndClick(page.GetTemplatesSearchListByName(suggestedResult));
        }

        [Then(@"suggested result '([^']*)' is highlighed with '([^']*)' color in suggestion list from search results on the cloud template page")]
        public void ThenSuggestedResultIsHighlighedWithColorInSuggestionListFromSearchResultsOnTheCloudTemplatePage(string suggestedResult, string expectedBorder)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            _browsers.Active.WaitForElementsToBeDisplayed(page.GetTemplatesSuggestionsList(), WebDriverExtensions.WaitTime.ExtraLong, false);
            var actualBorder = page.GetTemplatesSearchListByName(suggestedResult).GetCssValue("border");
            Verify.IsTrue(actualBorder.Contains(expectedBorder), $"Suggested result '{suggestedResult}' is not highlighted. Actual Border: '{actualBorder}'.Expected Border:'{expectedBorder}'");
        }
        #endregion

        #region SideMenu
        [When(@"User click on '([^']*)' item in the template side menu")]
        public void WhenUserClickOnTemplateGroup(string templateGroupName)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            page.GetTemplateGroupByName(templateGroupName).Click();
        }

        [When(@"User hovers on '([^']*)' item in the template side menu")]
        public void WhenUserHoversOnItemInTheTemplateSideMenu(string templateGroupName)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            _browsers.Active.MoveToElement(page.GetTemplateGroupByName(templateGroupName));
        }

        [Then(@"'([^']*)' item has border highlighted in '([^']*)' rgb color in the template side menu")]
        public void ThenItemHasBorderHighlightedInRgbColorInTheTemplateSideMenu(string templateGroupName, string color)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            var elementColor = page.GetTemplateGroupByName(templateGroupName).GetCssValue("border");
            Verify.IsTrue(elementColor.Contains(color), $"'{templateGroupName}' template Group does not have border highlighted in '{color}' in the template side menu. Actual Color: '{elementColor}'");
        }

        [Then(@"'([^']*)' item has background highlighted in '([^']*)' rgba color in the template side menu")]
        public void ThenItemHasBackgroundHighlightedInRgbColorInTheTemplateSideMenu(string templateGroupName, string color)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            var elementColor = page.GetTemplateGroupByName(templateGroupName).GetCssValue("color");
            Verify.IsTrue(elementColor.Contains(color), $"'{templateGroupName}' template Group does not have background highlighted in '{color}' in the template side menu. Actual Color: '{elementColor}'");
        }


        [Then(@"'([^']*)' item is selected in the template side menu")]
        public void ThenTemplateGroupIsSelected(string templateGroupName)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            Verify.IsTrue(page.IsTemplateGroupSelectedInSideMenu(templateGroupName), $"'{templateGroupName}' template group is not selected.");
        }

        [When(@"User remembers location of '([^']*)' item in the template side menu")]
        public void WhenUserRemembersLocationOfTemplateGroupInTheUseCasesSideMenu(string templateGroupName)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            var templateGroup = page.GetTemplateGroupByName(templateGroupName).Location;
            Point point = new Point(templateGroup.X, templateGroup.Y);
            _locWeb.Location = point;
        }

        [Then(@"'([^']*)' item has not changed location by Y axis in the template side menu")]
        public void ThenTemplateGroupHasNotChangedLocationByYAxisInTheUseCasesSideMenu(string templateGroupName)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            Verify.AreEqual(_locWeb.Location.Y, page.GetTemplateGroupByName(templateGroupName).Location.Y, $"Template group '{templateGroupName}' has changed location by Y axis in the use cases side menu");
        }

        [When(@"User hovers over on '([^']*)' button in the template side menu on cloud template page")]
        public void WhenUserHoversOverOnButtonInTheTemplateSideMenuOnCloudTemplatePage(string button)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            _browsers.Active.MoveToElement(page.GetSideMenuButtonByName(button));
        }

        [When(@"User clicks on '([^']*)' button in the template side menu on cloud template page")]
        public void WhenUserClicksOnButtonInTheTemplateSideMenuOnCloudTemplatePage(string button)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            page.GetSideMenuButtonByName(button).Click();
        }

        [Then(@"'([^']*)' button has border highlighted in '([^']*)' rgb in the template side menu on cloud template page")]
        public void ThenButtonHasBorderHighlightedInRgbInTheTemplateSideMenuOnCloudTemplatePage(string button, string color)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            var elementColor = page.GetSideMenuButtonByName(button).GetCssValue("border");
            Verify.IsTrue(elementColor.Contains(color), $"'{button}' button is not highlighted in '{color}' in the template side menu. Actual Color: '{elementColor}'");
        }

        #endregion

        #region SearchResult_Template_Group_Card
        [Then(@"interactive tour banner is displayed on the cloud template page")]
        public void ThenInteractiveTourBannerIsDisplayedOnTheCloudTemplatePage()
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            Verify.IsTrue(page.InteractiveTourBanner.Displayed(), "Interactive tour banner is not displayed on the cloud template page");
        }

        [Then(@"interactive tour banner is not displayed on the cloud template page")]
        public void ThenInteractiveTourBannerIsNotDisplayedOnTheCloudTemplatePage()
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            Verify.IsFalse(_browsers.Active.IsElementExists(page.InteractiveTourBanner), "Interactive tour banner is displayed on the cloud template page");
        }

        [When(@"interactive tour is set to '([^']*)' on the cloud template page")]
        public void WhenInteractiveTourIsSetToOnTheCloudTemplatePage(string status)
        {
            _browsers.Active.UpdateCanvasFlags(status);
        }

        [When(@"User hovers on the '([^']*)' element of the interactive banner on cloud template page")]
        public void WhenUserHoversOnTheElementOfTheInteractiveBannerOnCloudTemplatePage(string element)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            _browsers.Active.MoveToElement(page.GetInteractiveTourBannerElementByName(element));
        }

        [Then(@"'([^']*)' element in the interactive tour banner is highlighted in '([^']*)' rgba background color")]
        public void ThenElementIsHighlightedInRgbaBackgroundColor(string element, string color)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            var elementColor = page.GetInteractiveTourBannerElementByName(element).GetCssValue("background");
            Verify.IsTrue(elementColor.Contains(color), $"'{element}' element is not highlighted in '{color}' on the interactive tour banner. Actual Color: '{elementColor}'");
        }

        [When(@"User clicks on the '([^']*)' element of the interactive banner on cloud template page")]
        public void WhenUserClicksOnTheElementOfTheInteractiveBannerOnCloudTemplatePage(string element)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            page.GetInteractiveTourBannerElementByName(element).Click();
        }

        [When(@"User hovers over '([^']*)' template group card on cloud template page")]
        public void WhenUserHoversOverCardOnCloudTemplatePage(string cardName)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            _browsers.Active.MoveToElement(page.GetTemplateGroupCardByName(cardName));
        }

        [Then(@"learn more button is displayed in '([^']*)' template group card on cloud template page")]
        public void ThenLearnMoreButtonIsDisplayedInCardOnCloudTemplatePage(string cardName)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            Verify.IsTrue(page.GetLearnMoreButtonByTemplateGroupCardName(cardName).Displayed, $"Learn More button is not displayed in '{cardName}' card on cloud template page");
        }

        [Then(@"use case state information is displayed in '([^']*)' template group card on cloud template page")]
        public void ThenTemplateStateInformationIsDisplayedInCardOnCloudTemplatePage(string cardName)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            Verify.IsTrue(page.GetStateInformationByTemplateGroupCardName(cardName).Displayed, $"State information is not displayed in '{cardName}' card on cloud template page");
        }

        [Then(@"'([^']*)' description is displayed in '([^']*)' template card in home section")]
        public void ThenDescriptionIsDisplayedInTemplateCardInHomeSection(string description, string cardName)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            Verify.IsTrue(page.GetCardHoverDetailsByTemplateGroupCardName(cardName).GetAttribute("class").Contains("visible"), $"The hover effect is not visible for the '{cardName}' template card in home section.");
            Verify.AreEqual(description, page.GetStateInformationByTemplateGroupCardName(cardName).GetText(), $"Description with text '{description}' is not displayed in '{cardName}' template card in home section");
        }

        [When(@"User hovers over learn more button in '([^']*)' template group card on cloud template page")]
        public void WhenUserHoversOverLearnMoreButtonInCardOnCloudTemplatePage(string cardName)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            _browsers.Active.MoveToElement(page.GetLearnMoreButtonByTemplateGroupCardName(cardName));
        }

        [Then(@"learn more button has '([^']*)' rgba background color in '([^']*)' template group card on cloud template page")]
        public void ThenLearnMoreButtonIsHighlightedWithColorInCardOnCloudTemplatePage(string color, string cardName)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            var buttonColor = page.GetLearnMoreButtonByTemplateGroupCardName(cardName).GetCssValue("background-color");
            Verify.AreEqual(color, buttonColor, $"Learn More button is not highlighted in  '{color}' color on '{cardName}' card.Actual Color: '{buttonColor}'");
        }

        [When(@"User clicks on '([^']*)' template group card on cloud template page")]
        public void WhenUserClicksOnCardOnCloudTemplatePage(string cardName)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            page.GetTemplateGroupCardByName(cardName).Click();
        }

        [When(@"User clicks on learn more button in '([^']*)' template group card on cloud template page")]
        public void WhenUserClicksOnLearnMoreButtonInCardOnCloudTemplatePage(string cardName)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            page.GetLearnMoreButtonByTemplateGroupCardName(cardName).Click();
        }

        [When(@"User remembers location of '([^']*)' template group card on cloud template page")]
        public void WhenUserRemembersLocationOfCardOnCloudTemplatePage(string cardName)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            var useCaseCard = page.GetTemplateGroupCardByName(cardName).Location;
            Point point = new Point(useCaseCard.X, useCaseCard.Y);
            _locWeb.Location = point;
        }

        [Then(@"'([^']*)' template group card has changed location by Y axis on cloud template page")]
        public void ThenCardHasChangedLocationByYAxisOnCloudTemplatePage(string cardName)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            Verify.AreNotEqual(_locWeb.Location.Y, page.GetTemplateGroupCardByName(cardName).Location.Y, $"Use Case card '{cardName}' has not changed location by Y axis");
        }

        [Then(@"'([^']*)' template group card has changed location by X axis on cloud template page")]
        public void ThenTemplateGroupCardHasChangedLocationByXAxisOnCloudTemplatePage(string cardName)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            Verify.AreNotEqual(_locWeb.Location.X, page.GetTemplateGroupCardByName(cardName).Location.X, $"Use Case card '{cardName}' has not changed location by X axis");
        }

        [Then(@"'([^']*)' template group card has not changed location by Y axis on cloud template page")]
        public void ThenTemplateGroupCardHasChangedNotLocationByYAxisOnCloudTemplatePage(string cardName)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            Verify.AreEqual(_locWeb.Location.Y, page.GetTemplateGroupCardByName(cardName).Location.Y, $"Use Case card '{cardName}' has changed location by Y axis");
        }

        [When(@"User scrolls the template group card area down")]
        public void WhenUserScrollsTheUseCaseCardAreaDown()
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            _browsers.Active.MouseHoverByJavascript(page.GetTemplateGroupCards().Last());
            //Wait for scroll action to complete
            Thread.Sleep(3000);
        }

        [When(@"User scrolls the template group card area up")]
        public void WhenUserScrollsTheUseCaseCardAreaUp()
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            _browsers.Active.MouseHoverByJavascript(page.GetTemplateGroupCards().First());
            //Wait for scroll action to complete
            Thread.Sleep(3000);
        }

        [Then(@"all templates group cards are displayed on the cloud template page")]
        public void ThenAllTemplatesGroupCardsAreDisplayedOnTheCloudTemplatePage()
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            Verify.IsTrue(page.GetTemplateGroupCards().Count > 0, "No template group card is displayed in the search result section");
        }

        #endregion

        #region SearchResult_Template_Card

        [Then(@"template content is displayed on cloud template page")]
        public void ThenUseCasePageContentIsDisplayedOnCloudTemplatePage()
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            Verify.IsTrue(page.UseCasePageContent.Displayed, "Use case page content is not displayed on cloud template page");
        }

        [Then(@"'([^']*)' banner is displayed on template content page")]
        public void ThenBannerIsDisplayedOnUseCasePageContentPage(string banner)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            Verify.IsTrue(page.GetTemplateBanner(banner).Displayed, $"'{banner}' banner is not displayed on se case page content page");
        }

        [Then(@"all templates are displayed on the cloud template page")]
        public void ThenAllTemplatesAreDisplayedOnTheCloudTemplatePage()
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            Verify.IsTrue(page.GetAllTemplatesCardsList().Count > 11, "No template card or not all cards are displayed in the search results section");
        }

        [When(@"User hovers over '([^']*)' template card on cloud template page")]
        public void WhenUserHoversOverTemplateCardOnCloudTemplatePage(string templateCard)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            _browsers.Active.MoveToElement(page.GetTemplateCardByName(templateCard));
        }

        [Then(@"'([^']*)' description is displayed in '([^']*)' template card")]
        public void ThenDescriptionIsDisplayedTemplateCard(string description, string templateCard)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            Verify.AreEqual(description, page.GetTemplateDescriptionByTemplateCardName(templateCard), $"'{description}' is not displayed in '{templateCard}' template card");
        }

        [Then(@"preview button is displayed in '([^']*)' template card")]
        public void ThenPreviewButtonIsDisplayedInTemplateCard(string templateCard)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            Verify.IsTrue(page.GetPreviewButtonByTemplateCardName(templateCard).Displayed, $"Preview button is not displayed in '{templateCard}' template card");
        }

        [When(@"User right clicks on '([^']*)' template card on cloud template page")]
        public void WhenUserRightClicksOnTemplateCardOnCloudTemplatePage(string templateCard)
        {
            var page = _browsers.Active.NowAt<CloudTemplatesPage>();
            if (templateCard.Equals("anyRandom"))
            {
                _browsers.Active.ContextClick(page.GetRandomTemplateCard());
            }
            else
            {
                _browsers.Active.ContextClick(page.GetTemplateCardByName(templateCard));
            }
        }
        #endregion   
    }
}
