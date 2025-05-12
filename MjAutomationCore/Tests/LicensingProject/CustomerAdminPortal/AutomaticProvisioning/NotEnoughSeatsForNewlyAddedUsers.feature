@retry(2)
Feature: NotEnoughSeatsForNewlyAddedUsers

@Licensing @CustomerAdminPortal @Automatic_Provisioning @QA @Staging @Qase[LICENSE-104] @Cleanup @Upd_Qase
Scenario: Check_that_user_removed_from_the_group_frees_the_seat
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 3     | MMSUBSCRIPTION | D(10)   |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Subscription' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	Then 'manage-user' dialog is displayed to User
	When User clicks 'Automatic Provisioning' button in 'manage-user' dialog
	When User remembers scim secret token for 'dialog-scim-setup' dialog
	# <Setting up Provisioning> #
	When User creates SCIM Groups via Api
		| Name             |
		| Automation_Group |
	When User creates SCIM Users via Api
		| Name                                          |
		| auto.test+244SRND@mindmanager.onmicrosoft.com |
		| auto.test+245SRND@mindmanager.onmicrosoft.com |
		| auto.test+246SRND@mindmanager.onmicrosoft.com |
	When User 'add' Users to the SCIM group 'Automation_Group' via Api
		| Name                                          |
		| auto.test+244SRND@mindmanager.onmicrosoft.com |
		| auto.test+245SRND@mindmanager.onmicrosoft.com |
		| auto.test+246SRND@mindmanager.onmicrosoft.com |
	#
	When User clicks 'Continue' button in 'scim-setup' dialog
	When User selects 'Automation_Group' option from the scim group dropdown in 'scim-group-assign' dialog
	When User clicks 'Submit' button in 'scim-group-assign' dialog
	Then Rows with following values is displayed in 'admin-license-scim-group' table:
		| ColumnName  | Value            |
		| Azure Group | Automation_Group |
		| Users (3)   | 3                |
		| Status      | Active           |
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                    |
		| Version          | MindManager Subscription |
		| Expires          | D(10)                    |
		| Seats Used/Total | 3/3                      |
	# <Setting up Provisioning> #
	When User 'remove' Users to the SCIM group 'Automation_Group' via Api
		| Name                                          |
		| auto.test+245SRND@mindmanager.onmicrosoft.com |
	#
	When User refresh page
	Then Rows with following values is displayed in 'admin-license-scim-group' table:
		| ColumnName  | Value            |
		| Azure Group | Automation_Group |
		| Users (2)   | 2                |
		| Status      | Active           |
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                    |
		| Version          | MindManager Subscription |
		| Expires          | D(10)                    |
		| Seats Used/Total | 2/3                      |

Examples:
	| customerName        |
	| Automation_testSRND |