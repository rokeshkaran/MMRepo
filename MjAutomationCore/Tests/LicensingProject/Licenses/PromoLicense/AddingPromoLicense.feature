@retry(2)
Feature: AddingPromoLicense
Check Add Promo License functionality

Background: Pre-condition
	#Creating an account in the MM app
	When User creates new Customer on Sales portal via Api
		| Name                | Type       |
		| Automation_testSRND | enterprise |
	When User creates new Promo Purchase on Sales portal via Api
		| CustomerName        | ProductId      | PurchaseType | Seats | Duration | ProductLabel   | EndDate |
		| Automation_testSRND | MMSUBSCRIPTION | promo        | 5     | 1        | Promo_testSRND | D(1)    |

@Licensing @Promo_License @CreatePromo @QA @Staging @Qase[LICENSE-265] @LC_Upd @Cleanup
Scenario: Verify_that_it_is_possible_to_apply_Promo_license_if_Redemption_date_is_not_yet_expired
	#Admin portal
	When User is logged in to 'Automation_testSRND' customer on Admin portal via Api
	When admin 'Automation_testSRND' accepts BULA terms via API
	When User refresh page
	When User find 'Promo_testSRND' value in 'Product' column of 'admin-home-purchases' table and clicks clipboard copy button in 'License Key' column
	Then 'Copied.' text message is displayed in toast container
	Then value is copied to the clipboard
	#Creating an account in the MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | 6j9k2!SRND |
	Given User account user metadata
		| FirstName      | LastName       | AcceptedTerms |
		| <customerName> | <customerName> | true          |
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
	| emailAddress                         | customerName        |
	| user.SRND@mindmanager.auto.tests.com | Automation_testSRND |
	 
@Licensing @Promo_License @CreatePromo @QA @Staging @Qase[LICENSE-266] @LC_Upd @Cleanup
Scenario: Verify_that_it_is_possible_to_apply_Promo_license_if_Redemption_date_is_expired
	#Admin portal
	When User is logged in to 'Automation_testSRND' customer on Admin portal via Api
	When admin 'Automation_testSRND' accepts BULA terms via API
	When User refresh page
	When User find 'Promo_testSRND' value in 'Product' column of 'admin-home-purchases' table and clicks clipboard copy button in 'License Key' column
	Then 'Copied.' text message is displayed in toast container
	Then value is copied to the clipboard
	When User updates 'MMSUBSCRIPTION' purchase data for 'Automation_testSRND' customer in Sales portal via Api
		| EndDate |
		| D(-1)   |
	#Creating an account in the MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | 6j9k2!SRND |
	Given User account user metadata
		| FirstName      | LastName       | AcceptedTerms |
		| <customerName> | <customerName> | true          |
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
	Then User sees 'Your MindManager Subscription has expired or been cancelled.' header on Right Side panel
	Then User sees 'For help with this issue please contact your company's IT department.' subheader on Right Side panel

Examples:
	| emailAddress                         | customerName        |
	| user.SRND@mindmanager.auto.tests.com | Automation_testSRND |