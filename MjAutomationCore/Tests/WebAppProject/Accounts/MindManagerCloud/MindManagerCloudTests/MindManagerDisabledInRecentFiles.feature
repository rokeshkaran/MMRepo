@retry(2)
Feature: MindManagerDisabledInRecentFiles
Check the restriction on MM When mm files is disable

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

@MindManager @MindManagerCloud @App_QA @App_Staging @Qase[WEB-2264] @Cleanup @Upd_Qase
Scenario: Verify_that_MindManager_Files_is_not_displayed_in_Recent_File_when_allow_MMfiles_is_unchecked_on_admin_portal
	#MM app
	When User open new tab in browser
	Given User is logged into 'auto.test+SRND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api
	When User clicks on 'Organization' template group card on cloud template page
	Then template content is displayed on cloud template page
	When User right clicks on 'Organizational Chart' template card on cloud template page
	Then 'cloud-templates-context-menu' Menu is displayed to User
	When User clicks button with 'prefilled' name in 'cloud-templates-context-menu' menu
	Then Web Editor page is displayed to the User
	When User clicks Logo image on Menu toolbar
	Then 'New' tab is active on file manager header page
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	Then 'Organizational Chart' item is displayed on content manager page
	#Admin portal
	When User switches to '0' tab
	When User clicks 'Settings' button
	When User close 'analytics-opt-in-dialog' dialog
	Then 'Allow MindManager Files' checkbox is checked in section content group with 'Online Storage Providers' header
	When User unchecks 'Allow MindManager Files' checkbox in section content group with 'Online Storage Providers' header
	Then 'dialog-mmcloud-uncheck-confirm-disable' dialog is displayed to User
	When User enters 'DISABLE' value in the 'confirm-input' field in 'dialog-mmcloud-uncheck-confirm-disable' dialog
	When User clicks 'Continue' button in 'dialog-mmcloud-uncheck-confirm-disable' dialog
	When User switches to '1' tab
	When User refresh page
	Then content page is displayed to User
	Then 'Organizational Chart' content item is not displayed on content manager page

@MindManager @MindManagerCloud @App_QA @App_Staging @Qase[WEB-2227] @Cleanup @Upd_Qase @JIRA[MMCV-10385]
Scenario: Verify_that_User_can_no_longer_access_MindManager_File_via_email_invitation_when_allow_MMfiles_is_unchecked_on_admin_portal
	When User open new tab in browser
	Given User is logged into 'auto.test+SRND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api
	When User openes 'chrome' browser
	Given User is logged into MindManager web app via Api
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	When User shares 'auto_test_SRND.mmap' MindManager cloud file with 'r' permission to 'auto.test+SRND@mindmanager.onmicrosoft.com' user email via API
	#Check that user has access to map
	When User switches to '0' browser
	When 'auto.test+SRND@mindmanager.onmicrosoft.com' User opens 'auto_test_SRND' shared link from outlook email inbox
	When User clicks 'Web' button
	When User switches to '3' tab
	Then Web Editor page is displayed to the User
	#Admin portal
	When User switches to '0' tab
	When User clicks 'Settings' button
	When User close 'analytics-opt-in-dialog' dialog
	Then 'Allow MindManager Files' checkbox is checked in section content group with 'Online Storage Providers' header
	When User unchecks 'Allow MindManager Files' checkbox in section content group with 'Online Storage Providers' header
	Then 'dialog-mmcloud-uncheck-confirm-disable' dialog is displayed to User
	When User enters 'DISABLE' value in the 'confirm-input' field in 'dialog-mmcloud-uncheck-confirm-disable' dialog
	When User clicks 'Continue' button in 'dialog-mmcloud-uncheck-confirm-disable' dialog
	When User switches to '2' tab
	When User clicks 'Web' button
	When User switches to '4' tab
	Then message 'Insufficient Permissions. You do not have permission to view this file.' is displayed to User on page