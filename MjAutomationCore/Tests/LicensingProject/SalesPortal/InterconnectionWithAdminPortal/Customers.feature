@retry(2)
Feature: Customers
Check that editing and deletion customer in Sales portal also affects Customer admin account

@Licensing @CustomerAdminPortal @Interconnection @Customers @QA @Staging @Qase[LICENSE-312] @Cleanup
Scenario: Delete_customer
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
	When User removes customer with '<customerName>' name on Sales portal via Api
	Then customer with '<customerName>' name has not exist on Sales portal
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	Then Right Side panel is displayed
	Then User sees 'There was an issue with your license that could not be determined at this time.' header on Right Side panel
	Then 'Retry' button is displayed

Examples:
	| customerName        |
	| Automation_testSRND |