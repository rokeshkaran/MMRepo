@retry(2)
Feature: AddNewPurchase
Check is it possible Add New Purchase

Background: Pre-condition
	Given User is on the Mindmanager Sales portal website
	Then Right Side panel is displayed
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button

@Licensing @Manage_Subscriptions @Salesportal @Add_New_Purchase @QA @Staging @Qase[LICENSE-303] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @LC_Upd
Scenario: Check_Add_new_purchase_dialog_UI
	When User clicks 'Add New Purchase' button
	Then 'purchase' dialog is displayed to User
	When User clicks 'Cancel' button in 'purchase-dialog' dialog
	Then 'purchase' dialog is not displayed to User

@Licensing @Manage_Subscriptions @Salesportal @Add_New_Purchase @QA @Staging @Qase[LICENSE-304] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @LC_Upd
Scenario: Check_that_the_purchase_cannot_be_created_without_the_Customer_name
	When User clicks 'Add New Purchase' button
	When User clicks 'Add' button in 'purchase-dialog' dialog
	Then text 'Missing Customer.' is displayed in dialog popup
	Then dialog popup is displayed to User
	When User clicks Ok button in dialog popup
	Then dialog popup is not displayed to User

@Licensing @Manage_Subscriptions @Salesportal @Add_New_Purchase @QA @Staging @Qase[LICENSE-304] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @LC_Upd
Scenario: Check_the_Customer_field
	When User creates new Customer on Sales portal via Api
		| Name                | Type     |
		| Automation_testSRND | standard |
	When User clicks 'Add New Purchase' button
	When User clicks 'Customer' selectbox field of 'purchase' dialog
	Then dropdown with search is displayed to the User
	When User enters 'dcdscds' value in search field to dropdown with search
	Then 'No results found' message is displayed in the dropdown with search
	When User enters 'Automation_testSRND' value in search field to dropdown with search
	Then 'Automation_testSRND' value is highlighted blue in the search results in the dropdown with search
	When User clicks 'Automation_testSRND' value in the search results in tne dropdown with search
	Then 'Automation_testSRND' value is displayed in 'Customer' selectbox field of 'purchase' dialog

@Licensing @Manage_Subscriptions @Salesportal @Add_New_Purchase @QA @Staging @Qase[LICENSE-305] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @LC_Upd
Scenario: Check_the_Purchase_ID_field
	When User clicks 'Add New Purchase' button
	When User uses Ctrl_A and Ctrl_C combination for copies 'Purchase ID' field of 'purchase' dialog
	Then value is copied to the clipboard
	When User remembers data of 'Purchase ID' field in 'purchase' dialog
	When User uses Ctrl_A combination for select 'Purchase ID' field in 'purchase' dialog and clicks 'Delete' keys on keyboard
	Then 'Purchase ID' field data is not changed in 'purchase' dialog
	When User uses Ctrl_A combination for select 'Purchase ID' field in 'purchase' dialog and clicks 'Backspace' keys on keyboard
	Then 'Purchase ID' field data is not changed in 'purchase' dialog

@Licensing @Manage_Subscriptions @Salesportal @Add_New_Purchase @QA @Staging @Qase[LICENSE-306] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @LC_Upd
Scenario: Check_it_is_possible_that_increase_the_number_of_seats_using_the_keyboard
	When User clicks 'Add New Purchase' button
	When User clicks 'seats' field and presses the 'ArrowUp' key on the keyboard of 'purchase' dialog
	When User clicks 'seats' field and presses the 'ArrowUp' key on the keyboard of 'purchase' dialog
	Then '2' value is displayed to the 'seats' field of 'purchase' dialog
	When User clicks 'seats' field and presses the 'ArrowDown' key on the keyboard of 'purchase' dialog
	Then '1' value is displayed to the 'seats' field of 'purchase' dialog

@Licensing @Manage_Subscriptions @Salesportal @Add_New_Purchase @QA @Staging @Qase[LICENSE-306] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @LC_Upd
Scenario: Check_the_Seats_field
	When User creates new Customer on Sales portal via Api
		| Name                | Type     |
		| Automation_testSRND | standard |
	When User clicks 'Add New Purchase' button
	When User selects 'Automation_testSRND' value in the 'Customer' selectbox field of 'purchase' dialog
	Then '0' value is displayed to the 'seats' field of 'purchase' dialog
	When User enter '-83' value in the 'seats' field of 'purchase' dialog
	Then '-83' value is displayed to the 'seats' field of 'purchase' dialog
	When User clicks 'Add' button in 'purchase-dialog' dialog
	Then text 'Error: error. Negative seats number.' is displayed in dialog popup
	When User clicks Ok button in dialog popup
	Then 'purchase' dialog is not displayed to User
	When User clicks 'Add New Purchase' button
	When User selects 'Automation_testSRND' value in the 'Customer' selectbox field of 'purchase' dialog
	Then 'Automation_testSRND' value is displayed in 'Customer' selectbox field of 'purchase' dialog
	When User enter '39' value in the 'seats' field of 'purchase' dialog
	Then '39' value is displayed to the 'seats' field of 'purchase' dialog
	When User clicks 'Add' button in 'purchase-dialog' dialog
	Then 'purchase' dialog is not displayed to User
	Then following information about 'COEDIT' purchase for customer 'Automation_testSRND' is displayed in Sales portal via Api
		| UsedSeats | Seats |
		| 0         | 39    |

@Licensing @Manage_Subscriptions @Salesportal @Add_New_Purchase @QA @Staging @Qase[LICENSE-307] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @LC_Upd
Scenario Outline: Subscription_type
	When User creates new Customer on Sales portal via Api
		| Name                | Type     |
		| Automation_testSRND | standard |
	When User clicks 'Add New Purchase' button
	When User selects 'Automation_testSRND' value in the 'Customer' selectbox field of 'purchase' dialog
	When User selects '<ProductName>' option in the 'Product' selectbox field of 'purchase' dialog
	Then '<ProductName>' value is displayed in the 'Product' selectbox field of 'purchase' dialog
	When User clicks 'Add' button in 'purchase-dialog' dialog
	Then all Purchases have been saved

	Examples:
	| ProductName                     |
	| Co-editing                      |
	| MindManager Teams App           |
	| MindManager Subscription        |
	| MindManager Windows 21 / Mac 14 |
	| MindManager Windows 21 / Mac 13 |
	| MindManager Trial               |
	| MindManager Windows 21          |
	| MindManager Teams App Viewer    |
	| MindManager Windows 22          |
	| MindManager Windows 22 / Mac 14 |
	| MindManager Essentials          |
	| MindManager Mac 22              |
	| MindManager Reader              |

@Licensing @Manage_Subscriptions @Salesportal @Add_New_Purchase @QA @Staging @Qase[LICENSE-308] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @LC_Upd
Scenario: Subscription_End_Date
	When User creates new Customer on Sales portal via Api
		| Name                | Type     |
		| Automation_testSRND | standard |
	When User clicks 'Add New Purchase' button
	When User selects 'Automation_testSRND' value in the 'Customer' selectbox field of 'purchase' dialog
	Then 'D(365)' value is displayed to the 'end_date' field of 'purchase' dialog
	When User enter 'D(-1)' value in the 'end_date' field of 'purchase' dialog
	Then 'D(-1)' value is displayed to the 'end_date' field of 'purchase' dialog
	When User clicks 'Add' button in 'purchase-dialog' dialog
	Then text 'Error: error. End date of the purchase cannot be in the past.' is displayed in dialog popup
	Then dialog popup is displayed to User
	When User clicks Ok button in dialog popup
	Then dialog popup is not displayed to User
	When User clicks 'Add New Purchase' button
	When User selects 'Automation_testSRND' value in the 'Customer' selectbox field of 'purchase' dialog
	When User enter 'D(5)' value in the 'end_date' field of 'purchase' dialog
	Then 'D(5)' value is displayed to the 'end_date' field of 'purchase' dialog
	When User clicks 'Add' button in 'purchase-dialog' dialog
	Then all Purchases have been saved