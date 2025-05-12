@retry(2)
Feature: MindManagerCloudDisabled
Check the restriction on MM When mm files is disable

Background: Pre-condition
	#Creating an account in the MM app
	Given User account
		| Email                                         | Password   |
		| auto.test+245SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |
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
	#Admin portal
	When User is logged in to 'Automation_testSRND' customer on Admin portal via Api
	When admin 'Automation_testSRND' accepts BULA terms via API
	When User refresh page
	When 'Automation_testSRND' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails                                        |
		| add        | MMSUBSCRIPTION | auto.test+245SRND@mindmanager.onmicrosoft.com |
	When User clicks 'Settings' button
	When User close 'analytics-opt-in-dialog' dialog
	Then 'Allow MindManager Files' checkbox is checked in section content group with 'Online Storage Providers' header
	When User unchecks 'Allow MindManager Files' checkbox in section content group with 'Online Storage Providers' header
	Then 'dialog-mmcloud-uncheck-confirm-disable' dialog is displayed to User
	When User enters 'DISABLE' value in the 'confirm-input' field in 'dialog-mmcloud-uncheck-confirm-disable' dialog
	When User clicks 'Continue' button in 'dialog-mmcloud-uncheck-confirm-disable' dialog
	#MM app
	When User open new tab in browser
	Given User is logged into 'auto.test+245SRND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api

@MindManager @MindManagerCloud @App_QA @App_Staging @Qase[WEB-2197] @Cleanup @Upd_Qase
Scenario: Verify_that_multi_admin_user_has_no_access_to_mm_files_if_one_license_has_allow_MMfiles_unchecked_on_admin_portal
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name                 | Type       |
		| Automation_test1SRND | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName         | Seats | ProductId | EndDate |
		| Automation_test1SRND | 2     | COEDIT    | D(10)   |
	#Admin portal
	When User '2' is logged in to 'Automation_test1SRND' customer on Admin portal via Api
	When '2' admin 'Automation_test1SRND' accepts BULA terms via API
	When 'Automation_test1SRND' Admin '2' makes subscription action via API
		| ActionType | PurchaseId | Emails                                        |
		| add        | COEDIT     | auto.test+245SRND@mindmanager.onmicrosoft.com |
	When User refresh page
	When User clicks 'Settings' button
	When User close 'analytics-opt-in-dialog' dialog
	Then 'Allow MindManager Files' checkbox is checked in section content group with 'Online Storage Providers' header
	When User open new tab in browser
	Given User is logged into 'auto.test+245SRND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	Then 'MindManager Files' content item is not displayed on content manager page

@MindManager @MindManagerCloud @App_QA @App_Staging @Qase[WEB-2197] @Cleanup @Upd_Qase
Scenario: Verify_that_MindManager_Files_is_not_displayed_in_Browse_menu_when_allow_MMfiles_is_unchecked_on_admin_portal
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	Then 'MindManager Files' content item is not displayed on content manager page

@MindManager @MindManagerCloud @App_QA @App_Staging @Qase[WEB-2196,WEB-2198,WEB-2199] @Cleanup @Upd_Qase 
Scenario: Verify_that_MindManager_Files_is_not_displayed_on_save_menu_when_allow_MMfiles_is_unchecked_on_admin_portal
	When User clicks 'New' tab on file manager header page
	Then cloud templates page is displayed to User
	When User clicks on 'General' template group card on cloud template page
	Then template content is displayed on cloud template page
	When User right clicks on 'Timeline' template card on cloud template page
	Then 'cloud-templates-context-menu' Menu is displayed to User
	When User clicks button with 'blank' name in 'cloud-templates-context-menu' menu
	Then Web Editor page is displayed to the User
	Then 'Share' button is displayed as disabled on the Tools panel
	Then 'Share' button is not displayed on Menu toolbar
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	Then 'file' Menu is displayed to User
	When User clicks button with 'save' name in 'file' menu
	Then 'MindManager Files' content item is not displayed on content manager page

@MindManager @MindManagerCloud @App_QA @App_Staging @Qase[WEB-2200] @Cleanup @Upd_Qase
Scenario: Verify_that_a_map_recovery_dialog_is_obtained_upon_creating_a_new_file_when_allow_MMfiles_is_unchecked_on_admin_portal
	When User clicks 'New' tab on file manager header page
	Then cloud templates page is displayed to User
	When User clicks on 'General' template group card on cloud template page
	Then template content is displayed on cloud template page
	When User right clicks on 'Timeline' template card on cloud template page
	Then 'cloud-templates-context-menu' Menu is displayed to User
	When User clicks button with 'blank' name in 'cloud-templates-context-menu' menu
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	Then 'file' Menu is displayed to User
	When User clicks button with 'new' name in 'file' menu
	Then 'A file you edited previously was not saved.' titlebar header is displayed in 'recover-unsaved-map' dialog

@MindManager @MindManagerCloud @App_QA @App_Staging @Qase[WEB-2201] @Cleanup @Upd_Qase
Scenario: Verify_that_MindManager_Files_is_not_displayed_on_save_as_menu_when_allow_MMfiles_is_unchecked_on_admin_portal
	When User clicks 'New' tab on file manager header page
	Then cloud templates page is displayed to User
	When User clicks on 'General' template group card on cloud template page
	Then template content is displayed on cloud template page
	When User right clicks on 'Timeline' template card on cloud template page
	Then 'cloud-templates-context-menu' Menu is displayed to User
	When User clicks button with 'blank' name in 'cloud-templates-context-menu' menu
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	Then 'file' Menu is displayed to User
	When User mouse hovers menu button with 'save-to' name in 'file' menu
	Then button with 'MindManager Files' name is not displayed in 'save-to' menu

@MindManager @MindManagerCloud @App_QA @App_Staging @Qase[WEB-2202] @Cleanup @Upd_Qase 
Scenario: Verify_that_MindManager_Files_is_not_displayed_on_Save_To_menu_when_allow_MMfiles_is_unchecked_on_admin_portal
	When User clicks 'New' tab on file manager header page
	Then cloud templates page is displayed to User
	When User clicks on 'General' template group card on cloud template page
	Then template content is displayed on cloud template page
	When User right clicks on 'Timeline' template card on cloud template page
	Then 'cloud-templates-context-menu' Menu is displayed to User
	When User clicks button with 'blank' name in 'cloud-templates-context-menu' menu
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	Then 'file' Menu is displayed to User
	When User mouse hovers menu button with 'save-to' name in 'file' menu
	Then 'save-to' Menu is displayed to User
	Then button with 'MindManager Files' name is not displayed in 'save-to' menu

@MindManager @MindManagerCloud @App_QA @App_Staging @Qase[WEB-2203] @Cleanup @Upd_Qase @JIRA[MMCV-10385]
Scenario: Verify_that_user_cannot_access_MMFiles_when_allow_MMfiles_is_unchecked_on_admin_portal
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given User is logged into MindManager web app via Api
	Given User uploads following files to '/' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User clicks 'MindManager Files' content item
	When User hovers on 'auto_test_SRND' file and clicks on 'share-icon' action button
	Then 'share-file-dialog' dialog is displayed to User
	When User waits for data loading
	When User clicks selectbox by label 'Anyone with the share link' in 'General access' section of 'share-file-dialog' dialog and selects 'can view' option from dropdown 'share-file-dialog-select'
	When User clicks 'Copy link' button in 'share-file-dialog' dialog
	Then 'info accepted' dialog is displayed to User
	Then value is copied to the clipboard
	When User switches to '0' browser
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' button
	When User switches to '3' tab
	Then message 'Insufficient Permissions. You do not have permission to view this file.' is displayed to User on page