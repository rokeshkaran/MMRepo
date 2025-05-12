@retry(2)
Feature: AccountCreation
Check Mind Manager Accounts creation

@Licensing @MindManagerAccounts @AccountsCreation @QA @Staging @Qase[LICENSE-345] @Cleanup @CleanupOutlookEmail
Scenario: Verify_account_creation_process_for_user_with_preset_license
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 3     | MMSUBSCRIPTION | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Subscription' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters '<emailAddress>' value in the 'email' field in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                    |
		| Version          | MindManager Subscription |
		| Expires          | D(2)                     |
		| Seats Used/Total | 1/3                      |
	#MM app
	When User open new tab in browser
	Given User is on the Mindmanager website
	Then Right Side panel is displayed
	Then User sees 'Welcome' header on Right Side panel
	Then 'Start Free Trial' button is displayed
	Then 'Sign In' button is displayed
	Then 'Create Account' button is displayed
	Then 'Help' button is displayed
	When User clicks 'Create Account' button
	When User fills account creation fields for new UI
		| Email          | Full_Name      | Password  |
		| <emailAddress> | Automation_RND | TYf78!RND |
	Then 'Create Account' button is displayed
	When User clicks 'Create Account' button
	Then User sees 'Verify your account to continue' subheader on Right Side panel
	Then User sees 'An email was just sent to <emailAddress>(change email) from noreply@mindmanager.com. Please follow the instructions in the email, then come back here and click "Continue" to complete your account setup.' text messege on Right Side panel
	When User clicks 'Resend Email' button
	When User activates newly created Mind Manager account in outlook for 'auto.test@mindmanager.onmicrosoft.com' email address with 'Please verify your MindManager account' email title header and 'Something Else' use case button
	When User switches to '1' tab
	#When User clicks 'Continue' button
	When User clicks 'Something Else' button for use case options on Right Side panel
	Then file manager header page is displayed to User

Examples:
	| customerName        | emailAddress                               |
	| Automation_testSRND | auto.test+SRND@mindmanager.onmicrosoft.com |

@Licensing @MindManagerAccounts @AccountsCreation @QA @Staging @Qase[LICENSE-346] @Cleanup @CleanupOutlookEmail
Scenario: Verify_account_creation_process_for_user_without_preset_license
	#MM app
	Given User is on the Mindmanager website
	Then Right Side panel is displayed
	Then User sees 'Welcome' header on Right Side panel
	Then 'Start Free Trial' button is displayed
	Then 'Sign In' button is displayed
	Then 'Create Account' button is displayed
	Then 'Help' button is displayed
	When User clicks 'Create Account' button
	When User fills account creation fields for new UI
		| Email          | Full_Name      | Password  |
		| <emailAddress> | Automation_RND | TYf78!RND |
	Then 'Create Account' button is displayed
	When User clicks 'Create Account' button
	Then User sees 'Verify your account to continue' subheader on Right Side panel
	Then User sees 'An email was just sent to <emailAddress>(change email) from noreply@mindmanager.com. Please follow the instructions in the email, then come back here and click "Continue" to complete your account setup.' text messege on Right Side panel
	When User clicks 'Resend Email' button
	When User activates newly created Mind Manager account in outlook for 'auto.test@mindmanager.onmicrosoft.com' email address with 'Please verify your MindManager account' email title header and 'Something Else' use case button
	When User switches to '0' tab
	When User clicks 'Something Else' button for use case options on Right Side panel
	When User waits '2000' miliseconds
	Then User sees 'You don't have a license to use this product.' header on Right Side panel
	Then User sees 'Good news! You're eligible for a free trial.' subheader on Right Side panel

Examples:
	| emailAddress                               |
	| auto.test+SRND@mindmanager.onmicrosoft.com |

@Licensing @MindManagerAccounts @AccountsCreation @QA @Staging @Qase[LICENSE-347] @Cleanup @CleanupOutlookEmail @JIRA[MMCV-9818]
Scenario: Verify_that_license_is_added_instead_of_a_trial_if_the_user_has_preset_subscription
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 3     | MMSUBSCRIPTION | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Subscription' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters '<emailAddress>' value in the 'email' field in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                    |
		| Version          | MindManager Subscription |
		| Expires          | D(2)                     |
		| Seats Used/Total | 1/3                      |
	#MM app
	When User open new tab in browser
	Given User is on the Mindmanager website
	Then Right Side panel is displayed
	Then User sees 'Welcome' header on Right Side panel
	Then 'Start Free Trial' button is displayed
	Then 'Sign In' button is displayed
	Then 'Create Account' button is displayed
	Then 'Help' button is displayed
	When User clicks 'Start Free Trial' button
	When User fills account creation fields for new UI
		| Email          | Full_Name      | Password  |
		| <emailAddress> | Automation_RND | TYf78!RND |
	Then 'Create Account' button is displayed
	When User clicks 'Create Account' button
	Then User sees 'Verify your account to continue' subheader on Right Side panel
	Then User sees 'An email was just sent to <emailAddress>(change email) from noreply@mindmanager.com. Please follow the instructions in the email, then come back here and click "Continue" to complete your account setup.' text messege on Right Side panel
	When User clicks 'Resend Email' button
	When User activates newly created Mind Manager account in outlook for 'auto.test@mindmanager.onmicrosoft.com' email address with 'Please verify your MindManager account' email title header and 'Something Else' use case button
	When User switches to '1' tab
	When User close Admin System Message for User '<emailAddress>' and Password '<password>' via API
	When User clicks 'Something Else' button for use case options on Right Side panel
	Then file manager header page is displayed to User
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	Then header 'Account Details' is displayed on page
	Then subscription account details 'MindManager Subscription' is displayed on page in 'My Products' section on Account Details page

Examples:
	| customerName        | emailAddress                               | password  |
	| Automation_testSRND | auto.test+SRND@mindmanager.onmicrosoft.com | TYf78!RND |

@Licensing @MindManagerAccounts @AccountsCreation @QA @Staging @Qase[LICENSE-348] @Cleanup @CleanupOutlookEmail
Scenario: Verify_it_is_possible_to_start_a_free_trial_license_not_preset
		Given User is on the Mindmanager website
 	Then Right Side panel is displayed
 	Then User sees 'Welcome' header on Right Side panel
	Then 'Start Free Trial' button is displayed
	Then 'Sign In' button is displayed
	Then 'Create Account' button is displayed
	Then 'Help' button is displayed
	When User clicks 'Start Free Trial' button
	When User fills account creation fields for new UI
		| Email          | Full_Name      | Password  |
		| <emailAddress> | Automation_RND | TYf78!RND |
	Then 'Create Account' button is displayed
	When User clicks 'Create Account' button
	Then User sees 'Verify your account to continue' subheader on Right Side panel
 	Then User sees 'An email was just sent to <emailAddress>(change email) from noreply@mindmanager.com. Please follow the instructions in the email, then come back here and click "Continue" to complete your account setup.' text messege on Right Side panel
 	When User clicks 'Resend Email' button
 	When User activates newly created Mind Manager account in outlook for 'auto.test@mindmanager.onmicrosoft.com' email address with 'Please verify your MindManager account' email title header and 'Something Else' use case button
 	When User switches to '0' tab
 	When User clicks 'Something Else' button for use case options on Right Side panel
 	When User close Admin System Message for User '<emailAddress>' and Password 'TYf78!RND' via API
 	Then file manager header page is displayed to User
 	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
 		| ItemName            | ItemPath                     |
 		| auto_test_SRND.mmap | SimpleMap.mmap |
 	When User shares 'auto_test_SRND.mmap' MindManager cloud file with 'rw' permission to '<emailAddress>' user email via API
 	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
 	Then 'Professional Free Trial: 29 days remaining' message is displayed at the bottom of Canvas

Examples:
	| customerName        | emailAddress                               |
	| Automation_testSRND | auto.test+SRND@mindmanager.onmicrosoft.com |