@retry(2)
Feature: CoEditiing
Check admin settings interface

@Licensing @CustomerAdminPortal @Settings @CoEditing @QA @Staging @Qase[LICENSE-46] @Cleanup
Scenario: Verify_Improve_file_loading_performance_tooltip
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
	Then 'Improve File Loading Performance' checkbox is checked in section with 'Co-Editing' title
	When User hover over 'info' button on 'Improve File Loading Performance' label for 'Co-Editing' section
	Then Tooltip 'This setting controls whether files with co-editing enabled are temporarily cached on MindManager servers in order to reduce wait time when opening these files.When enabled, files are cached on MindManager servers for 30 days after being edited allowing MindManager to more quickly load the file, once the file has not been edited for 30 days, the file is purged from MindManager servers.When disabled, files are immediately purged from MindManager servers after being edited. This increases the amount of time it takes to load files with co-editing enabled. (Not recommended)' is displayed for 'info' button on 'Improve File Loading Performance' label for 'Co-Editing' section
	
Examples:
	| customerName        |
	| Automation_testSRND |