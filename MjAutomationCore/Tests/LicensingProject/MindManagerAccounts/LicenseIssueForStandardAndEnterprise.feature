@retry(2)
Feature: LicenseIssueStandardAndEnterprise
Check License Issue screen for Standard and Enterprise

@Licensing @MindManager_Accounts @LicenseIssue @QA @Staging @Qase[LICENSE-390,LICENSE-393] @Cleanup @LC_Upd
Scenario: Verify_Enter_New_License_Key_Button_On_License_Issue_Screen
	Given User account
		| Email                                     | Password   |
		| auto.test+RND@mindmanager.onmicrosoft.com | 6j9k2!SRND |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name             | Type   |
		| <customerName_1> | <type> |
	When User creates new Purchase on Sales portal via Api
		| CustomerName     | Seats | ProductId      | EndDate |
		| <customerName_1> | 1     | MMSUBSCRIPTION | D(1)    |
	#Admin portal
	When User is logged in to '<customerName_1>' customer on Admin portal via Api
	When admin '<customerName_1>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Subscription' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters 'auto.test+SRND@mindmanager.onmicrosoft.com' value in the 'email' field in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                    |
		| Version          | MindManager Subscription |
		| Expires          | D(1)                     |
		| Seats Used/Total | 1/1                      |
	When User clicks 'Back' button
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks clipboard copy button in 'License Key' column
	Then 'Copied.' text message is displayed in toast container
	Then value is copied to the clipboard
	#MM app
	Given User is logged into 'auto.test+RND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	When User clicks 'Enter License Key' button
	When User switches to iframe
	When User pastes copied key into 'license_key' field
	When User switches to iframe
	When User clicks 'Submit' button
	Then User sees '<License_Issue_Text_Verification_1>' header on Right Side panel
	Then User sees '<License_Issue_Text_Verification_2>' subheader on Right Side panel
	When User open new tab in browser
	#Admin portal
	When User creates new Customer on Sales portal via Api
		| Name             | Type       |
		| <customerName_2> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName     | Seats | ProductId      | EndDate |
		| <customerName_2> | 2     | MMSUBSCRIPTION | D(10)   |
	#Admin portal
	When User is logged in to '<customerName_2>' customer on Admin portal via Api
	When admin '<customerName_2>' accepts BULA terms via API
	When User refresh page
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks clipboard copy button in 'License Key' column
	Then 'Copied.' text message is displayed in toast container
	Then value is copied to the clipboard
	#MM app
	When User switches to '0' tab
	Then 'Enter New License Key' button is displayed
	When User clicks 'Enter New License Key' button
	When User switches to iframe
	When User pastes copied key into 'license_key' field
	When User switches to iframe
	When User clicks 'Submit' button
	Then User sees 'Success!' header on Right Side panel
	Then User sees 'Your license key was successfully added to your account.' subheader on Right Side panel
	When User clicks 'Continue' button
	Then file manager header page is displayed to User

Examples:
	| customerName_1      | customerName_2       | type       | License_Issue_Text_Verification_1                                   | License_Issue_Text_Verification_2                                                                                    |
	| Automation_testSRND | Automation1_testSRND | enterprise | This license key has already been used the maximum number of times. | For help with this issue please contact your company's IT department.                                                |
	| Automation_testSRND | Automation1_testSRND | standard   | This license key has already been used the maximum number of times. | Please contact your MindManager software administrator or purchase a new license or subscription to use MindManager. |

@Licensing @MindManager_Accounts @LicenseIssue @QA @Staging @Qase[LICENSE-391,LICENSE-395] @Cleanup @LC_Upd
Scenario: Verify_Sign_Out_Button_On_License_Issue_Screen
	Given User account
		| Email                                     | Password   |
		| auto.test+RND@mindmanager.onmicrosoft.com | 6j9k2!SRND |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name             | Type   |
		| <customerName_1> | <type> |
	When User creates new Purchase on Sales portal via Api
		| CustomerName     | Seats | ProductId      | EndDate |
		| <customerName_1> | 1     | MMSUBSCRIPTION | D(1)    |
	#Admin portal
	When User is logged in to '<customerName_1>' customer on Admin portal via Api
	When admin '<customerName_1>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Subscription' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters 'auto.test+SRND@mindmanager.onmicrosoft.com' value in the 'email' field in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                    |
		| Version          | MindManager Subscription |
		| Expires          | D(1)                     |
		| Seats Used/Total | 1/1                      |
	When User clicks 'Back' button
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks clipboard copy button in 'License Key' column
	Then 'Copied.' text message is displayed in toast container
	Then value is copied to the clipboard
	#MM app
	Given User is logged into 'auto.test+RND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	When User clicks 'Enter License Key' button
	When User switches to iframe
	When User pastes copied key into 'license_key' field
	When User switches to iframe
	When User clicks 'Submit' button
	Then User sees '<License_Issue_Text_Verification_1>' header on Right Side panel
	Then User sees '<License_Issue_Text_Verification_2>' subheader on Right Side panel
	When User switches to iframe
	When User clicks on sign out button on right side panel
	When User switches to default content
	Then User sees 'Welcome' header on Right Side panel
	Then 'Start Free Trial' button is displayed
	Then 'Sign In' button is displayed
	Then 'Create Account' button is displayed
	Then 'Help' button is displayed

Examples:
	| customerName_1      | type       | License_Issue_Text_Verification_1                                   | License_Issue_Text_Verification_2                                                                                    |
	| Automation_testSRND | enterprise | This license key has already been used the maximum number of times. | For help with this issue please contact your company's IT department.                                                |
	| Automation_testSRND | standard   | This license key has already been used the maximum number of times. | Please contact your MindManager software administrator or purchase a new license or subscription to use MindManager. |

@Licensing @MindManager_Accounts @LicenseIssue @QA @Staging @Qase[LICENSE-392] @Cleanup @LC_Upd
Scenario: Verify_View_Pricing_Button_On_License_Issue_Screen
	Given User account
		| Email                                     | Password   |
		| auto.test+RND@mindmanager.onmicrosoft.com | 6j9k2!SRND |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name             | Type   |
		| <customerName_1> | <type> |
	When User creates new Purchase on Sales portal via Api
		| CustomerName     | Seats | ProductId      | EndDate |
		| <customerName_1> | 1     | MMSUBSCRIPTION | D(1)    |
	#Admin portal
	When User is logged in to '<customerName_1>' customer on Admin portal via Api
	When admin '<customerName_1>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Subscription' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters 'auto.test+SRND@mindmanager.onmicrosoft.com' value in the 'email' field in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                    |
		| Version          | MindManager Subscription |
		| Expires          | D(1)                     |
		| Seats Used/Total | 1/1                      |
	When User clicks 'Back' button
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks clipboard copy button in 'License Key' column
	Then 'Copied.' text message is displayed in toast container
	Then value is copied to the clipboard
	#MM app
	Given User is logged into 'auto.test+RND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	When User clicks 'Enter License Key' button
	When User switches to iframe
	When User pastes copied key into 'license_key' field
	When User switches to iframe
	When User clicks 'Submit' button
	Then User sees '<License_Issue_Text_Verification_1>' header on Right Side panel
	Then User sees '<License_Issue_Text_Verification_2>' subheader on Right Side panel
	Then 'View Pricing' button is displayed
	When User clicks 'View Pricing' button
	When User switches to '1' tab
	Then page url is 'https://www.mindmanager.com/en/pricing/'

Examples:
	| customerName_1      | type     | License_Issue_Text_Verification_1                                   | License_Issue_Text_Verification_2                                                                                    |
	| Automation_testSRND | standard | This license key has already been used the maximum number of times. | Please contact your MindManager software administrator or purchase a new license or subscription to use MindManager. |

@Licensing @MindManager_Accounts @LicenseIssue @QA @Staging @Qase[LICENSE-394] @Cleanup @LC_Upd
Scenario: Verify_Help_Button_On_License_Issue_Screen
	Given User account
		| Email                                     | Password   |
		| auto.test+RND@mindmanager.onmicrosoft.com | 6j9k2!SRND |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name             | Type   |
		| <customerName_1> | <type> |
	When User creates new Purchase on Sales portal via Api
		| CustomerName     | Seats | ProductId      | EndDate |
		| <customerName_1> | 1     | MMSUBSCRIPTION | D(1)    |
	#Admin portal
	When User is logged in to '<customerName_1>' customer on Admin portal via Api
	When admin '<customerName_1>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Subscription' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters 'auto.test+SRND@mindmanager.onmicrosoft.com' value in the 'email' field in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                    |
		| Version          | MindManager Subscription |
		| Expires          | D(1)                     |
		| Seats Used/Total | 1/1                      |
	When User clicks 'Back' button
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks clipboard copy button in 'License Key' column
	Then 'Copied.' text message is displayed in toast container
	Then value is copied to the clipboard
	#MM app
	Given User is logged into 'auto.test+RND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	When User clicks 'Enter License Key' button
	When User switches to iframe
	When User pastes copied key into 'license_key' field
	When User switches to iframe
	When User clicks 'Submit' button
	Then User sees '<License_Issue_Text_Verification_1>' header on Right Side panel
	Then User sees '<License_Issue_Text_Verification_2>' subheader on Right Side panel
	Then 'Help' button is displayed
	When User clicks 'Help' button
	Then User sees 'MindManager Licensing Help' header on Right Side panel
	When User clicks 'Back' button
	Then User sees 'This license key has already been used the maximum number of times.' header on Right Side panel
	Then User sees 'Please contact your MindManager software administrator or purchase a new license or subscription to use MindManager.' subheader on Right Side panel
	Then 'View Pricing' button is displayed
	Then 'Enter New License Key' button is displayed
	Then 'Help' button is displayed

Examples:
	| customerName_1      | type     | License_Issue_Text_Verification_1                                   | License_Issue_Text_Verification_2                                                                                    |
	| Automation_testSRND | standard | This license key has already been used the maximum number of times. | Please contact your MindManager software administrator or purchase a new license or subscription to use MindManager. |