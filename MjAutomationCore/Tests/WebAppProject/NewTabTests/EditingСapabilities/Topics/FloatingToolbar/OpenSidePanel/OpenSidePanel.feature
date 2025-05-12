@retry(2)
Feature: OpenSidePanel
Check the functionality of floating Toolbar for opening Side Panel

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Text Formatting' topic on Canvas
	Then Floating Toolbar is displayed on Canvas

@MindManager @EditingCapabilities @FloatingToolbar @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2428] @Upd_Qase
Scenario: Check_that_it_is_possible_to_open_icon_side_panel_via_Floating_Toolbar
	When User clicks on 'Icons' option in Floating Toolbar Popup
	Then 'PanelByName' side panel with 'Icons' header is displayed to the User
	When User clicks 'Icon #1' item in 'Custom icon group' section of 'PanelByName' side panel with 'Icons' header
	Then 'Icon #1' item is displayed as selected in 'Custom icon group' section of 'PanelByName' side panel with 'Icons' header
	Then 'Icon #1' Icon is displayed to the 'Text Formatting' Topic

@MindManager @EditingCapabilities @FloatingToolbar @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2429] @Upd_Qase
Scenario: Check_that_it_is_possible_to_open_tags_side_panel_via_Floating_Toolbar
	When User clicks on 'Tags' option in Floating Toolbar Popup
	Then 'PanelByName' side panel with 'Tags' header is displayed to the User
	When User clicks 'Tag #1' item in 'Custom tag group' section of 'PanelByName' side panel with 'Tags' header
	Then 'Tag #1' tag is displayed in 'Text Formatting' topic infobox
	Then 'Tag #1' item is displayed as selected in 'Custom tag group' section of 'PanelByName' side panel with 'Tags' header

@MindManager @EditingCapabilities @FloatingToolbar @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2430] @Upd_Qase
Scenario: Check_that_it_is_possible_to_open_Link_side_panel_via_Floating_Toolbar
	When User clicks on 'Attachments & Links' option in Floating Toolbar Popup
	Then 'PanelByName' side panel with 'Attachments & Links' header is displayed to the User
	When User clicks 'Add' action button on 'PanelByName' side panel with 'Attachments & Links' header  and select 'Add Link' item in 'attachments-add-popup' dropdown
	When User enters 'https://www.facebook.com/' in the 'url' field
	When User enters 'Facebook' in the 'title' field
	When User clicks 'Add' footer button on Add Link panel
	Then 'Facebook' item is displayed in 'Links' section of 'PanelByName' side panel with 'Attachments & Links' header
	Then Links icon is displayed to the 'Text Formatting' topic infobox

@MindManager @EditingCapabilities @FloatingToolbar @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2431] @Upd_Qase
Scenario: Check_that_it_is_possible_to_open_Notes_side_panel_via_Floating_Toolbar
	When User clicks on 'Notes' option in Floating Toolbar Popup
	Then 'PanelByName' side panel with 'Notes' header is displayed to the User
	When User enters 'Note#1' text to input note field on Notes panel
	Then 'Note#1' text is dipslayed in Note field on Notes panel
	When User clicks by coordinates '200' and '200' on Canvas
	When User clicks Notes icon in 'Text Formatting' topic infobox
	Then 'Note#1' text is dipslayed in Note field on Notes panel

@MindManager @EditingCapabilities @FloatingToolbar @App_QA @Cleanup @Qase[WEB-2432] @Upd_Qase
Scenario: Check_that_it_is_possible_to_open_Comment_side_panel_via_Floating_Toolbar_QA
	When User clicks on 'Comments' option in Floating Toolbar Popup
	Then 'PanelByName' side panel with 'Comments' header is displayed to the User
	Then 'No comments' text is displayed in comment container on Comments panel
	When User enters 'Automation comment-SRND' in the 'comment-input' textarea
	When User clicks Comment button on Comments panel
	Then '1' number is displayed in the comment icon of the 'Text Formatting' topic infobox
	Then '1' comment contains following info on Comments panel:
		| commentAvatar                      | CommentAuthor              | CommentTopic | CommentText             | CommentTime |
		| https://secure.gravatar.com/avatar | automation.mj.qa@gmail.com |              | Automation comment-SRND | D(0)        |
	Then Comment icon is displayed to the 'Text Formatting' topic infobox

@MindManager @EditingCapabilities @FloatingToolbar @App_Staging @App_Prod @Cleanup @Qase[WEB-2432] @Upd_Qase
Scenario: Check_that_it_is_possible_to_open_Comment_side_panel_via_Floating_Toolbar_STG
	When User clicks on 'Comments' option in Floating Toolbar Popup
	Then 'PanelByName' side panel with 'Comments' header is displayed to the User
	Then 'No comments' text is displayed in comment container on Comments panel
	When User enters 'Automation comment-SRND' in the 'comment-input' textarea
	When User clicks Comment button on Comments panel
	Then '1' number is displayed in the comment icon of the 'Text Formatting' topic infobox
	Then '1' comment contains following info on Comments panel:
		| commentAvatar                      | CommentAuthor | CommentTopic | CommentText             | CommentTime |
		| https://secure.gravatar.com/avatar | Automation_MJ |              | Automation comment-SRND | D(0)        |
	Then Comment icon is displayed to the 'Text Formatting' topic infobox