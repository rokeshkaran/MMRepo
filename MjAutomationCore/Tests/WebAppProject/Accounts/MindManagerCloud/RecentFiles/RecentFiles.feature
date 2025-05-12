@retry(2)
Feature: RecentFiles
Check that files are displayed in Recent Files Section

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
	When User waits for data loading
	When User clicks 'auto_test_SRND' file
	Then Web Editor page is displayed to the User
	Then 'auto_test_SRND' map name is displayed on Toolbar
	When User clicks Logo image on Menu toolbar
	Then 'New' tab is active on file manager header page
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	Then 'auto_test_SRND' item is displayed on content manager page
	Then Recent Files Banner is displayed on Content Manager Page

@MindManager @MindManagerCloud @RecentFile @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2509] @Upd_Qase @Build_24.0.107
Scenario: Verify_that_option_to_edit_MM_Files_in_Recent_files_are_available
	When User hovers on 'auto_test_SRND' file
	Then 'share-icon' action button is displayed for 'auto_test_SRND' file on content manager Page
	Then 'triple-dot-actions' action button is displayed for 'auto_test_SRND' file on content manager Page
	Then 'pin-icon' action button is displayed for 'auto_test_SRND' file on content manager Page
	When User hovers on 'auto_test_SRND' file and clicks on 'triple-dot-actions' action button
	Then 'service-items-action' dropdown menu is displayed to User
	Then 'pin-icon' action button is displayed for 'auto_test_SRND' file on content manager Page

@MindManager @MindManagerCloud @RecentFile @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2510] @Upd_Qase @Build_24.0.107
Scenario: Verify_that_MMFiles_can_be_shared_directly_in_recent_files
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

@MindManager @MindManagerCloud @RecentFile @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2511] @Upd_Qase @Build_24.0.107
Scenario: Verify_that_MMFiles_can_be_deleted_directly_in_recent_files
	When User hovers on 'auto_test_SRND' file and clicks on 'triple-dot-actions' action button
	Then 'service-items-action' dropdown menu is displayed to User
	When User clicks 'Delete' item in 'service-items-action' dropdown menu
	Then 'delete-confirmation-dialog' dialog is displayed to User
	When User clicks 'Delete' button in 'delete-confirmation-dialog' dialog
	Then 'delete-confirmation-dialog' dialog is not displayed to User
	Then 'auto_test_SRND' content item is not displayed on content manager page
	When User clicks 'MindManager Files' content item
	Then 'auto_test_SRND' content item is not displayed on content manager page
	Then 'auto_test_SRND' mindmanager cloud item is NOT saved in 'For QA Automation/RuntimeData File' folder from 'own' directory via API

@MindManager @MindManagerCloud @RecentFile @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2512] @Upd_Qase @Build_24.0.107
Scenario: Verify_that_MMFiles_can_be_duplicate_directly_in_recent_files
	When User hovers on 'auto_test_SRND' file and clicks on 'triple-dot-actions' action button
	Then 'service-items-action' dropdown menu is displayed to User
	When User clicks 'Duplicate' item in 'service-items-action' dropdown menu
	Then 'choose-name-dialog' dialog is displayed to User
	When User clicks 'Duplicate' button in 'choose-name-dialog' dialog
	When User clicks 'MindManager Files' content item
	Then 'Copy of auto_test_SRND' item is displayed on content manager page
	When User remembers 'Copy of auto_test_SRND.mmap' mindmanager cloud item details from 'For QA Automation/RuntimeData File' directory via API

@MindManager @MindManagerCloud @RecentFile @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2513] @Upd_Qase @Build_24.0.107
Scenario: Verify_that_MMFiles_can_be_share_directly_in_recent_files_via_more_button
	When User hovers on 'auto_test_SRND' file and clicks on 'triple-dot-actions' action button
	Then 'service-items-action' dropdown menu is displayed to User
	When User clicks 'Share' item in 'service-items-action' dropdown menu
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

@MindManager @MindManagerCloud @RecentFile @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2514] @Upd_Qase @Build_24.0.107
Scenario: Verify_that_MMFiles_can_be_Rename_directly_in_recent_files
	When User hovers on 'auto_test_SRND' file and clicks on 'triple-dot-actions' action button
	Then 'service-items-action' dropdown menu is displayed to User
	When User clicks 'Rename' item in 'service-items-action' dropdown menu
	Then 'rename-dialog' dialog is displayed to User
	When User enters 'RenamedFile' value in the 'rename-file' field in 'rename-dialog' dialog
	When User clicks 'Rename' button in 'rename-dialog' dialog
	Then 'RenamedFile' item is displayed on content manager page

@MindManager @MindManagerCloud @RecentFile @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2514] @Upd_Qase @Build_24.0.107
Scenario: Verify_that_all_expected_action_are_available
	When User hovers on 'auto_test_SRND' file and clicks on 'triple-dot-actions' action button
	Then 'service-items-action' dropdown menu is displayed to User
	Then following items is displayed in 'service-items-action' dropdown menu
		| items     |
		| Share     |
		| Rename    |
		| Duplicate |
		| Delete    |