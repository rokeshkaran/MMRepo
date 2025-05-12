@retry(2)
Feature: RelationshipLabels
Check the relationship labels

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath             |
		| auto_test_SRND.mmap | RelationshipMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @Relationship_Labels @App_QA @App_Staging @App_Prod @Qase[WEB-388] @Cleanup @Upd_Qase
Scenario: Check_that_any_icon_could_be_added_to_the_Relationship_labels
	When User clicks 'Relationship label' topic on Canvas
	Then 'Relationship label' is outlined with a blue circuit
	When User clicks 'Icons' button of side Toolbox
	And User clicks 'Priority 4' item in 'Priority' section of 'PanelByName' side panel with 'Icons' header
	Then 'Priority 4' Icon is displayed to the 'Relationship label' Topic
	When User clicks '50% done' item in 'Progress' section of 'PanelByName' side panel with 'Icons' header
	Then '50% done' Icon is displayed to the 'Relationship label' Topic
	When User clicks 'Up' item in 'Arrows' section of 'PanelByName' side panel with 'Icons' header
	Then 'Up' Icon is displayed to the 'Relationship label' Topic
	When User clicks 'Defer' item in 'Flags' section of 'PanelByName' side panel with 'Icons' header
	Then 'Defer' Icon is displayed to the 'Relationship label' Topic
	When User clicks 'Sad' item in 'Smileys' section of 'PanelByName' side panel with 'Icons' header
	Then 'Sad' Icon is displayed to the 'Relationship label' Topic
	When User clicks 'Pro' item in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	Then 'Pro' Icon is displayed to the 'Relationship label' Topic
	When User clicks 'Priority 4' item in 'Priority' section of 'PanelByName' side panel with 'Icons' header
	Then 'Priority 4' Icon is not displayed to the 'Relationship label' Topic
	When User clicks '50% done' item in 'Progress' section of 'PanelByName' side panel with 'Icons' header
	Then '50% done' Icon is not displayed to the 'Relationship label' Topic
	When User clicks 'Up' item in 'Arrows' section of 'PanelByName' side panel with 'Icons' header
	Then 'Up' Icon is not displayed to the 'Relationship label' Topic
	When User clicks 'Defer' item in 'Flags' section of 'PanelByName' side panel with 'Icons' header
	Then 'Defer' Icon is not displayed to the 'Relationship label' Topic
	When User clicks 'Sad' item in 'Smileys' section of 'PanelByName' side panel with 'Icons' header
	Then 'Sad' Icon is not displayed to the 'Relationship label' Topic
	When User clicks 'Pro' item in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	Then 'Pro' Icon is not displayed to the 'Relationship label' Topic

@MindManager @EditingCapabilities @Relationship_Labels @App_QA @App_Staging @App_Prod @Qase[WEB-389] @Cleanup @Upd_Qase
Scenario: Check_that_tag_attribute_could_be_added_to_the_Relationship_Labels
	When User clicks 'Relationship label' topic on Canvas
	Then 'Relationship label' is outlined with a blue circuit
	When User clicks 'Tags' button of side Toolbox
	And User clicks 'Doing' item in 'Kanban' section of 'PanelByName' side panel with 'Tags' header
	And User clicks Close button of 'PanelByName' side panel with 'Tags' header
	Then 'PanelByName' side panel with 'Tags' header is not displayed to the User
	And 'Doing' tag is displayed in 'Relationship label' topic infobox
	When User clicks 'Tags' button of side Toolbox
	And User clicks 'Doing' item in 'Kanban' section of 'PanelByName' side panel with 'Tags' header
	Then 'Doing' tag is not displayed in 'Relationship label' topic infobox

@MindManager @EditingCapabilities @Relationship_Labels @App_QA @App_Staging @App_Prod @Qase[WEB-389] @Cleanup @Upd_Qase
Scenario: Check_that_comments_attribute_could_be_added_to_the_Relationship_Labels
	When User clicks 'Relationship label' topic on Canvas
	Then 'Relationship label' is outlined with a blue circuit
	When User clicks 'Comments' button of side Toolbox
	And User enters 'Comment to the Label' in the 'comment-input' textarea
	And User clicks Comment button on Comments panel
	And User clicks Close button of 'PanelByName' side panel with 'Comments' header
	Then 'PanelByName' side panel with 'Comments' header is not displayed to the User
	And Comment icon is displayed to the 'Relationship label' topic infobox
	When User clicks 'Comments' button of side Toolbox
	And User clicks 'Delete' button on 'Comment to the Label' comment text on Comments panel
	Then Comment icon is not displayed to the 'Relationship label' topic infobox

@MindManager @EditingCapabilities @Relationship_Labels @App_QA @App_Staging @App_Prod @Qase[WEB-389] @Cleanup @Upd_Qase
Scenario: Check_that_resources_attribute_could_be_added_to_the_Relationship_Labels
	When User clicks 'Relationship label' topic on Canvas
	Then 'Relationship label' is outlined with a blue circuit
	When User clicks 'Task Information' button of side Toolbox
	And User enter 'Test Resource' value in the 'Resources' field of 'Task Information' panel
	And User presses the 'Enter' key on the keyboard
	And User clicks Close button of 'PanelByName' side panel with 'Task Information' header
	Then 'PanelByName' side panel with 'Task Information' header is not displayed to the User
	And 'Test Resource' resource is displayed in 'Relationship label' topic
	When User clicks 'Task Information' button of side Toolbox
	And User clicks Remove on 'Test Resource' resource in 'Resources' section on 'PanelByName' panel with 'Task Information' header
	Then 'Test Resource' resource is not displayed in 'Resources' section of 'PanelByName' side panel with 'Task Information' header
	And 'Test Resource' resource is not displayed in 'Relationship label' topic

@MindManager @EditingCapabilities @Relationship_Labels @App_QA @App_Staging @App_Prod @Qase[WEB-389] @Cleanup @Upd_Qase
Scenario: Check_that_notes_attribute_could_be_added_to_the_Relationship_Labels
	When User clicks 'Relationship label' topic on Canvas
	Then 'Relationship label' is outlined with a blue circuit
	When User clicks 'Notes' button of side Toolbox
	And User enters 'Test Notes for Relationship label text' text to input note field on Notes panel
	And User clicks Close button of 'PanelByName' side panel with 'Notes' header
	Then 'PanelByName' side panel with 'Task Information' header is not displayed to the User
	And Notes icon is displayed to the 'Relationship label' topic infobox
	When User clicks 'Notes' button of side Toolbox
	And User Clear notes input field
	And User clicks Close button of 'PanelByName' side panel with 'Notes' header
	Then 'PanelByName' side panel with 'Notes' header is not displayed to the User
	And Notes icon is not displayed to the 'Relationship label' topic infobox

@MindManager @EditingCapabilities @Relationship_Labels @App_QA @App_Staging @App_Prod @Qase[WEB-390] @Cleanup @Upd_Qase @JIRA[MMCV-4986]
Scenario: Check_that_links_and_attachments_are_displayed_in_the_Relationship_Labels
	When User clicks 'Relationship label' topic on Canvas
	Then 'Relationship label' is outlined with a blue circuit
	When User clicks 'Attachments & Links' button of side Toolbox
	Then 'PanelByName' side panel with 'Attachments & Links' header is displayed to the User
	When User clicks 'Add' action button on 'PanelByName' side panel with 'Attachments & Links' header  and select 'Add Link' item in 'attachments-add-popup' dropdown
	And User enters 'https://www.facebook.com/' in the 'url' field
	And User enters 'Facebook' in the 'title' field
	And User clicks 'Add' footer button on Add Link panel
	Then hyperlinks icon with tooltip 'Facebook' text is displayed in 'Relationship label' topic
	When User clicks Hyperlinks icon in 'Relationship label' topic infobox
	And User switches to '1' tab
	Then page url is 'https://www.facebook.com/'
	When User switches to '0' tab
	Then 'PanelByName' side panel with 'Attachments & Links' header is displayed to the User
	When User uploads 'FruitImages.jpg' file through 'add-attachment-input' input
	Then 'FruitImages.jpg' item is displayed in 'Attachments' section of 'PanelByName' side panel with 'Attachments & Links' header
	And attached image with tooltip 'FruitImages.jpg' is displayed in 'Relationship label' topiс
	When User mouses over 'FruitImages.jpg' item in 'Attachments' section of 'PanelByName' side panel with 'Attachments & Links' header and clicks Remove button
	Then 'No attachments' text of empty content is displayed in 'Attachments' section of 'PanelByName' side panel with 'Attachments & Links' header
	When User mouses over 'Facebook' item in 'Links' section of 'PanelByName' side panel with 'Attachments & Links' header and clicks Remove button
	Then 'No links' text of empty content is displayed in 'Links' section of 'PanelByName' side panel with 'Attachments & Links' header

@MindManager @EditingCapabilities @Relationship_Labels @App_QA @App_Staging @App_Prod @Qase[WEB-396] @Health_Check @Cleanup @Upd_Qase
Scenario: Check_adding_and_editing_Label_boundary
	When User clicks 'Relationship label' topic on Canvas
	Then 'Relationship label' is outlined with a blue circuit
	When User clicks 'Add boundary' button on Tools panel
	Then 'Relationship label' topic is located in boundary on Canvas
	When User selects 'Relationship label' topic boundary body on Canvas
	Then Topic Border is highlight blue color in 'Relationship label' topic on Canvas
	And Boundary outerline is highlighted blue color on the 'Relationship label' topic on Canvas
	When User clicks 'Delete' button on Tools panel
	Then 'Relationship label' topic is not located in boundary on Canvas

@MindManager @EditingCapabilities @Relationship_Labels @App_QA @App_Staging @App_Prod @Qase[WEB-397] @Cleanup @Upd_Qase
Scenario: Check_the_applying_Toolbar_commands_to_the_Label
	When User clicks 'Relationship label' topic on Canvas
	Then 'Relationship label' is outlined with a blue circuit
	When User clicks 'Topic Shape' button on Tools panel
	Then 'Capsule' item is displayed as selected in 'toolpanel' dropdown menu
	When User clicks 'Document' item in 'toolpanel' dropdown menu
	Then 'Relationship label' topic is assigned 'document' shape on Canvas

@MindManager @EditingCapabilities @Relationship_Labels @App_QA @App_Staging @App_Prod @Qase[WEB-391] @Cleanup @Upd_Qase
Scenario: Check_opportunity_to_add_bold_style_text_in_the_Relationship_Labels
	When User clicks 'Relationship label' topic on Canvas
	Then 'Relationship label' is outlined with a blue circuit
	When User double clicks to the 'Relationship label' topic text on Canvas
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks 'bold' button in font style section of text editor in 'TextEditorPopup' container
	Then 'bold' button is selected in font style section of text editor in 'TextEditorPopup' container

@MindManager @EditingCapabilities @Relationship_Labels @App_QA @App_Staging @App_Prod @Qase[WEB-391] @Cleanup @Upd_Qase
Scenario: Check_opportunity_to_add_italic_style_text_in_the_Relationship_Labels
	When User clicks 'Relationship label' topic on Canvas
	Then 'Relationship label' is outlined with a blue circuit
	When User double clicks to the 'Relationship label' topic text on Canvas
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks 'italic' button in font style section of text editor in 'TextEditorPopup' container
	Then 'italic' button is selected in font style section of text editor in 'TextEditorPopup' container

@MindManager @EditingCapabilities @Relationship_Labels @App_QA @App_Staging @App_Prod @Qase[WEB-391] @Cleanup @Upd_Qase
Scenario: Check_opportunity_to_add_underline_style_text_in_the_Relationship_Labels
	When User clicks 'Relationship label' topic on Canvas
	Then 'Relationship label' is outlined with a blue circuit
	When User double clicks to the 'Relationship label' topic text on Canvas
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks 'underline' button in font style section of text editor in 'TextEditorPopup' container
	Then 'underline' button is selected in font style section of text editor in 'TextEditorPopup' container

@MindManager @EditingCapabilities @Relationship_Labels @App_QA @App_Staging @App_Prod @Qase[WEB-391] @Cleanup @Upd_Qase
Scenario: Check_opportunity_to_add_strikethrough_style_text_in_the_Relationship_Labels
	When User clicks 'Relationship label' topic on Canvas
	Then 'Relationship label' is outlined with a blue circuit
	When User double clicks to the 'Relationship label' topic text on Canvas
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks 'strikethrough' button in font style section of text editor in 'TextEditorPopup' container
	Then 'strikethrough' button is selected in font style section of text editor in 'TextEditorPopup' container

@MindManager @EditingCapabilities @Relationship_Labels @App_QA @App_Staging @App_Prod @Qase[WEB-391] @Cleanup @Upd_Qase @JIRA[MMCV-9794]
Scenario: Check_opportunity_to_add_FontSize_style_text_in_the_Relationship_Labels
	When User clicks 'Relationship label' topic on Canvas
	Then 'Relationship label' is outlined with a blue circuit
	When User clicks on text in the 'Relationship label' topic on Canvas
	And User presses the Ctrl_A combination key on the keyboard
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks font size section in text editor and selects '20' option in 'text-style-size' selectbox in 'TextEditorPopup' container
	And User clicks by coordinates '50' and '50' on Canvas
	Then 'Relationship label' topic text has '26.666' size

@MindManager @EditingCapabilities @Relationship_Labels @App_QA @App_Staging @App_Prod @Qase[WEB-391] @Cleanup @Upd_Qase
Scenario: Check_opportunity_to_add_FontType_style_text_in_the_Relationship_Labels
	When User clicks 'Relationship label' topic on Canvas
	Then 'Relationship label' is outlined with a blue circuit
	When User clicks on text in the 'Relationship label' topic on Canvas
	And User presses the Ctrl_A combination key on the keyboard
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks font family section in text editor and selects 'Verdana' option in 'font-family' selectbox in 'TextEditorPopup' container
	Then 'Relationship label' topic text is displayed  'Verdana' in font

@MindManager @EditingCapabilities @Relationship_Labels @App_QA @App_Staging @App_Prod @Qase[WEB-391] @Cleanup @Upd_Qase
Scenario: Check_opportunity_to_add_color_style_text_in_the_Relationship_Labels
	When User clicks 'Relationship label' topic on Canvas
	Then 'Relationship label' is outlined with a blue circuit
	When User clicks on text in the 'Relationship label' topic on Canvas
	And User presses the Ctrl_A combination key on the keyboard
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks Color button in text editor in 'TextEditorPopup' container
	Then Color Picker window is displayed to User
	When User enters '#ff1d921e' hex code in input field on Color picker
	And User clicks 'Apply' button in Color Picker window
	Then 'Relationship label' topic text has 'rgba(29, 146, 30, 1)' color on Canvas

@MindManager @EditingCapabilities @Relationship_Labels @App_QA @App_Staging @App_Prod @Qase[WEB-391] @Cleanup @Upd_Qase
Scenario: Check_opportunity_to_delete_text_in_the_Relationship_Labels
	When User clicks 'Relationship label' topic on Canvas
	Then 'Relationship label' is outlined with a blue circuit
	When User clicks on text in the 'Relationship label' topic on Canvas
	And User presses the Ctrl_A combination key on the keyboard
	And User presses the 'Delete' key on the keyboard
	Then text 'Relationship label' is not displayed to the topic on Canvas

@MindManager @EditingCapabilities @Relationship_Labels @App_QA @App_Staging @App_Prod @Qase[WEB-398] @Cleanup @Upd_Qase
Scenario: Check_opportunity_to_add_subtopic_in_the_Relationship_Labels
	When User clicks 'Relationship label' topic on Canvas
	Then 'Relationship label' is outlined with a blue circuit
	When User presses the 'Insert' key on the keyboard
	Then '1' subtopics with the name 'Subtopic' are displayed on Canvas

@MindManager @EditingCapabilities @Relationship_Labels @App_QA @App_Staging @App_Prod @Qase[WEB-398] @Cleanup @Upd_Qase
Scenario: Check_opportunity_to_remove_subtopic_in_the_Relationship_Labels
	When User clicks 'Relationship label' topic on Canvas
	Then 'Relationship label' is outlined with a blue circuit
	When User presses the 'Insert' key on the keyboard
	Then '1' subtopics with the name 'Subtopic' are displayed on Canvas
	When User presses the 'Delete' key on the keyboard
	Then 'Subtopic' topic is not displayed on Canvas

@MindManager @EditingCapabilities @Relationship_Labels @App_QA @App_Staging @App_Prod @Qase[WEB-399] @Cleanup @Upd_Qase
Scenario: Check_opportunity_to_copy_and_paste_in_the_Relationship_Labels
	When User clicks 'Relationship label' topic on Canvas
	Then 'Relationship label' is outlined with a blue circuit
	When User clicks 'Copy' button on Tools panel
	And User clicks 'MT1' topic on Canvas
	Then 'MT1' is outlined with a blue circuit
	When User clicks 'Paste' button on Tools panel
	Then '2' topics name 'Relationship label' are displayed on Canvas
	And 'Relationship label' callout is displayed on Canvas

@MindManager @EditingCapabilities @Relationship_Labels @App_QA @App_Staging @App_Prod @Qase[WEB-399] @Cleanup @Upd_Qase
Scenario: Check_opportunity_to_cut_and_paste_in_the_Relationship_Labels
	When User clicks 'Relationship label' topic on Canvas
	Then 'Relationship label' is outlined with a blue circuit
	When User clicks 'Cut' button on Tools panel
	Then 'Relationship label' topic is not displayed on Canvas
	When User clicks 'Floating Topic' topic on Canvas
	Then 'Floating Topic' is outlined with a blue circuit
	When User clicks 'Paste' button on Tools panel
	Then '1' topics name 'Relationship label' are displayed on Canvas
	And 'Relationship label' callout is displayed on Canvas

@MindManager @EditingCapabilities @Relationship_Labels @App_QA @App_Staging @App_Prod @Qase[WEB-399] @Cleanup @Upd_Qase
Scenario: Check_opportunity_to_add_color_and_format_painter_in_the_Relationship_Labels
	When User clicks 'Relationship label' topic on Canvas
	Then 'Relationship label' is outlined with a blue circuit
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#2fccc4' hex code in input field on Color picker
	And User clicks 'Apply' button in Color Picker window
	Then 'Relationship label' topic has Fill Color 'rgb(47, 204, 196)' on Canvas
	When User clicks 'Format painter' button on Tools panel
	Then 'format painter' icon is displayed beside cursor
	When User clicks 'MT1' topic on Canvas
	Then 'format painter' icon is not displayed beside cursor
	And 'MT1' topic has Fill Color 'rgb(47, 204, 196)' on Canvas

@MindManager @EditingCapabilities @Relationship_Labels @App_QA @App_Staging @App_Prod @Qase[WEB-392] @Cleanup @Upd_Qase
Scenario: Check_opportunity_to_Add_Relationship_between_topics
	When User clicks 'Floating Topic' topic on Canvas
	Then 'Floating Topic' is outlined with a blue circuit
	When User clicks Add relationship button on the Toolbar
	Then cursor relationship added to the 'Floating Topic' topic on Canvas
	When User clicks 'FT1' topic on Canvas
	Then '2' relationship lines are displayed on Canvas

@MindManager @EditingCapabilities @Relationship_Labels @App_QA @App_Staging @App_Prod @Qase[WEB-392] @Cleanup @Upd_Qase @JIRA[MMCV-9960]
Scenario: Check_opportunity_to_Add_text_to_Relationship_between_topics
	When User clicks 'Floating Topic' topic on Canvas
	Then 'Floating Topic' is outlined with a blue circuit
	When User clicks Add relationship button on the Toolbar
	Then cursor relationship added to the 'Floating Topic' topic on Canvas
	When User clicks 'CT' topic on Canvas
	Then '2' relationship lines are displayed on Canvas
	When User clicks on the '2' relationship line dynamic selection
	Then relationship is selected on Canvas
	When User clicks Relationship label on Canvas
	And User enters 'Relationship' text to the topic on Canvas
	Then text 'Relationship' is displayed to the topic on Canvas
	When User presses the 'Enter' key on the keyboard

@MindManager @EditingCapabilities @Relationship_Labels @App_QA @App_Staging @App_Prod @Qase[WEB-392] @Cleanup @Upd_Qase
Scenario: Check_opportunity_to_Add_Relationship_between_label_and_topic
	When User clicks 'Relationship label' topic on Canvas
	Then 'Relationship label' is outlined with a blue circuit
	When User clicks Add relationship button on the Toolbar
	Then cursor relationship added to the 'Relationship label' topic on Canvas
	When User clicks 'MT1' topic on Canvas
	Then '2' relationship lines are displayed on Canvas

@MindManager @EditingCapabilities @Relationship_Labels @App_QA @App_Staging @App_Prod @Qase[WEB-392] @Cleanup @Upd_Qase
Scenario: Check_opportunity_to_Delete_Relationship_between_label_and_topic
	When User clicks 'Relationship label' topic on Canvas
	Then 'Relationship label' is outlined with a blue circuit
	When User clicks Add relationship button on the Toolbar
	Then cursor relationship added to the 'Relationship label' topic on Canvas
	When User clicks 'MT1' topic on Canvas
	Then '2' relationship lines are displayed on Canvas
	When User clicks on the '2' relationship line dynamic selection
	Then relationship is selected on Canvas
	When User clicks 'Delete' button on Tools panel
	Then '1' relationship lines are displayed on Canvas

@MindManager @EditingCapabilities @Relationship_Labels @App_QA @App_Staging @App_Prod @Qase[WEB-393] @Cleanup @Upd_Qase
Scenario: Check_opportunity_to_Add_Relationship_between_label_and_callout
	When User clicks 'MT1' topic on Canvas
	Then 'MT1' is outlined with a blue circuit
	When User clicks 'Add callout' button on Tools panel
	Then 'Callout' callout is displayed on Canvas
	When User clicks 'Relationship label' topic on Canvas
	Then 'Relationship label' is outlined with a blue circuit
	When User clicks Add relationship button on the Toolbar
	Then cursor relationship added to the 'Relationship label' topic on Canvas
	When User clicks 'Callout' topic on Canvas
	Then '2' relationship lines are displayed on Canvas
	
@MindManager @EditingCapabilities @Relationship_Labels @App_QA @App_Staging @App_Prod @Qase[WEB-393] @Cleanup @Upd_Qase
Scenario: Check_opportunity_to_Delete_Relationship_between_label_and_callout
	When User clicks 'MT1' topic on Canvas
	Then 'MT1' is outlined with a blue circuit
	When User clicks 'Add callout' button on Tools panel
	Then 'Callout' callout is displayed on Canvas
	When User clicks 'Relationship label' topic on Canvas
	Then 'Relationship label' is outlined with a blue circuit
	When User clicks Add relationship button on the Toolbar
	Then cursor relationship added to the 'Relationship label' topic on Canvas
	When User clicks 'Callout' topic on Canvas
	Then '2' relationship lines are displayed on Canvas
	When User clicks on the '2' relationship line dynamic selection
	Then relationship is selected on Canvas
	When User clicks 'Delete' button on Tools panel
	Then '1' relationship lines are displayed on Canvas