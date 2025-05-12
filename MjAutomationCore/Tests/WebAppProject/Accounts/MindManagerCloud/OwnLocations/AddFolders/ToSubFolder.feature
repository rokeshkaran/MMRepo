@retry(2)
Feature: ToSubFolder
Check that subfolder can be saved on MM Cloud folder

Background: Pre-condition
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User clicks 'MindManager Files' content item
	When User clicks 'For QA Automation' folder

@MindManager @MindManagerCloud @App_QA @App_Staging @App_Prod @Qase[WEB-1926] @Cleanup @Upd_Qase
Scenario: Verify_that_sub_folder_with_empty_name_can_not_be_created
	When User clicks on Create New Folder button on content navigation panel
	Then 'choose-name-dialog' dialog is displayed to User
	When User clicks 'Create' button in 'choose-name-dialog' dialog
	Then 'input-new-folder' input field has style 'border: 1px solid red' in 'choose-name-dialog' dialog

@MindManager @MindManagerCloud @App_QA @App_Staging @App_Prod @Qase[WEB-1927] @Cleanup @Upd_Qase
Scenario: Verify_that_sub_folder_with_regular_name_can_be_created
	When User clicks on Create New Folder button on content navigation panel
	Then 'choose-name-dialog' dialog is displayed to User
	When User enters 'This is my new Cloud folder_SRND' value in the 'input-new-folder' field in 'choose-name-dialog' dialog
	When User clicks 'Create' button in 'choose-name-dialog' dialog
	Then 'This is my new Cloud folder_SRND' item with 'Folder' description is displayed on content manager page
	When User remembers 'This is my new Cloud folder_SRND' mindmanager cloud item details from 'For QA Automation' directory via API

@MindManager @MindManagerCloud @App_QA @App_Staging @App_Prod @Qase[WEB-1928] @Cleanup @Upd_Qase
Scenario: Verify_that_sub_folder_with_name_with_digit_can_be_created
	When User clicks on Create New Folder button on content navigation panel
	Then 'choose-name-dialog' dialog is displayed to User
	When User enters 'This is Cloud folder_RND' value in the 'input-new-folder' field in 'choose-name-dialog' dialog
	When User clicks 'Create' button in 'choose-name-dialog' dialog
	Then 'This is Cloud folder_RND' item with 'Folder' description is displayed on content manager page
	When User remembers 'This is Cloud folder_RND' mindmanager cloud item details from 'For QA Automation' directory via API

@MindManager @MindManagerCloud @App_QA @App_Staging @App_Prod @Qase[WEB-1929] @Cleanup @Upd_Qase @JIRA[MMCV-9832]
Scenario: Verify_that_sub_folder_with_name_with_special_symbol_can_be_created
	When User clicks on Create New Folder button on content navigation panel
	Then 'choose-name-dialog' dialog is displayed to User
	When User enters 'This map name c0ntans spe$i@l `sy^^bo$_RND' value in the 'input-new-folder' field in 'choose-name-dialog' dialog
	When User clicks 'Create' button in 'choose-name-dialog' dialog
	When User remembers 'This map name c0ntans spe$i@l `sy^^bo$_RND' mindmanager cloud item details from 'For QA Automation' directory via API
	Then 'This map name c0ntans spe$i@l `sy^^bo$_RND' item with 'Folder' description is displayed on content manager page

@MindManager @MindManagerCloud @App_QA @App_Staging @App_Prod @Qase[WEB-1930] @Cleanup @JIRA[MMCV-9536] @Upd_Qase
Scenario: Verify_that_sub_folder_with_a_space_before_the_name_cannot_be_created
	When User clicks on Create New Folder button on content navigation panel
	Then 'choose-name-dialog' dialog is displayed to User
	When User enters '   space before name_SRND' value in the 'input-new-folder' field in 'choose-name-dialog' dialog
	When User clicks 'Create' button in 'choose-name-dialog' dialog
	Then text 'Invalid filename: filename shouldn't contain leading or trailing spaces' displayed in 'choose-name-dialog' dialog
