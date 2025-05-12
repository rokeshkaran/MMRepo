@retry(2)
Feature: MindManagerSnap
Check MindManager Snap option

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath              |
		| auto_test_SRND.mmap | CommonEmptyATMap.mmap |
	#Creating an account in the MM app
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
	#Admin portal
	When User is logged in to 'Automation_testSRND' customer on Admin portal via Api
	When admin 'Automation_testSRND' accepts BULA terms via API
	When 'Automation_testSRND' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails                                     |
		| add        | MMSUBSCRIPTION | auto.test+SRND@mindmanager.onmicrosoft.com |
	When User refresh page
	When User accepts Optanon cookies

@Licensing @CustomerAdminPortal @Settings @CoEditing_Option @QA @Staging @Qase[LICENSE-54] @Cleanup
Scenario: Verify_info_message_tooltip_for_MindManager_Snap
	#Admin portal
	When User clicks 'Settings' button
	When User close 'analytics-opt-in-dialog' dialog
	Then 'Allow MindManager Snap' checkbox is checked in section with 'MindManager Snap' title
	When User hover over 'info' button on 'Allow MindManager Snap' label for 'MindManager Snap' section
	Then Tooltip 'Allow users on your licenses to use MindManager Snap to capture and organize ideas. MindManager Snap content is stored on MindManager servers and can be accessed only by an authenticated user who is the owner or member of a Snap Team.' is displayed for 'info' button on 'Allow MindManager Snap' label for 'MindManager Snap' section

@Licensing @CustomerAdminPortal @Settings @CoEditing_Option @QA @Staging @Qase[LICENSE-54] @Cleanup
Scenario: Verify_warning_message_tooltip_for_MindManager_Snap
	#Admin portal
	When User clicks 'Settings' button
	When User close 'analytics-opt-in-dialog' dialog
	Then 'Allow MindManager Snap' checkbox is checked in section with 'MindManager Snap' title
	When User hover over 'warning' button on 'Allow MindManager Snap' label for 'MindManager Snap' section
	Then Tooltip 'This setting applies to version 22.1 or greater for the following products:MindManager WindowsMindManager MacMindManager for MS TeamsMindManager ChromebookMindManager WebYour organization has not verified domains for SSO so disallowing this feature will prevent users from using it, but previously stored data will not be deleted. Please inform your users they must delete their data prior to disallowing this feature. If you wish to delete data on behalf of your licensed users you must verify your email domains via the SSO setup process.' is displayed for 'warning' button on 'Allow MindManager Snap' label for 'MindManager Snap' section

@Licensing @CustomerAdminPortal @Settings @MindManager_Snap @QA @Staging @Qase[LICENSE-55] @Cleanup
Scenario: Allow_MindManager_Snap
	#Admin portal
	When User clicks 'Settings' button
	When User close 'analytics-opt-in-dialog' dialog
	Then 'Allow MindManager Snap' checkbox is checked in section with 'MindManager Snap' title
	#MM app
	When User open new tab in browser
	Given User is logged into 'auto.test+SRND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Snap' button of side Toolbox
	Then 'Snap' side panel with 'Snap' header is displayed to the User

@Licensing @CustomerAdminPortal @Settings @MindManager_Snap @QA @Staging @Qase[LICENSE-57] @Cleanup
Scenario: Do_not_allow_MindManager_Snap
	#Admin portal
	When User clicks 'Settings' button
	When User unchecks 'Allow MindManager Snap' checkbox in section with 'MindManager Snap' title
	Then 'Allow MindManager Snap' checkbox is unchecked in section with 'MindManager Snap' title
	#MM app
	When User open new tab in browser
	Given User is logged into 'auto.test+SRND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	Then 'Snap' button is not displayed on side toolbox