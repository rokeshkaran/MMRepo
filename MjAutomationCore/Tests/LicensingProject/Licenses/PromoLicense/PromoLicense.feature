@retry(2)
Feature: PromoLicense
Check add promo license functionality

Background: Pre-condition
	Given User is on the Mindmanager Sales portal website
	Then Right Side panel is displayed
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button

@Licensing @Promo_License @CreatePromo @QA @Staging @Qase[LICENSE-241] @JIRA[MMCV-10397,MMCV-10518] @LC_Upd @Cleanup
Scenario: Verify_it_is_possible_to_delete_Promo_license_via_support
	#MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Promo Purchase on Sales portal via Api
		| CustomerName   | ProductId      | PurchaseType | Seats | Duration | ProductLabel   | EndDate |
		| <customerName> | MMSUBSCRIPTION | promo        | 5     | 5        | <ProductLabel> | D(20)   |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	When User find '<ProductLabel>' value in 'Product' column of 'admin-home-purchases' table and clicks clipboard copy button in 'License Key' column
	Then 'Copied.' text message is displayed in toast container
	Then value is copied to the clipboard
	#Support Portal
	When User open new tab in browser
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User selects 'Purchases' search option on Action panel
	When User enters '<customerName>' value in the 'search-input' field on Action panel
	When User find '<ProductLabel>' value in 'Product' column of 'license-support-purchase-search-result' table and clicks 'Edit' button
	Then 'license-purchase-dialog' dialog is displayed to User
	When User clicks 'Delete Purchase' button in 'license-purchase-dialog' dialog
	Then 'license-purchase-dialog-delete' dialog is displayed to User
	When User clicks 'Confirm Delete' button in 'license-purchase-dialog-delete' dialog
	Then text message 'No matches found.' is displayed in 'license-support-purchase-search-result' table
	Then 'MMSUBSCRIPTION' purchase has not exist for '<customerName>' customer on Sales portal
	#Admin portal
	When User open new tab in browser
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When User enters '<ProductLabel>' value in the 'search-input' field on Action panel
	Then 'license-support-purchase-search-result' table is not displayed to User
	#MM Application
	When User open new tab in browser
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	Then User sees 'You don't have a license to use this product.' header on Right Side panel
	Then User sees 'Good news! You're eligible for a free trial.' subheader on Right Side panel

Examples:
	| emailAddress                         | customerName        | ProductLabel   | password   |
	| user.SRND@mindmanager.auto.tests.com | Automation_testSRND | Promo_testSRND | 6j9k2!SRND |

@Licensing @Promo_License @CreatePromo @QA @Staging @Qase[LICENSE-242] @JIRA[MMCV-10397,MMCV-10518] @LC_Upd @Cleanup
Scenario: Verify_that_it_is_possible_to_discontinue_Promo_license
	#MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
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
	When User accepts Optanon cookies
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	When User find '<ProductLabel>' value in 'Product' column of 'admin-home-purchases' table and clicks clipboard copy button in 'License Key' column
	Then 'Copied.' text message is displayed in toast container
	Then value is copied to the clipboard
	#Support Portal
	When User open new tab in browser
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User selects 'Purchases' search option on Action panel
	When User enters '<customerName>' value in the 'search-input' field on Action panel
	When User find '<ProductLabel>' value in 'Product' column of 'license-support-purchase-search-result' table and clicks 'Edit' button
	Then 'license-purchase-dialog' dialog is displayed to User
	Then 'D(1)' value is displayed to the 'end_date' field of 'license-purchase-dialog' dialog
	When User enter 'D(-1)' value in the 'end_date' field of 'license-purchase-dialog' dialog
	When User clicks 'Submit' button in 'license-purchase-dialog' dialog
	#Sales portal
	Then following information about 'MMSUBSCRIPTION' purchase for customer '<customerName>' is displayed in Sales portal via Api
		| UsedSeats | Seats | EndDateIso |
		| 1         | 5     | D(-1)      |
	#MM Application active users 
	When User open new tab in browser
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	Then file manager header page is displayed to User
	#MM Application New users 
	When User open new tab in browser
	Given User account
		| Email           | Password   |
		| <emailAddress1> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Given User is logged into '<emailAddress1>' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	Then User sees 'You don't have a license to use this product.' header on Right Side panel
	When User clicks 'Enter License Key' button
	Then User sees 'Enter License Key.' header on Right Side panel
	Then User sees 'Unlock MindManager by entering the license key below:' subheader on Right Side panel
	When User switches to iframe
	When User pastes copied key into 'license_key' field
	When User clicks 'Submit' button
	Then User sees 'Success!' header on Right Side panel
	Then User sees 'Your license key was successfully added to your account.' subheader on Right Side panel
	When User clicks 'Continue' button
	Then User sees 'Your MindManager Subscription has expired or been cancelled.' header on Right Side panel
	Then User sees 'For help with this issue please contact your company's IT department.' subheader on Right Side panel

Examples:
	| emailAddress                         | customerName        | ProductLabel   | emailAddress1                         | password   |
	| user.SRND@mindmanager.auto.tests.com | Automation_testSRND | Promo_testSRND | user1.SRND@mindmanager.auto.tests.com | 6j9k2!SRND |