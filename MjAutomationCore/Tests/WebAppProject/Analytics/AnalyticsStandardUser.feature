@retry(2)
Feature: AnalyticsStandardUser
	Verify analytics options turned on for Standard User	
Background: Pre-condition
	#Creating an account in the MM app
	Given User account
		| Email                                      | Password   |
		| auto.test+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created

@MindManager @Analytics @StandardUser @QA @App_QA @Staging @App_Staging @Qase[WEB-5] @Cleanup @Upd_Qase
Scenario: Verify_That_Conversion_Is_Tracked_For_Standard_User_Who_Adds_License
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type     |
		| <customerName> | standard |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 1     | MMTRIAL   | D(1)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId | Emails                                     |
		| add        | MMTRIAL    | auto.test+SRND@mindmanager.onmicrosoft.com |
	#MM app
	Given User is logged into 'auto.test+SRND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api
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
		| Name            | Type     |
		| <customerName2> | standard |
	When User creates new Purchase on Sales portal via Api
		| CustomerName    | Seats | ProductId      | EndDate |
		| <customerName2> | 1     | MMSUBSCRIPTION | D(1)    |
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
	When User clicks 'Submit' button
	Then User sees 'Success!' header on Right Side panel
	Then User sees 'Your license key was successfully added to your account.' subheader on Right Side panel
	When User clicks 'Continue' button
	#Wait for page load before dialog box is visible
	When User waits '3000' miliseconds
	When User switches to iframe
	Then 'analytics-opt-in-dialog' dialog is displayed to User
	When User clicks '×' button in 'analytics-opt-in-dialog' dialog
	When User switches to default content
	Then file manager header page is displayed to User
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	When User switches to iframe
	Then header 'Account Details' is displayed on page
	Then 'Settings' section is displayed on Account Details page
	Then checkbox 'Help make MindManager better' is unchecked in 'Settings' section on Account Details page
	
Examples:
	| customerName        | customerName2        |
	| Automation_testSRND | Automation1_testSRND |

@MindManager @Analytics @StandardUser @QA @App_QA @Staging @App_Staging @Qase[WEB-7] @Cleanup @Upd_Qase
Scenario: To_Verify_That_The_User_Can_Opt_in_For_Analytics
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
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails                                     |
		| add        | MMSUBSCRIPTION | auto.test+SRND@mindmanager.onmicrosoft.com |
	#MM app
	Given User is logged into 'auto.test+SRND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api
	#Wait for page load before dialog box is visible
	When User waits '3000' miliseconds
	When User switches to iframe
	Then 'analytics-opt-in-dialog' dialog is displayed to User
	When User clicks '×' button in 'analytics-opt-in-dialog' dialog
	When User switches to default content
	Then file manager header page is displayed to User
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	When User switches to iframe
	Then header 'Account Details' is displayed on page
	Then 'Settings' section is displayed on Account Details page
	Then checkbox 'Help make MindManager better' is unchecked in 'Settings' section on Account Details page
	When User open new tab in browser
	Given User is logged into 'auto.test+SRND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	When User switches to iframe
	Then header 'Account Details' is displayed on page
	Then 'Settings' section is displayed on Account Details page
	When User checks checkbox by label 'Help make MindManager better'
	Then checkbox 'Help make MindManager better' is checked in 'Settings' section on Account Details page

Examples:
	| customerName        |
	| Automation_testSRND |

@MindManager @Analytics @StandardUser @QA @App_QA @Staging @App_Staging @Qase[WEB-8] @Cleanup @Upd_Qase
Scenario: To_Verify_That_The_User_Can_Opt_Out_For_Analytics
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
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails                                     |
		| add        | MMSUBSCRIPTION | auto.test+SRND@mindmanager.onmicrosoft.com |
    #MM app
	Given User is logged into 'auto.test+SRND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api
	#Wait for page load before dialog box is visible
	When User waits '3000' miliseconds
	When User switches to iframe
	Then 'analytics-opt-in-dialog' dialog is displayed to User
	When User clicks 'OK' button in 'analytics-opt-in-dialog' dialog
	Then 'analytics-opt-in-dialog' dialog is not displayed to User
	When User switches to default content
	Then file manager header page is displayed to User
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	When User switches to iframe
	Then header 'Account Details' is displayed on page
	Then 'Settings' section is displayed on Account Details page
	Then checkbox 'Help make MindManager better' is checked in 'Settings' section on Account Details page
	When User open new tab in browser
	Given User is logged into 'auto.test+SRND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	When User switches to iframe
	Then header 'Account Details' is displayed on page
	Then 'Settings' section is displayed on Account Details page
	When User unchecks checkbox by label 'Help make MindManager better'
	Then checkbox 'Help make MindManager better' is unchecked in 'Settings' section on Account Details page

Examples:
	| customerName        |
	| Automation_testSRND |