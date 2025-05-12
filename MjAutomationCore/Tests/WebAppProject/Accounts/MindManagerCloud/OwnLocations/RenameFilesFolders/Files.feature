@retry(2)
Feature: Files
Check that files can be renamed on MM Cloud

Background: Pre-condition
	Given User is logged into MindManager web app via Api
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User clicks 'MindManager Files' content item
	When User clicks 'For QA Automation' folder
	When User clicks 'RuntimeData File' folder
	When User hovers on 'auto_test_SRND' file and clicks on 'triple-dot-actions' action button
	Then 'service-items-action' dropdown menu is displayed to User

@MindManager @MindManagerCloud @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1906] @JIRA[MMCV-10510] @Upd_Qase
Scenario: Verify_that_all_file_action_are_available
	Then following items is displayed in 'service-items-action' dropdown menu
		| items     |
		| Share     |
		| Rename    |
		| Duplicate |
		| Move to   |
		| Delete    |

@MindManager @MindManagerCloud @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1906] @JIRA[MMCV-10510] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_rename_map_with_digit
	When User clicks 'Rename' item in 'service-items-action' dropdown menu
	Then 'rename-dialog' dialog is displayed to User
	When User enters 'This is my new Cloud 1 folder' value in the 'rename-file' field in 'rename-dialog' dialog
	When User clicks 'Rename' button in 'rename-dialog' dialog
	Then 'This is my new Cloud 1 folder' item is displayed on content manager page

@MindManager @MindManagerCloud @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1905] @JIRA[MMCV-9434] @Upd_Qase
Scenario: Verify_that_it_is_not_possible_to_rename_map_with_empty_name
	When User clicks 'Rename' item in 'service-items-action' dropdown menu
	Then 'rename-dialog' dialog is displayed to User
	When User clears the 'rename-file' field in 'rename-dialog' dialog by backspace key
	Then '' value is displayed in the 'rename-file' field in 'rename-dialog' dialog
	When User clicks 'Rename' button in 'rename-dialog' dialog
	Then 'rename-file' input field has style 'border: 1px solid red' in 'rename-dialog' dialog

@MindManager @MindManagerCloud @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1907] @Upd_Qase @JIRA[MMCV-9832]
Scenario: Verify_that_it_is_possible_to_rename_map_with_special_characters
	When User clicks 'Rename' item in 'service-items-action' dropdown menu
	Then 'rename-dialog' dialog is displayed to User
	When User enters 'This map name c0nta^ns spe$i@l `sy^^bo$_RND' value in the 'rename-file' field in 'rename-dialog' dialog
	When User clicks 'Rename' button in 'rename-dialog' dialog
	Then 'rename-dialog' dialog is not displayed to User
	Then 'This map name c0nta^ns spe$i@l `sy^^bo$_RND' item is displayed on content manager page

@MindManager @MindManagerCloud @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1922] @Upd_Qase
Scenario: Verify_that_it_is_not_possible_to_rename_map_with_space_before_name
	When User clicks 'Rename' item in 'service-items-action' dropdown menu
	Then 'rename-dialog' dialog is displayed to User
	When User enters ' Space before name_SRND' value in the 'rename-file' field in 'rename-dialog' dialog
	When User clicks 'Rename' button in 'rename-dialog' dialog
	Then text 'Invalid filename: filename shouldn't contain leading or trailing spaces' displayed in 'rename-dialog' dialog

@MindManager @MindManagerCloud @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1924] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_rename_map_with_regular_name
	When User clicks 'Rename' item in 'service-items-action' dropdown menu
	Then 'rename-dialog' dialog is displayed to User
	When User enters 'this is the file with regular name_SRND' value in the 'rename-file' field in 'rename-dialog' dialog
	When User clicks 'Rename' button in 'rename-dialog' dialog
	Then 'this is the file with regular name_SRND' item is displayed on content manager page