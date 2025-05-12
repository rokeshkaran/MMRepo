@retry(2)
Feature: ApplyMMSubscription
Check Replace functionality

@Licensing @Licenses @ApplySubscriptions @ApplyMMSubscription @QA @Qase[LICENSE-202] @Cleanup
Scenario: To_verify_that_it_is_possible_to_apply_MMsubscription_to_MM_account_that_is_not_created_yet
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
	#MM app
	When User open new tab in browser
	Given User is on the Mindmanager website
	Then Right Side panel is displayed
	When User clicks 'Create Account' button
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
	When User switches to '1' tab
	When User close Admin System Message for User '<emailAddress>' and Password '<password>' via API
	When User clicks 'Something Else' button for use case options on Right Side panel
	When User waits for data loading
	Then file manager header page is displayed to User
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	Then header 'Account Details' is displayed on page
	Then header 'My Products' is displayed on page
	Then product 'MindManager Subscription' is displayed with status 'Active' in 'My Products' section on Account Details page

Examples:
	| emailAddress                               | CustomerName         | password   |
	| auto.test+SRND@mindmanager.onmicrosoft.com | automation_test_SRND | 6j9k2!SRND |

@Licensing @Licenses @ApplySubscriptions @ApplyMMSubscription @QA @Qase[LICENSE-203] @Cleanup
Scenario: To_verify_that_it_is_possible_to_apply_MMsubscription_to_new_MM_account_without_any_subscription
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
	#MM app
	When User open new tab in browser
	Given User is on the Mindmanager website
	Then Right Side panel is displayed
	When User clicks 'Sign In' button
	When User enters '<emailAddress>' in the 'email' field
	When User enters '<password>' in the 'password' field
	When User clicks 'Sign In' button
	When User close Admin System Message for User '<emailAddress>' and Password '<password>' via API
	When User clicks 'Something Else' button for use case options on Right Side panel
	Then file manager header page is displayed to User
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	Then header 'Account Details' is displayed on page
	Then header 'My Products' is displayed on page
	Then product 'MindManager Subscription' is displayed with status 'Active' in 'My Products' section on Account Details page

Examples:
	| emailAddress                                 | CustomerName         | password   |
	| auto.test_1+SRND@mindmanager.onmicrosoft.com | automation_test_SRND | 6j9k2!SRND |

@Licensing @Licenses @ApplySubscriptions @ApplyMMSubscription @QA @Qase[LICENSE-204] @Cleanup
Scenario: To_verify_that_it_is_possible_to_apply_MMsubscription_to_account_with_MMtrial
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
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	Then 'Professional Free Trial: 0 days remaining' message is displayed at the bottom of Canvas
	When User clicks Logo image on Menu toolbar
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	Then header 'Account Details' is displayed on page
	Then subscription account details 'MindManager Trial' is displayed on page in 'My Products' section on Account Details page
	Then product 'MindManager Trial' is displayed with status 'Active' in 'My Products' section on Account Details page
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
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	Then 'Professional Free Trial: 0 days remaining' message is not displayed at the bottom of Canvas

Examples:
	| customerName        | emailAddress                               | password   | customerName2           |
	| Automation_testSRND | auto.test+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | AutomationTest_testSRND |

@Licensing @Licenses @ApplySubscriptions @ApplyMMSubscription @QA @Qase[LICENSE-205] @Cleanup
Scenario: To_verify_that_it_is_possible_to_apply_MMSubscription_to_the_account_with_an_expired_trial_subscription
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
		| Name                 | Type       |
		| <firstCustomerName>  | enterprise |
		| <secondCustomerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName         | Seats | ProductId      | EndDate |
		| <firstCustomerName>  | 3     | MMTRIAL        | D(1)    |
		| <secondCustomerName> | 1     | MMSUBSCRIPTION | D(3)    |
	#Admin portal
	When User is logged in to '<firstCustomerName>' customer on Admin portal via Api
	When admin '<firstCustomerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When '<firstCustomerName>' Admin makes subscription action via API
		| ActionType | PurchaseId | Emails         |
		| add        | MMTRIAL    | <emailAddress> |
	#Sales portal
	When User updates 'MMTRIAL' purchase data for '<firstCustomerName>' customer in Sales portal via Api
		| EndDate |
		| D(-1)   |
	#Admin portal
	When User is logged in to '<secondCustomerName>' customer on Admin portal via Api
	When admin '<secondCustomerName>' accepts BULA terms via API
	When User refresh page
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks clipboard copy button in 'License Key' column
	Then 'Copied.' text message is displayed in toast container
	Then value is copied to the clipboard
	#MM app
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	Then User sees 'Your MindManager Trial has expired.' header on Right Side panel
	Then User sees 'Please purchase to continue using MindManager.' subheader on Right Side panel
	When User clicks 'Enter New License Key' button
	Then User sees 'Enter License Key.' header on Right Side panel
	Then User sees 'Unlock MindManager by entering the license key below:' subheader on Right Side panel
	When User switches to iframe
	When User pastes copied key into 'license_key' field
	When User clicks 'Submit' button
	Then User sees 'Success!' header on Right Side panel
	Then User sees 'Your license key was successfully added to your account.' subheader on Right Side panel
	When User clicks 'Continue' button
	Then file manager header page is displayed to User
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	Then header 'Account Details' is displayed on page
	Then header 'My Products' is displayed on page
	Then product 'MindManager Subscription' is displayed with status 'Active' in 'My Products' section on Account Details page

Examples:
	| emailAddress                                 | firstCustomerName          | secondCustomerName          | password   |
	| auto.test_1+SRND@mindmanager.onmicrosoft.com | first_automation_test_SRND | second_automation_test_SRND | 6j9k2!SRND |

@Licensing @Licenses @ApplySubscriptions @ApplyMMSubscription @QA @Qase[LICENSE-206] @Cleanup
Scenario: To_verify_that_it_is_possible_to_apply_MMSubscription_to_the_account_with_an_expired_MMsubscription
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
		| Name                 | Type       |
		| <firstCustomerName>  | enterprise |
		| <secondCustomerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName         | Seats | ProductId      | EndDate |
		| <firstCustomerName>  | 3     | MMSUBSCRIPTION | D(1)    |
		| <secondCustomerName> | 1     | MMSUBSCRIPTION | D(3)    |
	#Admin portal
	When User is logged in to '<firstCustomerName>' customer on Admin portal via Api
	When admin '<firstCustomerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When '<firstCustomerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	#Sales portal
	When User updates 'MMSUBSCRIPTION' purchase data for '<firstCustomerName>' customer in Sales portal via Api
		| EndDate |
		| D(-1)   |
	#MM app
	When User open new tab in browser
	Given User is on the Mindmanager website
	Then Right Side panel is displayed
	When User clicks 'Sign In' button
	When User enters '<emailAddress>' in the 'email' field
	When User enters '<password>' in the 'password' field
	When User clicks 'Sign In' button
	When User clicks 'Something Else' button for use case options on Right Side panel
	Then User sees 'Your MindManager Subscription has expired or been cancelled.' header on Right Side panel
	Then User sees 'For help with this issue please contact your company's IT department.' subheader on Right Side panel
	#Admin portal
	When User switches to '0' tab
	When User is logged in to '<secondCustomerName>' customer on Admin portal via Api
	When admin '<secondCustomerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When '<secondCustomerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
   #MM app
	When User switches to '1' tab	
	When User close Admin System Message for User '<emailAddress>' and Password '<password>' via API
	When User refresh page
	Then file manager header page is displayed to User
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	Then header 'Account Details' is displayed on page
	Then header 'My Products' is displayed on page
	Then product 'MindManager Subscription' is displayed with status 'Active' in 'My Products' section on Account Details page

Examples:
	| emailAddress                                 | firstCustomerName          | secondCustomerName          | password   |
	| auto.test_1+SRND@mindmanager.onmicrosoft.com | first_automation_test_SRND | second_automation_test_SRND | 6j9k2!SRND |