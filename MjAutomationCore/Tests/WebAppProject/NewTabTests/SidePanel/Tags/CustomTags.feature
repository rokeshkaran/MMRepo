@retry(2)
Feature: CustomTags

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @SidePanel @Tags @CustomTags @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-771] @Upd_Qase @JIRA[MMCV-7926]
Scenario: Verify_that_it_is_possible_to_rename_custom_tag_from_side_panel
	When User clicks 'MT4ST1ST2' topic on Canvas
	Then 'MT4ST1ST2' is outlined with a blue circuit
	When User clicks 'Tags' button of side Toolbox
	Then 'PanelByName' side panel with 'Tags' header is displayed to the User
	Then 'Tags_1' item is displayed as selected in 'General Tags' section of 'PanelByName' side panel with 'Tags' header
	When User hovers over 'Tags_1' item in 'General Tags' section on 'PanelByName' side panel with 'Tags' header and clicks ellips button
	Then 'inspector-item-triple-dot-popup' dropdown menu is displayed to User
	When User clicks 'Rename' item in 'inspector-item-triple-dot-popup' dropdown menu
	When User enters 'Automation_tags_11' value in item input field on Side panel
	Then 'Automation_tags_11' item is displayed in 'General Tags' section of 'PanelByName' side panel with 'Tags' header
	Then 'Tags_1' item is not displayed in 'General Tags' section of 'PanelByName' side panel with 'Tags' header
	When User mouses over 'Automation_tags_11' tag in 'MT4ST1ST2' topic infobox
	Then 'Automation_tags_11' tooltip is displayed to the User

@MindManager @SidePanel @Tags @CustomTags @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-772] @Upd_Qase
Scenario: Verify_that_user_can_remove_custom_tag_from_file_when_icon_applied_to_topic
	When User clicks 'Tags' button of side Toolbox
	Then 'PanelByName' side panel with 'Tags' header is displayed to the User
	When User hovers over 'Tag #2' item in 'Custom tag group' section on 'PanelByName' side panel with 'Tags' header and clicks ellips button
	Then 'inspector-item-triple-dot-popup' dropdown menu is displayed to User
	When User clicks 'Remove from group' item in 'inspector-item-triple-dot-popup' dropdown menu
	Then 'remove-group' dialog is displayed to User
	When User clicks 'Remove tag' button in 'remove-group' dialog
	Then 'Tag #2' item is not displayed in 'Custom tag group' section of 'PanelByName' side panel with 'Tags' header
	Then 'Tag #2' tag is not displayed in 'MT4ST3' topic infobox

@MindManager @SidePanel @Tags @CustomTags @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-773] @Upd_Qase
Scenario: Verify_that_user_can_remove_custom_tag_from_file_when_icon_not_applied_to_topic
	When User clicks 'Tags' button of side Toolbox
	Then 'PanelByName' side panel with 'Tags' header is displayed to the User
	When User hovers over 'Tag #3' item in 'Custom tag group' section on 'PanelByName' side panel with 'Tags' header and clicks ellips button
	Then 'inspector-item-triple-dot-popup' dropdown menu is displayed to User
	When User clicks 'Remove from group' item in 'inspector-item-triple-dot-popup' dropdown menu
	Then 'Tag #3' item is not displayed in 'Custom tag group' section of 'PanelByName' side panel with 'Tags' header

@MindManager @SidePanel @Tags @CustomTags @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-774] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_create_custom_tag
	When User clicks 'Tags' button of side Toolbox
	Then 'PanelByName' side panel with 'Tags' header is displayed to the User
	When User clicks 'Add' action button on 'PanelByName' side panel with 'Tags' header
	Then 'tags-add-popup' dropdown menu is displayed to User
	Then following items is displayed in 'tags-add-popup' dropdown menu
		| items                |
		| Add custom tag       |
		| Add custom tag group |
	When User clicks 'Add custom tag' item in 'tags-add-popup' dropdown menu
	Then 'Custom Group 1' section is displayed on 'PanelByName' side panel with 'Tags' header
	Then 'Custom Tag 1' item is displayed in 'Custom Group 1' section of 'PanelByName' side panel with 'Tags' header
	Then 'Custom Tag 1' item is displayed as editable in 'Custom Group 1' section of 'PanelByName' side panel with 'Tags' header

@MindManager @SidePanel @Tags @CustomTags @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-775] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_add_custom_tag_to_topic
	When User clicks 'MT1' topic on Canvas
	Then 'MT1' is outlined with a blue circuit
	When User clicks 'Tags' button of side Toolbox
	Then 'PanelByName' side panel with 'Tags' header is displayed to the User
	When User clicks 'Tag #1' item in 'Custom tag group' section of 'PanelByName' side panel with 'Tags' header
	Then 'Tag #1' item is displayed as selected in 'Custom tag group' section of 'PanelByName' side panel with 'Tags' header
	Then 'Tag #1' tag is displayed in 'MT1' topic infobox