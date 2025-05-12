@retry(2)
Feature: BasicSharing
Check the restriction on MM When mm files is disable

Background: Pre-condition
	Given User is logged into MindManager web app via Api
	Given User uploads following files to '/' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User clicks 'MindManager Files' content item

@MindManager @MindManagerFiles @BasicSharing @Co_Editing @Health_Check @App_QA @App_Staging @App_Prod @Qase[WEB-1893] @Cleanup @Upd_Qase
Scenario: Verify_that_file_can_be_shared_with_view_permission
	When User waits for data loading
	When User hovers on 'auto_test_SRND' file and clicks on 'share-icon' action button
	Then 'share-file-dialog' dialog is displayed to User
	When User waits for data loading
	When User clicks selectbox by label 'Anyone with the share link' in 'General access' section of 'share-file-dialog' dialog and selects 'can view' option from dropdown 'share-file-dialog-select'
	When User clicks 'Copy link' button in 'share-file-dialog' dialog
	Then 'info accepted' dialog is displayed to User
	Then value is copied to the clipboard
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' button
	When User switches to '2' tab
	Then Web Editor page is displayed to the User
	Then 'auto_test_SRND' map name is displayed on Toolbar
	Then menu button with 'file' name is displayed in 'status-read-only' state on Overlay panel