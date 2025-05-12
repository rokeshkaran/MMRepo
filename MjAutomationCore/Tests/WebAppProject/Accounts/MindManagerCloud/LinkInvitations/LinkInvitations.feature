@retry(2)
Feature: LinkInvitations

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

@MindManager @MindManagerFiles @LinkInvitation @App_QA @App_Staging @App_Prod @Qase[WEB-2134] @Cleanup
Scenario: Verify_that_the_access_to_the_map_is_provided_immediately_if_user_is_signed_In
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
	When User clicks 'Web' hyperlink
	When User switches to '2' tab
	When User waits for data loading
	Then Web Editor page is displayed to the User
	Then 'auto_test_SRND' map name is displayed on Toolbar
	Then menu button with 'file' name is displayed in 'status-read-only' state on Overlay panel

@MindManager @MindManagerFiles @LinkInvitation @App_QA @App_Staging @App_Prod @Qase[WEB-2135] @Cleanup @JIRA[MMCV-10385]
Scenario: Verify_that_the_access_to_the_file_is_denied_to_the_user_without_permissions_to_the_file
	When User waits for data loading
	When User hovers on 'auto_test_SRND' file and clicks on 'share-icon' action button
	Then 'share-file-dialog' dialog is displayed to User
	When User waits for data loading
	When User clicks selectbox by label 'Anyone with the share link' in 'General access' section of 'share-file-dialog' dialog and selects 'no access' option from dropdown 'share-file-dialog-select'
	When User clicks 'Copy link' button in 'share-file-dialog' dialog
	Then 'info accepted' dialog is displayed to User
	Then value is copied to the clipboard
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' button
	When User switches to '2' tab
	Then message 'Insufficient Permissions. You do not have permission to view this file.' is displayed to User on page

@MindManager @MindManagerFiles @LinkInvitation @App_QA @App_Staging @App_Prod @Qase[WEB-2257] @Cleanup
Scenario: Verify_that_the_subscription_is_applied_automatically_to_the_account_created_from_shared_map_link
	When User waits for data loading
	When User hovers on 'auto_test_SRND' file and clicks on 'share-icon' action button
	Then 'share-file-dialog' dialog is displayed to User
	When User waits for data loading
	When User waits '3000' miliseconds
	When User clicks selectbox by label 'Anyone with the share link' in 'General access' section of 'share-file-dialog' dialog and selects 'can edit' option from dropdown 'share-file-dialog-select'
	When User clicks 'Copy link' button in 'share-file-dialog' dialog
	Then 'info accepted' dialog is displayed to User
	Then value is copied to the clipboard
	When User openes 'chrome' browser
	When User accepts Optanon cookies
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' hyperlink
	When User switches to '2' tab
	When User waits '3000' miliseconds
	Then 'Create Account' button is displayed
	When User clicks 'Create Account' button
	When User fills account creation fields for new UI
		| Email          | FullName       | Password  |
		| <emailAddress> | Automation_RND | TYf7!8RND |
	When User clicks 'Create Account' button
	Then User sees 'Verify your account to continue' header on Right Side panel
	Then User sees 'An email was just sent to <emailAddress>(change email) from noreply@mindmanager.com. Please follow the instructions in the email, then come back here and click "Continue" to complete your account setup.' text messege on Right Side panel
	When User activates newly created Mind Manager account in outlook for 'auto.test@mindmanager.onmicrosoft.com' email address with 'Please verify your MindManager account' email title header and 'Something Else' use case button
	When User switches to '2' tab
	When User waits for data loading
	When User clicks 'Something Else' button for use case options on Right Side panel
	Then Web Editor page is displayed to the User
	When User clicks on the toolbar logo of Tools panel
	Then 'New' tab is active on file manager header page
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	Then header 'Account Details' is displayed on page
	Then header 'My Products' is displayed on page
	Then product 'MindManager Trial' is displayed with status 'Active' in 'My Products' section on Account Details page

Examples:
	| customerName        | emailAddress                               |
	| Automation_testSRND | auto.test+SRND@mindmanager.onmicrosoft.com |