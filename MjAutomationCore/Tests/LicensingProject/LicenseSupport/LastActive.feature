@retry(2)
Feature: LastActive
Verify Last Sign In shown in Support portals shows date of last license check

@Licensing @LisenseSupport @LastActive @QA @Staging @Qase[LICENSE-149] @Cleanup @AccountCreationEmailCleanup @Upd_Qase @JIRA[MMCV-10397,MMCV-10518]
Scenario: Check that_the_valid_date_is_displayed_in_Last_Active_field_on_Support_portal_for_the_users_that_has_already_signed_in
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
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails                             |
		| add        | MMSUBSCRIPTION | <emailAddressUserSignedIn>         |
		| add        | MMSUBSCRIPTION | <emailAddressUserLoggedInLongTime> |
	#Support portal
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	Then 'User Search' search option is selected on Action panel
	When User enters '<emailAddressUserSignedIn>' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'license-support-user-search-result' table:
		| ColumnName     | Value                      |
		| User           | <emailAddressUserSignedIn> |
		| Name           | Automation Automation      |
		| Products       | 1                          |
		| Email Verified | Yes                        |
		| Last Active    | D(0)                       |
	When User enters '<emailAddressUserLoggedInLongTime>' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'license-support-user-search-result' table:
		| ColumnName     | Value                              |
		| User           | <emailAddressUserLoggedInLongTime> |
		| Name           | Automation Automation              |
		| Products       | 1                                  |
		| Email Verified | Yes                                |
		| Last Active    | 03/25/2024                         |

Examples:
	| customerName        | emailAddressUserSignedIn                     | emailAddressUserLoggedInLongTime                 |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com | auto.test_1+11abfghi@mindmanager.onmicrosoft.com |

@Licensing @LisenseSupport @LastActive @QA @Staging @Qase[LICENSE-150] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @Upd_Qase
Scenario: Check_that_NA_is_displayed_for_the_user_that_did_never_sign_in_to_their_account_in_Last_Active_column_on_Support_portal
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 5     | MMSUBSCRIPTION | D(1)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails                          |
		| add        | MMSUBSCRIPTION | <emailAddressUserNeverSignedIn> |
	#Support portal
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	Then 'User Search' search option is selected on Action panel
	When User enters '<emailAddressUserNeverSignedIn>' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'license-support-user-search-result' table:
		| ColumnName     | Value                           |
		| User           | <emailAddressUserNeverSignedIn> |
		| Name           | N/A                             |
		| Products       | 1                               |
		| Email Verified | N/A                             |
		| Last Active    | N/A                             |

Examples:
	| customerName        | emailAddressUserNeverSignedIn                |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com |