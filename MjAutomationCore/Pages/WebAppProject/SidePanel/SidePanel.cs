using MjAutomationCore.Extensions;
using OpenQA.Selenium;
using SeleniumAutomationUtils.Pages;
using SeleniumAutomationUtils.SeleniumExtensions;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

namespace MjAutomationCore.Pages.WebAppProject.SidePanel
{
    class SidePanel : BaseSidePanelPage, IContextContainer
    {
        public new By Context => By.XPath(".//div[@id='inspector']");

        [FindsBy(How = How.XPath, Using = ".//div[@id='inspector']")]
        public IWebElement SidePanelInspector { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'joint-select-box joint-theme-default text-style')][contains(@class,'text-style-font-family')][not(contains(@class,'rendered'))]")]
        public IList<IWebElement> Properties { get; set; }

        public string ContainerSelector => GetStringByFor(() => SidePanelInspector);

        public string PatternTypesInSelectionField = ".//div[@class='select-box-option-content']/*/*[@stroke-dasharray]";

        public string AllIconsOnPanel = "./following-sibling::div[@class='content']//div[contains(@class,'select-button-group-button')]";

        #region FilterPanel

        public string FilterMenuButton = ".//button[@class='btn menu-filter']";

        public string RemoveHistoryItem = ".//div[contains(@class,'item-remove')]";

        #endregion

        #region TaskInformation
        public IWebElement GetCheckboxInSectionOnSidePanel(string sectionName, string panelName, string header)
        {
            var checkbox = By.XPath($".//div[contains(@class,'checkbox')]");
            if (!Driver.IsElementInElementDisplayed(GetSectionByName(sectionName, panelName, header), checkbox, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Checkbox is not displayed in section '{sectionName}' on '{panelName}' panel with '{header}' header");
            }

            return GetSectionByName(sectionName, panelName, header).FindElement(checkbox);
        }

        public IWebElement GetCheckboxInSidePanelByLabel(string labelName, string panelName, string header)
        {
            var selector = By.XPath($".//*[contains(text(),'{labelName}')]/parent::div//*[contains(@class,'checkbox')]");
            if (!Driver.IsElementInElementDisplayed(GetSidePanel(panelName, header), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Checkbox with '{labelName}' is not displayed on '{panelName}' panel with '{header}' header");
            }

            return GetSidePanel(panelName, header).FindElement(selector);
        }

        public bool CheckboxCheckedInSectionOnPanel(string sectionName, string panelName, string header)
        {
            return GetCheckboxInSectionOnSidePanel(sectionName, panelName, header).GetAttribute("class").Contains("checked");
        }

        public bool CheckboxCheckedInSidePanelByLabel(string labelName, string panelName, string header)
        {
            return GetCheckboxInSidePanelByLabel(labelName, panelName, header).GetAttribute("class").Contains("checked");
        }

        public void SetCheckboxState(string sectionName, string panelName, bool desiredState, string header)
        {
            if (desiredState)
            {
                if (!CheckboxCheckedInSectionOnPanel(sectionName, panelName, header))
                {
                    GetCheckboxInSectionOnSidePanel(sectionName, panelName, header).Click();
                }
            }
            else
            {
                if (CheckboxCheckedInSectionOnPanel(sectionName, panelName, header))
                {
                    GetCheckboxInSectionOnSidePanel(sectionName, panelName, header).Click();
                }
            }
        }

        public void SetCheckboxStateByLabel(string labelName, string panelName, string header, bool desiredState)
        {
            if (desiredState)
            {
                if (!CheckboxCheckedInSidePanelByLabel(labelName, panelName, header))
                {
                    GetCheckboxInSidePanelByLabel(labelName, panelName, header).Click();
                }
            }
            else
            {
                if (CheckboxCheckedInSidePanelByLabel(labelName, panelName, header))
                {
                    GetCheckboxInSidePanelByLabel(labelName, panelName, header).Click();
                }
            }
        }
        public IWebElement GetDateInputFieldInSectionOnSidePanel(string sectionName, string panelName, string header)
        {
            var inputfield = By.XPath($".//input[contains(@class,'date-input')]");
            if (!Driver.IsElementInElementDisplayed(GetSectionByName(sectionName, panelName, header), inputfield, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Date input field is not displayed in section '{sectionName}' on '{panelName}' panel with '{header}' header");
            }

            return GetSectionByName(sectionName, panelName, header).FindElement(inputfield);
        }

        public IWebElement GetCostInputFieldInSectionOnSidePanel(string inputField, string panelName, string header)
        {
            var input = By.XPath($".//ancestor::div[@class='side-panel-group']//div[@class='content costs']//label[text()='{inputField}']/following-sibling::div/input");
            if (!Driver.IsElementInElementDisplayed(GetSidePanel(panelName, header), input, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Cost '{inputField}' input field is not displayed on '{panelName}' panel with '{header}' header");
            }

            return GetSidePanel(panelName, header).FindElement(input);
        }

        #endregion

        #region CommentsPanel

        [FindsBy(How = How.XPath, Using = ".//button[@class='btn-comment-add']")]
        public IWebElement CommentButton { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[not(contains(@style,'display: none')) and contains(@class,'joint-comment joint-theme-default')]//textarea[contains(@class,'edit-comment')]")]
        public IWebElement InputFieldForEditingComments { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='comment-author']")]
        public IList<IWebElement> UsersNameInСomment { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='comment-text']")]
        public IList<IWebElement> СommentText { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='comment-topic']")]
        public IList<IWebElement> CommentTopic { get; set; }
        public IList<IWebElement> CommentCreationData { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[not(contains(@style,'display: none')) and contains(@class,'joint-comment joint-theme-default')]//div[@class='comment-container']")]
        public IList<IWebElement> CommentsContainer { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='empty-comment']")]
        public IWebElement EmptyComment { get; set; }

        public string CommentAvatar = ".//img[@class='comment-avatar']";

        public string CommentAuthor = ".//div[@class='comment-author']";

        public string CommentTopics = ".//div[@class='comment-topic']";

        public string CommentText = ".//div[@class='comment-text']";

        public string CommentTime = ".//div[@class='comment-time']";

        public string DeleteButtons = ".//div[@class='comment-edit-bar']/img[@class='btn-comment-delete']";
        public IWebElement GetCommentsContainerByIndex(int index)
        {
            return CommentsContainer[index - 1];
        }

        [FindsBy(How = How.XPath, Using = ".//*[@class='group-header select-button-group-button in-rename']//*[contains(@class,'select-button-group-edit-text')]")]
        public IWebElement SectionInputField { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'select-button-group-button')][contains(@class,'in-rename')]/div[@class='select-button-group-edit-text']")]
        public IWebElement ItemInputField { get; set; }

        public string TripledotButton = ".//*[@class='select-button-group-button-triple-dot']";

        public IWebElement GetButtonByNameInCommentEditBar(string buttonName)
        {
            var selector = By.XPath($".//div[@class='comment-edit-bar edit']//span[text()='{buttonName}']/parent::div[contains(@class,'btn-comment-edit')]");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Button '{buttonName}' is not displayed in comments edit bar");
            }

            return Driver.FindElement(selector);
        }

        public IWebElement GetCommentsContainerByText(string commentText)
        {
            var selector = By.XPath($".//*[@class='comment-input edit-comment' and text()='{commentText}']/ancestor::div[not(contains(@style,'display: none')) and contains(@class,'joint-comment joint-theme-default')]");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Medium))
            {
                throw new Exception($"Comment text '{commentText}' is not displayed in comments editor");
            }
            return Driver.FindElement(selector);
        }

        public IWebElement GetCommentsButtonByText(string button, string commentText)
        {
            var commentContainer = GetCommentsContainerByText(commentText);
            if (button.Equals("Edit"))
            {
                return commentContainer.FindElement(By.XPath(".//*[@class='btn-comment-edit']"));
            }
            if (button.Equals("Delete"))
            {
                return commentContainer.FindElement(By.XPath(".//*[@class='btn-comment-delete']"));
            }
            throw new Exception($"Button '{button}' is not displayed in comments editor");
        }

        public bool DisplayedInputFieldForEditingComments()
        {
            var inputField = InputFieldForEditingComments.GetAttribute("style");
            if (!inputField.Equals("display: none;"))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public IWebElement GetTabByNameOnСommentsPanel(string tabName, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Medium)
        {
            var selector = By.XPath($".//div[@class='comments-tabs']/div[text()='{tabName}']");
            if (!Driver.IsElementDisplayed(selector, waitTime))
            {
                throw new Exception($"Tab '{tabName}' is not displaed on Comments panel");
            }

            return Driver.FindElement(selector);
        }

        public bool DisplayedTabOnСommentsPanel(string tabName)
        {
            try
            {
                return GetTabByNameOnСommentsPanel(tabName, WebDriverExtensions.WaitTime.Short).Displayed();
            }
            catch
            {
                return false;
            }
        }

        #endregion

        #region NotesPanel

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'note')]//div[contains(@class,'editable')]")]
        public IWebElement NotesInputField { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'note')]//div[contains(@class,'joint-select-box joint-theme-default text-style')]")]
        public IWebElement NotesTextStyleSelectOptions { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'note-btn-group')]")]
        public IWebElement NotesBtnGroup { get; set; }

        [FindsBy(How = How.XPath, Using = ".//input[@type='file'][@accept='image/png, image/jpeg, image/gif, image/svg+xml']")]
        public IWebElement NotesInputFileType { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@Class='note-editable']/p")]
        public IWebElement SingleNoteContainer { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[@class='notes-content-inspector-new']/p")]
        public IWebElement SingleViewOnlyNoteContainer { get; set; }

        [FindsBy(How = How.XPath, Using = ".//div[contains(@class,'resizable-handle resizable-handle-e')]")]
        public IWebElement NotesResizeblaArea { get; set; }

        public string ArrowSelector = ".//span[@class='opt']/span[@class='{0}']";

        public IWebElement GetButtonInNoteToolbarSection(string buttonName, string sectionName, string panelName, string header)
        {
            var selector = By.XPath($".//button//i[contains(@class, '{buttonName}')]/parent::button");
            if (!Driver.IsElementInElementDisplayed(GetSectionValueInNoteToolbarSectionOnSidePanel(sectionName, panelName, header), selector, WebDriverExtensions.WaitTime.Second))
            {
                throw new Exception($"Button '{buttonName}' is not displayed in '{sectionName}' on '{panelName}' side panel with '{header}' header");
            }
            return GetSectionValueInNoteToolbarSectionOnSidePanel(sectionName, panelName, header).FindElement(selector);
        }

        public IWebElement GetSectionValueInNoteToolbarSectionOnSidePanel(string sectionName, string panelName, string header)
        {
            var selector = By.XPath($".//div[contains(@class,'note-toolbar')]//div[contains(@class,'{sectionName}')]");
            if (!Driver.IsElementInElementDisplayed(GetSidePanel(panelName, header), selector, WebDriverExtensions.WaitTime.Second))
            {
                throw new Exception($"Section '{sectionName}' is not displayed on '{panelName}' side panel with '{header}' header");
            }
            return Driver.FindElement(selector);
        }

        public List<string> GetNotesContainerValues()
        {
            var text = SingleNoteContainer.GetAttribute("innerHTML");
            List<string> parts = new List<string>();
            // Define the regular expression pattern
            string pattern = @"^(.*?)(<img.*?>)(.*)$";

            // Match the pattern against the input text
            Match match = Regex.Match(text, pattern);

            if (match.Success)
            {
                // Extract the three parts
                parts.Add(match.Groups[1].Value);
                parts.Add(match.Groups[2].Value);
                parts.Add(match.Groups[3].Value);

                return parts;
            }
            else
            {
                throw new Exception("Invalid input format.");
            }
        }

        public IWebElement GetDropdownListMenuByLabelName(string labelName)
        {
            var selector = By.XPath($".//button[contains(@class,'dropdown-toggle')]//span[contains(@class,'{labelName}')]//parent::button");
            if (!Driver.IsElementInElementExists(NotesBtnGroup, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"{labelName} is not displayed for note drop down list");
            }
            return NotesBtnGroup.FindElement(selector);
        }

        public IWebElement GetDropdownListItemsByName(string labelName, string OptionName)
        {
            var selector = By.XPath($".//parent::div//div//a[contains(@class,'note-dropdown-item')][@data-value='{OptionName}']");
            if (!Driver.IsElementInElementExists(GetDropdownListMenuByLabelName(labelName), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"{OptionName} is not displayed in note drop down list options");
            }
            return GetDropdownListMenuByLabelName(labelName).FindElement(selector);
        }

        public string GetImageNameInNoteTexbox(string imageName)
        {
            var selector = $".//img[@data-filename='{imageName}']";
            return selector;
        }

        public string GetHyperlinkInNoteTexbox(string hyperlinkTopic)
        {
            var selector = $".//a[@name='{hyperlinkTopic}']";
            return selector;
        }

        public IWebElement GetNoteText(string noteText)
        {
            var selector = By.XPath($".//*[contains(text(),'{noteText}')]");
            if (!Driver.IsElementInElementExists(NotesInputField, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"{noteText} is not displayed in note drop down list options");
            }
            return NotesInputField.FindElement(selector);
        }

        public IWebElement GetViewOnlyNoteText(string noteText)
        {
            var selector = By.XPath($"[contains(text(),'{noteText}')]");
            if (!Driver.IsElementDisplayed(SingleViewOnlyNoteContainer, WebDriverExtensions.WaitTime.Second))
            {
                throw new Exception($"View-only Notes side panel is not displayed");
            }
            return SingleViewOnlyNoteContainer.FindElement(selector);
        }

        public bool CheckNoteTextSize(string noteText, string fontSize)
        {
            var textFontSize = GetNoteText(noteText).GetCssValue("font-size");
            return textFontSize.Equals(fontSize);
        }

        public bool CheckNoteTextFontFamily(string noteText, string fontFamily)
        {
            var textFontFamily = GetNoteText(noteText).GetCssValue("font-family");
            return textFontFamily.Equals(fontFamily);
        }

        public bool IsImageDisplayedInNoteTexbox(string imageName)
        {
            var selector = By.XPath($".//img[@data-filename='{imageName}']");
            return Driver.IsElementInElementDisplayed(NotesInputField, selector, WebDriverExtensions.WaitTime.Short);
        }
        public void SelectArrowInFontSizeSection(string arrow)
        {
            var selector = By.XPath(string.Format(ArrowSelector, arrow));
            NotesTextStyleSelectOptions.FindElement(selector).Click();
        }

        #endregion

        #region Attachments&LinksPanel

        public string RemoveButtonOnAttachmentsOrLinks = ".//following-sibling::*[@class='select-button-group-button-remove']";

        #endregion

        #region ImagesPanel

        [FindsBy(How = How.XPath, Using = ".//input[@class='add-image-input']")]
        public IWebElement AddImages { get; set; }

        #endregion

        #region Icons
        public string IconText = ".//div[@class='select-button-group-edit-text']";
        #endregion

        public override List<By> GetPageIdentitySelectors()
        {
            return new List<By> { };
        }

        public IWebElement GetSidePanel(string panelName, string header)
        {
            IWebElement panel = null;
            switch (panelName)
            {
                case ("PanelByName"):
                    panel = GetSidePanelByName(header);
                    break;
                case ("PanelPublished"):
                    panel = GetSidePanelPublished(header);
                    break;
                case ("PanelWithMenuButton"):
                    panel = GetSidePanelWithMenuButton(header);
                    break;
                case ("Snap"):
                    panel = GetSidePanelSnap();
                    break;
            }

            return panel;
        }

        public bool DisplayedSidePanel(string panelName, string header = "")
        {
            try
            {
                return Driver.IsElementDisplayed(GetSidePanel(panelName, header), WebDriverExtensions.WaitTime.Short);
            }
            catch
            {
                return false;
            }
        }

        public IWebElement GetSidePanelByName(string panelName)
        {
            var selector = By.XPath(".//div[text()]");
            if (Header.FindElements(selector).Any(x => x.Text.Equals(panelName)))
            {
                var panel = Header.FindElements(selector).First(x => x.Text.Equals(panelName));
                return panel.FindElement(By.XPath(".//ancestor::div[@id='inspector']"));
            }

            throw new Exception($"There is not '{panelName}' panel");
        }

        public IWebElement GetSidePanelPublished(string panelName)
        {
            if (ButtonHeader.Any(x => x.Text.Equals(panelName)))
            {
                var panel = ButtonHeader.First(x => x.Text.Equals(panelName));
                return panel.FindElement(By.XPath(".//ancestor::div[@id='inspector']"));
            }

            throw new Exception($"There is not '{panelName}' panel");
        }

        public IWebElement GetSidePanelWithMenuButton(string menuButton, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Short)
        {
            var selector = By.XPath(".//button[contains(@class,'menu-filter')]");
            if (!Driver.IsElementInElementDisplayed(SidePanelFilter, selector, waitTime))
            {
                throw new Exception($"Panel with '{menuButton}' menu button is not displayed");
            }

            var panelFilter = SidePanelFilter.FindElements(selector).First(x => x.Text.Equals(menuButton));
            return panelFilter.FindElement(By.XPath(".//ancestor::div[@id='powerFilter']"));
        }

        public IWebElement GetSidePanelSnap()
        {
            var selector = By.XPath(".//div[@class='header snap-header']");
            if (Driver.IsElementInElementDisplayed(SidePanelInspector, selector, WebDriverExtensions.WaitTime.Short))
            {
                var panelSnap = SidePanelInspector.FindElement(selector);
                return panelSnap.FindElement(By.XPath(".//ancestor::div[@id='inspector']"));
            }

            throw new Exception($"There is not Snap panel");
        }

        public IWebElement GetContentActionButtonByName(string button, string panelName, string header)
        {
            var selector = By.XPath($".//button[contains(@class,'content-action-btn')][text()='{button}']");
            if (!Driver.IsElementInElementDisplayed(GetSidePanel(panelName, header), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Action button '{button}' is not displayed on '{panelName}' panel with '{header}' header");
            }

            return GetSidePanel(panelName, header).FindElements(selector).First(btn => btn.Text.Equals(button));
        }

        public List<IWebElement> GetSectionList(string panelName, string header)
        {
            var selector = By.XPath(".//*[contains(@class,'side-panel-group')]");
            Driver.WaitForElementToBeExists(GetSidePanel(panelName, header), WebDriverExtensions.WaitTime.Short);
            return GetSidePanel(panelName, header).FindElements(selector).ToList();
        }

        public IWebElement GetSectionByName(string sectionName, string panelName, string header)
        {
            var selector = By.XPath($".//*[contains(@class,'group-header')]//*[contains(@class,'group-edit-text')]");
            var sectionList = GetSectionList(panelName, header);
            if (sectionList.Where(x => x.IsElementExists(selector)).Any(x => x.FindElement(selector).Text.Equals(sectionName)))
            {
                return sectionList.Where(x => x.IsElementExists(selector)).First(x => x.FindElement(selector).Text.Equals(sectionName));
            }

            throw new Exception($"Section with name '{sectionName}' is not displayed on '{panelName}' panel with '{header}' header");
        }

        public IWebElement GetBackgroundItemByName(string backgroundItem, string sectionName, string panelName, string header, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Short)
        {
            var selector = By.XPath($".//div[@class='background-side-panel']//div[contains(text(),'{backgroundItem}')]/parent::div");
            {
                var backgroundSection = GetSectionByName(sectionName, panelName, header);
                if (Driver.IsElementInElementExists(backgroundSection, selector, WebDriverExtensions.WaitTime.Second))
                {
                    return backgroundSection.FindElement(selector);
                }
                throw new Exception($"'{backgroundItem}'  item is not displayed in '{sectionName}' section of '{panelName}' side panel with '{header}'header");
            }
        }

        public bool IsBackgroundItemDisplayed(string backgroundItem, string sectionName, string panelName, string header)
        {
            try
            {
                var item = GetBackgroundItemByName(backgroundItem, sectionName, panelName, header, WebDriverExtensions.WaitTime.Second);
                Driver.MoveToElement(item);
                return Driver.IsElementDisplayed(item);
            }
            catch
            {
                return false;
            }
        }

        public bool IsSectionDisplayed(string sectionName, string panelName, string header)
        {
            try
            {
                return Driver.IsElementDisplayed(GetSectionByName(sectionName, panelName, header), WebDriverExtensions.WaitTime.Second);
            }
            catch
            {
                return false;
            }
        }

        public IWebElement GetInputByRowNameInSubSection(string inputName, string row, string subsectionName, string sectionName, string panelName, string header)
        {
            var rowSection = GetRowByNameInSubSection(row, subsectionName, sectionName, panelName, header);
            var selector = By.XPath($".//input[contains(@class,'{inputName}')]");
            if (!Driver.IsElementInElementDisplayed(rowSection, selector, WebDriverExtensions.WaitTime.Second))
            {
                throw new Exception($"Input '{inputName}' is not displayed in '{row}' for '{subsectionName}' subsection");
            }

            return rowSection.FindElement(selector);
        }

        public IWebElement GetIconByRowNameInSubSection(string iconName, string row, string subsectionName, string sectionName, string panelName, string header)
        {
            var rowSection = GetRowByNameInSubSection(row, subsectionName, sectionName, panelName, header);
            var selector = By.XPath($".//*[contains(@src,'{iconName}')]");
            if (!Driver.IsElementInElementDisplayed(rowSection, selector, WebDriverExtensions.WaitTime.Second))
            {
                throw new Exception($"Icon '{iconName}' is not displayed in '{row}' for '{subsectionName}' subsection");
            }

            return rowSection.FindElement(selector);
        }

        public IWebElement GetCheckBoxByRowNameInSubSection(string row, string subsectionName, string sectionName, string panelName, string header)
        {
            var rowSection = GetRowByNameInSubSection(row, subsectionName, sectionName, panelName, header);
            var selector = By.XPath($".//*[contains(@class,'btn-checkbox')]");
            if (!Driver.IsElementInElementDisplayed(rowSection, selector, WebDriverExtensions.WaitTime.Second))
            {
                throw new Exception($"CheckBox is not displayed in '{row}' for '{subsectionName}' subsection");
            }

            return rowSection.FindElement(selector);
        }

        public IWebElement GetFieldByRowNameInSubSection(string row, string subsectionName, string sectionName, string panelName, string header)
        {
            var rowSection = GetRowByNameInSubSection(row, subsectionName, sectionName, panelName, header);
            var selector = By.XPath($".//*[contains(@class,'label')]");
            if (!Driver.IsElementInElementDisplayed(rowSection, selector, WebDriverExtensions.WaitTime.Second))
            {
                throw new Exception($"CheckBox is not displayed in '{row}' for '{subsectionName}' subsection");
            }

            return rowSection.FindElement(selector);
        }

        public IWebElement GetRowByNameInSubSection(string row, string subsectionName, string sectionName, string panelName, string header)
        {
            var subSection = GetSubSectionByName(subsectionName, sectionName, panelName, header);
            var selector = By.XPath($".//div[contains(@data-id,'{row}')]");
            if (!Driver.IsElementInElementDisplayed(subSection, selector, WebDriverExtensions.WaitTime.Second))
            {
                throw new Exception($"Row '{row}' is not displayed in '{sectionName}' on '{panelName}' panel with '{header}' header");
            }

            return subSection.FindElement(selector);
        }

        public IWebElement GetSubSectionByName(string subsectionName, string sectionName, string panelName, string header)
        {
            var selector = By.XPath($".//h5");
            try
            {
                return GetSubSectionListInSection(sectionName, panelName, header).First(x => x.FindElement(selector).Text.Equals(subsectionName));
            }
            catch
            {
                throw new Exception($"Subsection '{subsectionName}' is not displayed on '{sectionName}' section on '{panelName}' side panel with '{header}')");
            }
        }

        public IList<IWebElement> GetSubSectionListInSection(string sectionName, string panelName, string header)
        {
            var selector = By.XPath(".//div[@class='content']/div[contains(@class,'side-panel-grouped-grid')]");
            if (!Driver.IsElementInElementDisplayed(GetSectionByName(sectionName, panelName, header), selector, WebDriverExtensions.WaitTime.Second))
            {
                throw new Exception($"No Sub Section are not displayed in '{sectionName}' on '{panelName}' panel with '{header}' header");
            }

            return GetSectionByName(sectionName, panelName, header).FindElements(selector);
        }

        public IWebElement GetSectionHeader(string sectionName, string panelName, string header)
        {
            var selector = By.XPath("(.//input[contains(@class,'edit-text')])" + $"| (.//*[contains(@class,'group-header')])");
            if (!Driver.IsElementInElementDisplayed(GetSectionByName(sectionName, panelName, header), selector, WebDriverExtensions.WaitTime.Second))
            {
                throw new Exception($"Section header '{header}' is not displayed on '{panelName}' panel with '{header}' header");
            }
            return GetSectionByName(sectionName, panelName, header).FindElement(selector);
        }

        public IWebElement GetEllipsButtonOnSectionHeader(string sectionName, string panelName, string header)
        {
            var selector = By.XPath(".//*[@class='select-button-group-button-triple-dot']");
            Driver.WaitForElementInElementToBeDisplayed(GetSectionHeader(sectionName, panelName, header), selector);
            return GetSectionHeader(sectionName, panelName, header).FindElement(selector);
        }

        public bool DisplayedSectionState(string sectionName, string panelName, string header, bool expectedCondition)
        {
            // TODO Collapsed state
            if (expectedCondition)
            {
                Driver.WaitForElementToContainsTextInAttribute(GetSectionByName(sectionName, panelName, header), "closed", "class", WebDriverExtensions.WaitTime.Second);
                return true;
            }
            //TODO Expanded state
            else
            {
                Driver.WaitForElementToNotContainsTextInAttribute(GetSectionByName(sectionName, panelName, header), "closed", "class", WebDriverExtensions.WaitTime.Second);
                return false;
            }
        }

        public IList<IWebElement> GetItemListInSection(string sectionName, string panelName, string header)
        {
            var selector = By.XPath(".//div[@class='content']/div/*[contains(@class,'select-button-group') and not (contains(@class,'icon'))]");
            if (Driver.IsElementInElementExists(GetSectionByName(sectionName, panelName, header), selector))
            {
                return GetSectionByName(sectionName, panelName, header).FindElements(selector);
            }

            return GetSectionByName(sectionName, panelName, header).FindElements(By.XPath(".//div[@class='content']//a[contains(@class,'select-button-group-button')]"));
        }

        public IWebElement GetItemByNameInSectionOnPanel(string itemName, string sectionName, string panelName, string header)
        {
            var selector = By.XPath(".//input[contains(@class,'button-group-edit-text')]");

            try
            {
                return GetItemListInSection(sectionName, panelName, header).First(x => x.Text.Equals(itemName));
            }
            catch
            {
                return GetItemListInSection(sectionName, panelName, header).First(x => x.FindElement(selector).GetAttribute("value").Equals(itemName));
            }

            throw new Exception($"Item '{itemName}' is not displayed in '{sectionName}' section on '{panelName}' panel");
        }

        public bool DisplayedItemInSectionOnPanel(string item, string sectionName, string panelName, string header)
        {
            try
            {
                return Driver.IsElementDisplayed(GetItemByNameInSectionOnPanel(item, sectionName, panelName, header), WebDriverExtensions.WaitTime.Short);
            }
            catch
            {
                return false;
            }
        }

        public bool IsParticipantNameDisplayedInSectionOnPanel(string item, string sectionName, string panelName, string header)
        {
            var selector = "./parent::*/parent::*//div[@class='content']/div/span";

            try
            {
                return GetSectionByName(sectionName, panelName, header).FindElements(By.XPath(selector)).First(x => x.Text.Equals(item)).Displayed();
            }
            catch
            {
                throw new Exception($"Participant '{item}' is not displayed in '{sectionName}' section on '{panelName}' panel");
            }
        }

        public IWebElement GetDialogItemByNameInSectionOnPanel(string itemName, string sectionName, string panelName, string header)
        {
            var selector = $".//following-sibling::span[text()='{itemName}']";
            return GetSectionByName(sectionName, panelName, header).FindElement(By.XPath(selector));
        }

        public IWebElement GetTripleDotButtonOnItem(string itemName, string sectionName, string panelName, string header)
        {
            return GetItemByNameInSectionOnPanel(itemName, sectionName, panelName, header).FindElement(By.XPath(TripledotButton));
        }

        public IWebElement GetEmptyContentInSection(string sectionName, string panelName, string header)
        {
            var selector = By.XPath(".//div[@class='content']//*[@class='empty-content']");
            if (!Driver.IsElementInElementDisplayed(GetSectionByName(sectionName, panelName, header), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Empty content is not displayed in '{sectionName}' on '{panelName}' panel with '{header}' header");
            }

            return GetSectionByName(sectionName, panelName, header).FindElement(selector);
        }

        public IList<IWebElement> GetResourceListInSection(string sectionName, string panelName, string header)
        {
            var selector = By.XPath(".//div[@class='content']//div[contains(@class,'selectize-input')]/div[@data-value]");
            return GetSectionByName(sectionName, panelName, header).FindElements(selector);
        }

        public IWebElement GetResourceByNemeInSectionOnPanel(string value, string sectionName, string panelName, string header, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Medium)
        {
            if (GetResourceListInSection(sectionName, panelName, header).Any(x => x.GetAttribute("data-value").Equals(value)))
            {
                return GetResourceListInSection(sectionName, panelName, header).First(x => x.GetAttribute("data-value").Equals(value));
            }

            throw new Exception($"Resource '{value}' is not displayed in '{sectionName}' on '{panelName}' panel");
        }

        public bool DisplayedResourceInSectionOnPanel(string value, string sectionName, string panelName, string header)
        {
            try
            {
                return GetResourceByNemeInSectionOnPanel(value, sectionName, panelName, header, WebDriverExtensions.WaitTime.Second).Displayed();
            }
            catch
            {
                return false;
            }
        }

        public bool DisplayedItemInResourceInputField(string sectionName, string panelName, string header)
        {
            var selector = By.XPath(".//div[@class='content']//div[contains(@class,'selectize-input items not-full has-options')]");
            var state = GetSectionByName(sectionName, panelName, header).FindElement(selector).GetAttribute("class");
            if (!state.Contains("has-items"))
            {
                return false;
            }
            return true;
        }

        public void RemoveResourceByNemeInSectionOnPanel(string value, string sectionName, string panelName, string header)
        {
            var selector = By.XPath(".//a[@class='remove']");
            var resourceRemove = GetResourceByNemeInSectionOnPanel(value, sectionName, panelName, header).FindElement(selector);
            resourceRemove.Click();
        }

        public string GetPatternLineInDropdownOnPanel(string patternLineInDropdown)
        {
            var selector = $".//div[contains(@class,'select-box')][@class='select-box-options-arrow'!='hidden']//*[@stroke-dasharray='{patternLineInDropdown}']/..";
            return selector;
        }

        public IWebElement GetFormatTestInTopicByName(string topicName)
        {
            var text = topicName.Split(' ').Aggregate(string.Empty, (current, s) => current + $"[contains(text(),'{s}')]");
            var selector = By.XPath($".//div[contains(@class,'joint-paper-scroller')]//div[@class='remote-cursors-container']//ancestor::div//*{text}/parent::*");
            if (!Driver.IsElementDisplayed(selector, WebDriverExtensions.WaitTime.Long))
            {
                throw new Exception($"{topicName} topic was not clicked");
            }

            return Driver.FindElement(selector);
        }

        public IWebElement GetRelationLableOnPanel(string lableName, string panelName)
        {
            var selector = By.XPath($".//div[contains(@class,'relation')]/*[text()='{lableName}']");
            if (!Driver.IsElementInElementDisplayed(GetSidePanelByName(panelName), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Relation lable '{lableName}' is not displayed on '{panelName}' panel");
            }

            return GetSidePanelByName(panelName).FindElement(selector);
        }

        #region FilterPanel

        public IWebElement GetBehaviorButtonByName(string buttonName, string panelName, string header)
        {
            var selector = By.XPath($".//div[@class='behavior-control']/button[text()='{buttonName}']");
            if (!Driver.IsElementInElementDisplayed(GetSidePanel(panelName, header), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($" '{buttonName}' behavior button is not displayed of '{panelName}' panel name with '{header}' header");
            }

            return GetSidePanel(panelName, header).FindElement(selector);
        }

        public IList<IWebElement> GetGroupList(string sectionName, string panelName, string header)
        {
            var selector = By.XPath(".//div[@class='content']//h5");
            var sectionByName = GetSectionByName(sectionName, panelName, header);
            if (!Driver.IsElementInElementDisplayed(sectionByName, selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception("Group list is not displayed on Filter control panel");
            }

            return sectionByName.FindElements(selector);
        }

        public IWebElement GetGroupByName(string groupName, string sectionName, string panelName, string header)
        {
            var groupList = GetGroupList(sectionName, panelName, header);
            if (groupList.Any(x => x.Text.Equals(groupName)))
            {
                return groupList.First(x => x.Text.Equals(groupName));
            }

            throw new Exception($"'{groupName}' group is not displayed in '{sectionName}' section of '{panelName}' side panel with '{header}' header");
        }

        public IList<IWebElement> GetGridItemListInGroup(string groupName, string sectionName, string panelName, string header)
        {
            var selector = By.XPath(".//following-sibling::div[@class='side-panel-grid'][1]/div[@class='grid-item']");

            return GetGroupByName(groupName, sectionName, panelName, header).FindElements(selector);
        }

        public IWebElement GetGridItemByName(string gridItem, string groupName, string sectionName, string panelName, string header)
        {
            var gridItemListInGroup = GetGridItemListInGroup(groupName, sectionName, panelName, header);
            if (gridItemListInGroup.Any(x => x.GetAttribute("data-tooltip").Equals(gridItem)))
            {
                return gridItemListInGroup.First(x => x.GetAttribute("data-tooltip").Equals(gridItem));
            }

            throw new Exception($"'{gridItem}' grid item is not displayed in '{groupName}' group in '{sectionName}' section of '{panelName}' side panel with '{header}'header");
        }

        public IList<IWebElement> GetAllGridItems(string groupName, string sectionName, string panelName, string header)
        {
            if (GetGridItemListInGroup(groupName, sectionName, panelName, header).Any())
            {
                return GetGridItemListInGroup(groupName, sectionName, panelName, header);
            }

            throw new Exception($"Grid items are not displayed in '{groupName}' group in '{sectionName}' section of '{panelName}' side panel with '{header}'header");
        }

        public IWebElement GetCheckboxInGridItem(string gridItem, string groupName, string sectionName, string panelName, string header)

        {
            var selector = By.XPath(".//div[contains(@class, 'btn-checkbox')]");
            var gridItemByName = GetGridItemByName(gridItem, groupName, sectionName, panelName, header);
            if (Driver.IsElementInElementDisplayed(gridItemByName, selector, WebDriverExtensions.WaitTime.Short))
            {
                return gridItemByName.FindElement(selector);
            }

            throw new Exception($"'Checkbox is not displayed in '{gridItem}' grid item in '{groupName}' group in '{sectionName}' section of '{panelName}' side panel with '{header}'header");
        }

        public void SetCheckboxStateInFilterPanel(string gridItem, string groupName, string sectionName, string panelName, string header, bool desiredState)
        {
            var checkboxInGridItem = GetCheckboxInGridItem(gridItem, groupName, sectionName, panelName, header);
            var checkboxState = checkboxInGridItem.IsSelected();
            if (desiredState)
            {
                if (!checkboxState)
                {
                    checkboxInGridItem.Click();
                }
            }
            else
            {
                if (checkboxState)
                {
                    checkboxInGridItem.Click();
                }
            }
        }

        public IWebElement GetFilterHistoryItemByName(string historyItem, string sectionName, string panelName, string header, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Short)
        {
            var selector = By.XPath(".//parent::div/following-sibling::div//div[@class='filter-history']/div[contains(@class,'history-item')]");
            {
                var historySection = GetSectionByName(sectionName, panelName, header);
                if (!historySection.FindElements(selector).Any(x => x.Text.Equals(historyItem)))
                {
                    throw new Exception($"'{historyItem}' history item is not displayed in '{sectionName}' section of '{panelName}' side panel with '{header}'header");
                }
                return historySection.FindElement(selector);
            }
        }

        public IWebElement GetFilterPresetItemByName(string item, string sectionName, string panelName, string header, WebDriverExtensions.WaitTime waitTime = WebDriverExtensions.WaitTime.Short)
        {
            var selector = By.XPath($".//ancestor::div[@class='side-panel-group']//div[@class='preset-item-name' and text()='{item}']");
            {
                var filterSection = GetSectionByName(sectionName, panelName, header);
                if (!filterSection.FindElements(selector).Any(x => x.Text.Equals(item)))
                {
                    throw new Exception($"'{item}' item is not displayed in '{sectionName}' section of '{panelName}' side panel with '{header}'header");
                }
                return filterSection.FindElement(selector);
            }
        }

        public bool DisplayedHistoryItem(string historyItem, string sectionName, string panelName, string header)
        {
            try
            {
                return GetFilterHistoryItemByName(historyItem, sectionName, panelName, header, WebDriverExtensions.WaitTime.Second).Displayed();
            }
            catch
            {
                return false;
            }
        }

        #endregion

        public IWebElement GetFieldNameInSection(string fieldName, string panelName, string header, string sectionName = "")
        {
            var selector = By.XPath($".//div[@class='content']//div[contains(@class,'name') or contains(@class,'label')]");
            if (!string.IsNullOrEmpty(sectionName))
            {
                return GetSectionByName(sectionName, panelName, header).FindElements(selector).First(x => x.Text.Contains(fieldName));
            }

            else
            {
                return GetSidePanel(panelName, header).FindElements(selector).First(x => x.Text.Equals(fieldName));
            }

            throw new Exception($"Field '{fieldName}' is not displayed in '{sectionName}' section of '{panelName}' side panel with '{header}'header");
        }

        public IWebElement GetInputField(string fieldName, string panelName, string header, string sectionName = "")
        {
            var selector = By.XPath(".//following-sibling::div//input");
            return GetFieldNameInSection(fieldName, panelName, header, sectionName).FindElement(selector);
        }

        public IWebElement GetFieldNameInSectionToggle(string fieldName, string panelName, string header, string sectionName = "")
        {
            var selector = By.XPath(".//following-sibling::div//*[contains(@class,'toggle')]");
            return GetFieldNameInSection(fieldName, panelName, header, sectionName).FindElement(selector);
        }

        public IWebElement GetColorPickerMenuButton(string fieldName, string panelName, string header, string sectionName = "")
        {
            var selector = By.XPath(".//following-sibling::div//div[contains(@class,'sp-replacer') or contains(@class,'sp-preview')]");
            if (!Driver.IsElementInElementExists(GetFieldNameInSection(fieldName, panelName, header, sectionName), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Color picker menu button is not displayed to '{fieldName}' field in '{sectionName}' section of '{panelName}' side panel with '{header}'header");
            }

            return GetFieldNameInSection(fieldName, panelName, header, sectionName).FindElement(selector);
        }

        public bool DisplayedColorInMenuButton(string color, string fieldName, string panelName, string header, string sectionName = "")
        {
            var selector = By.XPath(".//following-sibling::div//div[contains(@class,'sp-replacer')]//div[@class='sp-preview-inner']");
            var expectedColor = GetFieldNameInSection(fieldName, panelName, header, sectionName).FindElement(selector).GetAttribute("style").Contains(color);
            if (!expectedColor)
            {
                throw new Exception($"'{color}' color is not displayed to '{fieldName}' field in '{sectionName}' section of '{panelName}' side panel with '{header}' header");
            }

            return expectedColor;
        }

        public IWebElement GetSelectboxByName(string fieldName, string panelName, string header, string sectionName = "")
        {
            var selector = By.XPath(".//following-sibling::div//div[contains(@class,'joint-select-box')]");
            if (!Driver.IsElementInElementDisplayed(GetFieldNameInSection(fieldName, panelName, header, sectionName), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"'{fieldName}' selectbox field is not displayed in '{sectionName}' section of '{panelName}' side panel with '{header}' header");
            }

            return GetFieldNameInSection(fieldName, panelName, header, sectionName).FindElement(selector);
        }

        public bool DisplayedSelectboxOptionName(string value, string fieldName, string panelName, string header, string sectionName = "")
        {
            bool setTextOptionName = default(bool);
            var selector = By.XPath(".//div[contains(@class,'option-content')]");
            var optionFieldBox = GetSelectboxByName(fieldName, panelName, header, sectionName).FindElement(selector);

            if (!string.IsNullOrEmpty(optionFieldBox.Text))
            {
                setTextOptionName = optionFieldBox.Text.Equals(value);
            }
            else
            {
                setTextOptionName = optionFieldBox.FindElement(By.XPath("./*/*")).GetAttribute("stroke-dasharray").Equals(value);
            }
            return setTextOptionName;
        }

        public bool DisplayedSelectboxOptionValue(string value, string panelName, string header, string sectionName = "")
        {
            bool setTextOptionName = default(bool);
            var selector = By.XPath(".//div[contains(@class,'option-content')]");
            var optionFieldBox = GetSelectboxInSection(sectionName, panelName, header).FindElement(selector);

            if (!string.IsNullOrEmpty(optionFieldBox.Text))
            {
                setTextOptionName = optionFieldBox.Text.Equals(value);
            }
            else
            {
                setTextOptionName = optionFieldBox.FindElement(By.XPath("./*/*")).GetAttribute("stroke-dasharray").Equals(value);
            }
            return setTextOptionName;
        }

        public IWebElement GetCheckbox(string fieldName, string panelName, string header, string sectionName = "")
        {
            var selector = By.XPath(".//following-sibling::div//div[contains(@class,'btn-checkbox')]");
            if (!Driver.IsElementInElementDisplayed(GetFieldNameInSection(fieldName, panelName, header, sectionName), selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"Checkbox is not displayed in '{fieldName}' field in '{sectionName}' section of '{panelName}' side panel with '{header}' header");
            }

            return GetFieldNameInSection(fieldName, panelName, header, sectionName).FindElement(selector);
        }

        public bool GetCheckboxState(string fieldName, string panelName, string header, string sectionName = "")
        {
            return GetCheckbox(fieldName, panelName, header, sectionName).IsSelected();
        }

        public void SetCheckboxStateInField(string fieldName, string panelName, string header, bool desiredState, string sectionName = "")
        {
            if (desiredState)
            {
                if (!GetCheckboxState(fieldName, panelName, header, sectionName))
                {
                    GetCheckbox(fieldName, panelName, header, sectionName).Click();
                }
            }
            else
            {
                if (GetCheckboxState(fieldName, panelName, header, sectionName))
                {
                    GetCheckbox(fieldName, panelName, header, sectionName).Click();
                }
            }
        }

        public IWebElement GetPropertyByName(string fieldName, string panelName, string header)
        {
            var selector = By.XPath(".//div[@class='properties-property']");
            return GetSidePanel(panelName, header).FindElements(selector).First(x => x.Text.Contains(fieldName));
        }

        public IWebElement GetPropertyTitleByName(string fieldName, string panelName, string header)
        {
            var selector = By.XPath(".//div[contains(@class, 'name')]");
            return GetPropertyByName(fieldName, panelName, header).FindElement(selector);
        }

        public IWebElement GeSelectboxByPropertyName(string fieldName, string panelName, string header)
        {
            var selector = By.XPath(".//div[@class='select-box-selection']/div[contains(@class, 'content')]");
            return GetPropertyByName(fieldName, panelName, header).FindElement(selector);
        }

        public IWebElement GetSelectboxInSection(string sectionName, string panelName, string header)
        {
            var selector = By.XPath(".//div[@class='select-box-selection']");
            return GetSectionByName(sectionName, panelName, header).FindElement(selector);
        }

        public string GetValueInSelectbox(string fieldName, string panelName, string header)
        {
            var selector = By.XPath(".//div[@class='select-box-option-content']");
            return GetPropertyByName(fieldName, panelName, header).FindElement(selector).Text;
        }

        public IWebElement GetInputFieldByPropertyName(string fieldName, string panelName, string header)
        {
            var input = By.XPath(".//input[@type]");
            var textarea = By.XPath(".//textarea[@type]");
            if (Driver.IsElementInElementDisplayed(GetPropertyByName(fieldName, panelName, header), input, WebDriverExtensions.WaitTime.Second))
            {
                return GetPropertyByName(fieldName, panelName, header).FindElement(input);
            }
            else if ((Driver.IsElementInElementDisplayed(GetPropertyByName(fieldName, panelName, header), textarea, WebDriverExtensions.WaitTime.Second)))
            {
                return GetPropertyByName(fieldName, panelName, header).FindElement(textarea);
            }
            throw new Exception($"Input field is not displayed");
        }

        public IWebElement GetInputFieldByLabelOnSidePanel(string labelName, string panelName, string header)
        {
            var selector = By.XPath($".//label[text()='{labelName}']/ancestor::div[contains(@class,'side-panel')]//input");
            if (Driver.IsElementInElementDisplayed(GetSidePanel(panelName, header), selector, WebDriverExtensions.WaitTime.Second))
            {
                return GetSidePanel(panelName, header).FindElement(selector);
            }
            throw new Exception($"Input field '{labelName}' is not displayed of '{panelName}' side panel with '{header}' header");
        }

        public bool GetDisableInputFieldByLabelOnSidePanel(string labelName, string panelName, string header)
        {
            return GetInputFieldByLabelOnSidePanel(labelName, panelName, header).IsAttributePresent("disabled");
        }

        public bool GetDisableDateInputFieldInSectionOnSidePanel(string sectionName, string panelName, string header)
        {
            return GetDateInputFieldInSectionOnSidePanel(sectionName, panelName, header).IsAttributePresent("disabled");
        }

        public string GetRadioButtonByName(string radioButton)
        {
            var selector = $".//div[contains(@class,'joint-radio-button')]//label[text()='{radioButton}']/preceding-sibling::input[@type='radio']";
            return selector;
        }

        public IWebElement GetRadioButtonInSectionOnPanel(string radioButton, string section, string panelName, string header)
        {
            if (!Driver.IsElementInElementDisplayed(GetSectionByName(section, panelName, header), By.XPath(GetRadioButtonByName(radioButton)), WebDriverExtensions.WaitTime.Second))
            {
                throw new Exception($"'{radioButton}' radio button is not displayed in '{section}' section of '{panelName}' side panel with '{header}' header");
            }

            return GetSectionByName(section, panelName, header).FindElement(By.XPath(GetRadioButtonByName(radioButton)));
        }

        public bool GetRadioButtonStateInSectionOnPanel(string radioButton, string section, string panelName, string header)
        {
            var state = GetRadioButtonInSectionOnPanel(radioButton, section, panelName, header).Selected;
            return state;
        }

        public IWebElement GetRadioButtonOnPanel(string radioButton, string panelName, string header)
        {
            if (!Driver.IsElementInElementDisplayed(GetSidePanel(panelName, header), By.XPath(GetRadioButtonByName(radioButton)), WebDriverExtensions.WaitTime.Second))
            {
                throw new Exception($"'{radioButton}' radio button is not displayed on '{panelName}' side panel with '{header}' header");
            }

            return GetSidePanel(panelName, header).FindElement(By.XPath(GetRadioButtonByName(radioButton)));
        }

        public bool GetRadioButtonStateOnPanel(string radioButton, string panelName, string header)
        {
            var state = GetRadioButtonOnPanel(radioButton, panelName, header).Selected;
            return state;
        }
        public void SetRadioButtonInSectionOnPanel(string radioButton, string section, string panelName, string header)
        {
            if (!GetRadioButtonStateInSectionOnPanel(radioButton, section, panelName, header))
            {
                Driver.ClickByActions(GetRadioButtonInSectionOnPanel(radioButton, section, panelName, header));
            }
        }

        public void SetRadioButtonOnPanel(string radioButton, string panelName, string header, bool desiredSate)
        {
            bool currentState = GetRadioButtonStateOnPanel(radioButton, panelName, header);
            if (desiredSate != currentState)
            {
                Driver.ClickByActions(GetRadioButtonOnPanel(radioButton, panelName, header));
            }
        }

        public IWebElement GetInputToUploadFile(string systemName)
        {
            var selector = By.XPath($".//input[@type='file'][@id='{systemName}']");
            if (!Driver.IsElementExists(selector, WebDriverExtensions.WaitTime.Short))
            {
                throw new Exception($"File upload input field not found");
            }
            return Driver.FindElement(selector);
        }
    }
}