@retry(2)
Feature: AdminPanel
Check Admin Panel functionality

@Licensing @Admin_Portal @AdminPanel @QA @Staging @Qase[LICENSE-1] @Cleanup @LC_Upd
Scenario: Check_it_multi_admin_can_choose_the_company_to_administer
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name             | Type       |
		| <firstСustomer>  | enterprise |
		| <secondСustomer> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName     | Seats | ProductId      | EndDate |
		| <firstСustomer>  | 5     | COEDIT         | D(2)    |
		| <secondСustomer> | 10    | MMSUBSCRIPTION | D(100)  |
	#Admin portal
	When User is logged in to '<firstСustomer>' customer on Admin portal via Api
	When admin '<firstСustomer>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	Then User sees '<firstСustomer> Admin Home' page header
	When User is logged in to '<secondСustomer>' customer on Admin portal via Api
	When admin '<secondСustomer>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	Then User sees '<secondСustomer> Admin Home' page header
	Given User is on Customer Admin Portal website
	When User provides the Login and Password of Customer Admin Portal and clicks on the Sign In button
	Then User sees 'Customer Admin Portal' page header
	Then Rows with following values is displayed in 'admin-choose-tenants' table:
		| ColumnName | Value1          | Value2           |
		| Customer   | <firstСustomer> | <secondСustomer> |
	When User accepts Optanon cookies
	When User find '<secondСustomer>' value in 'Customer' column of 'admin-choose-tenants' table and clicks 'Administrate' button
	When User close 'analytics-opt-in-dialog' dialog
	Then User sees '<secondСustomer> Admin Home' page header
	Then Rows with following values is displayed in 'admin-home-purchases' table:
		| ColumnName       | Value                    |
		| Product          | MindManager Subscription |
		| License Status   | Active                   |
		| Expires          | D(100)                   |
		| Seats Used/Total | 0/10                     |
	Then Rows with following values is displayed in 'admin-home-admins' table:
		| ColumnName    | Value          |
		| Administrator | <emailAddress> |
	When User clicks 'Back' button
	Then User sees 'Customer Admin Portal' page header
	Then Rows with following values is displayed in 'admin-choose-tenants' table:
		| ColumnName | Value1          | Value2           |
		| Customer   | <firstСustomer> | <secondСustomer> |

Examples:
	| firstСustomer              | secondСustomer              | emailAddress              |
	| first_automation_test_SRND | second_automation_test_SRND | auto.test.mm.lc@gmail.com |

@Licensing @Admin_Portal @AdminPanel @QA @Staging @Qase[LICENSE-2] @Cleanup @LC_Upd
Scenario: Check_Setup_SSO_dialog
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId   | EndDate |
		| <customerName> | 50    | MMD-W21-M14 | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	Then User sees '<customerName> Admin Home' page header
	When User clicks 'Setup SSO' button
	Then User sees '<customerName> Admin Home / Setup SSO' page header

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @Admin_Portal @AdminPanel @QA @Staging @Qase[LICENSE-3] @Cleanup @LC_Upd
Scenario: Check_adding_and_removing_admin
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User clicks 'Add Admin' button
	Then 'add-admin' dialog is displayed to User
	Then 'Add Administrator' header is displayed in 'add-admin' dialog
	Then 'Add an administrator to your account by entering their details below:' subheader is displayed in 'add-admin' dialog
	When User enters '<emailAddress>' value in the 'email' field in 'add-admin' dialog
	When User clicks 'Submit' button in 'add-admin' dialog
	Then notification message with text 'Success. Self-registration email sent to <emailAddress>.' is displayed to User
	Then '<emailAddress> (pending)' value is displayed in the 'Administrator' column of 'admin-home-admins' table
	When User find '<emailAddress> (pending)' value in 'Administrator' column of 'admin-home-admins' table and clicks 'Remove' button
	Then '<emailAddress> (pending)' value is not displayed in the 'Administrator' column of 'admin-home-admins' table

Examples:
	| customerName        | emailAddress                                 |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com |

@Licensing @Admin_Portal @AdminPanel @QA @Staging @Qase[LICENSE-3] @Cleanup @LC_Upd
Scenario: Check_that_administrator_can_be_removed
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User clicks 'Add Admin' button
	When User enters '<emailAddress>' value in the 'email' field in 'add-admin' dialog
	When User clicks 'Submit' button in 'add-admin' dialog
	When User find '<emailAddress> (pending)' value in 'Administrator' column of 'admin-home-admins' table and clicks 'Remove' button
	Then '<emailAddress> (pending)' value is not displayed in the 'Administrator' column of 'admin-home-admins' table
	Then 'auto.test.mm.lc@gmail.com' value is displayed in the 'Administrator' column of 'admin-home-admins' table

Examples:
	| customerName        | emailAddress                                 |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com |