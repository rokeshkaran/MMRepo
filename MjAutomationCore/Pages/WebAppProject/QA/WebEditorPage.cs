using AutomationUtils.Utils;
using MjAutomationCore.Base;
using MjAutomationCore.Extensions;
using OpenQA.Selenium;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;

namespace MjAutomationCore.Pages.WebAppProject.QA
{
    class WebEditorPage : SeleniumBasePage
    {

        #region XpathSelectors

        public string BorderWithoutQuickAddButtonsOnTopic = "(.//following::*[@class='selection']//*[@stroke-opacity][@stroke])[2] | (.//following::*[@class='selection']//*[@stroke-opacity][@stroke])";

        public string TopicParentClass = ".//ancestor::*[@data-type='mindjet.ModernTopic']";

        public string Boundaries = ".//*[@class='boundaries']//*[contains(@class,'boundary')]";

        public string BorderHighlight = ".//ancestor::*[contains(@class,'cells')]/following-sibling::*[@class='selection']/*[contains(@class,'joint-canvas-selection-frame')]";

        public string DateInfobox = "./ancestor::*[@model-id]//*[@class='infobox']";

        public string RelationshipInTopic = ".//following::*[@class='highlight-box']";

        public string FillColorInTopic = ".//ancestor::*[@model-id]//*[@class='topic-shape']";

        public string AreaTopic = ".//ancestor::*[contains(@data-type,'Topic')]";

        public string Canvas = ".//div[@class='joint-paper-scroller joint-theme-default']";

        public string GetTitleOfShape = ".//*[@class='v-line']";

        public string GetParametersShape = "./*[@stroke-dasharray]";

        public string GetMainSmartShapeParameters = "./*[local-name()='rect' and not(contains(@class, 'non-resizable'))] | //*[local-name()='path' and contains(@class, 'background-funnel')]";

        public string GetSmartShapeLines = ".//*[local-name()='path' and contains(@fill, 'none')]";

        public string ResourceRemoveButton = ".//following-sibling::*[@class='remove-resource']";

        public string TagRemoveButton = ".//following-sibling::*[@class='remove-tag']";

        public string TagLabel = "./preceding-sibling::*[@class='tag-label']";

        public string ThemeTransparency = "./ancestor::*[contains(@data-type,'Topic')]/*[@transform]/*[@opacity]";

        public string ShapePath = ".//*[@class='non-resizable']";

        public string TopicSelectedResizeBySide = ".//*[contains(@selected-topic-id,'{0}')]//*[contains(@class,'mm-selection-resize')][contains(@data-direction,'{1}')]";

        public string TopicImage = "(./parent::*/following-sibling::*/*[@class='topic-image']) | (./parent::*/following-sibling::*[@class='topic-image']) | (./ancestor::*/following-sibling::*/*[@class='topic-image']) | (./ancestor::*/following-sibling::*[@class='topic-image'])";

        public string TopicThumbnailImageButton = "./parent::*//*[@class='thumbnail-button']";

        public string TopicImageSelectedBorder = ".//ancestor::*[contains(@class,'cells')]/following-sibling::*[@class='selection']/*[contains(@class,'joint-canvas-selection-frame')]/*[contains(@class,'mm-selection-drag')][3]";

        public string TopicImageHoverBorder = "(.//ancestor::*[contains(@class,'cells')]/following-sibling::*[@class='selection']/*[contains(@class,'joint-canvas-selection-frame')]//.)[3]";

        public string TopicImageSelectedBorderByTopicId(string topicId)
        {
            var selector = $".//*[@class='selection']//*[contains(@selected-topic-id, '{topicId}')]/*[@class='mm-selection-drag mm-image-selection']";
            return selector;
        }

        public string TopicImageHoverBorderByTopicId(string topicId)
        {

            var selector = $".//ancestor::*[contains(@class,'cells')]/following-sibling::*[@class='selection']//*[contains(@lightly-selected-topic-id,'{topicId}')]/*[@class='mm-image-selection']";
            return selector;
        }
        public string TopicBorderPrimaryHighlightedByTopicId(string topicId)
        {
            var selector = $".//ancestor::*[contains(@class,'cells')]/following-sibling::*[@class='selection']/*[contains(@selected-topic-id,'{topicId}')]/*[@class='mm-selection-drag'][2]";
            return selector;
        }

        public string TopicBorderSecondaryHighlightedByTopicId(string topicId)
        {
            var selector = $".//ancestor::*[contains(@class,'cells')]/following-sibling::*[@class='selection']/*[contains(@lightly-selected-topic-id,'{topicId}')]/*[1]";
            return selector;
        }
        #endregion

        #region Elements
        [FindsBy(How = How.XPath, Using = ".//*[contains(@class,'joint-eye-dropper')]")]
        public IWebElement MagnifierCursor { get; set; }

        [FindsBy(How = How.XPath, Using = ".//*[@class='background-objects']/*[contains(@class,'joint-background-object')]")]
        public IList<IWebElement> BackgroundObjectsOnPage { get; set; }

        [FindsBy(How = How.XPath, Using = ".//*[@class='background-objects']/*[contains(@class,'joint-background-object')]/*[contains(@class,'ProseMirror')]")]
        public IList<IWebElement> TextBoxesOnPage { get; set; }

        [FindsBy(How = How.XPath, Using = ".//*[@class='background-objects']/*[contains(@class,'joint-background-object')]//*[@contenteditable='true']")]
        public IWebElement CursorInTextBox { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='paper-scroller-background']//div[contains(@class,'bg-free-transform')]")]
        public IWebElement BackgroundObjectBorder { get; set; }

        [FindsBy(How = How.XPath, Using = ".//ancestor::div[@class='paper-scroller-background']//div[contains(@class,'bg-free-transform')]/div[@data-position]")]
        public IList<IWebElement> PointsInBorderShape { get; set; }

        [FindsBy(How = How.XPath, Using = ".//*[@class='relationship-label-group']//*[contains(text(),'Label')]")]
        public IWebElement RelationshipLabel { get; set; }

        [FindsBy(How = How.XPath, Using = ".//*[@class='selection']/*")]
        public IList<IWebElement> BackgroundObjectList { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'joint-paper-scroller joint-theme-default transition-in-progress') and @data-cursor='move']")]
        public IWebElement TopicAnimationTransition { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'joint-paper-scroller joint-theme') and @data-cursor='grab']")]
        public IWebElement HandCursor { get; set; }

        [FindsBy(How = How.XPath, Using = ".//*[@class='background-objects']/*[contains(@class,'joint-background-object joint-theme-default')]/*[@preserveAspectRatio='none']")]
        public IList<IWebElement> ImageOnCanvas { get; set; }

        [FindsBy(How = How.XPath, Using = ".//*[@class='search-highlights']/*")]
        public IList<IWebElement> SearchHighlightsList { get; set; }

        [FindsBy(How = How.XPath, Using = ".//*[@class='coeditor-remote-cursor']")]
        public IWebElement CoeditorCursor { get; set; }

        [FindsBy(How = How.XPath, Using = ".//img[contains(@src,'assets_add_relationship.svg')]")]
        public IWebElement RelationshipIcon { get; set; }

        [FindsBy(How = How.XPath, Using = ".//*[@shape-type='line-legacy']")]
        public IList<IWebElement> AddedSubtopics { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='tree-layout-box translate']")]
        public IWebElement SelectedTopicAttachedMouse { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='joint-paper joint-theme-default']//*[@joint-selector='cells']/*")]
        public IWebElement ShapeTopic { get; set; }

        [FindsBy(How = How.XPath, Using = ".//*[contains(@class,'content-text interactive')][contains(@contenteditable,'true')]")]
        public IWebElement SelectTextInTopic { get; set; }

        [FindsBy(How = How.XPath, Using = ".//*[contains(@class,'relationship')]/*[@class='relationship-path']")]
        public IWebElement RelationshipOnTopics { get; set; }

        [FindsBy(How = How.XPath, Using = ".//*[@class='relationships']//*[name()='g' and contains(@class,'relationship')]")]
        public IList<IWebElement> RelationshipLinesOnCanvas { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@data-type,'sub-menu')]//div[@class='scroll-content']")]
        public IWebElement ShareContentMenu { get; set; }

        [FindsBy(How = How.XPath, Using = ".//*[@class='relationship non-interactive']/parent::*[@class='relationships']/following-sibling::*[@class='selection']//*[@class='joint-path-editor joint-theme-default']")]
        public IWebElement RelationshipLineSelected { get; set; }

        [FindsBy(How = How.XPath, Using = ".//*[contains(@class,'joint-theme-default')]/*[@class='anchor-point']")]
        public IList<IWebElement> RelationshipsEndpointOnTopic { get; set; }

        [FindsBy(How = How.XPath, Using = ".//*[@class='joint-path-editor joint-theme-default']//*[@class='control-point']")]
        public IList<IWebElement> RelationshipsEndpointOnHandlebars { get; set; }

        [FindsBy(How = How.XPath, Using = ".//*[@selected-topic-id]/*[@class='mm-selection-handle']")]
        public IList<IWebElement> JoinBorder { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='modal']")]
        public IWebElement ModalPopupOnPage { get; set; }

        [FindsBy(How = How.XPath, Using = ".//*[@class='btn-expand-text interactive']")]
        public IList<IWebElement> TopicCollapseState { get; set; }

        [FindsBy(How = How.XPath, Using = ".//*[@data-type='mindjet.ModernTopic']")]
        public IList<IWebElement> TopicList { get; set; }

        [FindsBy(How = How.XPath, Using = ".//*[@class='handles']")]
        public IWebElement FlowChartModeHandlesMenu { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'resizable-handle')]")]
        public IWebElement SidePanelResizableHandle { get; set; }
        #endregion

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By>
            { };
        }

        public Point GetRelationShipPointLocation()
        {
            return RelationshipsEndpointOnTopic.First().Location;
        }

        public IWebElement GetBackgroundImage(IWebElement background)
        {
            var selector = By.XPath($".//div[contains(@style,'image')]");
            if (!Driver.IsElementInElementExists(background, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception("Background does not contain image");
            }
            return background.FindElement(selector);
        }

        public IWebElement GetIconByShapeNameInHandlesMenu(string shape)
        {
            var selector = By.XPath($".//*[@data-action='{shape}']//*[@class='slice']");
            if (!Driver.IsElementInElementDisplayed(FlowChartModeHandlesMenu, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Topic shape '{shape}' is not displayed in Handles menu on canvas");
            }
            return FlowChartModeHandlesMenu.FindElement(selector);
        }

        public bool IsBackgroundImageDisplayed(IWebElement background)
        {
            try
            {
                return GetBackgroundImage(background).Displayed();
            }
            catch
            {
                return false;
            }
        }

        public string GetTopicShapeByTopicName(string topicName)
        {
            var topicModelId = GetTopicIdByTopicName(topicName);
            var selector = $".//*[@model-id='{topicModelId}']";
            return Driver.FindElement(By.XPath(selector)).GetAttribute("shape-type");
        }

        public IWebElement GetButtonInModalPopup(string button)
        {
            var selector = By.XPath($".//div[@class='modal']/div[@class='buttons']/button[text()='{button}']");
            return Driver.FindElement(selector);
        }

        public IWebElement GetCollapseButtonByTopic(string topicName)
        {
            var topicModelId = GetTopicIdByTopicName(topicName);
            var selector = By.XPath($".//*[@model-id='{topicModelId}']//*[contains(@class,'btn-expand-text interactive')]");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception("Collapsed button not found");
            }
            return Driver.FindElement(selector);
        }

        public bool DisplayedCountSubtopics(string text)
        {
            var selector = By.XPath($".//*[@class='btn-expand-text interactive']/*[text()='{text}']");
            return Driver.IsElementDisplayed(selector);
        }

        public IWebElement GetCountSubtopics(string text)
        {
            var selector = By.XPath($".//*[@class='btn-expand-text interactive']/*[text()='{text}']");
            Driver.WaitForElementToBeDisplayed(selector);
            return Driver.FindElement(selector);
        }

        public IWebElement GetPlusButtonOnSelectedTopicById(string topicId, string buttonArrow)
        {
            var selector = By.XPath($".//*[contains(@class,'joint-theme') and @selected-topic-id='{topicId}']//*[@data-position='{buttonArrow}']");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Long))
                throw new Exception($"Arrow on selected topic was not displayed");

            return Driver.FindElement(selector);
        }

        public bool DisplayedTextInTopic(string text)
        {
            var partOfSelector = text.Split(' ').Aggregate(string.Empty, (current, s) => current + $"[contains(text(),'{s}')]");
            var selector = By.XPath($".//*[contains(@class,'content-text')]//*{partOfSelector}");
            try
            {
                return Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Second);
            }
            catch
            {
                return false;
            }
        }

        public IWebElement GetTopicInfobox(string topicName)
        {
            var selector = By.XPath("./ancestor::*[contains(@data-type,'Topic')]//*[@class='info']");
            var topic = GetTopicByName(topicName);
            if (!Driver.IsElementInElementDisplayed(topic, selector, WebDriverExtensions.WaitTime.Second))
            {
                throw new Exception($"Topic '{topicName}' Infobox is not displayed");
            }
            return topic.FindElement(selector);
        }

        public IWebElement GetTopicByName(string topicName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Long)
        {
            var text = string.Empty;
            if (topicName.Any(Char.IsWhiteSpace))
            {
                text = topicName.Split(' ').Aggregate(string.Empty, (current, s) => current + $"[contains(text(),'{s}')]");
            }
            else
            {
                text = topicName.Split(' ').Aggregate(string.Empty, (current, s) => current + $"[text()='{s}']");
            }

            var selector = By.XPath($".//*[contains(@class,'content-text interactive')][not(contains(@class,'joint-tip-tap-editor'))]//*{text}[1]");

            if (!Driver.IsElementExists(selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Topic '{topicName}'is not displayed");
            }

            var topic = Driver.FindElement(selector);
            //Remove character 160 which is Non-breaking space
            var topicText = topic.Text.Replace('\u00A0', ' ');

            Verify.AreEqual(topicName, topicText, "Incorrect topic name");
            return topic;
        }

        public bool DisplayedTopicOnCanvas(string topicName)
        {
            try
            {
                return Driver.IsElementDisplayed(GetTopicByName(topicName, WebDriverExtensions.WaitTime.Second));
            }
            catch
            {
                return false;
            }
        }

        public IList<IWebElement> GetTopicCountByName(string topicName)
        {
            var text = topicName.Split(' ').Aggregate(string.Empty, (current, s) => current + $"[contains(text(),'{s}')]");
            var selector = By.XPath($".//*[contains(@class,'content-text interactive')][not(contains(@class,'joint-tip-tap-editor'))]//span{text}");

            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Long))
            {
                throw new Exception($"{topicName} topic was not clicked");
            }

            var topic = Driver.FindElement(selector);
            //Remove character 160 which is Non-breaking space
            var topicText = topic.Text.Replace('\u00A0', ' ');

            Verify.AreEqual(topicName, topicText, "Incorrect topic name");
            return Driver.FindElements(selector);
        }

        public IList<IWebElement> GetSubtopicCountByName(string subtopicName)
        {
            var text = subtopicName.Split(' ').Aggregate(string.Empty, (current, s) => current + $"[contains(text(),'{s}')]");
            var selector = By.XPath($".//*[@shape-type='line-legacy']//*{text}");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Long))
            {
                throw new Exception($"{subtopicName} topic was not clicked");
            }

            var topic = Driver.FindElement(selector);
            //Remove character 160 which is Non-breaking space
            var topicText = topic.Text.Replace('\u00A0', ' ');

            Verify.AreEqual(subtopicName, topicText, "Incorrect topic name");
            return Driver.FindElements(selector);
        }

        public IWebElement GetButtonExpandSubtopic(string value)
        {
            var selector = By.XPath($".//*[@data-count='{value}']/*[@class='btn-expand-path interactive']");
            Driver.WaitForElementToBeDisplayed(selector);
            return Driver.FindElement(selector);
        }

        public IWebElement GetButtonByNameInContextMenuShare(string buttonName)
        {
            var selector = By.XPath($".//div[@class='scroll-content']/div[text()='{buttonName}']");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Long))
                throw new Exception($"{buttonName} was not clicked in popup");
            return Driver.FindElement(selector);
        }

        public IWebElement GetMessagee(string text)
        {
            var selector = By.XPath($".//div[@class='wrapper']/span[text()='{text}']");
            {
                if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Long))
                    throw new Exception($"Messagee {text} is not displayed");
            }
            return Driver.FindElement(selector);
        }

        public bool IsMessageDisplayed(string text)
        {
            try
            {
                return Driver.IsElementDisplayed(GetMessagee(text));
            }
            catch
            {
                return false;
            }
        }

        public IWebElement GetSubscribeLink(string text)
        {
            var selector = By.XPath($".//div[@class='trial-message']//span[@class='trial-message-subscribe-link'][text()='{text}']");
            return Driver.FindElement(selector);
        }

        public List<IWebElement> GetBoundariesOnCanvas()
        {
            var selector = By.XPath(Boundaries);
            {
                if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Short))
                    throw new Exception("Boundary is not displayed on Canvas");
            }
            return Driver.FindElements(By.XPath(Boundaries)).ToList();
        }

        public IWebElement GetTopicBoundaryBody(string topicName)
        {
            var topicId = GetTopicByName(topicName).FindElement(By.XPath(TopicParentClass)).GetAttribute("model-id");
            return (GetBoundariesOnCanvas().First(x => x.GetAttribute("boundary-topic-id").Equals(topicId))).FindElement(By.XPath($"./*[@joint-selector='boundaryBody']"));
        }

        public bool ValidateTopicBoundaryBodyColor(string topicName, string expectedColor)
        {
            var actualColor = GetTopicBoundaryBody(topicName).GetAttribute("fill");
            return actualColor.Equals(expectedColor);
        }

        public string GetTopicBoundaryOpacity(string topicName)
        {
            var topicModelId = GetTopicIdByTopicName(topicName);
            return GetBoundariesOnCanvas().First(x => x.GetAttribute("boundary-topic-id").Equals(topicModelId)).GetAttribute("opacity");
        }

        public bool IsTopicLocatedInBoundary(string topicName)
        {
            var topicId = GetTopicByName(topicName).FindElement(By.XPath(TopicParentClass)).GetAttribute("model-id");
            if (!Driver.IsElementDisplayed(By.XPath(Boundaries), WebDriverExtensions.WaitTime.Short))
            {
                //return false since no boundary is present on Canvas
                return false;
            }
            return GetBoundariesOnCanvas().Any(x => x.GetAttribute("boundary-topic-id").Equals(topicId));
        }

        public bool IsSubTopicOfTopic(string subtopicName, string topicName)
        {
            var selector = By.XPath($".//*[@source-id='{GetTopicIdByTopicName(topicName)}'][@target-id='{GetTopicIdByTopicName(subtopicName)}']");
            {
                if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Medium))
                    throw new Exception($"Topic '{subtopicName}' is not a subtopic of topic '{topicName}'");
            }
            return true;
        }

        public string GetTopicIdByTopicName(string topicName)
        {
            return GetTopicByName(topicName).FindElement(By.XPath(TopicParentClass)).GetAttribute("model-id");
        }

        public IWebElement GetTopicCoeditingFrameByTopicName(string topicName)
        {
            var topicModelId = GetTopicIdByTopicName(topicName);
            var selector = By.XPath($".//*[@id='{topicModelId}']");
            {
                if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Medium))
                    throw new Exception($"Topic '{topicName}' is not bounded by coediting frame");
            }
            return Driver.FindElement(selector);
        }

        public string GetTopicCoeditingFrameUsername(string topicName)
        {
            var topicModelId = GetTopicIdByTopicName(topicName);
            var selector = By.XPath($".//*[@id='{topicModelId}']//*[@class='v-line']");
            {
                if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Short))
                    throw new Exception($"User name is not displayed in topic '{topicName}' Coediting frame");
            }
            return Driver.FindElement(selector).Text.Trim(new Char[] { '…' });
        }

        public bool IsLockIconDisplayedInTopicCoeditingFrame(string topicName)
        {
            var topicModelId = GetTopicIdByTopicName(topicName);
            var selector = By.XPath($".//*[@id='{topicModelId}']/*[@href]");
            {
                if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Short))
                    throw new Exception($"Lock icon is not displayed in topic '{topicName}' Coediting frame");
            }
            return Driver.FindElement(selector).Displayed();
        }

        public bool IsTopicNameOnlyDisplayedInTopic(string topicName)
        {
            var topicModelId = GetTopicIdByTopicName(topicName);
            var selector = By.XPath($".//*[@model-id='{topicModelId}']//*[contains(@class,'content-text interactive')]/parent::*/parent::*//*[contains(@class,'topic-icon') or contains(@class,'topic-image')]");
            //If selector return true, icon or image are displayed next to topic name
            if (Driver.IsElementExists(selector, WebDriverExtensions.WaitTime.Short))
            {
                return false;
            }
            return true;
        }

        public IWebElement GetQuickAddButtonInTopicCoeditingFrame(string topicName, string position)
        {
            var topicModelId = GetTopicIdByTopicName(topicName);
            var selector = By.XPath($".//*[@id='{topicModelId}']//*[@class='mm-selection-handle'][@data-position='{position}']");
            {
                if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Short))
                    throw new Exception($"'{position}'Quick Add button is not displayed in topic '{topicName}' Coediting frame");
            }
            return Driver.FindElement(selector);
        }

        public void DropImageToTopicSideByTopicName(string side, string topicName, int offsetX, int offsetY)
        {
            var topicModelId = GetTopicIdByTopicName(topicName);
            if (side == "left" || side == "right")
            {
                var element = Driver.FindElement(By.XPath($".//*[@data-topic='{topicModelId}'][@data-direction='{side}']"));
                Driver.MoveByOffset(1, 0, 0);
                Driver.ActionMoveToElement(element);
                Driver.MoveByOffsetAndClick(offsetX, offsetY);
            }
            else
            {
                if (side == "top")
                {
                    Driver.MoveByOffsetAndClick(offsetX, offsetY);
                }
                else
                {
                    Driver.MoveByOffsetAndClick(offsetX, offsetY);
                }
            }
        }

        public IWebElement GetTopicBySubTextAndModelId(string modelId, string subText)
        {
            var selector = By.XPath($".//*[contains(@model-id,'{modelId}')]//*[contains(text(),'{subText}')]");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Topic with text '{subText}' is not displayed");
            }
            return Driver.FindElement(selector);
        }

        public IWebElement GetTopicConnectionLineById(string modelId)
        {
            var selector = By.XPath($".//*[@target-id='{modelId}']//*[@class='connection']");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Long))
            {
                throw new Exception($"topic with id '{modelId}' connection line  not found");
            }
            return Driver.FindElement(selector);
        }

        public IWebElement GetTopicCostByTopicId(string modelId, string cost)
        {
            var selector = By.XPath($".//*[@model-id='{modelId}']//*[@class='cost']//*[@class='cost-icon']/following-sibling::*/*[text()='{cost}']");
            return Driver.FindElement(selector);
        }

        public bool IsCostDisplayedInTopic(string modelId, string cost)
        {
            try
            {
                return Driver.IsElementDisplayed(GetTopicCostByTopicId(modelId, cost), WebDriverExtensions.WaitTime.Short);
            }
            catch
            {
                return false;
            }
        }

        public IWebElement GetTopicByName(string topicName)
        {
            var text = string.Empty;
            if (topicName.Any(Char.IsWhiteSpace))
            {
                text = topicName.Split(' ').Aggregate(string.Empty, (current, s) => current + $"[contains(text(),'{s}')]");
            }
            else
            {
                text = topicName.Split(' ').Aggregate(string.Empty, (current, s) => current + $"[text()='{s}']");
            }
            
            var selector = By.XPath($".//*[contains(@class,'content-text interactive')][not(contains(@class,'joint-tip-tap-editor'))]//*{text}[1]");

            if (!Driver.IsElementExists(selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Topic '{topicName}' is not displayed");
            }

            var topic = Driver.FindElement(selector);
            //Remove character 160 which is Non-breaking space
            var topicText = topic.Text.Replace('\u00A0', ' ');

            Verify.AreEqual(topicName, topicText, $"Incorrect topic name. Expected:'{topicName}'. Actual: '{topicText}'");
            return topic;
        }

        public IWebElement GetTopicLineBreak(string topicNameFirstPart, string topicNameSecondPart)
        {
            var selector = By.XPath($".//*[contains(@class,'content-text interactive')][not(contains(@class,'joint-tip-tap-editor'))]//span[text()='{topicNameFirstPart}']/following-sibling::br/following-sibling::span[text()='{topicNameSecondPart}']");
            return Driver.FindElement(selector);
        }

        public IWebElement GetTopicByText(string topicText)
        {
            var selector = By.XPath($".//p[contains(., \"{topicText}\")]");
            if (!Driver.IsElementExists(selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Topic with text '{topicText}' is not displayed.");
            }
            return Driver.FindElement(selector);
        }

        public bool DisplayedTopicByName(string topicName)
        {
            var text = topicName.Split(' ').Aggregate(string.Empty, (current, s) => current + $"[contains(text(),'{s}')]");
            var selector = By.XPath($".//*[contains(@data-type,'Topic')]//*{text}");
            return Driver.IsElementDisplayed(selector);
        }

        public IWebElement GetTextContentInTopicByName(string topicName)
        {
            var selector = By.XPath($"./ancestor::*[contains(@class,'content-text interactive')]");
            var topic = GetTopicByName(topicName);
            if (!Driver.IsElementInElementDisplayed(topic, selector, WebDriverExtensions.WaitTime.Long))
            {
                throw new Exception($"Text content is not displayed in '{topicName}' topic");
            }

            return topic.FindElement(selector);
        }

        public IWebElement GetTextContainerByTopicByName(string topicName)
        {
            var selector = By.XPath($"./ancestor::*[contains(@class,'content-text interactive')]/parent::*");
            var topic = GetTopicByName(topicName);
            if (!Driver.IsElementInElementDisplayed(topic, selector, WebDriverExtensions.WaitTime.Long))
            {
                throw new Exception($"Text content is not displayed in '{topicName}' topic");
            }
            return topic.FindElement(selector);
        }

        public bool IsBorderDisplayedInTopic(string topicName)
        {
            var selector = By.XPath("./ancestor::*[@class='joint-layers']//*[contains(@class,'selection-frame joint-theme-map')]");
            return GetTopicByName(topicName).IsElementExists(selector);
        }

        public string GetParametersForTitleOfShape(string title)
        {
            var text = title.Split(' ').Aggregate(string.Empty, (current, s) => current + $"[contains(text(),'{s}')]");
            return $".//*[@class='v-line']{text}/parent::*[@transform]";
        }

        public string GetPointPositionOnShape(string pointPosition)
        {
            var selector = $".//ancestor::div[@class='paper-scroller-background']//div[contains(@class,'bg-free-transform')]/div[@data-position='{pointPosition}']";
            return selector;
        }

        public string GetRotationArrowInShape(string arrowPosition)
        {
            var selector = $".//ancestor::div[@class='paper-scroller-background']//div[contains(@class,'bg-free-transform')]/div[contains(@class,'rotate')][contains(@class,'{RotationArrow(arrowPosition)}')]";
            return selector;
        }

        public bool IsGreenHighlightedFrameDisplayed(string coordinates)
        {
            var selection = BackgroundObjectList.First(x => x.GetAttribute("transform").Equals(coordinates));
            return selection.GetCssValue("stroke").Equals("rgb(99, 165, 88)");
        }

        public static string RotationArrow(string arrowPosition)
        {
            switch (arrowPosition)
            {
                case ("top-left"):
                    return "nw";
                case ("top-right"):
                    return "ne";
                case ("bottom-left"):
                    return "sw";
                case ("bottom-right"):
                    return "se";
                default:
                    {
                        throw new Exception($"'{arrowPosition}' arrow position NOT FOUND");
                    }
            }
        }

        public IWebElement GetImageInTopic(string topicName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Medium)
        {
            var selector = By.XPath(TopicImage);
            var topic = GetTopicByName(topicName);
            if (!Driver.IsElementInElementDisplayed(topic, selector, waitTime))
            {
                throw new Exception($"Image is not displayed in '{topicName}' topic");
            }
            return topic.FindElement(selector);
        }

        public IWebElement GetImageIconInTopicInfobox(string topicName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Second)
        {
            var selector = By.XPath(".//*[@class='image']//*[contains(@class,'topic-image-icon')]");
            var topicInfobox = GetTopicInfobox(topicName);
            if (!Driver.IsElementInElementDisplayed(topicInfobox, selector, waitTime))
            {
                throw new Exception($"Image icon is not displayed in '{topicName}' topic infobox");
            }
            return topicInfobox.FindElement(selector);
        }

        public bool IsImageIconDisplayedInTopicInfobox(string iconName, string topicName)
        {
            try
            {
                return GetImageIconInTopicInfobox(topicName, WebDriverExtensions.WaitTime.Second).GetAttribute("xlink:href").Contains(iconName);
            }
            catch
            {
                return false;
            }
        }

        public string GetImageTypeInTopic(string topicName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Medium)
        {
            return GetImageInTopic(topicName).GetCssValue("clip-path") == "none" ? "Standard" : "Thumbnail";
        }

        public bool IsImageDisplayedInTopic(string topicName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Medium)
        {
            var selector = By.XPath(TopicImage);
            return Driver.IsElementInElementDisplayed(GetTopicByName(topicName), selector, waitTime);
        }

        public IWebElement GetIconInTopic(string iconName, string topicName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Medium)
        {
            var selector = By.XPath($"./ancestor::*[contains(@data-type,'Topic')]//*[@class='topic-icon'][contains(@data-tooltip,'{iconName}')]");
            var topic = GetTopicByName(topicName);
            if (!Driver.IsElementInElementDisplayed(topic, selector, waitTime))
            {
                throw new Exception($"Topic icon '{iconName}' is not displayed in '{topicName}' topic");
            }
            return topic.FindElement(selector);
        }

        public IWebElement GetIconInTopicInfobox(string iconName, string topicName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Medium)
        {
            var selector = By.XPath($".//*[@*[contains(.,'{iconName}')]]");
            var topicInfobox = GetTopicInfobox(topicName);
            if (!Driver.IsElementInElementDisplayed(topicInfobox, selector, waitTime))
            {
                throw new Exception($"Topic icon '{iconName}' is not displayed in '{topicName}' topic infobox");
            }
            return topicInfobox.FindElement(selector);
        }

        public IWebElement GetIconNameAndValueInTopicInfobox(string iconName, string iconValue, string topicName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Short)
        {
            var text = string.Empty;
            if (iconValue.Any(Char.IsWhiteSpace))
            {
                text = iconValue.Split(' ').Aggregate(string.Empty, (current, s) => current + $"[contains(text(),'{s}')]");
            }
            else
            {
                text = iconValue.Split(' ').Aggregate(string.Empty, (current, s) => current + $"[text()='{s}']");
            }
            var selector = By.XPath($".//*[@*[contains(.,'{iconName}')] and contains(@data-tooltip, '{iconValue}')] | .//*[@*[contains(.,'{iconName}')]]/following-sibling::*/*{text}");
            var topicInfobox = GetTopicInfobox(topicName);
            if (!Driver.IsElementInElementDisplayed(topicInfobox, selector, waitTime))
            {
                throw new Exception($"Topic icon '{iconName}' with value '{iconValue}' is not displayed in '{topicName}' topic infobox");
            }
            return topicInfobox.FindElement(selector);
        }

        public IWebElement GetIconNameAndValueInTopic(string iconName, string iconValue, string topicName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Short)
        {
            var text = string.Empty;
            if (iconValue.Any(Char.IsWhiteSpace))
            {
                text = iconValue.Split(' ').Aggregate(string.Empty, (current, s) => current + $"[contains(text(),'{s}')]");
            }
            else
            {
                text = iconValue.Split(' ').Aggregate(string.Empty, (current, s) => current + $"[text()='{s}']");
            }
            var selector = By.XPath($"./ancestor::*[contains(@data-type,'Topic')]//*[not(@class='info')]//*[@*[contains(.,'{iconName}')] and contains(@data-tooltip, '{iconValue}')] | ./ancestor::*[contains(@data-type,'Topic')]//*[not(@class='info')]//*[@*[contains(.,'{iconName}')]]/following-sibling::*/*{text}");
            var topic = GetTopicByName(topicName);
            if (!Driver.IsElementInElementDisplayed(topic, selector, waitTime))
            {
                throw new Exception($"Topic icon '{iconName}' with value '{iconValue}' is not displayed in '{topicName}' topic");
            }
            return topic.FindElement(selector);
        }

        public IWebElement GetIconNameAndValueTransformInTopicInfobox(string iconName, string iconValue, string topicName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Short)
        {
            var selector = By.XPath("./parent::*/parent::*");
            if (!Driver.IsElementInElementDisplayed(GetIconNameAndValueInTopicInfobox(iconName, iconValue, topicName), selector, waitTime))
            {
                throw new Exception($"Topic icon '{iconName}' with value '{iconValue}' in '{topicName}' topic infobox has no transform");
            }
            return GetIconNameAndValueInTopicInfobox(iconName, iconValue, topicName).FindElement(selector);
        }

        public bool IsIconDisplayedInTopicInfobox(string iconName, string topicName)
        {
            try
            {
                return GetIconInTopicInfobox(iconName, topicName, WebDriverExtensions.WaitTime.Second).Displayed();
            }
            catch
            {
                return false;
            }
        }

        public bool IsIconDisplayedInTopic(string iconName, string topicName)
        {
            try
            {
                return GetIconInTopic(iconName, topicName, WebDriverExtensions.WaitTime.Second).Displayed();
            }
            catch
            {
                return false;
            }
        }

        public bool IsLockedIconDisplayedInTopic(string iconName, string topicName)
        {
            return GetIconInTopic(iconName, topicName, WebDriverExtensions.WaitTime.Second).GetAttribute("xlink:href").Contains("ro");
        }

        public bool IsTagTextDisplayedInStyleInTopic(string tagName, string textStyle, string topicName)
        {
            return GetTagInTopicInfobox(tagName, topicName).FindElement(By.XPath(TagLabel)).GetAttribute("font-family").Contains(textStyle);
        }

        public IWebElement GetTagInTopicInfobox(string tagName, string topicName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Medium)
        {
            var selector = By.XPath($"./ancestor::*[contains(@data-type,'Topic')]//*[@class='tag'][contains(@data-tag-description,'{tagName}')]");
            var topic = GetTopicByName(topicName);
            if (!Driver.IsElementInElementDisplayed(topic, selector, waitTime))
            {
                throw new Exception($"Tag '{tagName}' is not displayed in '{topicName}' topic infobox");
            }
            return topic.FindElement(selector);
        }

        public bool IsTagDisplayedInTopicInfobox(string tagName, string topicName)
        {
            try
            {
                return GetTagInTopicInfobox(tagName, topicName, WebDriverExtensions.WaitTime.Second).Displayed();
            }
            catch
            {
                return false;
            }
        }

        public List<IWebElement> GetSeparatorsInTopicInfobox(string topicName)
        {
            var selector = By.XPath("./*[@stroke-width='1']");
            return GetTopicInfobox(topicName).FindElements(selector).ToList();
        }

        public List<IWebElement> GetPropertyListInTopicInfobox(string topicName)
        {
            var selector = By.XPath(".//ancestor::*[contains(@data-type,'Topic')]//*[@class='business-data-text' or @class='business-data-color']");
            return GetTopicByName(topicName).FindElements(selector).ToList();
        }

        public IWebElement GetPropertyByNameInTopicInfobox(string propertyName, string topicName)
        {
            return GetPropertyListInTopicInfobox(topicName).First(x => x.Text.Equals(propertyName));
        }

        public bool IsPropertyDisplayedInTopicInfobox(string propertyName, string topicName)
        {
            try
            {
                return Driver.IsElementDisplayed(GetPropertyListInTopicInfobox(topicName).First(x => x.Text.Equals(propertyName)), WebDriverExtensions.WaitTime.Short);
            }
            catch
            {
                return false;
            }
        }

        public IWebElement GetPropertyValueInTopicInfobox(string propertyName, string topicName)
        {
            var topicPropertyName = GetPropertyByNameInTopicInfobox(propertyName, topicName);
            var propertyIndex = GetPropertyListInTopicInfobox(topicName).IndexOf(topicPropertyName);
            var topicPropertyValue = GetPropertyListInTopicInfobox(topicName).ElementAt(propertyIndex + 1);
            return topicPropertyValue;
        }

        public bool DisplayedPropertyValueInTopicInfobox(string propertyValue, string propertyName, string topicName)
        {
            try
            {
                return GetPropertyValueInTopicInfobox(propertyName, topicName).Displayed();
            }
            catch
            {
                return false;
            }
        }

        public string GetAuthorDetailsInTopicInfobox(string authorIcon, string topicName)
        {
            var selector = By.XPath("./following-sibling::*/*[@class='v-line']");
            var authorDetailText = GetAuthorIconInTopicInfobox(authorIcon, topicName).FindElement(selector).Text.Replace('\u00A0', ' ');
            return authorDetailText;
        }

        public IWebElement GetAuthorIconInTopicInfobox(string authorIcon, string topicName)
        {
            var selector = By.XPath(".//ancestor::*[contains(@data-type,'Topic')]//*[@class='author-wrap']/following-sibling::*[@pointer-events]");
            var element = GetTopicByName(topicName).FindElements(selector).FirstOrDefault(e => e.GetAttribute("xlink:href")?.Contains(authorIcon) == true);
            return element;
        }

        public bool IsAuthorDetailsDisplayedByDataRoleInTopicInfobox(string topicName, string dataRole)
        {
            try
            {
                return GetTopicByName(topicName).FindElement(By.XPath($".//ancestor::*[contains(@data-type,'Topic')]//*[@class='author-wrap' and @data-role='{dataRole}']")).Displayed();
            }
            catch
            {
                return false;
            }
        }
        public IWebElement GetResourceInTopicInfobox(string resourceName, string topicName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Medium)
        {
            var selector = By.XPath($"./ancestor::*[contains(@data-type,'Topic')]//*[@class='resource-wrap'][@data-name='{resourceName}' or contains(@data-tooltip,'{resourceName}')]");
            var topic = GetTopicByName(topicName);
            if (!Driver.IsElementInElementDisplayed(topic, selector, waitTime))
            {
                throw new Exception($"Resource '{resourceName}' is not displayed in '{topicName}' topic infobox");
            }

            return topic.FindElement(selector);
        }

        public bool IsResourceDisplayedInTopicInfobox(string resourceName, string topicName)
        {
            try
            {
                return GetResourceInTopicInfobox(resourceName, topicName, WebDriverExtensions.WaitTime.Second).Displayed();
            }
            catch
            {
                return false;
            }
        }

        public IWebElement GetCommentsIconInTopicInfobox(string topicName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Medium)
        {
            var selector = By.XPath("./ancestor::*[contains(@data-type,'Topic')]//*[@class='comments-toggle interactive']");
            var topic = GetTopicByName(topicName);
            if (!Driver.IsElementInElementDisplayed(topic, selector, waitTime))
            {
                throw new Exception($"Comments icon is not displayed in '{topicName}' topic infobox");
            }

            return topic.FindElement(selector);
        }

        public bool IsCommentsIconDisplayedInTopicInfobox(string topicName)
        {
            try
            {
                return GetCommentsIconInTopicInfobox(topicName, WebDriverExtensions.WaitTime.Second).Displayed();
            }
            catch
            {
                return false;
            }
        }

        public IWebElement GetNumberOfCommentsInIcon(string topicName, string numberOfComments)
        {
            var selector = By.XPath($"./following-sibling::*[name()='text']/*[@class='v-line'][text()='{numberOfComments}']");
            var comments = GetCommentsIconInTopicInfobox(topicName);
            if (!Driver.IsElementInElementDisplayed(comments, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Number '{numberOfComments}' is not displayed on comment icon in '{topicName}' topic infobox");
            }

            return comments.FindElement(selector);
        }

        public IWebElement GetAttachmentsIconInTopicInfobox(string topicName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Medium)
        {
            var selector = By.XPath("./ancestor::*[contains(@data-type,'Topic')]//*[contains(@class,'attachment')]");
            var topic = GetTopicByName(topicName);
            if (!Driver.IsElementInElementDisplayed(topic, selector, waitTime))
            {
                throw new Exception($"Attachments icon is not displayed in '{topicName}' topic infobox");
            }
            return topic.FindElement(selector);
        }

        public bool IsAttachmentsIconDisplayedInTopicInfobox(string topicName)
        {
            try
            {
                return GetAttachmentsIconInTopicInfobox(topicName, WebDriverExtensions.WaitTime.Second).Displayed();
            }
            catch
            {
                return false;
            }
        }

        public IWebElement GetHyperlinkIconInTopicInfobox(string topicName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Medium)
        {
            var selector = By.XPath(".//ancestor::*[contains(@data-type,'Topic')]//*[contains(@class,'hyperlinks-toggle interactive is-favicon') or contains(@class,'link-titles')]");
            var topic = GetTopicByName(topicName);
            if (!Driver.IsElementInElementDisplayed(topic, selector, waitTime))
            {
                throw new Exception($"Hyperlink icon is not displayed in '{topicName}' topic infobox");
            }

            return topic.FindElement(selector);
        }

        public bool IsHyperlinkIconDisplayedInTopicInfobox(string topicName)
        {
            try
            {
                return GetHyperlinkIconInTopicInfobox(topicName, WebDriverExtensions.WaitTime.Short).Displayed();
            }
            catch
            {
                return false;
            }
        }

        public IWebElement GetLinkIconFromLinkTitleTextInTopicInfobox(string linkIcon, string linkTitle, string topicName)
        {
            var selector = By.XPath($".//parent::*/preceding-sibling::*[@*[contains(.,'{linkIcon}')]]");
            if (!Driver.IsElementInElementDisplayed(GetLinkTitleTextInTopicInfobox(linkTitle, topicName), selector, WebDriverExtensions.WaitTime.Second))
            {
                throw new Exception($"Link icon '{linkIcon}' is not displayed with Link title with '{linkTitle}' in '{topicName}' topic infobox");
            }
            return GetLinkTitleTextInTopicInfobox(linkTitle, topicName).FindElement(selector);
        }

        public IWebElement GetLinkTitleTextInTopicInfobox(string value, string topicName)
        {
            var text = value.Split(' ').Aggregate(string.Empty, (current, s) => current + $"[contains(.,'{s}')]");
            var selector = By.XPath($".//ancestor::*[contains(@data-type,'Topic')]//*[@class='link-title']{text}");
            var topic = GetTopicByName(topicName);
            if (!Driver.IsElementInElementDisplayed(topic, selector, WebDriverExtensions.WaitTime.Second))

            {
                throw new Exception($"Link title with '{value}' is not displayed in '{topicName}' topic infobox");
            }

            return topic.FindElement(selector);
        }

        public IWebElement GetAttachmentNameInTopicInfobox(string topicName, string value, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Medium)
        {
            var selector = By.XPath($"./ancestor::*[contains(@data-type,'Topic')]//*[name()='text'][@class='attachment-name'][contains(@data-tooltip,'{value}')]");
            var topic = GetTopicByName(topicName);
            if (!Driver.IsElementInElementDisplayed(topic, selector, waitTime))
            {
                throw new Exception($"Attachment name is not displayed in '{topicName}' topic infobox");
            }

            return topic.FindElement(selector);
        }

        public IWebElement GetAttachmentFilenameInTopicInfobox(string value, string topicName)
        {
            var selector = By.XPath($".//*[name()='tspan'][contains(text(),'{value}')]");
            var topicAttachment = GetAttachmentNameInTopicInfobox(topicName, value);
            if (!Driver.IsElementInElementDisplayed(topicAttachment, selector, WebDriverExtensions.WaitTime.Second))

            {
                throw new Exception($"Attachment filename '{value}' is not displayed in '{topicName}' topic infobox");
            }

            return topicAttachment.FindElement(selector);
        }

        public IWebElement GetNotesIconInTopicByName(string topicName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Medium)
        {
            var selector = By.XPath("./ancestor::*[contains(@data-type,'Topic')]//*[@class='notes-toggle interactive']");
            var topic = GetTopicByName(topicName);
            if (!Driver.IsElementInElementDisplayed(topic, selector, waitTime))
            {
                throw new Exception($"Notes icon is not displayed in '{topicName}' topic infobox");
            }

            return topic.FindElement(selector);
        }

        public IWebElement GetNotesTextInTopicByName(string topicName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Medium)
        {
            var selector = By.XPath("./ancestor::*[contains(@data-type,'Topic')]//*[@class='notes-toggle interactive']/following-sibling::*[@font-family]");
            var topic = GetTopicByName(topicName);
            if (!Driver.IsElementInElementDisplayed(topic, selector, waitTime))
            {
                throw new Exception($"Notes text is not displayed in '{topicName}' topic infobox");
            }

            return topic.FindElement(selector);
        }

        public bool IsNotesIconDisplayedInTopicInfobox(string topicName)
        {
            try
            {
                return GetNotesIconInTopicByName(topicName, WebDriverExtensions.WaitTime.Second).Displayed();
            }
            catch
            {
                return false;
            }
        }

        public IWebElement GetNoteTitleTextInTopicInfobox(string value, string topicName)
        {
            var text = value.Split(' ').Aggregate(string.Empty, (current, s) => current + $"[contains(.,'{s}')]");
            var selector = By.XPath($".//ancestor::*[contains(@data-type,'Topic')]//*[@class='notes-preview']//*{text}");
            var topic = GetTopicByName(topicName);
            if (!Driver.IsElementInElementDisplayed(topic, selector, WebDriverExtensions.WaitTime.Second))

            {
                throw new Exception($"Note preview '{value}' is not displayed in '{topicName}' topic infobox");
            }

            return topic.FindElement(selector);
        }

        public IWebElement GetStartDateInTopicInfobox(string startDate, string topicName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Medium)
        {
            var value = startDate.Split(' ').Aggregate(string.Empty, (current, s) => current + $"[contains(text(),'{s}')]");
            var selector = By.XPath($"./ancestor::*[contains(@data-type,'Topic')]//*[contains(@class,'start-date')]/*{value}");
            var topic = GetTopicByName(topicName);
            if (!Driver.IsElementInElementDisplayed(topic, selector, waitTime))
            {
                throw new Exception($"Start date '{startDate}' is not displayed in '{topicName}' topic infobox");
            }

            return topic.FindElement(selector);
        }

        public bool IsStartDateDisplayedInTopicInfobox(string startDate, string topicName)
        {
            try
            {
                return GetStartDateInTopicInfobox(startDate, topicName, WebDriverExtensions.WaitTime.Long).Displayed();
            }
            catch
            {
                return false;
            }
        }

        public IWebElement GetDatePicker()
        {
            var selector = By.XPath(".//div[contains(@class,'task-datepicker')]");
            return Driver.FindElement(selector);
        }

        public IWebElement GetDueDateInTopicInfobox(string dueDate, string topicName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Medium)
        {
            var value = dueDate.Split(' ').Aggregate(string.Empty, (current, s) => current + $"[contains(text(),'{s}')]");
            var selector = By.XPath($"./ancestor::*[contains(@data-type,'Topic')]//*[@class='date due-date']/*{value}");
            var topic = GetTopicByName(topicName);
            if (!Driver.IsElementInElementDisplayed(topic, selector, waitTime))
            {
                throw new Exception($"Due date '{dueDate}' is not displayed in '{topicName}' topic infobox");
            }

            return topic.FindElement(selector);
        }

        public bool IsDueDateDisplayedInTopicInfobox(string dueDate, string topicName)
        {
            try
            {
                return GetDueDateInTopicInfobox(dueDate, topicName, WebDriverExtensions.WaitTime.Medium).Displayed();
            }
            catch
            {
                return false;
            }
        }

        public IWebElement GetDateIconInTopicInfobox(string topicName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Medium)
        {
            var selector = By.XPath($".//ancestor::*[contains(@data-type,'Topic')]//*[@class='date icon']");
            var topic = GetTopicByName(topicName);
            if (!Driver.IsElementInElementDisplayed(topic, selector, waitTime))
            {
                throw new Exception($"Date icon is not displayed in '{topicName}' topic infobox");
            }

            return topic.FindElement(selector);
        }

        public IWebElement GetMilestoneIconInTopicInfobox(string topicName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Medium)
        {
            var selector = By.XPath($".//ancestor::*[contains(@data-type,'Topic')]//*[@class='date icon' and @milestone='true']");
            var topic = GetTopicByName(topicName);
            if (!Driver.IsElementInElementDisplayed(topic, selector, waitTime))
            {
                throw new Exception($"Milestones icon is not displayed in '{topicName}' topic infobox");
            }

            return topic.FindElement(selector);
        }

        public bool IsMilestoneIconDisplayedInTopicInfobox(string topicName)
        {
            try
            {
                return GetMilestoneIconInTopicInfobox(topicName, WebDriverExtensions.WaitTime.Medium).Displayed();
            }
            catch
            {
                return false;
            }
        }

        public IWebElement GetDateInfoInTopicInfobox(string dateInfo, string topicName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Medium)
        {
            var value = dateInfo.Split(' ').Aggregate(string.Empty, (current, s) => current + $"[contains(text(),'{s}')]");
            var selector = By.XPath($"./ancestor::*[contains(@data-type,'Topic')]//*[contains(@class,'date')]/*{value}");
            var topic = GetTopicByName(topicName);
            if (!Driver.IsElementInElementDisplayed(topic, selector, waitTime))
            {
                throw new Exception($"Date info '{dateInfo}' is not displayed in '{topicName}' topic infobox");
            }

            return topic.FindElement(selector);
        }

        public bool IsDateInfoDisplayedInTopicInfobox(string dateInfo, string topicName)
        {
            try
            {
                return GetDateInfoInTopicInfobox(dateInfo, topicName, WebDriverExtensions.WaitTime.Second).Displayed();
            }
            catch
            {
                return false;
            }
        }

        public IWebElement GetEffortInfoInTopicInfobox(string effortInfo, string topicName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Medium)
        {
            var value = effortInfo.Split(' ').Aggregate(string.Empty, (current, s) => current + $"[contains(text(),'{s}')]");
            var selector = By.XPath($"./ancestor::*[contains(@data-type,'Topic')]//*[@class='effort']/*{value}");
            var topic = GetTopicByName(topicName);
            if (!Driver.IsElementInElementDisplayed(topic, selector, waitTime))
            {
                throw new Exception($"Effort info '{effortInfo}' is not displayed in '{topicName}' topic infobox");
            }

            return topic.FindElement(selector);
        }

        public bool IsEffortInfoDisplayedInTopicInfobox(string effortInfo, string topicName)
        {
            try
            {
                return GetEffortInfoInTopicInfobox(effortInfo, topicName, WebDriverExtensions.WaitTime.Second).Displayed();
            }
            catch
            {
                return false;
            }
        }

        public IWebElement GetInfoCardButtonInTopicInfobox(string topicName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Medium)
        {
            var selector = By.XPath(".//*[@class='info-card-button']");
            var topicInfobox = GetTopicInfobox(topicName);
            if (!Driver.IsElementInElementDisplayed(topicInfobox, selector, waitTime))
            {
                throw new Exception($"Three dots button is not displayed in '{topicName}' topic infobox");
            }
            return topicInfobox.FindElement(selector);
        }

        public IWebElement GetInfoCardButtonPosition(string topicName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Medium)
        {
            var selector = By.XPath("./ancestor::*[@transform]/following-sibling::*[@transform]//*[@class='info-card-button']/*[@fill='transparent']");
            var topic = GetTopicByName(topicName);
            if (!Driver.IsElementInElementDisplayed(topic, selector, waitTime))
            {
                throw new Exception($"Three dots button is not displayed in '{topicName}' topic");
            }
            return topic.FindElement(selector);
        }

        public bool IsInfoCardButtonDisplayedInTopicInfobox(string topicName)
        {
            try
            {
                return GetInfoCardButtonInTopicInfobox(topicName, WebDriverExtensions.WaitTime.Second).Displayed();
            }
            catch
            {
                return false;
            }
        }

        public string GetTextAlignPosition(string textAlignPosition)
        {
            switch (textAlignPosition)
            {
                case ("left"):
                    return "start";
                case ("center"):
                    return "center";
                case ("right"):
                    return "right";
                default:
                    {
                        throw new Exception($"'{textAlignPosition}' align position NOT FOUND");
                    }
            }
        }

        public IWebElement GetTextBoxByName(string textValue)
        {
            var selector = By.XPath($".//*[@class='background-objects']/*[contains(@class,'joint-background-object')]//*[text()='{textValue}']");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Textbox with text '{textValue}' is not displayed on canvas");
            }
            return Driver.FindElement(selector);
        }

        public bool ValidateTopicTextSize(IWebElement topic, string expectedSize)
        {
            return topic.GetCssValue("font-size").Contains(expectedSize);
        }

        public bool ValidateTopicTextFontStyle(IWebElement topic, string expectedFontStyle)
        {
            return topic.GetCssValue("font-family").Contains(expectedFontStyle);
        }

        public bool ValidateTopicTextColor(IWebElement topic, string expectedColor)
        {
            return topic.GetCssValue("color").Equals(expectedColor);
        }

        public bool ValidateTopicTextDecorationStyle(IWebElement topic, string fontStyle)
        {
            switch (fontStyle)
            {

                case ("bold"):
                case ("normal"):

                    if (!string.IsNullOrEmpty(topic.GetCssValue("font-weight")))
                    {
                        var cssVal = topic.GetCssValue("font-weight");
                        if (cssVal.Equals("700") && fontStyle.Equals("bold"))//The bold value maps to number 700 as per https://css-tricks.com/almanac/properties/f/font-weight/
                        {
                            return true;
                        }
                        if (cssVal.Equals("400") && fontStyle.Equals("normal"))//The normal value maps to number 400 as per https://css-tricks.com/almanac/properties/f/font-weight/
                        {
                            return true;
                        }
                        else
                        {
                            return cssVal.Equals(fontStyle);
                        }
                    }
                    else
                    {
                        return false;
                    }

                case ("italic"):
                    return CheckItalic(topic);

                case ("underline"):
                case ("strikethrough"):
                case ("line-through"):

                    if (!string.IsNullOrEmpty(topic.GetCssValue("text-decoration")))
                    {
                        var cssVal = topic.GetCssValue("text-decoration");
                        if (fontStyle.Equals("strikethrough"))
                            return cssVal.Contains("line-through");
                        else
                            return cssVal.Contains(fontStyle);
                    }
                    else
                    {
                        return false;
                    }

                case ("bold underline line-through"):
                    return CheckBoldUnderlineLineThrough(topic);

                case ("bold underline line-through italic"):
                    //check if text is bold, underline and line-through
                    if (CheckBoldUnderlineLineThrough(topic))
                    {
                        //check if text is italic
                        var italicSelector = By.XPath("./ancestor::em");
                        var italicParent = topic.FindElement(italicSelector);
                        return CheckItalic(italicParent);
                    }
                    return false;

                case ("none"):
                    if (!string.IsNullOrEmpty(topic.GetCssValue("font-style")))
                    {
                        return topic.GetCssValue("font-style").Equals("normal");
                    }
                    return false;
            }
            return false;
        }
        private bool CheckBoldUnderlineLineThrough(IWebElement topic)
        {
            //check if topic is bold
            var check = 0;
            if (!string.IsNullOrEmpty(topic.GetCssValue("font-weight")))
            {
                var cssVal = topic.GetCssValue("font-weight");
                if (cssVal.Contains("700"))//The bold value maps to number 700 as per https://css-tricks.com/almanac/properties/f/font-weight/
                {
                    check++;
                }
            }

            //check if parent topic is underline
            var underlineSelector = By.XPath("./parent::*");
            var underlineParent = topic.FindElement(underlineSelector);
            if (!string.IsNullOrEmpty(underlineParent.GetCssValue("text-decoration")))
            {
                var cssVal = underlineParent.GetCssValue("text-decoration");
                var test = cssVal.Contains("underline");
                if (cssVal.Contains("underline"))
                {
                    check++;
                }
            }

            //check if parent of parent topic is line-through
            var linethroughSelector = By.XPath("./parent::*/parent::*");
            var linethroughParent = topic.FindElement(linethroughSelector);
            if (!string.IsNullOrEmpty(linethroughParent.GetCssValue("text-decoration")))
            {
                var cssVal = linethroughParent.GetCssValue("text-decoration");
                if (cssVal.Contains("line-through"))
                {
                    check++;
                }
            }

            return check == 3 ? true : false;
        }
        private bool CheckItalic(IWebElement topic)
        {
            if (!string.IsNullOrEmpty(topic.GetCssValue("font-style")))
            {
                return topic.GetCssValue("font-style").Equals("italic");
            }
            else
            {
                return false;
            }
        }

        public Tuple<int, int> TransformExtractedFromString(string transform)
        {
            transform.Replace("translate", "");
            string output = transform.Split('(', ')')[1];
            var xy = output.Split(',');
            //Remove any decimal
            var x = xy[0].Split('.');
            var y = xy[1].Split('.');
            return Tuple.Create(Int32.Parse(x[0]), Int32.Parse(y[0]));
        }

        public IList<string> GetAllRelationshipLinesCssByCssValue(string cssValue)
        {
            List<string> cssValueList = new List<string>();
            foreach (var relshipLine in RelationshipLinesOnCanvas)
            {
                var lineID = relshipLine.GetAttribute("relationship-id");
                var selector = By.XPath($".//*[@class='relationships']//*[@class='relationship'][@relationship-id='{lineID}']/*[@class='relationship-path']");
                cssValueList.Add(Driver.FindElement(selector).GetCssValue($"{cssValue}").ToString());
            }
            return cssValueList;
        }
    }
}