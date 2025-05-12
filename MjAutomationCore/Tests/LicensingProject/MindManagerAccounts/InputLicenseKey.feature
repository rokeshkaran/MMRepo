@retry(2)
Feature: InputLicenseKey
Check license key is valid or invalid

@Licensing @MindManager_Accounts @Input_License_Key @QA @Staging @Qase[LICENSE-359] @Cleanup @LC_Upd
Scenario: Verify_used_account_key_cannot_be_applied
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
	When User clicks 'Back' button
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks clipboard copy button in 'License Key' column
	Then 'Copied.' text message is displayed in toast container
	Then value is copied to the clipboard
	##MM app
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	Then header 'Account Details' is displayed on page
	When User switches to iframe
	When User clicks 'Add Product' button on the page
	When User switches to iframe
	When User pastes copied key into 'license_key' field
	When User switches to iframe
	When User clicks 'Submit' button
	When User switches to iframe
	Then license key error message with text 'This Key has already been added to your account.' is displayed to the User

Examples:
	| customerName        | emailAddress                               | password   |
	| Automation_testSRND | auto.test+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |

@Licensing @MindManager_Accounts @Input_License_Key @QA @Qase[LICENSE-360] @Cleanup @LC_Upd
Scenario: Verify_an_invalid_license_key_cannot_be_applied_QA
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
	Then Right Side panel is displayed
	Then User sees 'Your MindManager Subscription has expired or been cancelled.' header on Right Side panel
	When User clicks 'Enter New License Key' button
	When User switches to iframe
	When User enters 'invalid key' in the 'license_key' field
	When User clicks 'Submit' button
	When User switches to iframe
	Then license key invalid message with text 'This Key is invalid. If this problem persists, please contact support.' is displayed to the User

Examples:
	| customerName        | emailAddress                               | password   |
	| Automation_testSRND | auto.test+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |

@Licensing @MindManager_Accounts @Input_License_Key @Staging @Qase[LICENSE-360] @Cleanup @LC_Upd
Scenario: Verify_an_invalid_license_key_cannot_be_applied_STG
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
	Then Right Side panel is displayed
	Then User sees 'Your MindManager Subscription has expired or been cancelled.' header on Right Side panel
	When User clicks 'Enter New License Key' button
	When User switches to iframe
	When User enters 'invalid key' in the 'license_key' field
	When User clicks 'Submit' button
	When User switches to iframe
	Then license key invalid message with text 'This Key is invalid. If this problem persists, please contact support.' is displayed to the User

Examples:
	| customerName        | emailAddress                               | password   |
	| Automation_testSRND | auto.test+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |

@Licensing @MindManager_Accounts @Input_License_Key @QA @Staging @Qase[LICENSE-361] @Cleanup @LC_Upd
Scenario: Verify_License_Key_Cannot_Be_Applied_If_No_Seats_Remaining_Enterprise_Type
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
	When User refresh page
	When User accepts Optanon cookies
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails                                     |
		| add        | MMSUBSCRIPTION | auto.test+SRND@mindmanager.onmicrosoft.com |
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Subscription' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters 'auto.test+520SRND@mindmanager.onmicrosoft.com,auto.test+521SRND@mindmanager.onmicrosoft.com' value in the 'email' field in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then 'Not enough seats.' text message is displayed in toast container
	When User clicks close button in 'manage-user' dialog
	When User updates 'MMSUBSCRIPTION' purchase data for '<customerName>' customer in Sales portal via Api
		| EndDate |
		| D(-1)   |
	When User clicks 'Back' button
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks clipboard copy button in 'License Key' column
	Then 'Copied.' text message is displayed in toast container
	Then value is copied to the clipboard
	#MM app
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	Then User sees 'Your MindManager Subscription has expired or been cancelled.' header on Right Side panel
	When User clicks 'Enter New License Key' button
	When User switches to iframe
	When User pastes copied key into 'license_key' field
	When User switches to iframe
	When User clicks 'Submit' button
	Then User sees 'This license key has already been used the maximum number of times.' header on Right Side panel
	Then User sees 'For help with this issue please contact your company's IT department.' subheader on Right Side panel

Examples:
	| customerName        | emailAddress                               | password   |
	| Automation_testSRND | auto.test+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |

@Licensing @MindManager_Accounts @Input_License_Key @QA @Staging @Qase[LICENSE-361] @Cleanup @LC_Upd
Scenario: Verify_License_Key_Cannot_Be_Applied_If_No_Seats_Remaining_Standard_Type
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
	When User refresh page
	When User accepts Optanon cookies
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails                                     |
		| add        | MMSUBSCRIPTION | auto.test+SRND@mindmanager.onmicrosoft.com |
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Subscription' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters 'auto.test+522SRND@mindmanager.onmicrosoft.com,auto.test+523SRND@mindmanager.onmicrosoft.com' value in the 'email' field in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then 'Not enough seats.' text message is displayed in toast container
	When User clicks close button in 'manage-user' dialog
	When User updates 'MMSUBSCRIPTION' purchase data for '<customerName>' customer in Sales portal via Api
		| EndDate |
		| D(-1)   |
	When User clicks 'Back' button
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks clipboard copy button in 'License Key' column
	Then 'Copied.' text message is displayed in toast container
	Then value is copied to the clipboard
	#MM app
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	Then User sees 'Your MindManager Subscription has expired or been cancelled.' header on Right Side panel
	When User clicks 'Enter New License Key' button
	When User switches to iframe
	When User pastes copied key into 'license_key' field
	When User switches to iframe
	When User clicks 'Submit' button
	Then User sees 'This license key has already been used the maximum number of times.' header on Right Side panel
	Then User sees 'Please contact your MindManager software administrator or purchase a new license or subscription to use MindManager.' subheader on Right Side panel

Examples:
	| customerName        | emailAddress                               | password   |
	| Automation_testSRND | auto.test+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |
	 
@Licensing @MindManager_Accounts @Input_License_Key @QA @Staging @Qase[LICENSE-363] @Cleanup @LC_Upd
Scenario: Verify_It_Is_Possible_To_Apply_License_Key_If_You_Don't_have_any_subscription
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
	When User switches to iframe
	When User clicks 'Enter License Key' button
	When User open new tab in browser
	When User switches to '1' tab
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
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks clipboard copy button in 'License Key' column
	Then 'Copied.' text message is displayed in toast container
	Then value is copied to the clipboard
	#MM app
	When User switches to '0' tab
	When User switches to iframe
	When User pastes copied key into 'license_key' field
	When User switches to iframe
	When User clicks 'Submit' button
	When User switches to '0' tab
	Then User sees 'Success!' header on Right Side panel
	Then User sees 'Your license key was successfully added to your account.' subheader on Right Side panel
	When User clicks 'Continue' button
	Then file manager header page is displayed to User
	When User switches to '1' tab
	When User refresh page
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                    |
		| Version          | MindManager Subscription |
		| Expires          | D(1)                     |
		| Seats Used/Total | 1/3                      |

Examples:
	| customerName        | emailAddress                               | password   |
	| Automation_testSRND | auto.test+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |
	 
@Licensing @MindManager_Accounts @Input_License_Key @QA @Staging @Qase[LICENSE-364] @Cleanup @LC_Upd
Scenario: Valid_License_Key_Can_Be_Applied_If_You_Have_Expired_MM_Subscription
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
	#MM app
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	Then User sees 'Your MindManager Subscription has expired or been cancelled.' header on Right Side panel
	When User clicks 'Enter New License Key' button
	When User open new tab in browser
	When User switches to '1' tab
	When User creates new Customer on Sales portal via Api
		| Name            | Type       |
		| <customerName2> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName    | Seats | ProductId      | EndDate |
		| <customerName2> | 3     | MMSUBSCRIPTION | D(1)    |
	#Admin portal
	When User is logged in to '<customerName2>' customer on Admin portal via Api
	When admin '<customerName2>' accepts BULA terms via API
	When User refresh page
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks clipboard copy button in 'License Key' column
	Then 'Copied.' text message is displayed in toast container
	Then value is copied to the clipboard
	When User switches to '0' tab
	When User switches to iframe
	When User pastes copied key into 'license_key' field
	When User switches to iframe
	When User clicks 'Submit' button
	When User switches to '0' tab
	Then User sees 'Success!' header on Right Side panel
	Then User sees 'Your license key was successfully added to your account.' subheader on Right Side panel
	When User clicks 'Continue' button
	Then file manager header page is displayed to User
	When User switches to '1' tab
	When User refresh page
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                    |
		| Version          | MindManager Subscription |
		| Expires          | D(1)                     |
		| Seats Used/Total | 1/3                      |

Examples:
	| customerName        | emailAddress                               | password   | customerName2           |
	| Automation_testSRND | auto.test+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | AutomationTest_testSRND |

@Licensing @MindManager_Accounts @Input_License_Key @QA @Staging @Qase[LICENSE-365] @Cleanup @LC_Upd
Scenario: Verify_It_Is_Possible_To_apply_valid_license_key_if_you_have_trial_subscription
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
	#MM app
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	Then header 'Account Details' is displayed on page
	Then subscription account details 'MindManager Trial' is displayed on page in 'My Products' section on Account Details page
	When User switches to iframe
	When User clicks 'Add Product' button on the page
	#Sales portal
	When User open new tab in browser
	When User switches to '1' tab
	When User creates new Customer on Sales portal via Api
		| Name            | Type       |
		| <customerName2> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName    | Seats | ProductId      | EndDate |
		| <customerName2> | 3     | MMSUBSCRIPTION | D(1)    |
	#Admin portal
	When User is logged in to '<customerName2>' customer on Admin portal via Api
	When admin '<customerName2>' accepts BULA terms via API
	When User refresh page
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks clipboard copy button in 'License Key' column
	Then 'Copied.' text message is displayed in toast container
	Then value is copied to the clipboard
	#MM app
	When User switches to '0' tab
	When User switches to iframe
	When User pastes copied key into 'license_key' field
	When User switches to iframe
	When User clicks 'Submit' button
	When User switches to '0' tab
	Then User sees 'Success!' header on Right Side panel
	Then User sees 'Your license key was successfully added to your account.' subheader on Right Side panel
	When User clicks 'Continue' button
	Then file manager header page is displayed to User
	When User switches to '1' tab
	When User refresh page
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                    |
		| Version          | MindManager Subscription |
		| Expires          | D(1)                     |
		| Seats Used/Total | 1/3                      |

Examples:
	| customerName        | emailAddress                               | password   | customerName2           |
	| Automation_testSRND | auto.test+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | AutomationTest_testSRND |

@Licensing @MindManager_Accounts @Input_License_Key @QA @Staging @Qase[LICENSE-366] @Cleanup @LC_Upd
Scenario: Verify_It_Is_Possible_To_apply_valid_license_key_if_you_have_expired_subscription
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
	#MM app
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	Then User sees 'Your MindManager Trial has expired.' header on Right Side panel
	Then User sees 'Please purchase to continue using MindManager.' subheader on Right Side panel
	When User switches to iframe
	When User clicks 'Enter New License Key' button
	#Sales portal
	When User open new tab in browser
	When User switches to '1' tab
	When User creates new Customer on Sales portal via Api
		| Name            | Type       |
		| <customerName2> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName    | Seats | ProductId      | EndDate |
		| <customerName2> | 3     | MMSUBSCRIPTION | D(1)    |
	#Admin portal
	When User is logged in to '<customerName2>' customer on Admin portal via Api
	When admin '<customerName2>' accepts BULA terms via API
	When User refresh page
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks clipboard copy button in 'License Key' column
	Then 'Copied.' text message is displayed in toast container
	Then value is copied to the clipboard
	#MM app
	When User switches to '0' tab
	When User switches to iframe
	When User pastes copied key into 'license_key' field
	When User switches to iframe
	When User clicks 'Submit' button
	When User switches to '0' tab
	Then User sees 'Success!' header on Right Side panel
	Then User sees 'Your license key was successfully added to your account.' subheader on Right Side panel
	When User clicks 'Continue' button
	Then file manager header page is displayed to User
	When User switches to '1' tab
	When User refresh page
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                    |
		| Version          | MindManager Subscription |
		| Expires          | D(1)                     |
		| Seats Used/Total | 1/3                      |

Examples:
	| customerName        | emailAddress                               | password   | customerName2           |
	| Automation_testSRND | auto.test+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | AutomationTest_testSRND |