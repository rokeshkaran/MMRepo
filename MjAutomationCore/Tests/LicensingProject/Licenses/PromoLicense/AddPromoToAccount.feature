@retry(2)
Feature: AddPromoToAccount
Check add promo account functionality

Background: Pre-condition
	When User creates new Customer on Sales portal via Api
		| Name                | Type       |
		| Automation_testSRND | enterprise |
	When User creates new Promo Purchase on Sales portal via Api
		| CustomerName        | ProductId      | PurchaseType | Seats | Duration | ProductLabel   | EndDate |
		| Automation_testSRND | MMSUBSCRIPTION | promo        | 5     | 1        | Promo_testSRND | D(10)   |
	#Admin portal
	When User is logged in to 'Automation_testSRND' customer on Admin portal via Api
	When admin 'Automation_testSRND' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User find 'Promo_testSRND' value in 'Product' column of 'admin-home-purchases' table and clicks clipboard copy button in 'License Key' column
	Then 'Copied.' text message is displayed in toast container
	Then value is copied to the clipboard

@Licensing @Promo_License @CreatePromo @QA @Staging @Qase[LICENSE-251] @LC_Upd @Cleanup
Scenario: Verify_User_is_eligible_to_apply_a_promo_license_key_if_user_has_never_previously_applied_a_promo_license
	#Creating an account in the MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | 6j9k2!SRND |
	Given User account user metadata
		| FirstName           | LastName            | AcceptedTerms |
		| Automation_testSRND | Automation_testSRND | true          |
	When User creates given user and confirms the account via Api
	#MM application
	When User open new tab in browser
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	When User clicks 'Enter License Key' button
	When User switches to iframe
	When User pastes copied key into 'license_key' field
	When User clicks 'Submit' button
	Then User sees 'Success!' header on Right Side panel
	Then User sees 'Your license key was successfully added to your account.' subheader on Right Side panel
	When User clicks 'Continue' button
	Then file manager header page is displayed to User

Examples:
	| emailAddress                         |
	| user.SRND@mindmanager.auto.tests.com |
	 
@Licensing @Promo_License @CreatePromo @QA @Staging @Qase[LICENSE-259] @LC_Upd @Cleanup
Scenario: Verify_it_is_impossible_to_apply_a_Promo_license_to_the_account_with_active_subscription_license
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
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	   #MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	#MM app
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	Then header 'Account Details' is displayed on page
	Then subscription account details 'MindManager Subscription' is displayed on page in 'My Products' section on Account Details page
	When User switches to iframe
	When User clicks 'Add Product' button on the page
	When User switches to iframe
	When User pastes copied key into 'license_key' field
	When User clicks 'Submit' button
	When User switches to iframe
	Then 'dialog-promo-not-eligible' dialog is displayed to User
	Then 'License could not be added' header is displayed in 'dialog-promo-not-eligible' dialog
	Then 'This promo could not be added to your account because you have already used a promo license or previously owned MindManager.' subheader is displayed in 'dialog-promo-not-eligible' dialog

Examples:
	| emailAddress                         | password   | customerName         |
	| user.SRND@mindmanager.auto.tests.com | 6j9k2!SRND | Automation1_testSRND |

@Licensing @Promo_License @CreatePromo @QA @Staging @Qase[LICENSE-260] @LC_Upd @Cleanup
Scenario: Verify_it_is_impossible_to_apply_a_Promo_license_to_the_account_with_expired_subscription_license
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
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	When User updates 'MMSUBSCRIPTION' purchase data for '<customerName>' customer in Sales portal via Api
		| EndDate |
		| D(-1)   |
	#MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	#MM app
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	Then User sees 'Your MindManager Subscription has expired or been cancelled.' header on Right Side panel
	Then User sees 'For help with this issue please contact your company's IT department.' subheader on Right Side panel
	Then Right Side panel is displayed
	When User clicks 'Enter New License Key' button
	When User switches to iframe
	When User pastes copied key into 'license_key' field
	When User clicks 'Submit' button
	When User switches to iframe
	Then 'dialog-promo-not-eligible' dialog is displayed to User
	Then 'License could not be added' header is displayed in 'dialog-promo-not-eligible' dialog
	Then 'This promo could not be added to your account because you have already used a promo license or previously owned MindManager.' subheader is displayed in 'dialog-promo-not-eligible' dialog

Examples:
	| emailAddress                         | password   | customerName         |
	| user.SRND@mindmanager.auto.tests.com | 6j9k2!SRND | Automation1_testSRND |

@Licensing @Promo_License @CreatePromo @QA @Staging @Qase[LICENSE-261] @LC_Upd @Cleanup
Scenario: Verify_it_is_impossible_to_apply_a_Promo_license_to_the_account_with_expired_essentials_license
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
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId   | Emails         |
		| add        | MMESSENTIALS | <emailAddress> |
	When User updates 'MMESSENTIALS' purchase data for '<customerName>' customer in Sales portal via Api
		| EndDate |
		| D(-1)   |
	#MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	#MM app
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	Then User sees 'Your MindManager Subscription has expired or been cancelled.' header on Right Side panel
	Then User sees 'For help with this issue please contact your company's IT department.' subheader on Right Side panel
	Then Right Side panel is displayed
	When User clicks 'Enter New License Key' button
	When User switches to iframe
	When User pastes copied key into 'license_key' field
	When User clicks 'Submit' button
	When User switches to iframe
	Then 'dialog-promo-not-eligible' dialog is displayed to User
	Then 'License could not be added' header is displayed in 'dialog-promo-not-eligible' dialog
	Then 'This promo could not be added to your account because you have already used a promo license or previously owned MindManager.' subheader is displayed in 'dialog-promo-not-eligible' dialog

Examples:
	| emailAddress                         | password   | customerName         |
	| user.SRND@mindmanager.auto.tests.com | 6j9k2!SRND | Automation1_testSRND |

@Licensing @Promo_License @CreatePromo @QA @Staging @Qase[LICENSE-262] @LC_Upd @Cleanup
Scenario: Verify_it_is_impossible_to_apply_a_Promo_license_to_the_account_with_active_essentials_license
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
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId   | Emails         |
		| add        | MMESSENTIALS | <emailAddress> |
	   #MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	#MM app
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	Then header 'Account Details' is displayed on page
	Then subscription account details 'MindManager Essentials' is displayed on page in 'My Products' section on Account Details page
	When User switches to iframe
	When User clicks 'Add Product' button on the page
	When User switches to iframe
	When User pastes copied key into 'license_key' field
	When User clicks 'Submit' button
	When User switches to iframe
	Then 'dialog-promo-not-eligible' dialog is displayed to User
	Then 'License could not be added' header is displayed in 'dialog-promo-not-eligible' dialog
	Then 'This promo could not be added to your account because you have already used a promo license or previously owned MindManager.' subheader is displayed in 'dialog-promo-not-eligible' dialog

Examples:
	| emailAddress                         | password   | customerName         |
	| user.SRND@mindmanager.auto.tests.com | 6j9k2!SRND | Automation1_testSRND |


@Licensing @Promo_License @CreatePromo @QA @Staging @Qase[LICENSE-263] @LC_Upd @Cleanup
Scenario: Verify_it_is_impossible_to_apply_a_Promo_license_to_the_account_with_active_promo_license
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Promo Purchase on Sales portal via Api
		| CustomerName   | ProductId      | PurchaseType | Seats | Duration | ProductLabel   | EndDate |
		| <customerName> | MMSUBSCRIPTION | promo        | 5     | 1        | <ProductLabel> | D(1)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
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
	When User open new tab in browser
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	Then header 'Account Details' is displayed on page
	Then subscription account details '<ProductLabel>' is displayed on page in 'My Products' section on Account Details page
	When User switches to iframe
	When User clicks 'Add Product' button on the page
	When User switches to iframe
	When User pastes copied key into 'license_key' field
	When User clicks 'Submit' button
	When User switches to iframe
	Then 'dialog-promo-not-eligible' dialog is displayed to User
	Then 'License could not be added' header is displayed in 'dialog-promo-not-eligible' dialog
	Then 'This promo could not be added to your account because you have already used a promo license or previously owned MindManager.' subheader is displayed in 'dialog-promo-not-eligible' dialog

Examples:
	| emailAddress                         | password   | customerName         | ProductLabel    |
	| user.SRND@mindmanager.auto.tests.com | 6j9k2!SRND | Automation1_testSRND | Promo1_testSRND |
