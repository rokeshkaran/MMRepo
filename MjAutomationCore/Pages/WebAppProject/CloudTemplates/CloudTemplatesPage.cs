using MjAutomationCore.Extensions;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Pages;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MjAutomationCore.Pages.WebAppProject.CloudTemplates
{
    class CloudTemplatesPage : SeleniumBasePage
    {
        [FindsBy(How = How.XPath, Using = ".//div[@id='cloudTemplates']")]
        public IWebElement CloudTemplates { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='search-bar']")]
        public IWebElement CloudTemplatesSearchBar { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='search-results']")]
        public IWebElement SearchResults { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='content-scroll-pane']//p[@class='title']")]
        public IWebElement ContentHeaderTitle { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'close-button')]")]
        public IWebElement CloudTemplatesSearchBarCloseButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='search-flyout']")]
        public IWebElement SearchFlyout { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'use-case-page__content-container')]")]
        public IWebElement UseCasePageContent { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'interactive-tour-banner')]")]
        public IWebElement InteractiveTourBanner { get; set; } 

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'cloud-templates-context-menu')]")]
        public IWebElement CloudTemplateContextMenu { get; set; }

        public string SideMenuButtonSelector = ".//div[@data-item='main-menu-{0}']";

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            {
              SelectorFor(this, p => p.CloudTemplates)
            };
        }

        #region TemplateGroupsCardsPage
        //Example: Organisation card, Flowcharts card
        public IList<IWebElement> GetTemplatesGroupList()
        {
            var selector = By.XPath(".//div[contains(@class,'menu-scroll')]/div[contains(@class,'menu-item-container')]//div");
            {
                if (!Driver.IsElementInElementDisplayed(CloudTemplates, selector, WebDriverExtensions.WaitTime.Short))
                {
                    throw new Exception("Template groups are not displayed");
                }
                return CloudTemplates.FindElements(selector);
            }
        }
        public IWebElement GetTemplateGroupByName(string templateGroupName)
        {
            return GetTemplatesGroupList().First(x => x.FindElement(By.XPath($".//span")).Text.Equals(templateGroupName));
        }
        public IList<IWebElement> GetTemplateGroupCards()
        {
            var selector = By.XPath(".//div[@class='use-case-card']");
            {
                if (!Driver.IsElementInElementDisplayed(SearchResults, selector, WebDriverExtensions.WaitTime.Short))
                {
                    throw new Exception("Use Case Cards are not displayed");
                }
                return SearchResults.FindElements(selector);
            }
        }
        public IWebElement GetTemplateGroupCardByName(string cardName)
        {
            return GetTemplateGroupCards().First(x => x.FindElement(By.XPath($".//div[@class='use-case-name']")).Text.Equals(cardName));
        }
        public IWebElement GetLearnMoreButtonByTemplateGroupCardName(string cardName)
        {
            var card = GetTemplateGroupCardByName(cardName);
            var selector = By.XPath(".//button[@class='card-button']");
            if (!Driver.IsElementInElementDisplayed(card, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Learn More button is not displayed in '{cardName}' use case card");
            }
            return card.FindElement(selector);
        }
        public IWebElement GetStateInformationByTemplateGroupCardName(string cardName)
        {
            var card = GetTemplateGroupCardByName(cardName);
            var selector = By.XPath(".//div[contains(@class,'card-hover')]/p");
            if (!Driver.IsElementInElementDisplayed(card, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"State Information is not displayed in '{cardName}' use case card");
            }
            return card.FindElement(selector);
        }
        public IWebElement GetCardHoverDetailsByTemplateGroupCardName(string cardName)
        {
            var card = GetTemplateGroupCardByName(cardName);
            var selector = By.XPath(".//div[contains(@class,'card-hover')]");
            if (!Driver.IsElementInElementDisplayed(card, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Card hover details is not displayed in '{cardName}' use case card");
            }
            return card.FindElement(selector);
        }
        public IWebElement GetInteractiveTourBannerElementByName(string element)
        {
            var selector = By.XPath($".//*[contains(@class,'{element}')]");
            {
                if (!Driver.IsElementInElementDisplayed(InteractiveTourBanner, selector, WebDriverExtensions.WaitTime.Short))
                {
                    throw new Exception($"'{element}' element is not displayed on the interactive tour banner");
                }
                return InteractiveTourBanner.FindElement(selector);
            }
        }
        #endregion

        #region TemplateSideMenu
        public bool IsTemplateGroupSelectedInSideMenu(string templateGroupName)
        {
            return GetTemplateGroupByName(templateGroupName).IsSelected();
        }
        public IWebElement GetSideMenuButtonByName(string button)
        {
            var selector = By.XPath(string.Format(SideMenuButtonSelector, button));
            if (!Driver.IsElementInElementDisplayed(CloudTemplates, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Button '{button}' is not displayed in the template side menu");
            }
            return CloudTemplates.FindElement(selector);
        }
        #endregion

        #region TemplateCardsPage
        //Example: Radial Map card, Organisation Chart Card
        public IWebElement GetTemplateBanner(string banner)
        {
            var selector = By.XPath($".//div[@class='use-case-collection-banner']//*[(text()='{banner}')]/parent::div");
            {
                if (!Driver.IsElementInElementDisplayed(UseCasePageContent, selector, WebDriverExtensions.WaitTime.Short))
                {
                    throw new Exception($"'{banner}' banner is not displayed");
                }
                return UseCasePageContent.FindElement(selector);
            }
        }
        public IList<IWebElement> GetAllTemplatesCardsList()
        {
            var selector = By.XPath(".//div[@class='result-card']");
            {
                if (!Driver.IsElementInElementDisplayed(SearchResults, selector, WebDriverExtensions.WaitTime.Short))
                {
                    throw new Exception("Templates Cards are not displayed");
                }
                return SearchResults.FindElements(selector);
            }
        }
        public IWebElement GetTemplateCardByName(string templatecardName)
        {
            return GetAllTemplatesCardsList().First(x => x.FindElement(By.XPath($".//div[@class='result-card__front']/p")).Text.Equals(templatecardName));
        }

        public IWebElement GetRandomTemplateCard()
        {
            var random = new Random();
            return GetAllTemplatesCardsList().ElementAt(random.Next(GetAllTemplatesCardsList().Count));
        }

        public IWebElement GetPreviewButtonByTemplateCardName(string templatecardName)
        {
            var card = GetTemplateCardByName(templatecardName);
            var selector = By.XPath(".//button[@class='card-button']");
            if (!Driver.IsElementInElementDisplayed(card, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Learn More button is not displayed in '{templatecardName}' use case card");
            }
            return card.FindElement(selector);
        }
        public string GetTemplateDescriptionByTemplateCardName(string templatecardName)
        {
            var card = GetTemplateCardByName(templatecardName);
            var selector = By.XPath(".//div[contains(@class,'card-hover')]/p");
            if (!Driver.IsElementInElementDisplayed(card, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"State Information is not displayed in '{templatecardName}' use case card");
            }
            return card.FindElement(selector).Text;
        }
        #endregion

        #region SearchTemplateCardsPage
        //Example: Search Temaplate Card Page
        public IList<IWebElement> GetTemplatesSuggestionsList()
        {
            var selector = By.XPath(".//div[@class='suggestions-container']//p[@class='item']");
            {
                if (!Driver.IsElementInElementDisplayed(CloudTemplates, selector, WebDriverExtensions.WaitTime.Long))
                {
                    throw new Exception("Template suggestions list is not displayed");
                }
                return CloudTemplates.FindElements(selector);
            }
        }
        public bool DisplayedSearchFlyoutSuggestionList()
        {
            return SearchFlyout.GetAttribute("class").Contains("show");
        }

        public IWebElement GetTemplatesSearchListByName(string templatesSearchListName)
        {
            return GetTemplatesSuggestionsList().FirstOrDefault(x => x.Text.Equals(templatesSearchListName));
        }

        public IList<IWebElement> GetTemplateListsFromSearchResults()
        {
            var selector = By.XPath(".//div[@class='result-card__front']/p");
            {
                if (!Driver.IsElementInElementDisplayed(SearchResults, selector, WebDriverExtensions.WaitTime.Short))
                {
                    throw new Exception("Template list is not displayed");
                }
                return SearchResults.FindElements(selector).ToList();
            }
        }
        #endregion
    }
}