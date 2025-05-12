@retry(2)
Feature: AdminSelfRegistration
Simple calculator for adding two numbers

@Licensing @CustomerAdminPortal @AdminSelfRegistration @QA @Staging @Qase[LICENSE-93] @Cleanup @AccountCreationEmailCleanup
Scenario: Subsequent_admin_via_the_link_provided_in_License_Certificate
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 2     | MMSUBSCRIPTION | D(10)   |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	#MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | 6j9k2!SRND |
	Given User account user metadata
		| FirstName      | LastName       | AcceptedTerms |
		| <customerName> | <customerName> | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Admin portal
	When User redirect by reglink for '<customerName>' customer
	When User clicks 'Sign In' button
	When User enters '<emailAddress>' in the 'email' field
	When User enters '6j9k2!SRND' in the 'password' field
	When User clicks 'Sign In' button
	When User clicks 'Something Else' button for use case options on Right Side panel
	When User waits '2000' miliseconds
	Then User sees 'There was an issue with your license that could not be determined at this time.' header on Right Side panel

Examples:
	| customerName        | emailAddress                    |
	| Automation_testSRND | autotest.user.mm+SRND@gmail.com |

@Licensing @CustomerAdminPortal @AdminSelfRegistration @QA @Staging @Qase[LICENSE-94] @Cleanup @AccountCreationEmailCleanup
Scenario: Admin_sign_in_via_the_link
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 2     | MMSUBSCRIPTION | D(10)   |
	#MM app
	Given User account
		| Email          | Password  |
		| <emailAddress> | 6j9k2!SRND |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	#Admin portal
	When User redirect by reglink for '<customerName>' customer
	When User provides the Login and Password of Customer Admin Portal and clicks on the Sign In button
	Then User sees '<customerName> Admin Home' page header

Examples:
	| customerName        | emailAddress                    |
	| Automation_testSRND | autotest.user.mm+SRND@gmail.com |