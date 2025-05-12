@retry(2)
Feature: Purchases
To verify that purchase adding, editing, deletion  in Sales portal also affects Customer admin home page

@Licensing @CustomerAdminPortal @Purchases @QA @Staging @Qase[LICENSE-313] @Cleanup @Upd_Qase
Scenario: Add_purchases
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 1     | COEDIT    | D(1)    |
	Then following information about 'COEDIT' purchase for customer '<customerName>' is displayed in Sales portal via Api
		| UsedSeats | Seats | EndDateIso |
		| 0         | 1     | D(1)       |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	Then Rows with following values is displayed in 'admin-home-purchases' table:
		| ColumnName       | Value      |
		| Product          | Co-editing |
		| License Status   | Active     |
		| Expires          | D(1)       |
		| Seats Used/Total | 0/1        |

Examples:
	| customerName        |
	| Automation_testSRND |

#Test case deprecated
@Licensing @CustomerAdminPortal @Purchases @QA @Staging @Qase[LICENSE-314] @Cleanup @Not_Run
Scenario: Edit_purchases
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 1     | COEDIT    | D(1)    |
	Then following information about 'COEDIT' purchase for customer '<customerName>' is displayed in Sales portal via Api
		| UsedSeats | Seats | EndDateIso |
		| 0         | 1     | D(1)       |
	#Admin portal
	When User redirect by reglink for '<customerName>' customer
	When User provides the Login and Password of Customer Admin Portal and clicks on the Sign In button
	Then Rows with following values is displayed in 'admin-home-purchases' table:
		| ColumnName       | Value      |
		| Product          | Co-editing |
		| License Status   | Active     |
		| Expires          | D(1)       |
		| Seats Used/Total | 0/1        |
	#Sales portal
	When User updates 'COEDIT' purchase data for '<customerName>' customer in Sales portal via Api
		| Seats | EndDate |
		| 5     | D(10)   |
	Then following information about 'COEDIT' purchase for customer '<customerName>' is displayed in Sales portal via Api
		| UsedSeats | Seats | EndDateIso |
		| 0         | 5     | D(10)      |
	#Admin portal
	When User refresh page
	Then Rows with following values is displayed in 'admin-home-purchases' table:
		| ColumnName       | Value      |
		| Product          | Co-editing |
		| License Status   | Active     |
		| Expires          | D(10)      |
		| Seats Used/Total | 0/5        |

Examples:
	| customerName        |
	| Automation_testSRND |

#Test case deprecated
@Licensing @CustomerAdminPortal @Purchases @QA @Staging @Qase[LICENSE-315] @Cleanup @Not_Run
Scenario: Delete_purchases
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 1     | COEDIT    | D(1)    |
	Then following information about 'COEDIT' purchase for customer '<customerName>' is displayed in Sales portal via Api
		| UsedSeats | Seats | EndDateIso |
		| 0         | 1     | D(1)       |
	#Admin portal
	When User redirect by reglink for '<customerName>' customer
	When User provides the Login and Password of Customer Admin Portal and clicks on the Sign In button
	Then Rows with following values is displayed in 'admin-home-purchases' table:
		| ColumnName       | Value      |
		| Product          | Co-editing |
		| License Status   | Active     |
		| Expires          | D(1)       |
		| Seats Used/Total | 0/1        |
	#Sales portal
	When User remove 'COEDIT' Purchase for '<customerName>' Customer in Sales portal via Api
	Then 'COEDIT' purchase has not exist for '<customerName>' customer on Sales portal
	#Admin portal
	When User refresh page
	Then 'admin-home-purchases' table does not have values

Examples:
	| customerName        |
	| Automation_testSRND |