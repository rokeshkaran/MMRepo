@retry(2)
Feature: CustomerManagementViaAPI
Verify the functionality to add a new customer;

@Licensing @API @Manage_Subscriptions @Salesportal @QA @Staging @Qase[LICENSE-296,LICENSE-297] @Cleanup @LC_Upd
Scenario Outline: Verify_adding_new_customers_via_API_on_Sales_Portal
When User creates new Customer on Sales portal via Api
		| Name           | Type           |
		| <customerName> | <customerType> |
	Then customer with '<customerName>' name has exist on Sales portal
	Then '<customerName>' Customer has '<customerType>' type in Sales portal via Api

	Examples:
	| customerName             | customerType |
	| 72354823762              | enterprise   |
	| $<#>":~*^%.\\@!)(>?-+= / | enterprise   |
	| automation test          | enterprise   |
	| AUTO.test                | enterprise   |
	| 72354823762              | standard     |
	| $<#>":~*^%.\\@!)(>?-+= / | standard     |
	| automation test          | standard     |
	| AUTO.test                | standard     |