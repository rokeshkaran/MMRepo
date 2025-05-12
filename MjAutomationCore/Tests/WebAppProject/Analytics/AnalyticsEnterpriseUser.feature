@retry(2)
Feature: AnalyticsEnterpriseUser
Verify analytics options turned on for Enterprise User

@MindManager @Analytics @QA @App_QA @Staging @App_Staging @Qase[WEB-9] @Cleanup @Upd_Qase
Scenario: Verify_It_Is_Not_Possible_To_Opt_In_Out_From_Enterprise_User_Account
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
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Subscription' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters '<emailAddress>' value in the 'email' field in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	#MM app
	When User open new tab in browser
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	Then 'Settings' section is not displayed on Account Details page

Examples:
	| customerName        | emailAddress                                 | password   |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |

@MindManager @Analytics @QA @App_QA @Staging @App_Staging @Qase[WEB-10] @Cleanup @Upd_Qase
Scenario: Verify_OptIn_Is_Disabled_Enterprise_User_If_The_User_Added_The_Key_On_Their_Own
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
	Then 'analytics-opt-in-dialog' dialog is not displayed to User
	When User clicks 'Submit' button
	Then User sees 'Success!' header on Right Side panel
	Then User sees 'Your license key was successfully added to your account.' subheader on Right Side panel
	When User clicks 'Continue' button
	When User switches to default content
	Then file manager header page is displayed to User
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	Then 'Settings' section is not displayed on Account Details page

Examples:
	| customerName        | emailAddress                               | password   | customerName2           |
	| Automation_testSRND | auto.test+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | AutomationTest_testSRND |

@MindManager @Analytics @QA @App_QA @Staging @App_Staging @Qase[WEB-11] @Cleanup @Upd_Qase
Scenario: Verify_Conversion_Tracked_Enterprise_User_Who_Has_Their_License_Added_If_Admin_Disabled_GA_Tracking
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
	Then 'Settings' section is not displayed on Account Details page
	When User close Active tab
	#Open web page again
	When User openes 'chrome' browser
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	Then 'analytics-opt-in-dialog' dialog is not displayed to User

Examples:
	| customerName        | emailAddress                               | password   |
	| Automation_testSRND | auto.test+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |