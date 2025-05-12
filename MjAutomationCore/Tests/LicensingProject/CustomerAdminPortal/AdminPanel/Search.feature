@retry(2)
Feature: Search
Check Search functionality

@Licensing @CustomerAdminPortal @Search @QA @Staging @Qase[LICENSE-4] @Cleanup @JIRA[MMCV-5459] @Upd_Qase
Scenario: Check_the_search_process_on_Company_Admin_Home_page
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 100   | COEDIT    | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User find 'Co-editing' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User provides '100Emails.csv' file to 'Import CSV' file upload in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	When User clicks 'Back' button
	When User enters 'auto.test_1+62' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'admin-user-search-result' table:
		| ColumnName | Value1                                     |
		| User       | auto.test_1+62@mindmanager.onmicrosoft.com |
		| Products   | 1                                          |
	When User clicks 'Back' button
	When User find 'Co-editing' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	Then '20' rows are displayed in 'admin-license-users' table
	When User selects '40' value from 'Rows per page:' menu in Pagination section
	Then '40' rows are displayed in 'admin-license-users' table
	When User clicks 'Back' button
	When User enters '99' value in the 'search-input' field on Action panel
	When User find 'auto.test_1+99@mindmanager.onmicrosoft.com' value in 'User' column of 'admin-user-search-result' table and clicks 'Details' button
	Then User sees '<customerName> / User Search / auto.test_1+99@mindmanager.onmicrosoft.com' page header
	Then Rows with following values is displayed in 'admin-user-details-subscriptions' table:
		| ColumnName     | Value      |
		| Product        | Co-editing |
		| License Status | Active     |
		| Expires        | D(2)       |
		| User Status    | Active     |
	When User clicks 'Back' button
	Then User sees '<customerName> Admin Home' page header
	#TODO add steps after fix bug https://mindjet.atlassian.net/browse/MMCV-5459
Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @Search @QA @Staging @Qase[LICENSE-5] @Cleanup @Upd_Qase
Scenario: Search_special_symbols
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 5     | MMSUBSCRIPTION | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails                                                                                                                                            |
		| add        | MMSUBSCRIPTION | auto.test+224SRND@mindmanager.onmicrosoft.com, u.s.e.r.te.s.t@mindmanager.onmicrosoft.com, a!u#t$%^&*o.ma-tion#!$%^*?@mindmanager.onmicrosoft.com |
	When User refresh page
	When User enters 'auto.test' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'admin-user-search-result' table:
		| ColumnName | Value                                         |
		| User       | auto.test+224SRND@mindmanager.onmicrosoft.com |
		| Products   | 1                                             |
	When User clicks 'Back' button
	When User enters 's.e.r.t' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'admin-user-search-result' table:
		| ColumnName | Value                                      |
		| User       | u.s.e.r.te.s.t@mindmanager.onmicrosoft.com |
		| Products   | 1                                          |
	When User clicks 'Back' button
	When User enters 'a!u#t$%^&*o.ma-tion#!$%^*?' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'admin-user-search-result' table:
		| ColumnName | Value                                                  |
		| User       | a!u#t$%^&*o.ma-tion#!$%^*?@mindmanager.onmicrosoft.com |
		| Products   | 1                                                      |
	When User clicks 'Back' button
	When User enters '!$%^*?' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'admin-user-search-result' table:
		| ColumnName | Value                                                  |
		| User       | a!u#t$%^&*o.ma-tion#!$%^*?@mindmanager.onmicrosoft.com |
		| Products   | 1                                                      |
	When User clicks 'Back' button
	When User enters '.o' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'admin-user-search-result' table:
		| ColumnName | Value1                                        | Value2                                     | Value3                                                 |
		| User       | auto.test+224SRND@mindmanager.onmicrosoft.com | u.s.e.r.te.s.t@mindmanager.onmicrosoft.com | a!u#t$%^&*o.ma-tion#!$%^*?@mindmanager.onmicrosoft.com |
		| Products   | 1                                             | 1                                          | 1                                                      |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @Search @QA @Staging @Qase[LICENSE-6] @Cleanup @Upd_Qase
Scenario: Check_that_capital_letters_can_be_searched
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 5     | COEDIT    | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId | Emails         |
		| add        | COEDIT     | <emailAddress> |
	When User enters 'Auto' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'admin-user-search-result' table:
		| ColumnName | Value1         |
		| User       | <emailAddress> |
		| Products   | 1              |
	When User clicks 'Back' button
	When User enters 'AUTO' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'admin-user-search-result' table:
		| ColumnName | Value1         |
		| User       | <emailAddress> |
		| Products   | 1              |
	When User clicks 'Back' button
	When User enters 'AutO' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'admin-user-search-result' table:
		| ColumnName | Value1         |
		| User       | <emailAddress> |
		| Products   | 1              |
	When User clicks 'Back' button
	When User enters 'TEST' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'admin-user-search-result' table:
		| ColumnName | Value1         |
		| User       | <emailAddress> |
		| Products   | 1              |

Examples:
	| customerName        | emailAddress                                  |
	| Automation_testSRND | auto.test+225SRND@mindmanager.onmicrosoft.com |

@Licensing @CustomerAdminPortal @Search @QA @Staging @Qase[LICENSE-7] @Cleanup @JIRA[MMCV-4921,MMCV-10055] @Upd_Qase
Scenario: Search_starts_from_space
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 2     | MMSUBSCRIPTION | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	When User refresh page
	When User enters ' auto' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'admin-user-search-result' table:
		| ColumnName | Value          |
		| User       | <emailAddress> |
		| Products   | 1              |
	When User clicks 'Back' button
	When User enters ' ' value in the 'search-input' field on Action panel
	#Admin portal
	Then Rows with following values is displayed in 'admin-home-purchases' table:
		| ColumnName       | Value                    |
		| Product          | MindManager Subscription |
		| License Status   | Active                   |
		| Expires          | D(2)                     |
		| Seats Used/Total | 1/2                      |
	Then 'admin-user-search-result' table is not displayed to User

Examples:
	| customerName        | emailAddress                                  |
	| Automation_testSRND | auto.test+226SRND@mindmanager.onmicrosoft.com |
