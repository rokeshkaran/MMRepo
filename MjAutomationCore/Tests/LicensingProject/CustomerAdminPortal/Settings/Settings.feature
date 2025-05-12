@retry(2)
Feature: Settings
Check admin settings interface

@Licensing @CustomerAdminPortal @Settings @QA @Staging @Qase[LICENSE-42] @Cleanup
Scenario: Settings_interface
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 2     | COEDIT    | D(2)    |
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User clicks 'Settings' button
	When User close 'analytics-opt-in-dialog' dialog
	Then User sees '<customerName> Settings' page header

Examples:
	| customerName        |
	| Automation_testSRND |