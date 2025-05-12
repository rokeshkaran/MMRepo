@retry(2)
Feature: SalesPortal
Check Mindjet super admin account UI, add new customer and check customer name and type

Background: Pre-condition
	Given User is on the Mindmanager Sales portal website
	Then Right Side panel is displayed
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button

@Licensing @Manage_Subscriptions @Salesportal @Add_New_Customer @QA @Staging @Qase[LICENSE-294] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @LC_Upd
Scenario: Mindjet_super_admin_account_UI
	Then User sees 'Enterprise Subscription Services - Sales Portal' page header
	Then 'Add New Customer' button is displayed
	Then 'Add New Purchase' button is displayed
	Then 'Product Table' button is displayed
	Then 'Product Version Table' button is displayed
	Then 'Product SKU Table' button is displayed
	Then 'Reset Trial Period for ALL Users' button is displayed
	When User clicks 'Product Table' button
	Then 'subscription-product-table' dialog is displayed to User
	When User clicks 'Cancel' button in 'subscription-product-table' dialog
	Then 'subscription-product-table' dialog is not displayed to User
	When User clicks 'Product Version Table' button
	Then 'subscription-product-version-table' dialog is displayed to User
	When User clicks 'Cancel' button in 'subscription-product-version-table' dialog
	Then 'subscription-product-version-table' dialog is not displayed to User
	When User clicks 'Product SKU Table' button
	Then 'subscription-product-sku-table' dialog is displayed to User
	When User clicks 'Cancel' button in 'subscription-product-sku-table' dialog
	Then 'subscription-product-sku-table' dialog is not displayed to User

@Licensing @Manage_Subscriptions @Salesportal @Add_New_Customer @QA @Staging @Qase[LICENSE-295] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @LC_Upd
Scenario: Add_New_Customer_UI
	Then User sees 'Enterprise Subscription Services - Sales Portal' page header
	When User clicks 'Add New Customer' button
	Then 'tenant' dialog is displayed to User
	Then 'Enterprise' value is displayed in the 'Type' selectbox field of 'tenant' dialog
	When User clicks 'Cancel' button in 'tenant-dialog' dialog
	Then 'tenant' dialog is not displayed to User

@Licensing @Manage_Subscriptions @Salesportal @Add_New_Customer @QA @Staging @Qase[LICENSE-296] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @LC_Upd
Scenario: Check_that_you_cant_create_a_Customer_without_name
	When User clicks 'Add New Customer' button
	Then 'tenant' dialog is displayed to User
	When User clicks 'Add' button in 'tenant-dialog' dialog
	Then 'Customer Name' field border is highlighted to the red color of 'tenant' dialog
	Then notification message with text 'Customer name is required.' is displayed to User

@Licensing @Manage_Subscriptions @Salesportal @Add_New_Customer @QA @Staging @Qase[LICENSE-296] @JIRA[MMCV-10518] @Cleanup @LC_Upd
Scenario: Check_that_a_customer_can_be_created_with_different_combination
	When User clicks 'Add New Customer' button
	Then 'tenant' dialog is displayed to User
	When User enter 'SRND' value in the 'name' field of 'tenant-dialog' dialog
	When User clicks 'Add' button in 'tenant-dialog' dialog
	Then 'tenant' dialog is not displayed to User
	When User clicks 'Add New Customer' button
	Then 'tenant' dialog is displayed to User
	When User enter 'RND' value in the 'name' field of 'tenant-dialog' dialog
	When User clicks 'Add' button in 'tenant-dialog' dialog
	Then 'tenant' dialog is not displayed to User
	When User clicks 'Add New Customer' button
	Then 'tenant' dialog is displayed to User
	When User enter 'RSN' value in the 'name' field of 'tenant-dialog' dialog
	When User clicks 'Add' button in 'tenant-dialog' dialog
	Then 'tenant' dialog is not displayed to User