@retry(2)
Feature: MoveFolder
	Check that MM folder can be moved on MM Cloud

Background: Pre-condition
	Given User is logged into MindManager web app via Api
	When User create 'Test_Folder_SRND' folder in 'For QA Automation' directory of Mind Manager Cloud via API
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User clicks 'MindManager Files' content item
	When User waits for data loading
	When User clicks 'For QA Automation' folder
	When User hovers on 'Test_Folder_SRND' file and clicks on 'triple-dot-actions' action button
	Then 'service-items-action' dropdown menu is displayed to User

@MindManager @MindManagerCloud @MoveFolder @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2547] @Upd_Qase
Scenario: Verify_that_move_to_option_is_available
	Then following items is displayed in 'service-items-action' dropdown menu
		| items     |
		| Rename    |
		| Move to   |
		| Delete    |
	
@MindManager @MindManagerCloud @MoveFolder @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2548] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_move_folder_to_a_folder
	When User clicks 'Move to' item in 'service-items-action' dropdown menu
	Then Content Manager footer is displayed on content manager page
	Then 'Test_Folder_SRND' item name is displayed on Content Manager footer
	Then 'folder' icon is displayed on Content Manager footer
	When User waits for data loading
	When User clicks 'MoveFile' folder
	When User waits for data loading
	When User clicks button with 'Move To This Folder' name on Content Manager footer
	Then text 'Test_Folder_SRND @NewLinehas been moved to @NewLineMoveFile.' displayed in 'joint-flash-message' dialog
	Then Content Manager footer is not displayed
	Then 'Test_Folder_SRND' item is displayed on content manager page
	Then 'Test_Folder_SRND' mindmanager cloud item is saved in 'For QA Automation/MoveFile' folder from 'own' directory via API
	
@MindManager @MindManagerCloud @MoveFolder @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2549] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_move_folder_to_a_Sub_folder
	When User clicks 'Move to' item in 'service-items-action' dropdown menu
	Then Content Manager footer is displayed on content manager page
	Then 'Test_Folder_SRND' item name is displayed on Content Manager footer
	Then 'folder' icon is displayed on Content Manager footer
	When User waits for data loading
	When User clicks 'MoveFile' folder
	When User waits for data loading
	When User clicks 'Move File Sub Folder' folder
	When User waits for data loading
	When User clicks button with 'Move To This Folder' name on Content Manager footer
	Then text 'Test_Folder_SRND @NewLinehas been moved to @NewLineMove File Sub Folder.' displayed in 'joint-flash-message' dialog
	Then Content Manager footer is not displayed
	Then 'Test_Folder_SRND' item is displayed on content manager page
	Then 'Test_Folder_SRND' mindmanager cloud item is saved in 'For QA Automation/MoveFile/Move File Sub Folder' folder from 'own' directory via API

@MindManager @MindManagerCloud @MoveFolder @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2550] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_cancel_move_map_to_with_cancel_button
	When User clicks 'Move to' item in 'service-items-action' dropdown menu
	Then Content Manager footer is displayed on content manager page
	Then 'Test_Folder_SRND' item name is displayed on Content Manager footer
	Then 'folder' icon is displayed on Content Manager footer
	Then button with 'Cancel' name is displayed on Content Manager footer
	Then button with 'Move To This Folder' name is displayed on Content Manager footer
	When User clicks button with 'Cancel' name on Content Manager footer
	Then Content Manager footer is not displayed
	Then 'Test_Folder_SRND' mindmanager cloud item is saved in 'For QA Automation' folder from 'own' directory via API

@MindManager @MindManagerCloud @MoveFolder @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2551] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_cancel_move_map_to_with_back_button
	When User clicks 'Move to' item in 'service-items-action' dropdown menu
	Then Content Manager footer is displayed on content manager page
	Then 'Test_Folder_SRND' item name is displayed on Content Manager footer
	Then button with 'Cancel' name is displayed on Content Manager footer
	Then button with 'Move To This Folder' name is displayed on Content Manager footer
	When User clicks Back button on content navigation panel
	Then Content Manager footer is not displayed
	Then 'MindManager Files' content item is displayed on content manager page
	Then 'Test_Folder_SRND' mindmanager cloud item is saved in 'For QA Automation' folder from 'own' directory via API
