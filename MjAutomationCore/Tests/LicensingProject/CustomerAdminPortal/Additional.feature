@retry(2)
Feature: Additional
Сheck that it is possible to transfer the license to another tenant

@Licensing @CustomerAdminPortal @AddAppend @QA @Staging @Qase[LICENSE-105] @Cleanup @Upd_Qase
Scenario: Transfer_licenses_to_another_tenant
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
		| Name             | Type       |
		| <firstСustomer>  | enterprise |
		| <secondСustomer> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName    | Seats | ProductId      | EndDate |
		| <firstСustomer> | 1     | MMSUBSCRIPTION | D(1)    |
	#Admin portal
	When User is logged in to '<firstСustomer>' customer on Admin portal via Api
	When admin '<firstСustomer>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When '<firstСustomer>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	#
	When '<firstСustomer>' Customer transfers 'MMSUBSCRIPTION' purchases to '<secondСustomer>' Сustomer via Api
	Then 'MMSUBSCRIPTION' purchase has not exist for '<firstСustomer>' customer on Sales portal
	Then 'MMSUBSCRIPTION' purchase has exist for '<secondСustomer>' customer on Sales portal
	When User is logged in to '<secondСustomer>' customer on Admin portal via Api
	When admin '<firstСustomer>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	Then User sees '<secondСustomer> Admin Home' page header
	Then Rows with following values is displayed in 'admin-home-purchases' table:
		| ColumnName       | Value                    |
		| Product          | MindManager Subscription |
		| License Status   | Active                   |
		| Expires          | D(1)                     |
		| Seats Used/Total | 1/1                      |
	#MM app
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	When User waits for data loading
	Then file manager header page is displayed to User

Examples:
	| firstСustomer        | secondСustomer        | emailAddress                                  | password   |
	| auto_test_first_SRND | auto_test_second_SRND | auto.test+254SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |