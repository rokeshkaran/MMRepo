@retry(2)
Feature: CreationAndSettingUp
Check creation and sign in from MM file shared links

Background: Pre-condition
	Given User is logged into MindManager web app via Api
	Given User uploads following files to '/' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User clicks 'MindManager Files' content item
	When User waits for data loading
	When User hovers on 'auto_test_SRND' file and clicks on 'share-icon' action button
	Then 'share-file-dialog' dialog is displayed to User
	When User waits '2000' miliseconds

@MindManager @MindManagerCloud @AccountsCreation @App_QA @App_Staging @Cleanup @Upd_Qase @Qase[WEB-1896] @JIRA[MMCV-9790,MMCV-9818]
Scenario: Check_it_is_possible_create_MM_acount_on_opening_map_by_shared_link_from_MM_cloud_in_view_mode
	When User clicks selectbox by label 'Anyone with the share link' in 'General access' section of 'share-file-dialog' dialog and selects 'can view' option from dropdown 'share-file-dialog-select'
	When User waits '500' miliseconds
	When User clicks 'Copy link' button in 'share-file-dialog' dialog
	Then 'info accepted' dialog is displayed to User
	Then value is copied to the clipboard
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 2     | MMSUBSCRIPTION | D(2)    |
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	#User A logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' button
	When User switches to '2' tab
	Then 'Create Account' button is displayed
	When User clicks 'Create Account' button
	When User fills account creation fields for new UI
		| Email          | FullName       | Password  |
		| <emailAddress> | Automation_RND | TYf7!8RND |
	When User clicks 'Create Account' button
	When User waits '1000' miliseconds
	Then User sees 'Verify your account to continue' subheader on Right Side panel
	When User accepts Optanon cookies
	Then User sees 'An email was just sent to <emailAddress>(change email) from noreply@mindmanager.com. Please follow the instructions in the email, then come back here and click "Continue" to complete your account setup.' text messege on Right Side panel
	When User clicks 'Resend Email' button
	When User activates newly created Mind Manager account in outlook for 'auto.test@mindmanager.onmicrosoft.com' email address with 'Please verify your MindManager account' email title header and 'Something Else' use case button
	When User switches to '2' tab
	When User clicks 'Something Else' button for use case options on Right Side panel
	Then Web Editor page is displayed to the User
	Then menu button with 'file' name is displayed in 'status-read-only' state on Overlay panel

Examples:
	| customerName        | emailAddress                               |
	| Automation_testSRND | auto.test+SRND@mindmanager.onmicrosoft.com |

@MindManager @MindManagerCloud @AccountsCreation @App_QA @App_Staging @Cleanup @Upd_Qase @Qase[WEB-1897] @JIRA[MMCV-9790,MMCV-9818]
Scenario: Check_it_is_possible_create_MM_acount_on_opening_map_by_shared_link_from_MM_cloud_in_edit_mode
	When User clicks selectbox by label 'Anyone with the share link' in 'General access' section of 'share-file-dialog' dialog and selects 'can edit' option from dropdown 'share-file-dialog-select'
	When User waits '500' miliseconds
	When User clicks 'Copy link' button in 'share-file-dialog' dialog
	Then 'info accepted' dialog is displayed to User
	Then value is copied to the clipboard
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 2     | MMSUBSCRIPTION | D(2)    |
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	#User A logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' button
	When User switches to '2' tab
	Then 'Create Account' button is displayed
	When User clicks 'Create Account' button
	When User fills account creation fields for new UI
		| Email          | FullName       | Password  |
		| <emailAddress> | Automation_RND | TYf7!8RND |
	When User clicks 'Create Account' button
	When User waits '1000' miliseconds
	Then User sees 'Verify your account to continue' subheader on Right Side panel
	When User accepts Optanon cookies
	Then User sees 'An email was just sent to <emailAddress>(change email) from noreply@mindmanager.com. Please follow the instructions in the email, then come back here and click "Continue" to complete your account setup.' text messege on Right Side panel
	When User clicks 'Resend Email' button
	When User activates newly created Mind Manager account in outlook for 'auto.test@mindmanager.onmicrosoft.com' email address with 'Please verify your MindManager account' email title header and 'Something Else' use case button
	When User switches to '2' tab
	When User clicks 'Something Else' button for use case options on Right Side panel
	Then Web Editor page is displayed to the User
	Then menu button with 'file' name is displayed in 'status-editing' state on Overlay panel

Examples:
	| customerName        | emailAddress                               |
	| Automation_testSRND | auto.test+SRND@mindmanager.onmicrosoft.com |

@MindManager @MindManagerCloud @AccountsCreation @App_QA @App_Staging @App_Prod @Cleanup @Upd_Qase @Qase[WEB-1898] @JIRA[MMCV-9790]
Scenario: Check_it_is_possible_sign_in_to_account_on_opening_map_by_shared_link_from_MM_cloud_in_view_mode
	When User clicks selectbox by label 'Anyone with the share link' in 'General access' section of 'share-file-dialog' dialog and selects 'can view' option from dropdown 'share-file-dialog-select'
	When User clicks 'Copy link' button in 'share-file-dialog' dialog
	Then 'info accepted' dialog is displayed to User
	Then value is copied to the clipboard
	#User A logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' button
	When User switches to '2' tab
	When User waits for data loading
	When User clicks 'login-link' hyperlink
	Then User sees 'Sign In' header on Right Side panel
	Then User sees 'Please enter your details below.' text messege on Right Side panel
	When '1' User provides the Login and Password and clicks Sign In button
	Then Web Editor page is displayed to the User
	Then menu button with 'file' name is displayed in 'status-read-only' state on Overlay panel

@MindManager @MindManagerCloud @AccountsCreation @App_QA @App_Staging @App_Prod @Cleanup @Upd_Qase @Qase[WEB-1899] @JIRA[MMCV-9790]
Scenario: Check_it_is_possible_sign_in_to_account_on_opening_map_by_shared_link_from_MM_cloud_in_edit_mode
	When User clicks selectbox by label 'Anyone with the share link' in 'General access' section of 'share-file-dialog' dialog and selects 'can edit' option from dropdown 'share-file-dialog-select'
	When User clicks 'Copy link' button in 'share-file-dialog' dialog
	Then 'info accepted' dialog is displayed to User
	Then value is copied to the clipboard
	#User A logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' button
	When User switches to '2' tab
	When User waits for data loading
	When User clicks 'login-link' hyperlink
	Then User sees 'Sign In' header on Right Side panel
	Then User sees 'Please enter your details below.' text messege on Right Side panel
	When '1' User provides the Login and Password and clicks Sign In button
	Then Web Editor page is displayed to the User
	Then menu button with 'file' name is displayed in 'status-editing' state on Overlay panel