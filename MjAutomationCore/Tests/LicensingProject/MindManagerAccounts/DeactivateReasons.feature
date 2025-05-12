@retry(2)
Feature: DeactivateReasons
Check license key is valid or invalid

@Licensing @MindManager_Accounts @Deactivate_Reasons @QA @Staging @Qase[LICENSE-349] @Cleanup @LC_Upd
Scenario: Verify_the_trial_expired_screen
	#MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 3     | MMTRIAL   | D(1)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User find 'MindManager Trial' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Trial' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters '<emailAddress>' value in the 'email' field in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value             |
		| Version          | MindManager Trial |
		| Expires          | D(1)              |
		| Seats Used/Total | 1/3               |
	When User updates 'MMTRIAL' purchase data for '<customerName>' customer in Sales portal via Api
		| EndDate |
		| D(-1)   |
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	Then User sees 'Your MindManager Trial has expired.' header on Right Side panel
	Then User sees 'Please purchase to continue using MindManager.' subheader on Right Side panel
	Then 'View Pricing' button is displayed
	Then 'Contact Enterprise Sales' button is displayed
	Then 'Enter New License Key' button is displayed
	Then 'Help' button is displayed

Examples:
	| customerName        | emailAddress                                 | password   |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |

@Licensing @MindManager_Accounts @Deactivate_Reasons @QA @Staging @Qase[LICENSE-350] @Cleanup @LC_Upd
Scenario: Verify_the_Blocked_trial_screen
	#MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Mind Manager UI
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	Then User sees 'You don't have a license to use this product.' header on Right Side panel
	Then User sees 'Good news! You're eligible for a free trial.' subheader on Right Side panel
	#MM app
	Given User account
		| Email           | Password    |
		| <emailAddress1> | <password1> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Open New tab
	#Mind Manager UI
	When User open new tab in browser
	Given User is logged into '<emailAddress1>' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	Then User sees 'You don't have a license to use this product.' header on Right Side panel
	Then User sees 'Good news! You're eligible for a free trial.' subheader on Right Side panel
	#Switch for first tab
	When User switches to '0' tab
	When User clicks 'Start Free Trial' button
	#Switch for second tab
	When User switches to '1' tab
	When User clicks 'Start Free Trial' button
	When User waits '2000' miliseconds
	Then Right Side panel is displayed
	Then User sees 'Your MindManager Trial cannot be started.' header on Right Side panel
	Then 'View Pricing' button is displayed
	Then 'Contact Enterprise Sales' button is displayed
	Then 'Enter License Key' button is displayed
	Then 'Help' button is displayed
	
Examples:
	| emailAddress                                 | password   | emailAddress1                               | password1  |
	| auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | auto.test_1+RND@mindmanager.onmicrosoft.com | 7j9k2!SRND |

@Licensing @MindManager_Accounts @Deactivate_Reasons @QA @Staging @Qase[LICENSE-351] @Cleanup @LC_Upd
Scenario: Verify_the_subscription_expired_screen_for_Enterprise_customer
	#MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 3     | MMSUBSCRIPTION | D(1)    |
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
		| Expires          | D(1)                     |
		| Seats Used/Total | 1/3                      |
	When User updates 'MMSUBSCRIPTION' purchase data for '<customerName>' customer in Sales portal via Api
		| EndDate |
		| D(-1)   |
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	When User waits for data loading
	Then Right Side panel is displayed
	Then User sees 'Your MindManager Subscription has expired or been cancelled.' header on Right Side panel
	Then User sees 'For help with this issue please contact your company's IT department.' subheader on Right Side panel
	Then 'Enter New License Key' button is displayed

Examples:
	| customerName        | emailAddress                                 | password   |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |

@Licensing @MindManager_Accounts @Deactivate_Reasons @QA @Staging @Qase[LICENSE-352] @Cleanup @LC_Upd
Scenario: Verify_the_subscription_expired_screen_for_Standard_customer
	#MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type     |
		| <customerName> | standard |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 3     | MMSUBSCRIPTION | D(1)    |
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
		| Expires          | D(1)                     |
		| Seats Used/Total | 1/3                      |
	When User updates 'MMSUBSCRIPTION' purchase data for '<customerName>' customer in Sales portal via Api
		| EndDate |
		| D(-1)   |
	#MM app
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	When User waits for data loading
	Then Right Side panel is displayed
	Then User sees 'Your MindManager Subscription has expired or been cancelled.' header on Right Side panel
	Then User sees 'Please purchase to continue using MindManager.' subheader on Right Side panel
	Then 'View Pricing' button is displayed
	Then 'Contact Enterprise Sales' button is displayed
	Then 'Enter New License Key' button is displayed
	Then 'Help' button is displayed

Examples:
	| customerName        | emailAddress                                 | password   |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |

@Licensing @MindManager_Accounts @Deactivate_Reasons @QA @Staging @Qase[LICENSE-353] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @LC_Upd
Scenario: Verify_revoked_screen_for_Enterprise_customer
	#MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 1     | MMSUBSCRIPTION | D(1)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User close 'bula-dialog' dialog
	When User accepts Optanon cookies
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Subscription' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters '<emailAddress>' value in the 'email' field in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                    |
		| Version          | MindManager Subscription |
		| Expires          | D(1)                     |
		| Seats Used/Total | 1/1                      |
	#Support portal
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	When User enters '<emailAddress>' value in the 'search-input' field on Action panel
	When User find '<emailAddress>' value in 'User' column of 'license-support-user-search-result' table and clicks 'Details' button
	When User find 'MindManager Subscription' value of 'Product' column of 'license-support-user-details-subscriptions' table and select 'Deactivated' value in 'User Status' column
	#MM app
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	Then User sees 'Your license was revoked or re-allocated.' header on Right Side panel
	Then User sees 'For help with this issue please contact your company's IT department.' subheader on Right Side panel
	Then 'Enter New License Key' button is displayed

Examples:
	| customerName        | emailAddress                                 | password   |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |

@Licensing @MindManager_Accounts @Deactivate_Reasons @QA @Staging @Qase[LICENSE-354] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @LC_Upd
Scenario: Verify_revoked_screen_for_Standard_customer
	#MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type     |
		| <customerName> | standard |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 1     | MMSUBSCRIPTION | D(1)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User close 'bula-dialog' dialog
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Subscription' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters '<emailAddress>' value in the 'email' field in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                    |
		| Version          | MindManager Subscription |
		| Expires          | D(1)                     |
		| Seats Used/Total | 1/1                      |
	#Support portal
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	When User accepts Optanon cookies
	When User enters '<emailAddress>' value in the 'search-input' field on Action panel
	When User find '<emailAddress>' value in 'User' column of 'license-support-user-search-result' table and clicks 'Details' button
	When User find 'MindManager Subscription' value of 'Product' column of 'license-support-user-details-subscriptions' table and select 'Deactivated' value in 'User Status' column
	#MM app
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	Then User sees 'Your license was revoked or re-allocated.' header on Right Side panel
	Then User sees 'Please contact your MindManager software administrator or purchase a new license or subscription to use MindManager.' subheader on Right Side panel
	Then 'View Pricing' button is displayed
	Then 'Enter New License Key' button is displayed
	Then 'Help' button is displayed

Examples:
	| customerName        | emailAddress                                 | password   |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |

@Licensing @MindManager_Accounts @Deactivate_Reasons @QA @Staging @Qase[LICENSE-355] @Cleanup @LC_Upd
Scenario: Verify_the_license_issue_screen_for_enterprise_customer
	#MM app
	Given User account
		| Email           | Password   |
		| <emailAddress1> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 1     | MMSUBSCRIPTION | D(1)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User close 'bula-dialog' dialog
	When User accepts Optanon cookies
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Subscription' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters '<emailAddress>' value in the 'email' field in 'manage-user' dialog
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
	Given User is logged into '<emailAddress1>' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	When User clicks 'Enter License Key' button
	When User switches to iframe
	When User pastes copied key into 'license_key' field
	When User switches to iframe
	When User clicks 'Submit' button
	Then User sees 'This license key has already been used the maximum number of times.' header on Right Side panel
	Then User sees 'For help with this issue please contact your company's IT department.' subheader on Right Side panel
	Then 'Enter New License Key' button is displayed

Examples:
	| customerName        | emailAddress                               | password   | emailAddress1                             |
	| Automation_testSRND | auto.test+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | auto.test+RND@mindmanager.onmicrosoft.com |

@Licensing @MindManager_Accounts @Deactivate_Reasons @QA @Staging @Qase[LICENSE-356] @Cleanup @LC_Upd
Scenario: Verify_the_license_issue_screen_for_standard_customer
	#MM app
	Given User account
		| Email           | Password   |
		| <emailAddress1> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type     |
		| <customerName> | standard |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 1     | MMSUBSCRIPTION | D(1)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User close 'bula-dialog' dialog
	When User accepts Optanon cookies
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Subscription' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters '<emailAddress>' value in the 'email' field in 'manage-user' dialog
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
	Given User is logged into '<emailAddress1>' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	When User clicks 'Enter License Key' button
	When User switches to iframe
	When User pastes copied key into 'license_key' field
	When User switches to iframe
	When User clicks 'Submit' button
	Then User sees 'This license key has already been used the maximum number of times.' header on Right Side panel
	Then User sees 'Please contact your MindManager software administrator or purchase a new license or subscription to use MindManager.' subheader on Right Side panel
	Then 'Enter New License Key' button is displayed

Examples:
	| customerName        | emailAddress                               | password   | emailAddress1                             |
	| Automation_testSRND | auto.test+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | auto.test+RND@mindmanager.onmicrosoft.com |

@Licensing @MindManager_Accounts @Deactivate_Reasons @QA @Staging @Qase[LICENSE-357] @Cleanup @LC_Upd
Scenario: Verify_the_start_trial_screen
	#MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#MM app
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	Then User sees 'You don't have a license to use this product.' header on Right Side panel
	Then User sees 'Good news! You're eligible for a free trial.' subheader on Right Side panel
	Then 'View Pricing' button is displayed
	Then 'Enter License Key' button is displayed
	Then 'Help' button is displayed

Examples:
	| customerName        | emailAddress                                 | password   |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |