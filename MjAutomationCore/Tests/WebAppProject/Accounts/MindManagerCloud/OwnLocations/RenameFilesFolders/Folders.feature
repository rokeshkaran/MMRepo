@retry(2)
Feature: Folders
Check that folders can be renamed on MM Cloud

Background: Pre-condition
	Given User is logged into MindManager web app via Api
	When User create 'Test_Folder_SRND' folder in 'For QA Automation' directory of Mind Manager Cloud via API
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User clicks 'MindManager Files' content item
	When User clicks 'For QA Automation' folder
	When User hovers on 'Test_Folder_SRND' file and clicks on 'triple-dot-actions' action button
	Then 'service-items-action' dropdown menu is displayed to User
	When User clicks 'Rename' item in 'service-items-action' dropdown menu
	Then 'rename-dialog' dialog is displayed to User

@MindManager @MindManagerCloud @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1931] @Upd_Qase
Scenario: Verify_that_it_is_not_possible_to_rename_folder_with_empty_name
	When User clears the 'input-new-folder' field in 'rename-dialog' dialog by backspace key
	Then '' value is displayed in the 'input-new-folder' field in 'rename-dialog' dialog
	When User clicks 'Rename' button in 'rename-dialog' dialog
	Then 'input-new-folder' input field has style 'border: 1px solid red' in 'rename-dialog' dialog

@MindManager @MindManagerCloud @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1932] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_rename_folder_with_digit
	When User enters 'This is my new Cloud 1 folder_RND' value in the 'input-new-folder' field in 'rename-dialog' dialog
	When User clicks 'Rename' button in 'rename-dialog' dialog
	Then 'This is my new Cloud 1 folder_RND' item is displayed on content manager page

@MindManager @MindManagerCloud @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1933] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_rename_folder_with_special_characters
	When User enters 'This map name c0nta^ns spe$i@l `sy^^bo$_RND' value in the 'input-new-folder' field in 'rename-dialog' dialog
	When User clicks 'Rename' button in 'rename-dialog' dialog
	Then 'This map name c0nta^ns spe$i@l `sy^^bo$_RND' item is displayed on content manager page

@MindManager @MindManagerCloud @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1934] @JIRA[MMCV-9536] @Upd_Qase
Scenario: Verify_that_it_is_not_possible_to_rename_folder_with_space_before_name
	When User enters ' Space before name' value in the 'input-new-folder' field in 'rename-dialog' dialog
	When User clicks 'Rename' button in 'rename-dialog' dialog
	Then text 'Invalid filename: filename shouldn't contain leading or trailing spaces' displayed in 'rename-dialog' dialog

@MindManager @MindManagerCloud @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1935] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_rename_folder_with_regular_name
	When User enters 'this is the file with regular name' value in the 'input-new-folder' field in 'rename-dialog' dialog
	When User clicks 'Rename' button in 'rename-dialog' dialog
	Then 'this is the file with regular name' item is displayed on content manager page