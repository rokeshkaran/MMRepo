@retry(2)
Feature: CustomerAdmin
Check that Users adding or deleting in Customer admin home page also affects Sales portal

#Test case deprecated
@Licensing @CustomerAdminPortal @CustomerAdmin @QA @Staging @Qase[LICENSE-316,LICENSE-317] @Cleanup @Not_Run
Scenario: Add_and_Delete_User
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 2     | COEDIT    | D(10)   |
	Then following information about 'COEDIT' purchase for customer '<customerName>' is displayed in Sales portal via Api
		| UsedSeats | Seats | EndDateIso |
		| 0         | 2     | D(10)      |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId | Emails         |
		| add        | COEDIT     | <emailAddress> |
	When User refresh page
	Then Rows with following values is displayed in 'admin-home-purchases' table:
		| ColumnName       | Value      |
		| Product          | Co-editing |
		| License Status   | Active     |
		| Expires          | D(10)      |
		| Seats Used/Total | 1/2        |
	#Sales portal
	Then following information about 'COEDIT' purchase for customer '<customerName>' is displayed in Sales portal via Api
		| UsedSeats | Seats | EndDateIso |
		| 1         | 2     | D(10)      |
	#Admin portal
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId | Emails         |
		| remove     | COEDIT     | <emailAddress> |
	When User refresh page
	Then Rows with following values is displayed in 'admin-home-purchases' table:
		| ColumnName       | Value      |
		| Product          | Co-editing |
		| License Status   | Active     |
		| Expires          | D(10)      |
		| Seats Used/Total | 0/2        |
	#Sales portal
	Then following information about 'COEDIT' purchase for customer '<customerName>' is displayed in Sales portal via Api
		| UsedSeats | Seats | EndDateIso |
		| 0         | 2     | D(10)      |

Examples:
	| customerName        | emailAddress                                 |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com |