@retry(2)
Feature: AdminPortalForSupport

Background: Pre-condition
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name                | Type       |
		| Automation_testSRND | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName        | Seats | ProductId | EndDate |
		| Automation_testSRND | 2     | COEDIT    | D(2)    |
	#Admin portal
	When User is logged in to 'Automation_testSRND' customer on Admin portal via Api
	When admin 'Automation_testSRND' accepts BULA terms via API
	When User refresh page

@Licensing @CustomerAdminPortal @AdminPortalForSupport @QA @Staging @Qase[LICENSE-415] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @LC_Upd @Upd_Qase
Scenario: Check_the_UI_of_Admin_home_page_in_view_only_mode_for_support_person
	#Admin portal
	When User clicks 'Add Admin' button
	When User enters 'auto.test@auto.test' value in the 'email' field in 'add-admin' dialog
	When User clicks 'Submit' button in 'add-admin' dialog
	#Support portal
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	When User waits for data loading
	When User selects 'Customer Search' search option on Action panel
	When User enters '<customerName>' value in the 'search-input' field on Action panel
	When User find '<customerName>' value in 'Customer' column of 'license-support-tenant-search-result' table and clicks 'View Admin' button
	When User switches to '1' tab
	Then User sees '<customerName> Admin Home' page header
	Then '(read only)' mark is displayed on section header
	Then 'Add Admin' button is disabled in admin search panel
	Then 'Remove' button is disabled in 'auto.test.mm.lc@gmail.com' row of 'Administrator' column of 'admin-home-admins' table
	Then 'Remove' button is disabled in 'auto.test@auto.test (pending)' row of 'Administrator' column of 'admin-home-admins' table

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @AdminPortalForSupport @QA @Staging @Qase[LICENSE-416] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @LC_Upd
Scenario: Check_the_user_search_in_Admin_read_only_mode
	Given User account
		| Email          | Password   |
		| <emailAddress> | 6j9k2!SRND |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	#Admin portal
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId | Emails         |
		| add        | COEDIT     | <emailAddress> |
	#Support portal
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	When User waits for data loading
	When User selects 'Customer Search' search option on Action panel
	When User enters '<customerName>' value in the 'search-input' field on Action panel
	When User find '<customerName>' value in 'Customer' column of 'license-support-tenant-search-result' table and clicks 'View Admin' button
	When User switches to '1' tab
	Then User sees '<customerName> Admin Home' page header
	Then '(read only)' mark is displayed on section header
	When User enters '<emailAddress>' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'admin-user-search-result' table:
		| ColumnName | Value          |
		| User       | <emailAddress> |
		| Products   | 1              |
	When User find '<emailAddress>' value in 'User' column of 'admin-user-search-result' table and clicks 'Details' button
	Then User sees '<customerName> / User Search / <emailAddress>' page header
	Then '(read only)' mark is displayed on section header
	Then Rows with following values is displayed in 'admin-user-details-subscription' table:
		| ColumnName     | Value      |
		| Product        | Co-editing |
		| License Status | Active     |
		| Expires        | D(2)       |
		| User Status    | Active     |
	Then 'admin-user-details-subscription' table has not any dropdown menus

Examples:
	| customerName        | emailAddress                                 |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com |

@Licensing @CustomerAdminPortal @AdminPortalForSupport @QA @Staging @Qase[LICENSE-418] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @LC_Upd
Scenario: Check_the_user_settings_in_Admin_read_only_mode
	#Admin portal
	When User clicks 'Settings' button
	When User clicks 'OK' button in 'analytics-opt-in-dialog' dialog
	#Support portal
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	When User waits for data loading
	When User selects 'Customer Search' search option on Action panel
	When User enters '<customerName>' value in the 'search-input' field on Action panel
	When User find '<customerName>' value in 'Customer' column of 'license-support-tenant-search-result' table and clicks 'View Admin' button
	When User switches to '1' tab
	Then User sees '<customerName> Admin Home' page header
	Then '(read only)' mark is displayed on section header
	When User clicks 'Settings' button
	Then all checkboxes with label are disabled

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @AdminPortalForSupport @QA @Staging @Qase[LICENSE-419] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @LC_Upd
Scenario: Check_the_user_Administrate_menu_in_Admin_read_only_mode
	#Admin portal
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId | Emails         |
		| add        | COEDIT     | <emailAddress> |
	#Support portal
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	When User waits for data loading
	When User selects 'Customer Search' search option on Action panel
	When User enters '<customerName>' value in the 'search-input' field on Action panel
	When User find '<customerName>' value in 'Customer' column of 'license-support-tenant-search-result' table and clicks 'View Admin' button
	When User switches to '1' tab
	Then User sees '<customerName> Admin Home' page header
	Then '(read only)' mark is displayed on section header
	When User find 'Co-editing' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	Then 'Add / Manage Users' button is disabled in 'Co-editing' row of 'Version' column of 'admin-license-purchases' table
	Then 'Export' button is disabled in 'Co-editing' row of 'Version' column of 'admin-license-purchases' table
	Then 'Deploy' button is disabled in 'Co-editing' row of 'Version' column of 'admin-license-purchases' table
	Then 'admin-license-users' table has not any dropdown menus

Examples:
	| customerName        | emailAddress                                 |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com |