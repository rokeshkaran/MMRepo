@retry(2)
Feature: CustomIconsGroup

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Icons' button of side Toolbox

@MindManager @SidePanel @Icons @CustomIconsGroup @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-748] @Upd_Qase
Scenario: Check_the_functionality_of_Icons_add_dropdown_menu_on_Icons_side_panel
	When User clicks 'Add' action button on 'PanelByName' side panel with 'Icons' header
	Then 'icons-add-popup' dropdown menu is displayed to User
	Then following items is displayed in 'icons-add-popup' dropdown menu
		| items                 |
		| Add custom icon       |
		| Add icon from library |
		| Add custom icon group |

@MindManager @SidePanel @Icons @CustomIconsGroup @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-748] @Upd_Qase
Scenario: Add_custom_icon_group
	When User clicks 'Add' action button on 'PanelByName' side panel with 'Icons' header
	When User clicks 'Add custom icon group' item in 'icons-add-popup' dropdown menu
	Then 'Custom Group 1' section is displayed on 'PanelByName' side panel with 'Icons' header

@MindManager @SidePanel @Icons @CustomIconsGroup @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-748] @JIRA[MMCV-10024] @Upd_Qase
Scenario: Add_custom_icon_group_and_check_that_group_name_is_preselected
	When User clicks 'Add' action button on 'PanelByName' side panel with 'Icons' header
	When User clicks 'Add custom icon group' item in 'icons-add-popup' dropdown menu
	Then 'Custom Group 1' section is displayed as editable on side panel
	When User enters 'Automation icon group' value in section header input field without clearing
	When User presses the 'Enter' key on the keyboard
	Then 'Automation icon group' section is displayed on 'PanelByName' side panel with 'Icons' header

@MindManager @SidePanel @Icons @CustomIconsGroup @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-748] @Upd_Qase
Scenario: To_check_that_created_custom_icon_group_is_mutually_exclusive
	When User clicks 'Add' action button on 'PanelByName' side panel with 'Icons' header
	When User clicks 'Add custom icon group' item in 'icons-add-popup' dropdown menu
	Then 'Custom Group 1' section is displayed on 'PanelByName' side panel with 'Icons' header
	When User hovers over at 'Custom Group 1' section header on 'PanelByName' side panel with 'Icons' header and clicks ellips button
	Then 'group-header-context-menu' Menu is displayed to User
	Then 'mutually-exclusive' toggle with 'Mutually exclusive' name is enabled in 'group-header-context-menu' Menu

@MindManager @SidePanel @Icons @CustomIconsGroup @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-748] @Upd_Qase
Scenario: To_check_that_next_created_custom_icon_group_has_a_sequence_number_one_higher
	When User clicks 'Add' action button on 'PanelByName' side panel with 'Icons' header
	When User clicks 'Add custom icon group' item in 'icons-add-popup' dropdown menu
	Then 'Custom Group 1' section is displayed on 'PanelByName' side panel with 'Icons' header
	When User clicks 'Add' action button on 'PanelByName' side panel with 'Icons' header
	When User clicks 'Add custom icon group' item in 'icons-add-popup' dropdown menu
	Then 'Custom Group 2' section is displayed on 'PanelByName' side panel with 'Icons' header
	When User clicks 'Add' action button on 'PanelByName' side panel with 'Icons' header
	When User clicks 'Add custom icon group' item in 'icons-add-popup' dropdown menu
	Then 'Custom Group 3' section is displayed on 'PanelByName' side panel with 'Icons' header

@MindManager @SidePanel @Icons @CustomIconsGroup @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-748] @Upd_Qase
Scenario: To_check_that_custom_icon_group_at_the_top_of_group_list
	When User clicks 'Add' action button on 'PanelByName' side panel with 'Icons' header
	When User clicks 'Add custom icon group' item in 'icons-add-popup' dropdown menu
	Then 'Custom Group 1' section is displayed at top on 'PanelByName' side panel with 'Icons' header
	When User clicks 'Add' action button on 'PanelByName' side panel with 'Icons' header
	When User clicks 'Add custom icon group' item in 'icons-add-popup' dropdown menu
	Then 'Custom Group 2' section is displayed at top on 'PanelByName' side panel with 'Icons' header
	When User clicks 'Add' action button on 'PanelByName' side panel with 'Icons' header
	When User clicks 'Add custom icon group' item in 'icons-add-popup' dropdown menu
	Then 'Custom Group 3' section is displayed at top on 'PanelByName' side panel with 'Icons' header

@MindManager @SidePanel @Icons @CustomIconsGroup @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-749] @Upd_Qase
Scenario: Remove_custom_icon_group
	When User clicks 'Add' action button on 'PanelByName' side panel with 'Icons' header
	When User clicks 'Add custom icon group' item in 'icons-add-popup' dropdown menu
	When User clicks by coordinates '10' and '10' on Canvas
	When User clicks 'Add' action button on 'PanelByName' side panel with 'Icons' header  and select 'Add custom icon' item in 'icons-add-popup' dropdown
	Then 'add-custom-icon' dialog is displayed to User
	When User clicks 'Browse' button in 'add-custom-icon' dialog
	When User uploads 'FruitImages.jpg' file through 'browse-icons' input
	When User enters 'Automation icon Test' value in item input field on Side panel
	When User clicks by coordinates '10' and '10' on Canvas
	Then 'Custom Group 1' section is displayed on 'PanelByName' side panel with 'Icons' header
	Then 'Automation icon Test' item is displayed in 'Custom Group 1' section of 'PanelByName' side panel with 'Icons' header
	When User clicks 'FT2' topic on Canvas
	When User clicks 'Automation icon Test' item in 'Custom Group 1' section of 'PanelByName' side panel with 'Icons' header
	Then 'Automation icon Test' Icon is displayed to the 'FT2' Topic
	When User hovers over at 'Custom Group 1' section header on 'PanelByName' side panel with 'Icons' header and clicks ellips button
	Then 'group-header-context-menu' Menu is displayed to User
	When User clicks button with 'remove' name in 'group-header-context-menu' menu
	When User clicks 'Remove group' button in 'remove-group' dialog
	Then 'Custom Group 1' section is not displayed on 'PanelByName' side panel with 'Icons' header
	Then 'Automation icon Test' Icon is not displayed to the 'FT2' Topic

@MindManager @SidePanel @Icons @CustomIconsGroup @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-750] @Upd_Qase
Scenario: Rename_custom_icon_group
	When User hovers over at 'Custom icon group' section header on 'PanelByName' side panel with 'Icons' header and clicks ellips button
	When User clicks button with 'rename' name in 'group-header-context-menu' menu
	Then 'Custom icon group' section is displayed as editable on side panel
	When User enters 'Automation icon group' value in section header input field on Side panel
	Then 'Custom icon group' section is not displayed on 'PanelByName' side panel with 'Icons' header
	Then 'Automation icon group' section is displayed on 'PanelByName' side panel with 'Icons' header