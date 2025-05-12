@retry(2)
Feature: CustomIcons

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @SidePanel @Icons @CustomIcons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-751] @Upd_Qase @JIRA[MMCV-10392]
Scenario: Upload_custom_icon
	When User clicks 'Icons' button of side Toolbox
	When User clicks 'Add' action button on 'PanelByName' side panel with 'Icons' header  and select 'Add custom icon' item in 'icons-add-popup' dropdown
	Then 'add-custom-icon' dialog is displayed to User
	When User clicks 'Browse' button in 'add-custom-icon' dialog
	When User uploads 'FruitImages.jpg' file through 'browse-icons' input
	When User enters 'Automation icon Test' value in item input field on Side panel
	When User clicks by coordinates '10' and '10' on Canvas
	Then 'Custom Group 1' section is displayed on 'PanelByName' side panel with 'Icons' header
	Then 'Automation icon Test' item is displayed in 'Custom Group 1' section of 'PanelByName' side panel with 'Icons' header

@MindManager @SidePanel @Icons @CustomIcons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-751] @Upd_Qase @JIRA[MMCV-10392]
Scenario: Check_that_custom_icon_dialog_can_be_closed
	When User clicks 'Icons' button of side Toolbox
	When User clicks 'Add' action button on 'PanelByName' side panel with 'Icons' header  and select 'Add custom icon' item in 'icons-add-popup' dropdown
	Then 'add-custom-icon' dialog is displayed to User
	When User clicks 'Cancel' button in 'add-custom-icon' dialog
	Then 'add-custom-icon' dialog is not displayed to User
	Then 'Custom Group 1' section is not displayed on 'PanelByName' side panel with 'Icons' header
	Then 'Custom Icon 1' item is not displayed in 'Custom Group 1' section of 'PanelByName' side panel with 'Icons' header

@MindManager @SidePanel @Icons @CustomIcons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-752] @Upd_Qase
Scenario: Upload_icon_larger_than_3_Mb
	When User clicks 'Icons' button of side Toolbox
	When User uploads 'Sample-jpg-image-5mb.jpg' file through 'browse-icons' input
	Then 'add-custom-icon' dialog is displayed to User
	Then 'File size is too large, the max file upload size is 3MB' warning message is displayed in 'add-custom-icon' dialog
	When User clicks 'Cancel' button in 'add-custom-icon' dialog
	Then 'add-custom-icon' dialog is not displayed to User

@MindManager @SidePanel @Icons @CustomIcons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-752] @Upd_Qase @JIRA[MMCV-10392]
Scenario: Upload_custom_icon_with_allowed_size_after_trying_to_upload_larger_than_3_Mb
	When User clicks 'Icons' button of side Toolbox
	When User uploads 'Sample-jpg-image-5mb.jpg' file through 'browse-icons' input
	Then 'add-custom-icon' dialog is displayed to User
	Then 'File size is too large, the max file upload size is 3MB' warning message is displayed in 'add-custom-icon' dialog
	When User clicks 'Browse' button in 'add-custom-icon' dialog
	When User uploads 'FruitImages.jpg' file through 'browse-icons' input
	Then 'Custom Group 1' section is displayed on 'PanelByName' side panel with 'Icons' header
	Then 'Custom Icon 1' item is displayed in 'Custom Group 1' section of 'PanelByName' side panel with 'Icons' header

@MindManager @SidePanel @Icons @CustomIcons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-753] @Upd_Qase
Scenario: Rename_custom_icon_from_side_panel
	When User clicks 'MT2ST1' topic on Canvas
	When User clicks 'Icons' button of side Toolbox
	When User hovers over 'Icon #3' item in 'Custom icon group' section on 'PanelByName' side panel with 'Icons' header and clicks ellips button
	When User clicks 'Rename' item in 'inspector-item-triple-dot-popup' dropdown menu
	Then 'Icon #3' item is displayed as editable in 'Custom icon group' section of 'PanelByName' side panel with 'Icons' header
	When User enters 'Automation icon *53' value in item input field on Side panel
	Then 'Automation icon *53' item is displayed in 'Custom icon group' section of 'PanelByName' side panel with 'Icons' header
	Then 'Icon #3' item is not displayed in 'Custom icon group' section of 'PanelByName' side panel with 'Icons' header
	When User hover over 'Automation icon *53' icon in 'MT2ST1' topic
	Then 'Automation icon *53' tooltip is displayed to the User

@MindManager @SidePanel @Icons @CustomIcons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-753] @JIRA[MMCV-10024] @Upd_Qase
Scenario: To_check_that_icon_name_is_preselected_when_renaming_custom_icon_from_side_panel
	When User clicks 'MT2ST1' topic on Canvas
	When User clicks 'Icons' button of side Toolbox
	When User hovers over 'Icon #3' item in 'Custom icon group' section on 'PanelByName' side panel with 'Icons' header and clicks ellips button
	When User clicks 'Rename' item in 'inspector-item-triple-dot-popup' dropdown menu
	Then 'Icon #3' item is displayed as editable in 'Custom icon group' section of 'PanelByName' side panel with 'Icons' header
	When User enters 'Automation icon *53' value in item input field without clearing
	When User presses the 'Enter' key on the keyboard
	Then 'Automation icon *53' item is displayed in 'Custom icon group' section of 'PanelByName' side panel with 'Icons' header
	Then 'Icon #3' item is not displayed in 'Custom icon group' section of 'PanelByName' side panel with 'Icons' header
	When User hover over 'Automation icon *53' icon in 'MT2ST1' topic
	Then 'Automation icon *53' tooltip is displayed to the User

@MindManager @SidePanel @Icons @CustomIcons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-754] @Upd_Qase
Scenario: Remove_custom_icon_from_file_when_icon_applied_to_topic
	When User clicks 'Icons' button of side Toolbox
	When User hovers over 'Icon #3' item in 'Custom icon group' section on 'PanelByName' side panel with 'Icons' header and clicks ellips button
	When User clicks 'Remove from group' item in 'inspector-item-triple-dot-popup' dropdown menu
	Then 'remove-group' dialog is displayed to User
	Then text 'Warning: Removal of this icon from its group will also remove it from any topics where it is in use.' displayed in 'remove-group' dialog
	When User clicks 'Cancel' button in 'remove-group' dialog
	Then 'Icon #3' item is displayed in 'Custom icon group' section of 'PanelByName' side panel with 'Icons' header
	Then 'Icon #3' Icon is displayed to the 'MT2ST1' Topic
	When User hovers over 'Icon #3' item in 'Custom icon group' section on 'PanelByName' side panel with 'Icons' header and clicks ellips button
	When User clicks 'Remove from group' item in 'inspector-item-triple-dot-popup' dropdown menu
	Then 'remove-group' dialog is displayed to User
	When User clicks 'Remove icon' button in 'remove-group' dialog
	Then 'Icon #3' item is not displayed in 'Custom icon group' section of 'PanelByName' side panel with 'Icons' header
	Then 'Icon #3' Icon is not displayed to the 'MT2ST1' Topic

@MindManager @SidePanel @Icons @CustomIcons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-754] @Upd_Qase
Scenario: Cancel_removing_custom_icon_when_icon_applied_to_topic
	When User clicks 'Icons' button of side Toolbox
	When User hovers over 'Icon #3' item in 'Custom icon group' section on 'PanelByName' side panel with 'Icons' header and clicks ellips button
	When User clicks 'Remove from group' item in 'inspector-item-triple-dot-popup' dropdown menu
	Then 'remove-group' dialog is displayed to User
	When User clicks 'Cancel' button in 'remove-group' dialog
	Then 'Icon #3' item is displayed in 'Custom icon group' section of 'PanelByName' side panel with 'Icons' header
	Then 'Icon #3' Icon is displayed to the 'MT2ST1' Topic

@MindManager @SidePanel @Icons @CustomIcons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-755] @Upd_Qase
Scenario: Remove_custom_icon_from_file_when_icon_not_applied_to_topic
	When User clicks 'Icons' button of side Toolbox
	When User hovers over 'Icon #1' item in 'Custom icon group' section on 'PanelByName' side panel with 'Icons' header and clicks ellips button
	When User clicks 'Remove from group' item in 'inspector-item-triple-dot-popup' dropdown menu
	When User moves cursor mouse on Canvas
	Then 'Icon #1' item is not displayed in 'Custom icon group' section of 'PanelByName' side panel with 'Icons' header

@MindManager @SidePanel @Icons @CustomIcons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-756] @Upd_Qase
Scenario: Add_custom_icon_to_topic
	When User clicks 'MT1' topic on Canvas
	When User clicks 'Icons' button of side Toolbox
	When User clicks 'Icon #1' item in 'Custom icon group' section of 'PanelByName' side panel with 'Icons' header
	Then 'Icon #1' item is displayed as selected in 'Custom icon group' section of 'PanelByName' side panel with 'Icons' header
	Then 'Icon #1' Icon is displayed to the 'MT1' Topic