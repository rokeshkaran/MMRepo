@retry(2)
Feature: Create_Account
	Check Creating Account functionality error messages
	Check Error messages on Create Account page

Background: Pre-condition
	Given User is on the Mindmanager website
	Then Right Side panel is displayed
	Then 'Create Account' button is displayed
	When User clicks 'Create Account' button

@MindManager @Account @Create_Account @App_QA @App_Staging @App_Prod @Cleanup @CleanupOutlookEmail @Qase[WEB-22] @Health_Check @Upd_Qase
Scenario Outline: Check_Account_Creation_app
	Then User sees 'Create your free account' header on Right Side panel
	Then User sees 'Sign up today and start building your first map in minutes.' text messege on Right Side panel
	When User fills account creation fields for new UI
		| Email          | FullName       | Password   |
		| <emailAddress> | Automation_RND | <password> |
	When User clicks 'Create Account' button
	When User waits for data loading
	Then User sees 'Verify your account to continue' subheader on Right Side panel
	When User accepts Optanon cookies
	Then User sees 'An email was just sent to <emailAddress>(change email) from noreply@mindmanager.com. Please follow the instructions in the email, then come back here and click "Continue" to complete your account setup.' text messege on Right Side panel
	When User activates newly created Mind Manager account in outlook for 'auto.test@mindmanager.onmicrosoft.com' email address with 'Please verify your MindManager account' email title header and 'Something Else' use case button
	When User switches to '0' tab
	When User clicks 'Something Else' button for use case options on Right Side panel
	When User waits for data loading
	Then User sees 'You don't have a license to use this product.' header on Right Side panel
	Then User sees 'Good news! You're eligible for a free trial.' subheader on Right Side panel
	When User close Admin System Message for User '<emailAddress>' and Password '<password>' via API
	When User clicks 'Start Free Trial' button
	When User refresh page
	When User waits for data loading
	Then 'New' tab is active on file manager header page
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	Then header 'Account Details' is displayed on page
	Then User Name 'Automation_RND' is displayed in 'ACCOUNT NAME' subsection in 'General' section on Account Details page

Examples:
	| emailAddress                               | password  |
	| auto.test+SRND@mindmanager.onmicrosoft.com | TYf78!RND |

@MindManager @Account @Create_Account @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-22] @Upd_Qase
Scenario: Check_placeholders_of_sign_up_data_entry_fields
	When User clicks 'Create Account' button
	Then 'Email' placeholder is displayed in 'email' enter field
	Then 'Your Name' placeholder is displayed in 'full_name' enter field
	Then 'Password' placeholder is displayed in 'password' enter field

@MindManager @Account @Create_Account @App_QA @App_Staging @App_Prod @Cleanup @CleanupOutlookEmail @Qase[WEB-1890] @Upd_Qase
Scenario Outline: Check_Account_Creation_with_full_name
	Then User sees 'Create your free account' header on Right Side panel
	Then User sees 'Sign up today and start building your first map in minutes.' text messege on Right Side panel
	When User fills account creation fields for new UI
		| Email          | FullName            | Password   |
		| <emailAddress> | Automation_RND Test | <password> |
	When User clicks 'Create Account' button
	When User waits for data loading
	Then User sees 'Verify your account to continue' subheader on Right Side panel
	When User accepts Optanon cookies
	Then User sees 'An email was just sent to <emailAddress>(change email) from noreply@mindmanager.com. Please follow the instructions in the email, then come back here and click "Continue" to complete your account setup.' text messege on Right Side panel
	When User activates newly created Mind Manager account in outlook for 'auto.test@mindmanager.onmicrosoft.com' email address with 'Please verify your MindManager account' email title header and 'Something Else' use case button
	When User switches to '0' tab
	When User clicks 'Something Else' button for use case options on Right Side panel
	When User waits for data loading
	Then User sees 'You don't have a license to use this product.' header on Right Side panel
	Then User sees 'Good news! You're eligible for a free trial.' subheader on Right Side panel
	When User close Admin System Message for User '<emailAddress>' and Password '<password>' via API
	When User clicks 'Start Free Trial' button
	When User refresh page
	Then 'New' tab is active on file manager header page
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	Then header 'Account Details' is displayed on page
	Then User Name 'Automation_RND Test' is displayed in 'ACCOUNT NAME' subsection in 'General' section on Account Details page

Examples:
	| emailAddress                               | password  |
	| auto.test+SRND@mindmanager.onmicrosoft.com | TYf78!RND |

@MindManager @Account @Create_Account @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Qase[WEB-24] @Upd_Qase
Scenario: Create_account_without_Your_name
	Then User sees 'Create your free account' header on Right Side panel
	Then User sees 'Sign up today and start building your first map in minutes.' text messege on Right Side panel
	When User enters 'MindManagerSRND@mailinator.com' in the 'email' field
	When User enters '' in the 'full_name' field
	When User enters 'TYf78Klo12' in the 'password' field
	When User clicks 'Create Account' button
	Then Error message with text 'Your Name is required' is displayed to the User

@MindManager @Account @Create_Account @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Qase[WEB-27] @Upd_Qase
Scenario: Create_account_without_entering_password
	When User enters 'MindManager@mailinator.com' in the 'email' field
	When User enters 'Automationtest' in the 'full_name' field
	When User clicks 'Create Account' button
	Then Error message with text 'Password is required' is displayed to the User

@MindManager @Account @Create_Account @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Qase[WEB-28] @Upd_Qase
Scenario: Create_account_without_entering_email
	When User enters 'Automationtest' in the 'full_name' field
	When User enters 'TYf78Klo12' in the 'password' field
	When User clicks 'Create Account' button
	Then Error message with text 'Email is required' is displayed to the User

@MindManager @Account @Create_Account @QA @App_QA @Staging @App_Staging @App_Prod @Prod @Qase[WEB-29] @Upd_Qase
Scenario: Check_Create_an_existing_account
	When User enters 'automationtestmj@gmail.com' in the 'email' field
	When User enters 'Automationtest' in the 'full_name' field
	When User enters 'TYf78Klo12!' in the 'password' field
	When User clicks 'Create Account' button
	Then User sees 'Sign In' header on Right Side panel
	Then User sees 'Please enter your details below.' text messege on Right Side panel

@MindManager @Account @Create_Account @App_Prod @Cleanup @CleanupOutlookEmail @Qase[WEB-30] @Health_Check @Upd_Qase
Scenario Outline: Check_changing_info_while_creating_an_account_app_Prod
	When User fills account creation fields for new UI
		| Email          | FullName          | Password |
		| <invalidEmail> | TESTAutomationRND | G5kw!RND |
	When User clicks 'Create Account' button
	When User waits for data loading
	Then User sees 'Verify your account to continue' subheader on Right Side panel
	Then User sees 'An email was just sent to <invalidEmail>(change email) from noreply@mindmanager.com. Please follow the instructions in the email, then come back here and click "Continue" to complete your account setup.' text messege on Right Side panel
	When User clicks Change email link
	When User waits for data loading
	Then '<invalidEmail>' value is displayed to the 'email' field
	Then 'TESTAutomationRND' value is displayed to the 'full_name' field
	Then '' value is displayed to the 'password' field
	When User fills account creation fields for new UI
		| Email        | FullName      | Password   |
		| <validEmail> | AutomationRND | M2p8rw!RND |
	When User clicks 'Create Account' button
	When User waits for data loading
	When User accepts Optanon cookies
	Then User sees 'Verify your account to continue' subheader on Right Side panel
	Then User sees 'An email was just sent to <validEmail>(change email) from noreply@mindmanager.com. Please follow the instructions in the email, then come back here and click "Continue" to complete your account setup.' text messege on Right Side panel
	When User activates newly created Mind Manager account in outlook for 'auto.test@mindmanager.onmicrosoft.com' email address with 'Please verify your MindManager account' email title header and 'Something Else' use case button
	When User switches to '0' tab
	When User clicks 'Something Else' button for use case options on Right Side panel
	When User waits for data loading
	Then User sees 'You don't have a license to use this product.' header on Right Side panel
	Then User sees 'Good news! You're eligible for a free trial.' subheader on Right Side panel
	When User clicks 'Start Free Trial' button
	Then 'New' tab is active on file manager header page
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Sign Out' item in 'user-panel' dropdown menu
	Then Right Side panel is displayed
	When User clicks 'Sign In' button
	When User enters '<invalidEmail>' in the 'email' field
	When User enters 'G5kwRND' in the 'password' field
	When User clicks 'Sign In' button
	Then Error message with text 'Incorrect username or password' is displayed to the User

Examples:
	| invalidEmail                 | validEmail                                 |
	| automation_SRND@hehe.ppp.com | auto.test+SRND@mindmanager.onmicrosoft.com |

@MindManager @Account @Create_Account @App_QA @App_Staging @Cleanup @CleanupOutlookEmail @Qase[WEB-30] @Upd_Qase @JIRA[MMCV-10518]
Scenario Outline: Check_changing_info_while_creating_an_account
	When User fills account creation fields for new UI
		| Email          | FullName          | Password |
		| <invalidEmail> | TESTAutomationRND | G5kwRND! |
	When User clicks 'Create Account' button
	Then User sees 'Verify your account to continue' subheader on Right Side panel
	Then User sees 'An email was just sent to <invalidEmail>(change email) from noreply@mindmanager.com. Please follow the instructions in the email, then come back here and click "Continue" to complete your account setup.' text messege on Right Side panel
	When User clicks Change email link
	Then '<invalidEmail>' value is displayed to the 'email' field
	Then 'TESTAutomationRND' value is displayed to the 'full_name' field
	Then '' value is displayed to the 'password' field
	When User fills account creation fields for new UI
		| Email        | FullName      | Password   |
		| <validEmail> | AutomationRND | <password> |
	When User clicks 'Create Account' button
	Then User sees 'Verify your account to continue' subheader on Right Side panel
	When User accepts Optanon cookies
	Then User sees 'An email was just sent to <validEmail>(change email) from noreply@mindmanager.com. Please follow the instructions in the email, then come back here and click "Continue" to complete your account setup.' text messege on Right Side panel
	When User activates newly created Mind Manager account in outlook for 'auto.test@mindmanager.onmicrosoft.com' email address with 'Please verify your MindManager account' email title header and 'Something Else' use case button
	When User switches to '0' tab
	When User clicks 'Something Else' button for use case options on Right Side panel
	When User waits '3000' miliseconds
	Then User sees 'You don't have a license to use this product.' header on Right Side panel
	Then User sees 'Good news! You're eligible for a free trial.' subheader on Right Side panel
	When User close Admin System Message for User '<validEmail>' and Password '<password>' via API
	When User clicks 'Start Free Trial' button
	When User refresh page
	Then 'New' tab is active on file manager header page
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Sign Out' item in 'user-panel' dropdown menu
	Then Right Side panel is displayed
	When User clicks 'Sign In' button
	When User enters '<invalidEmail>' in the 'email' field
	When User enters 'G5kwRND!' in the 'password' field
	When User clicks 'Sign In' button
	Then Error message with text 'Incorrect username or password' is displayed to the User
	#Support Portal
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	When User selects 'User Search' search option on Action panel
	When User enters '<invalidEmail>' value in the 'search-input' field on Action panel
	Then 'license-support-tenant-search-result' table is not displayed to User
	When User enters '<validEmail>' value in the 'search-input' field on Action panel
	Then '<validEmail>' value is displayed in the 'User' column of 'license-support-user-search-result' table

Examples:
	| invalidEmail                 | validEmail                                 | password   |
	| automation_SRND@hehe.ppp.com | auto.test+SRND@mindmanager.onmicrosoft.com | M2p8rwRND! |

