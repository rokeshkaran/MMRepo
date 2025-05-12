@retry(2)
Feature: UserDetails
Check User details functionality

@Licensing @CustomerAdminPortal @UserDetails @QA @Staging @Qase[LICENSE-8] @Cleanup @LC_Upd
Scenario: Check_that_it_is_possible_to_copy_the_License_key
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	And User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 1     | COEDIT    | D(5)    |
	#Admin portal
	And User is logged in to '<customerName>' customer on Admin portal via Api
	And admin '<customerName>' accepts BULA terms via API
	And User refresh page
	And User accepts Optanon cookies
	And User find 'Co-editing' value in 'Product' column of 'admin-home-purchases' table and clicks clipboard copy button in 'License Key' column
	Then 'Copied.' text message is displayed in toast container
	And value is copied to the clipboard

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @UserDetails @QA @Staging @Qase[LICENSE-9] @Cleanup @LC_Upd @JIRA[MMCV-9622]
Scenario: Check_the_Expiration_date_is_displayed
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	And User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId    | EndDate |
		| <customerName> | 1     | MSTEAMSEDIT  | D(5)    |
		| <customerName> | 1     | MMD-W21-M14  |         |
		| <customerName> | 1     | MMESSENTIALS | D(1)    |
	And User updates 'MMESSENTIALS' purchase data for '<customerName>' customer in Sales portal via Api
		| EndDate |
		| D(-2)   |
	#Admin portal
	And User is logged in to '<customerName>' customer on Admin portal via Api
	And admin '<customerName>' accepts BULA terms via API
	And User refresh page
	And User accepts Optanon cookies
	Then User sees '<customerName> Admin Home' page header
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId   | Emails         |
		| add        | MSTEAMSEDIT  | <emailAddress> |
		| add        | MMD-W21-M14  | <emailAddress> |
		| add        | MMESSENTIALS | <emailAddress> |
	And User enters '<emailAddress>' value in the 'search-input' field on Action panel
	And User presses the 'Enter' key on the keyboard
	And User find '<emailAddress>' value in 'User' column of 'admin-user-search-result' table and clicks 'Details' button
	Then Rows with following values is displayed in 'admin-user-details-subscription' table:
		| ColumnName     | Value1                | Value2                          | Value3                 |
		| Product        | MindManager Teams App | MindManager Windows 21 / Mac 14 | MindManager Essentials |
		| License Status | Active                | Perpetual                       | Expired                |
		| Expires        | D(5)                  | N/A                             | D(-2)                  |
		| User Status    | Active                | Active                          | Active                 |

Examples:
	| customerName        | emailAddress                                  |
	| Automation_testSRND | auto.test+227SRND@mindmanager.onmicrosoft.com |

@Licensing @CustomerAdminPortal @UserDetails @QA @Staging @Qase[LICENSE-10] @Cleanup @LC_Upd
Scenario: Check_the_possibility_to_change_User_status
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	And User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 1     | COEDIT    | D(5)    |
	#Admin portal
	And User is logged in to '<customerName>' customer on Admin portal via Api
	And admin '<customerName>' accepts BULA terms via API
	And User refresh page
	And User accepts Optanon cookies
	And '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId | Emails         |
		| add        | COEDIT     | <emailAddress> |
	And User find 'Co-editing' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value      |
		| Version          | Co-editing |
		| Expires          | D(5)       |
		| Seats Used/Total | 1/1        |
	And Rows with following values is displayed in 'admin-license-users' table:
		| ColumnName  | Value          |
		| User        | <emailAddress> |
		| User Status | Active         |
	When User find '<emailAddress>' value of 'User' column of 'admin-license-users' table and select 'Deactivated' value in 'User Status' column
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value      |
		| Version          | Co-editing |
		| Expires          | D(5)       |
		| Seats Used/Total | 0/1        |
	And Rows with following values is displayed in 'admin-license-users' table:
		| ColumnName  | Value          |
		| User        | <emailAddress> |
		| User Status | Deactivated    |
	And '<emailAddress>' row of 'User' column of 'admin-license-users' table has 'deactivated' status
	When User find '<emailAddress>' value of 'User' column of 'admin-license-users' table and select 'Remove' value in 'User Status' column
	Then 'admin-license-users' table does not have values

Examples:
	| customerName        | emailAddress                                  |
	| Automation_testSRND | auto.test+228SRND@mindmanager.onmicrosoft.com |