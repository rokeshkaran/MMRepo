@retry(2)
Feature: ChangeShareFileAccess
Check that files can be shared on MM Cloud

Background: Pre-condition
	Creating an account in the MM app
	Given User account
		| Email                                      | Password   |
		| auto.test+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Creating Customer on Sales portal
	When User creates new Customer on Sales portal via Api
		| Name                | Type       |
		| Automation_testSRND | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName        | Seats | ProductId      | EndDate |
		| Automation_testSRND | 2     | MMSUBSCRIPTION | D(10)   |
	When User is logged in to 'Automation_testSRND' customer on Admin portal via Api
	When admin 'Automation_testSRND' accepts BULA terms via API
	When 'Automation_testSRND' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails                                     |
		| add        | MMSUBSCRIPTION | auto.test+SRND@mindmanager.onmicrosoft.com |
	When User refresh page
	When User open new tab in browser
	Given User is logged into 'auto.test+SRND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api
	When User openes 'chrome' browser
	When User switches to '1' browser
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

@MindManager @MindManagerCloud @App_QA @App_Staging @Cleanup @Qase[WEB-1966] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_change_permission_to_MindManager_cloud_from_view_to_edit_access
	When User shares 'auto_test_SRND.mmap' MindManager cloud file with 'r' permission to 'auto.test+SRND@mindmanager.onmicrosoft.com' user email via API
	When User switches to '0' browser
	When 'auto.test+SRND@mindmanager.onmicrosoft.com' User opens 'auto_test_SRND' shared link from outlook email inbox
	When User switches to '2' tab
	When User waits for data loading
	When User clicks 'Web' button
	When User switches to '3' tab
	Then Web Editor page is displayed to the User
	Then 'auto_test_SRND' map name is displayed on Toolbar
	Then menu button with 'file' name is displayed in 'status-read-only' state on Overlay panel
	When User switches to '1' browser
	When User hovers on 'auto_test_SRND' file and clicks on 'triple-dot-actions' action button
	Then 'service-items-action' dropdown menu is displayed to User
	When User clicks 'Share' item in 'service-items-action' dropdown menu
	Then 'share-file-dialog' dialog is displayed to User
	When User clicks selectbox for user 'auto.test+SRND@mindmanager.onmicrosoft.com' of 'share-file-dialog' dialog and selects 'can edit' option from dropdown 'share-file-dialog-select'
	When User clicks 'Apply' button in 'share-file-dialog' dialog
	When User waits for data loading
	Then 'Apply' button is not displayed on 'share-file-dialog' dialog
	When User clicks 'Done' button in 'share-file-dialog' dialog
	When User switches to '0' browser
	When 'auto.test+SRND@mindmanager.onmicrosoft.com' User opens 'auto_test_SRND' shared link from outlook email inbox
	When User switches to '4' tab
	When User waits for data loading
	When User clicks 'Web' button
	When User switches to '5' tab
	Then Web Editor page is displayed to the User
	Then 'auto_test_SRND' map name is displayed on Toolbar
	Then menu button with 'file' name is displayed in 'status-editing' state on Overlay panel

@MindManager @MindManagerCloud @App_QA @App_Staging @Cleanup @Qase[WEB-1971] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_change_permission_to_MindManager_cloud_from_edit_to_view_access
	When User shares 'auto_test_SRND.mmap' MindManager cloud file with 'rw' permission to 'auto.test+SRND@mindmanager.onmicrosoft.com' user email via API
	When User switches to '0' browser
	When 'auto.test+SRND@mindmanager.onmicrosoft.com' User opens 'auto_test_SRND' shared link from outlook email inbox
	When User switches to '2' tab
	When User waits for data loading
	When User clicks 'Web' button
	When User switches to '3' tab
	Then Web Editor page is displayed to the User
	Then 'auto_test_SRND' map name is displayed on Toolbar
	Then menu button with 'file' name is displayed in 'status-editing' state on Overlay panel
	When User switches to '1' browser
	When User hovers on 'auto_test_SRND' file and clicks on 'triple-dot-actions' action button
	Then 'service-items-action' dropdown menu is displayed to User
	When User clicks 'Share' item in 'service-items-action' dropdown menu
	Then 'share-file-dialog' dialog is displayed to User
	When User clicks selectbox for user 'auto.test+SRND@mindmanager.onmicrosoft.com' of 'share-file-dialog' dialog and selects 'can view' option from dropdown 'share-file-dialog-select'
	When User clicks 'Apply' button in 'share-file-dialog' dialog
	When User waits for data loading
	Then 'Apply' button is not displayed on 'share-file-dialog' dialog
	When User clicks 'Done' button in 'share-file-dialog' dialog
	When User switches to '0' browser
	When 'auto.test+SRND@mindmanager.onmicrosoft.com' User opens 'auto_test_SRND' shared link from outlook email inbox
	When User switches to '4' tab
	When User waits for data loading
	When User clicks 'Web' button
	When User switches to '5' tab
	Then Web Editor page is displayed to the User
	Then 'auto_test_SRND' map name is displayed on Toolbar
	Then menu button with 'file' name is displayed in 'status-read-only' state on Overlay panel
