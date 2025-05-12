@retry(2)
Feature: ApplySubscriptions
Check apply subscriptions functionality

#Test case deprecated
@Licensing @ApplySubscriptions @Customers @QA @Staging @Qase[LICENSE-318] @Cleanup @Not_Run
Scenario: Apply_subscription_number_manually
	#Creating an account in the MM app
	Given User account
		| Email          | Password  |
		| <emailAddress> | 6j9k2!SRND |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name                 | Type       |
		| <firstCustomerName>  | enterprise |
		| <secondCustomerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName         | Seats | ProductId    | EndDate |
		| <firstCustomerName>  | 1     | MMESSENTIALS | D(1)    |
		| <secondCustomerName> | 1     | MMESSENTIALS | D(3)    |
	#Admin portal
	When User is logged in to '<firstCustomerName>' customer on Admin portal via Api
	When admin '<firstCustomerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When '<firstCustomerName>' Admin makes subscription action via API
		| ActionType | PurchaseId   | Emails         |
		| add        | MMESSENTIALS | <emailAddress> |
	#Sales portal
	When User updates 'MMESSENTIALS' purchase data for '<firstCustomerName>' customer in Sales portal via Api
		| EndDate |
		| D(-1)   |
	#Admin portal
	When User is logged in to '<secondCustomerName>' customer on Admin portal via Api
	When admin '<secondCustomerName>' accepts BULA terms via API
	When User refresh page
	When User find 'MindManager Essentials' value in 'Product' column of 'admin-home-purchases' table and clicks clipboard copy button in 'License Key' column
	Then 'Copied.' text message is displayed in toast container
	Then value is copied to the clipboard
	#MM app
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	Then User sees 'Your MindManager Subscription has expired or been cancelled.' header on Right Side panel
	Then User sees 'For help with this issue please contact your company's IT department.' subheader on Right Side panel
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

Examples:
	| emailAddress                                 | firstCustomerName          | secondCustomerName          |
	| auto.test_1+SRND@mindmanager.onmicrosoft.com | first_automation_test_SRND | second_automation_test_SRND |

#Test case deprecated
@Licensing @ApplySubscriptions @Customers @QA @Staging @Qase[LICENSE-320] @Cleanup @Not_Run
Scenario: Apply_subscription_during_account_creation
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId    | EndDate |
		| <customerName> | 1     | MMESSENTIALS | D(1)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId   | Emails         |
		| add        | MMESSENTIALS | <emailAddress> |
	#Creating an account in the MM app
	Given User account
		| Email          | Password  |
		| <emailAddress> | 6j9k2!SRND |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	When User waits for data loading
	Then file manager header page is displayed to User

Examples:
	| emailAddress                                 | customerName         |
	| auto.test_1+SRND@mindmanager.onmicrosoft.com | automation_test_SRND |

#Test case deprecated
@Licensing @ApplySubscriptions @Customers @QA @Staging @Qase[LICENSE-319] @Cleanup @Not_Run
Scenario: Apply_subscription_number_to_several_accounts
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name                 | Type     |
		| Automation_test_SRND | standard |
	When User creates new Purchase on Sales portal via Api
		| CustomerName         | Seats | ProductId    | EndDate |
		| Automation_test_SRND | 2     | MMESSENTIALS | D(1)    |
	#Admin portal
	When User is logged in to 'Automation_test_SRND' customer on Admin portal via Api
	When admin 'Automation_test_SRND' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User find 'MindManager Essentials' value in 'Product' column of 'admin-home-purchases' table and clicks clipboard copy button in 'License Key' column
	Then 'Copied.' text message is displayed in toast container
	Then value is copied to the clipboard
	#Creating an account in the MM app for first User
	Given User account
		| Email                                         | Password  |
		| auto.test_1+1SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	#Creating an account in the MM app for second User
	Given User account
		| Email                                         | Password  |
		| auto.test_1+2SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	#Creating an account in the MM app for third User
	Given User account
		| Email                                         | Password  |
		| auto.test_1+3SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	#
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'share' name in 'ToolbarPageElement' container
	When User clicks button with 'Copy Link' name in 'share' menu
	Then Invite others to edit link is copied to clipboard
	#First User
	When User openes 'chrome' browser
	When User switches to '1' browser
	When '1' User opens shared map link in browser
	Then Right Side panel is displayed
	When User clicks 'Web' button
	When User switches to '1' tab
	Then User sees 'Welcome' header on Right Side panel
	When User clicks 'Sign In' button
	When User enters 'auto.test_1+1SRND@mindmanager.onmicrosoft.com' in the 'email' field
	When User enters '6j9k2!SRND' in the 'password' field
	When User clicks 'Sign In' button
	When User clicks 'Something Else' button for use case options on Right Side panel
	Then User sees 'You don't have a license to use this product.' header on Right Side panel
	When User clicks 'Enter License Key' button
	Then User sees 'Enter License Key.' header on Right Side panel
	Then User sees 'Unlock MindManager by entering the license key below:' subheader on Right Side panel
	When User switches to iframe
	When User pastes copied key into 'license_key' field
	When User clicks 'Submit' button
	When User clicks 'Continue' button
	When User switches to default content
	When User login to SharePoint
	Then Web Editor page is displayed to the User
	#Second User
	When User openes 'chrome' browser
	When User switches to '2' browser
	When '2' User opens shared map link in browser
	Then Right Side panel is displayed
	When User clicks 'Web' button
	When User switches to '1' tab
	Then User sees 'Welcome' header on Right Side panel
	When User clicks 'Sign In' button
	When User enters 'auto.test_1+2SRND@mindmanager.onmicrosoft.com' in the 'email' field
	When User enters '6j9k2!SRND' in the 'password' field
	When User clicks 'Sign In' button
	When User clicks 'Something Else' button for use case options on Right Side panel
	Then User sees 'You don't have a license to use this product.' header on Right Side panel
	When User clicks 'Enter License Key' button
	Then User sees 'Enter License Key.' header on Right Side panel
	Then User sees 'Unlock MindManager by entering the license key below:' subheader on Right Side panel
	When User switches to iframe
	When User pastes copied key into 'license_key' field
	When User clicks 'Submit' button
	When User clicks 'Continue' button
	When User switches to default content
	When User login to SharePoint
	Then Web Editor page is displayed to the User
	#Third User
	When User openes 'chrome' browser
	When User switches to '3' browser
	When '3' User opens shared map link in browser
	Then Right Side panel is displayed
	When User clicks 'Web' button
	When User switches to '1' tab
	Then User sees 'Welcome' header on Right Side panel
	When User clicks 'Sign In' button
	When User enters 'auto.test_1+3SRND@mindmanager.onmicrosoft.com' in the 'email' field
	When User enters '6j9k2!SRND' in the 'password' field
	When User clicks 'Sign In' button
	When User clicks 'Something Else' button for use case options on Right Side panel
	Then User sees 'You don't have a license to use this product.' header on Right Side panel
	When User clicks 'Enter License Key' button
	Then User sees 'Enter License Key.' header on Right Side panel
	Then User sees 'Unlock MindManager by entering the license key below:' subheader on Right Side panel
	When User switches to iframe
	When User pastes copied key into 'license_key' field
	When User clicks 'Submit' button
	Then User sees 'This license key has already been used the maximum number of times.' header on Right Side panel
	Then User sees 'Please contact your MindManager software administrator or purchase a new license or subscription to use MindManager.' subheader on Right Side panel