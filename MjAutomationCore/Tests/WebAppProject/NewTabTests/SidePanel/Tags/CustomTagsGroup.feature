@retry(2)
Feature: CustomTagsGroup

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Tags' button of side Toolbox

@MindManager @SidePanel @Tags @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-767] @Upd_Qase
Scenario: Verify_that_users_can_add_add_new_custom_tag_groups
	Then 'PanelByName' side panel with 'Tags' header is displayed to the User
	When User clicks 'Add' action button on 'PanelByName' side panel with 'Tags' header
	Then 'tags-add-popup' dropdown menu is displayed to User
	Then following items is displayed in 'tags-add-popup' dropdown menu
		| items                |
		| Add custom tag       |
		| Add custom tag group |
	When User clicks 'Add custom tag group' item in 'tags-add-popup' dropdown menu
	Then 'Custom Group 1' section is displayed on 'PanelByName' side panel with 'Tags' header
	When User hovers over at 'Custom Group 1' section header on 'PanelByName' side panel with 'Tags' header and clicks ellips button
	Then 'group-header-context-menu' Menu is displayed to User
	Then 'mutually-exclusive' toggle with 'Mutually exclusive' name is enabled in 'group-header-context-menu' Menu

@MindManager @SidePanel @Tags @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-768] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_remove_custom_tag_group_from_the_file
	Then 'PanelByName' side panel with 'Tags' header is displayed to the User
	Then 'Custom tag group' section is displayed on 'PanelByName' side panel with 'Tags' header
	Then following items is displayed in 'Custom tag group' section of 'PanelByName' side panel with 'Tags' header:
		| item   |
		| Tag #1 |
		| Tag #2 |
		| Tag #3 |
	When User hovers over at 'Custom tag group' section header on 'PanelByName' side panel with 'Tags' header and clicks ellips button
	When User clicks button with 'remove' name in 'group-header-context-men' menu
	Then 'remove-group' dialog is displayed to User
	When User clicks 'Remove group' button in 'remove-group' dialog
	Then 'Custom tag group' section is not displayed on 'PanelByName' side panel with 'Tags' header
	Then 'Tag #2' tag is not displayed in 'MT4ST3' topic infobox

@MindManager @SidePanel @Tags @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-769] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_rename_custom_tag_group
	Then 'PanelByName' side panel with 'Tags' header is displayed to the User
	When User hovers over at 'Custom tag group' section header on 'PanelByName' side panel with 'Tags' header and clicks ellips button
	Then 'group-header-context-menu' Menu is displayed to User
	When User clicks button with 'rename' name in 'group-header-context-menu' menu
	When User enters 'Automation group' value in section header input field on Side panel
	Then 'Custom tag group' section is not displayed on 'PanelByName' side panel with 'Tags' header
	Then 'Automation group' section is displayed on 'PanelByName' side panel with 'Tags' header