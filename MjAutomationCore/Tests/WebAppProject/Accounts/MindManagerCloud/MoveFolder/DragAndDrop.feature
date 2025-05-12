@retry(2)
Feature: DragAndDrop
	Check that MM folder can be moved on MM Cloud via drag and drop


@MindManager @MindManagerCloud @MoveFolder @DragAndDrop @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2552] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_move_folder_to_a_folder_via_drag_and_drop
	Given User is logged into MindManager web app via Api
	When User create 'Test_Folder_SRND' folder in '/' directory of Mind Manager Cloud via API
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User clicks 'MindManager Files' content item
	When User waits for data loading
	Then 'For QA Automation' folder with 'Folder' description is exist on page
	When User waits for data loading
	When User drags 'Test_Folder_SRND' item to 'For QA Automation' folder on the content manager page
	When User waits for data loading
	Then text 'Test_Folder_SRND @NewLinehas been moved to @NewLineFor QA Automation.' displayed in 'joint-flash-message' dialog
	When User clicks 'For QA Automation' folder
	Then 'Test_Folder_SRND' item is displayed on content manager page
	Then 'Test_Folder_SRND' mindmanager cloud item is saved in 'For QA Automation' folder from 'own' directory via API

@MindManager @MindManagerCloud @MoveFolder @DragAndDrop @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2553] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_move_folder_to_a_Sub_folder_via_drag_and_drop
	Given User is logged into MindManager web app via Api
	When User create 'Test_Folder_SRND' folder in 'For QA Automation/MoveFile' directory of Mind Manager Cloud via API
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User clicks 'MindManager Files' content item
	When User waits for data loading
	When User clicks 'For QA Automation' folder
	When User clicks 'MoveFile' folder
	Then 'Test_Folder_SRND' item is displayed on content manager page
	Then 'Move File Sub Folder' folder with 'Folder' description is exist on page
	When User waits for data loading
	When User drags 'Test_Folder_SRND' item to 'Move File Sub Folder' folder on the content manager page
	When User waits for data loading
	Then text 'Test_Folder_SRND @NewLinehas been moved to @NewLineMove File Sub Folder.' displayed in 'joint-flash-message' dialog
	When User clicks 'Move File Sub Folder' folder
	Then 'Test_Folder_SRND' item is displayed on content manager page
	Then 'Test_Folder_SRND' mindmanager cloud item is saved in 'For QA Automation/MoveFile/Move File Sub Folder' folder from 'own' directory via API