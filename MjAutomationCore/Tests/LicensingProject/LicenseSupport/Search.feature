@retry(2)
Feature: Search
Check Search functionality of License support

@Licensing @LisenseSupport @QA @Staging @Qase[LICENSE-126] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @Upd_Qase
Scenario: User_search
	Given User account
		| Email          | Password   |
		| <emailAddress> | 6j9k2!SRND |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type     |
		| <customerName> | standard |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 1     | MMSUBSCRIPTION | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	Then 'User Search' search option is selected on Action panel
	When User enters 'automation' value in the 'search-input' field on Action panel
	When User waits for data loading
	When User selects '40' value from 'Rows per page:' menu in Pagination section
	When User waits for data loading
	When User clicks 'button-next' button in Pagination section
	When User waits for data loading
	Then '2' value is displayed in 'number' page number field in Pagination section
	When User clicks 'button-prev' button in Pagination section
	When User waits for data loading
	Then '1' value is displayed in 'number' page number field in Pagination section
	When User enters '<emailAddress>' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'license-support-user-search-result' table:
		| ColumnName     | Value                 |
		| User           | <emailAddress>        |
		| Name           | Automation Automation |
		| Products       | 1                     |
		| Email Verified | Yes                   |
		| Last Active    | D(0)                  |
	When User find '<emailAddress>' value in 'User' column of 'license-support-user-search-result' table and clicks 'Details' button
	Then Rows with following values is displayed in 'license-support-user-details-subscriptions' table:
		| ColumnName     | Value                    |
		| Product        | MindManager Subscription |
		| License Status | Active                   |
		| Expires        | D(2)                     |
		| Owner          | <customerName>           |
		| User Status    | Active                   |
		| Device         | N/A                      |
	When User clicks 'Back' button
	Then Rows with following values is displayed in 'license-support-user-search-result' table:
		| ColumnName     | Value                 |
		| User           | <emailAddress>        |
		| Name           | Automation Automation |
		| Products       | 1                     |
		| Email Verified | Yes                   |
		| Last Active    | D(0)                  |
	When User clicks 'Back' button
	Then User sees 'License Support' page header

Examples:
	| customerName        | emailAddress                                 |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com |

@Licensing @LisenseSupport @QA @Qase[LICENSE-127] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @Upd_Qase
Scenario: Check_the_Customer_search_process_on_License_support_Home_page
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	When User waits for data loading
	When User selects 'Customer Search' search option on Action panel
	Then 'Customer Search' search option is selected on Action panel
	When User enters '<customerName>' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'license-support-tenant-search-result' table:
		| ColumnName    | Value          |
		| Customer      | <customerName> |
		| Type          | enterprise     |
		| Created       | D(0)           |
		| SSO Status    | Eligibility    |
		| BULA Accepted | No             |
		| Date Accepted |                |
		| Who Accepted  |                |
	When User clicks 'Back' button
	Then 'license-support-tenant-search-result' table is not displayed to User
	Then 'Customer Search' search option is selected on Action panel
	When User enters Сustomer ID '<customerName>' in 'search-input' field on Action panel
	Then Rows with following values is displayed in 'license-support-tenant-search-result' table:
		| ColumnName    | Value          |
		| Customer      | <customerName> |
		| Type          | enterprise     |
		| Created       | D(0)           |
		| SSO Status    | Eligibility    |
		| BULA Accepted | No             |
		| Date Accepted |                |
		| Who Accepted  |                |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @LisenseSupport @QA @Staging @Qase[LICENSE-129] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @Upd_Qase
Scenario: Check_the_Purchase_search_process_on_License_support_Home_page
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 5     | MMSUBSCRIPTION | D(10)   |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 10    | COEDIT    | D(20)   |
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	When User waits for data loading
	When User selects 'Purchases' search option on Action panel
	Then 'Purchases' search option is selected on Action panel
	When User enters '<customerName>' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'license-support-purchase-search-result' table:
		| ColumnName       | Value1                   | Value2         |
		| Product          | MindManager Subscription | Co-editing     |
		| Type             | enterprise               | enterprise     |
		| Expiration Date  | D(10)                    | D(20)          |
		| Seats Used/Total | 0/5                      | 0/10           |
		| Owner            | <customerName>           | <customerName> |
	When User clicks 'Back' button
	Then 'license-support-purchase-search-result' table is not displayed to User
	Then User sees 'License Support' page header

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @LisenseSupport @QA @Qase[LICENSE-130] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @Upd_Qase
Scenario: Search_special_symbols_Support_Portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 5     | COEDIT    | D(10)   |
	Given User account
		| Email          | Password   |
		| <emailAddress> | 6j9k2!SRND |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	#
	When User redirect by reglink for '<customerName>' customer
	When User provides the Login and Password of Customer Admin Portal and clicks on the Sign In button
	When User close 'bula-dialog' dialog
	Then User sees '<customerName> Admin Home' page header
	When User find 'Co-editing' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters '<emailAddress>' value in the 'email' field in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	#
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	Then 'User Search' search option is selected on Action panel
	When User enters '<emailAddress>' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'license-support-user-search-result' table:
		| ColumnName     | Value                                        |
		| User           | auto.test_1+SRND@mindmanager.onmicrosoft.com |
		| Name           | Automation Automation                        |
		| Products       | 1                                            |
		| Email Verified | Yes                                          |
		| Last Active    | D(0)                                         |
	When User clicks 'Back' button
	Then 'license-support-user-search-result' table is not displayed to User
	When User selects 'Customer Search' search option on Action panel
	When User enters '<customerName>' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'license-support-tenant-search-result' table:
		| ColumnName    | Value          |
		| Customer      | <customerName> |
		| Type          | enterprise     |
		| Created       | D(0)           |
		| SSO Status    | Eligibility    |
		| BULA Accepted | No             |
		| Date Accepted |                |
		| Who Accepted  |                |
	When User clicks 'Back' button
	Then 'license-support-tenant-search-result' table is not displayed to User
	When User selects 'Purchases' search option on Action panel
	When User enters '<customerName>' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'license-support-purchase-search-result' table:
		| ColumnName       | Value          |
		| Product          | Co-editing     |
		| Type             | enterprise     |
		| Expiration Date  | D(10)          |
		| Seats Used/Total | 1/5            |
		| Owner            | <customerName> |
	When User clicks 'Back' button
	Then 'license-support-purchase-search-result' table is not displayed to User

Examples:
	| customerName    | emailAddress                                 |
	| Automation*test | auto.test_1+SRND@mindmanager.onmicrosoft.com |
	| Automation!test | auto.test_1+SRND@mindmanager.onmicrosoft.com |
	| Automation.test | auto.test_1+SRND@mindmanager.onmicrosoft.com |
	| Automation-test | auto.test_1+SRND@mindmanager.onmicrosoft.com |

@Licensing @LisenseSupport @QA @Qase[LICENSE-131] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @Upd_Qase
Scenario: Search_capital_letters 
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 5     | COEDIT    | D(10)   |
	Given User account
		| Email          | Password   |
		| <emailAddress> | 6j9k2!SRND |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	#
	When User redirect by reglink for '<customerName>' customer
	When User provides the Login and Password of Customer Admin Portal and clicks on the Sign In button
	When User close 'bula-dialog' dialog
	Then User sees '<customerName> Admin Home' page header
	When User find 'Co-editing' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters '<emailAddress>' value in the 'email' field in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	#
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	Then 'User Search' search option is selected on Action panel
	When User enters '<emailAddress>' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'license-support-user-search-result' table:
		| ColumnName     | Value                                        |
		| User           | auto.test_1+SRND@mindmanager.onmicrosoft.com |
		| Name           | Automation Automation                        |
		| Products       | 1                                            |
		| Email Verified | Yes                                          |
		| Last Active    | D(0)                                         |
	When User clicks 'Back' button
	Then 'license-support-user-search-result' table is not displayed to User
	When User selects 'Customer Search' search option on Action panel
	When User enters '<customerName>' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'license-support-tenant-search-result' table:
		| ColumnName    | Value          |
		| Customer      | <customerName> |
		| Type          | enterprise     |
		| Created       | D(0)           |
		| SSO Status    | Eligibility    |
		| BULA Accepted | No             |
		| Date Accepted |                |
		| Who Accepted  |                |
	When User clicks 'Back' button
	Then 'license-support-tenant-search-result' table is not displayed to User
	When User selects 'Purchases' search option on Action panel
	When User enters '<customerName>' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'license-support-purchase-search-result' table:
		| ColumnName       | Value          |
		| Product          | Co-editing     |
		| Type             | enterprise     |
		| Expiration Date  | D(10)          |
		| Seats Used/Total | 1/5            |
		| Owner            | <customerName> |
	When User clicks 'Back' button
	Then 'license-support-purchase-search-result' table is not displayed to User

Examples:
	| customerName    | emailAddress                                 |
	| Automation test | auto.test_1+SRND@mindmanager.onmicrosoft.com |
	| AUTOMATION TEST | auto.test_1+SRND@mindmanager.onmicrosoft.com |