@retry(2)
Feature: DragAndDrop
Check that files can be moved on MM Cloud by Drag and drop

@MindManager @MindManagerCloud @MoveFile @DragAndDrop @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2398] @Upd_Qase @JIRA[MMCV-10223] @Build_24.0.107
Scenario: Verify_that_it_is_possible_to_move_map_to_a_folder_via_drag_and_drop
	Given User is logged into MindManager web app via Api
	Given User uploads following files to '/' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User clicks 'MindManager Files' content item
	When User waits for data loading
	Then 'auto_test_SRND' item is displayed on content manager page
	Then 'For QA Automation' folder with 'Folder' description is exist on page
	When User waits for data loading
	When User drags 'auto_test_SRND' item to 'For QA Automation' folder on the content manager page
	When User waits for data loading
	Then text 'auto_test_SRND.mmap @NewLinehas been moved to @NewLineFor QA Automation.' displayed in 'joint-flash-message' dialog
	When User clicks 'For QA Automation' folder
	Then 'auto_test_SRND' item is displayed on content manager page
	Then 'auto_test_SRND.mmap' mindmanager cloud item is saved in 'For QA Automation' folder from 'own' directory via API

@MindManager @MindManagerCloud @MoveFile @DragAndDrop @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2399] @Upd_Qase @JIRA[MMCV-10223] @Build_24.0.107
Scenario: Verify_that_it_is_possible_to_move_map_to_a__Sub_folder_via_drag_and_drop
	Given User is logged into MindManager web app via Api
	Given User uploads following files to 'For QA Automation/MoveFile' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User clicks 'MindManager Files' content item
	When User waits for data loading
	When User clicks 'For QA Automation' folder
	When User clicks 'MoveFile' folder
	Then 'auto_test_SRND' item is displayed on content manager page
	Then 'Move File Sub Folder' folder with 'Folder' description is exist on page
	When User waits for data loading
	When User drags 'auto_test_SRND' item to 'Move File Sub Folder' folder on the content manager page
	When User waits for data loading
	Then text 'auto_test_SRND.mmap @NewLinehas been moved to @NewLineMove File Sub Folder.' displayed in 'joint-flash-message' dialog
	When User clicks 'Move File Sub Folder' folder
	Then 'auto_test_SRND' item is displayed on content manager page
	Then 'auto_test_SRND.mmap' mindmanager cloud item is saved in 'For QA Automation/MoveFile/Move File Sub Folder' folder from 'own' directory via API