@retry(2)
Feature: TopicElements

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @Keyboard_Shortcuts @TopicElements @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1402] @Upd_Qase
Scenario: Check_that_user_can_open_Link_side_panel_using_Ctrl_K_keys_for_Attachment
	When User clicks 'MT6' topic on Canvas
	When User presses the Ctrl_K combination key on the keyboard
	Then 'PanelByName' side panel with 'Attachments & Links' header is displayed to the User
	Then 'MM_Attach.mmap' item is displayed in 'Attachments' section of 'PanelByName' side panel with 'Attachments & Links' header
	When User clicks Close button of 'PanelByName' side panel with 'Attachments & Links' header
	Then 'PanelByName' side panel with 'Attachments & Links' header is not displayed to the User

@MindManager @Keyboard_Shortcuts @TopicElements @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1402] @Upd_Qase
Scenario: Check_that_user_can_open_Link_side_panel_using_Ctrl_K_keys_for_Link
	When User clicks 'MT5' topic on Canvas
	When User presses the Ctrl_K combination key on the keyboard
	Then 'PanelByName' side panel with 'Attachments & Links' header is displayed to the User
	Then 'Facebook' item is displayed in 'Links' section of 'PanelByName' side panel with 'Attachments & Links' header
	When User clicks Close button of 'PanelByName' side panel with 'Attachments & Links' header
	Then 'PanelByName' side panel with 'Attachments & Links' header is not displayed to the User

@MindManager @Keyboard_Shortcuts @TopicElements @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1402] @Upd_Qase
Scenario: Check_that_user_can_open_Link_side_panel_using_Ctrl_K_keys_for_topic_not_selected
	When User presses the Ctrl_K combination key on the keyboard
	Then 'PanelByName' side panel with 'Attachments & Links' header is displayed to the User

@MindManager @Keyboard_Shortcuts @TextControls @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1403] @Upd_Qase
Scenario: Check_that_user_can_open_image_tab_using_Ctrl_Shift_I_shortcut_without_selecting_anything
	When User presses the CTRL_SHIFT_I combination key on the keyboard
	Then 'PanelByName' side panel with 'Image' header is displayed to the User
	Then 'Add' action button is displayed of 'PanelByName' side panel with 'Image' header

@MindManager @Keyboard_Shortcuts @TopicElements @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1403] @Upd_Qase
Scenario: Check_that_user_can_open_image_tab_using_Ctrl_Shift_I_shortcut
	When User clicks 'MT8' topic on Canvas
	When User presses the CTRL_SHIFT_I combination key on the keyboard
	Then 'PanelByName' side panel with 'Image' header is displayed to the User
	Then 'Replace' action button is displayed of 'PanelByName' side panel with 'Image' header
	Then 'Size' section is displayed on 'PanelByName' side panel with 'Image' header
	Then 'Type' section is displayed on 'PanelByName' side panel with 'Image' header
	Then 'Location' section is displayed on 'PanelByName' side panel with 'Image' header