@retry(2)
Feature: LastActive
Verification Last Sign In shown in Admin and Support portals shows date of last license check

@Licensing @CustomerAdminPortal @Administrate @LastActive @QA @Staging @Qase[LICENSE-14] @Cleanup @LC_Upd
Scenario: Verify_valid_date_is_displayed_in_Last_Active_field_for_users_already_signed_in
	#Creating an account in the MM app
	Given User account
		| Email                      | Password   |
		| <emailAddressUserSignedIn> | 6j9k2!SRND |
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
		| <customerName> | 5     | MMSUBSCRIPTION | D(1)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails                             |
		| add        | MMSUBSCRIPTION | <emailAddressUserSignedIn>         |
		| add        | MMSUBSCRIPTION | <emailAddressUserLoggedInLongTime> |
	When User refresh page
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	Then Rows with following values is displayed in 'admin-license-users' table:
		| ColumnName  | Value1                     | Value2                             |
		| User        | <emailAddressUserSignedIn> | <emailAddressUserLoggedInLongTime> |
		| User Status | Active                     | Active                             |
		| Last Active | D(0)                       | 03/25/2024                         |

Examples:
	| customerName        | emailAddressUserSignedIn                     | emailAddressUserLoggedInLongTime                 |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com | auto.test_1+11abfghi@mindmanager.onmicrosoft.com |

@Licensing @CustomerAdminPortal @Administrate @LastActive @QA @Staging @Qase[LICENSE-15] @Cleanup @LC_Upd
Scenario: Verify_NA_is_displayed_for_user_that_never_sign_in_to_their_account_in_last_active_column
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
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails                          |
		| add        | MMSUBSCRIPTION | <emailAddressUserNeverSignedIn> |
	When User refresh page
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	Then Rows with following values is displayed in 'admin-license-users' table:
		| ColumnName  | Value                           |
		| User        | <emailAddressUserNeverSignedIn> |
		| User Status | Active                          |
		| Last Active | N/A                             |

Examples:
	| customerName        | emailAddressUserNeverSignedIn                |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com |