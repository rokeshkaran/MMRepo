@retry(2)
Feature: Delete
Check Delete functionality

@Licensing @LisenseSupport @Delete @QA @Qase[LICENSE-139] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @Upd_Qase
Scenario: Check_that_Order_entry_specialist_OES_can_delete_tenant_QA
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	When User waits for data loading
	When User selects 'Customer Search' search option on Action panel
	When User enters '<customerName>' value in the 'search-input' field on Action panel
	When User find '<customerName>' value in 'Customer' column of 'license-support-tenant-search-result' table and clicks 'Edit' button
	Then 'license-tenant-dialog' dialog is displayed to User
	When User clicks 'Delete Tenant' button in 'license-tenant-dialog' dialog
	Then 'license-tenant-dialog-delete' dialog is displayed to User
	Then 'Confirm Customer (Tenant) Deletion' header is displayed in 'license-tenant-dialog-delete' dialog
	Then text 'Are you sure you want to delete the customer:<<customerName>> #<id>? They will no longer be able to access their admin portal, all of their purchases will also be deleted so anyone using their license(s) will no longer be able to use the associated MindManager products.' is displayed in 'license-tenant-dialog-delete' dialog for confirm deletion in support portal
	When User clicks 'Cancel' button in 'license-tenant-dialog-delete' dialog
	Then 'license-tenant-dialog-delete' dialog is not displayed to User
	Then Rows with following values is displayed in 'license-support-tenant-search-result' table:
		| ColumnName    | Value          |
		| Customer      | <customerName> |
		| Type          | enterprise     |
		| Created       | D(0)           |
		| SSO Status    | Eligibility    |
		| BULA Accepted | No             |
		| Date Accepted |                |
		| Who Accepted  |                |
	Then customer with '<customerName>' name has exist on Sales portal
	When User find '<customerName>' value in 'Customer' column of 'license-support-tenant-search-result' table and clicks 'Edit' button
	When User clicks 'Delete Tenant' button in 'license-tenant-dialog' dialog
	When User clicks 'Confirm Delete' button in 'license-tenant-dialog-delete' dialog
	Then 'license-tenant-dialog-delete' dialog is not displayed to User
	Then 'license-support-tenant-search-result' table does not have values
	Then text message 'No matches found.' is displayed in 'license-support-tenant-search-result' table
	Then customer with '<customerName>' name has not exist on Sales portal

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @LisenseSupport @Delete @Staging @Qase[LICENSE-139] @JIRA[MMCV-10518] @Cleanup @Upd_Qase
Scenario: Check_that_Order_entry_specialist_OES_can_delete_tenant_STG
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	When User accepts Optanon cookies
	When User selects 'Customer Search' search option on Action panel
	When User enters '<customerName>' value in the 'search-input' field on Action panel
	When User find '<customerName>' value in 'Customer' column of 'license-support-tenant-search-result' table and clicks 'Edit' button
	Then 'license-tenant-dialog' dialog is displayed to User
	When User clicks 'Delete Tenant' button in 'license-tenant-dialog' dialog
	Then 'license-tenant-dialog-delete' dialog is displayed to User
	Then 'Confirm Customer (Tenant) Deletion' header is displayed in 'license-tenant-dialog-delete' dialog
	Then text 'Are you sure you want to delete the customer:<<customerName>> #<id>? They will no longer be able to access their admin portal, all of their purchases will also be deleted so anyone using their license(s) will no longer be able to use the associated MindManager products.' is displayed in 'license-tenant-dialog-delete' dialog for confirm deletion in support portal
	When User clicks 'Cancel' button in 'license-tenant-dialog-delete' dialog
	Then 'license-tenant-dialog-delete' dialog is not displayed to User
	Then Rows with following values is displayed in 'license-support-tenant-search-result' table:
		| ColumnName    | Value          |
		| Customer      | <customerName> |
		| Type          | enterprise     |
		| Created       | D(0)           |
		| SSO Status    | N/A            |
		| BULA Accepted | No             |
		| Date Accepted |                |
		| Who Accepted  |                |
	Then customer with '<customerName>' name has exist on Sales portal
	When User find '<customerName>' value in 'Customer' column of 'license-support-tenant-search-result' table and clicks 'Edit' button
	When User clicks 'Delete Tenant' button in 'license-tenant-dialog' dialog
	When User clicks 'Confirm Delete' button in 'license-tenant-dialog-delete' dialog
	Then 'license-tenant-dialog-delete' dialog is not displayed to User
	Then 'license-support-tenant-search-result' table does not have values
	Then text message 'No matches found.' is displayed in 'license-support-tenant-search-result' table
	Then customer with '<customerName>' name has not exist on Sales portal

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @LisenseSupport @Delete @QA @Staging @Qase[LICENSE-140] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @Upd_Qase
Scenario: Delete_purchase
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 5     | MMSUBSCRIPTION | D(10)   |
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	When User waits for data loading
	When User selects 'Purchases' search option on Action panel
	When User enters '<customerName>' value in the 'search-input' field on Action panel
	When User find 'MindManager Subscription' value in 'Product' column of 'license-support-purchase-search-result' table and clicks 'Edit' button
	Then 'license-purchase-dialog' dialog is displayed to User
	When User clicks 'Delete Purchase' button in 'license-purchase-dialog' dialog
	Then 'Confirm Purchase Deletion' header is displayed in 'license-purchase-dialog-delete' dialog
	Then text 'Are you sure you want to delete the purchase:<id> Anyone using this license will no longer be able to use the associated MindManager products.'is displayed  with customer name '<customerName>' and purchase Id 'MMSUBSCRIPTION' in 'license-purchase-dialog-delete' dialog for confirm purchase deletion in support portal
	When User clicks 'Cancel' button in 'license-purchase-dialog-delete' dialog
	Then 'license-purchase-dialog-delete' dialog is not displayed to User
	When User find 'MindManager Subscription' value in 'Product' column of 'license-support-purchase-search-result' table and clicks 'Edit' button
	When User clicks 'Delete Purchase' button in 'license-purchase-dialog' dialog
	When User clicks 'Confirm Delete' button in 'license-purchase-dialog-delete' dialog
	Then text message 'No matches found.' is displayed in 'license-support-purchase-search-result' table
	Then 'MMSUBSCRIPTION' purchase has not exist for '<customerName>' customer on Sales portal

Examples:
	| customerName        |
	| Automation_testSRND |