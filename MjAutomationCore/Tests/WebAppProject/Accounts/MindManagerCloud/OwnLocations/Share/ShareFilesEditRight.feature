@retry(2)
Feature: ShareFilesEditRight
Check that files can be shared on MM Cloud with edit access

@MindManager @MindManagerCloud @ShareFiles @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1970] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_invite_another_user_to_MindManager_Files_with_edit_access
	Given User is logged into MindManager web app via Api
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User clicks 'MindManager Files' content item
	When User clicks 'For QA Automation' folder
	When User clicks 'RuntimeData File' folder
	When User waits for data loading
	When User hovers on 'auto_test_SRND' file and clicks on 'triple-dot-actions' action button
	Then 'service-items-action' dropdown menu is displayed to User
	When User clicks 'Share' item in 'service-items-action' dropdown menu
	Then 'share-file-dialog' dialog is displayed to User
	When User waits for data loading
	When User clicks selectbox by label 'select-options-email' in 'People you specify' section of 'share-file-dialog' dialog and selects 'can edit' option from dropdown 'share-file-dialog-select'
	#Share with user '2'
	When User enters 'automationtestmm2@meta.ua' value by character in the 'search' field in 'share-file-dialog' dialog
	When User waits '500' miliseconds
	When User presses the 'Enter' key on the keyboard
	When User clicks 'Invite' button in 'share-file-dialog' dialog
	When User waits for data loading
	When User clicks 'Done' button in 'share-file-dialog' dialog
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '2' User is logged into MindManager web app via Api
	# User '2' opens shared map
	When User clicks 'My Files' tab on file manager header page
	When User clicks 'MindManager Files' content item
	When User clicks 'auto_test_SRND' file
	Then Web Editor page is displayed to the User
	Then menu button with 'file' name is displayed in 'status-editing' state on Overlay panel