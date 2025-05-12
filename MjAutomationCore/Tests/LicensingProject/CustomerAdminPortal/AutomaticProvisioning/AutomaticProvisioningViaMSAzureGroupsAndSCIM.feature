@retry(2)
Feature: AutomaticProvisioningViaMSAzureGroupsAndSCIM
Check Automatic Provisioning functionality

@Licensing @CustomerAdminPortal @Automatic_Provisioning @QA @Staging @Qase[LICENSE-98] @Cleanup @Upd_Qase
Scenario: MS_Azure_Groups_and_SCIM_setting_up
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 10    | MMSUBSCRIPTION | D(1)    |
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
		| Name               |
		| Automation_Group_1 |
	When User creates SCIM Users via Api
		| Name                                          |
		| auto.test+229SRND@mindmanager.onmicrosoft.com |
		| auto.test+230SRND@mindmanager.onmicrosoft.com |
	When User 'add' Users to the SCIM group 'Automation_Group_1' via Api
		| Name                                          |
		| auto.test+229SRND@mindmanager.onmicrosoft.com |
		| auto.test+230SRND@mindmanager.onmicrosoft.com |
	#
	When User clicks 'Continue' button in 'scim-setup' dialog
	When User selects 'Automation_Group_1' option from the scim group dropdown in 'scim-group-assign' dialog
	When User clicks 'Submit' button in 'scim-group-assign' dialog
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                    |
		| Version          | MindManager Subscription |
		| Expires          | D(1)                     |
		| Seats Used/Total | 2/10                     |
	Then Rows with following values is displayed in 'admin-license-scim-groups' table:
		| ColumnName  | Value              |
		| Azure Group | Automation_Group_1 |
		| Users (2)   | 2                  |
		| Status      | Active             |
	Then Rows with following values is displayed in 'admin-license-users' table:
		| ColumnName  | Value1                                        | Value2                                        |
		| User        | auto.test+229SRND@mindmanager.onmicrosoft.com | auto.test+230SRND@mindmanager.onmicrosoft.com |
		| User Status | Active                                        | Active                                        |
		| Last Active | N/A                                           | N/A                                           |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @Automatic_Provisioning @QA @Staging @Qase[LICENSE-98] @Cleanup @Upd_Qase
Scenario: Download_the_instructions
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 5     | MMSUBSCRIPTION | D(10)   |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Subscription' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	Then 'manage-user' dialog is displayed to User
	When User clicks 'Automatic Provisioning' button in 'manage-user' dialog
	Then 'scim-setup' dialog is displayed to User
	Then 'Automatic Provisioning Setup' header is displayed in 'scim-setup' dialog
	When User clicks 'Download Microsoft Azure AD Automatic Provisioning Setup instructions' link in in 'scim-setup' dialog
	When User switches to '1' tab
	Then page url is 'https://download.mindjet.com/MindManager_Azure_Automatic_Provisioning_Setup.pdf?'

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @Automatic_Provisioning @QA @Staging @Qase[LICENSE-99] @Cleanup @Upd_Qase
Scenario: Check_that_error_message_is_displayed_if_there_are_more_users_in_the_group_than_seats_available_during_the_initial_setup
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 10    | MMSUBSCRIPTION | D(10)   |
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
	When User creates '12' SCIM Users via Api
	When User 'add' created Users to the SCIM group 'Automation_Group' via Api
	#
	When User clicks 'Continue' button in 'scim-setup' dialog
	When User selects 'Automation_Group' option from the scim group dropdown in 'scim-group-assign' dialog
	When User clicks Submit button in scim group assign dialog
	Then 'There are not enough seats (10 available) for the members of the selected group (12 members). Please purchase more seats, select a different group, or reduce the number of members in your group first.' error message is displayed in 'scim-group-assign' dialog

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @Automatic_Provisioning @QA @Staging @Qase[LICENSE-100] @Cleanup @Upd_Qase
Scenario: Check_that_user_A_takes_1_seat_if_they_are_assigned_to_two_groups
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 9     | MMSUBSCRIPTION | D(10)   |
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
		| Name               |
		| Automation_Group_1 |
		| Automation_Group_2 |
	When User creates SCIM Users via Api
		| Name                                          |
		| auto.test+231SRND@mindmanager.onmicrosoft.com |
		| auto.test+232SRND@mindmanager.onmicrosoft.com |
		| auto.test+233SRND@mindmanager.onmicrosoft.com |
		| auto.test+234SRND@mindmanager.onmicrosoft.com |
		| auto.test+235SRND@mindmanager.onmicrosoft.com |
		| auto.test+236SRND@mindmanager.onmicrosoft.com |
		| auto.test+237SRND@mindmanager.onmicrosoft.com |
		| auto.test+238SRND@mindmanager.onmicrosoft.com |
		| auto.test+239SRND@mindmanager.onmicrosoft.com |
        
	When User 'add' Users to the SCIM group 'Automation_Group_1' via Api
		| Name                                          |
		| auto.test+231SRND@mindmanager.onmicrosoft.com |
		| auto.test+232SRND@mindmanager.onmicrosoft.com |
		| auto.test+233SRND@mindmanager.onmicrosoft.com |
		| auto.test+234SRND@mindmanager.onmicrosoft.com |
		| auto.test+235SRND@mindmanager.onmicrosoft.com |
	When User 'add' Users to the SCIM group 'Automation_Group_2' via Api
		| Name                                          |
		| auto.test+231SRND@mindmanager.onmicrosoft.com |
		| auto.test+236SRND@mindmanager.onmicrosoft.com |
		| auto.test+237SRND@mindmanager.onmicrosoft.com |
		| auto.test+238SRND@mindmanager.onmicrosoft.com |
		| auto.test+239SRND@mindmanager.onmicrosoft.com |
	When User clicks 'Continue' button in 'scim-setup' dialog
	When User selects 'Automation_Group_1' option from the scim group dropdown in 'scim-group-assign' dialog
	When User clicks 'Submit' button in 'scim-group-assign' dialog
	Then Rows with following values is displayed in 'admin-license-scim-group' table:
		| ColumnName  | Value              |
		| Azure Group | Automation_Group_1 |
		| Users (5)   | 5                  |
		| Status      | Active             |
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                    |
		| Version          | MindManager Subscription |
		| Expires          | D(10)                    |
		| Seats Used/Total | 5/9                      |
	When User find 'MindManager Subscription' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User clicks 'Automatic Provisioning' button in 'manage-user' dialog
	When User selects 'Automation_Group_2' option from the scim group dropdown in 'scim-group-assign' dialog
	When User clicks 'Submit' button in 'scim-group-assign' dialog
	Then Rows with following values is displayed in 'admin-license-scim-group' table:
		| ColumnName  | Value1             | Value2             |
		| Azure Group | Automation_Group_1 | Automation_Group_2 |
		| Users (9)   | 5                  | 5                  |
		| Status      | Active             | Active             |
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                    |
		| Version          | MindManager Subscription |
		| Expires          | D(10)                    |
		| Seats Used/Total | 9/9                      |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @Automatic_Provisioning @QA @Staging @Qase[LICENSE-102] @Cleanup @Upd_Qase
Scenario: Check_provisioned_Users_are_displayed_in_the_admin_portal
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 2     | MMSUBSCRIPTION | D(10)   |
		| <customerName> | 4     | COEDIT         | D(10)   |
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
		| Name               |
		| Automation_Group_1 |
		| Automation_Group_2 |
	When User creates SCIM Users via Api
		| Name                                          |
		| auto.test+240SRND@mindmanager.onmicrosoft.com |
		| auto.test+241SRND@mindmanager.onmicrosoft.com |
		| auto.test+242SRND@mindmanager.onmicrosoft.com |
		| auto.test+243SRND@mindmanager.onmicrosoft.com |
	When User 'add' Users to the SCIM group 'Automation_Group_1' via Api
		| Name                                          |
		| auto.test+240SRND@mindmanager.onmicrosoft.com |
		| auto.test+241SRND@mindmanager.onmicrosoft.com |
	When User 'add' Users to the SCIM group 'Automation_Group_2' via Api
		| Name                                          |
		| auto.test+242SRND@mindmanager.onmicrosoft.com |
		| auto.test+243SRND@mindmanager.onmicrosoft.com |
	When User clicks 'Continue' button in 'scim-setup' dialog
	When User selects 'Automation_Group_1' option from the scim group dropdown in 'scim-group-assign' dialog
	When User clicks 'Submit' button in 'scim-group-assign' dialog
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                    |
		| Version          | MindManager Subscription |
		| Expires          | D(10)                    |
		| Seats Used/Total | 2/2                      |
	Then Rows with following values is displayed in 'admin-license-scim-group' table:
		| ColumnName  | Value1             |
		| Azure Group | Automation_Group_1 |
		| Users (2)   | 2                  |
		| Status      | Active             |
	Then Rows with following values is displayed in 'admin-license-users' table:
		| ColumnName  | Value1                                        | Value2                                        |
		| User        | auto.test+240SRND@mindmanager.onmicrosoft.com | auto.test+241SRND@mindmanager.onmicrosoft.com |
		| User Status | Active                                        | Active                                        |
		| Last Active | N/A                                           | N/A                                           |
	When User clicks 'Back' button
	Then User sees '<customerName> Admin Home' page header
	When User find 'Co-editing' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	Then 'manage-user' dialog is displayed to User
	When User clicks 'Automatic Provisioning' button in 'manage-user' dialog
	When User selects 'Automation_Group_2' option from the scim group dropdown in 'scim-group-assign' dialog
	When User clicks 'Submit' button in 'scim-group-assign' dialog
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value      |
		| Version          | Co-editing |
		| Expires          | D(10)      |
		| Seats Used/Total | 2/4        |
	Then Rows with following values is displayed in 'admin-license-scim-group' table:
		| ColumnName  | Value1             |
		| Azure Group | Automation_Group_2 |
		| Users (2)   | 2                  |
		| Status      | Active             |
	Then Rows with following values is displayed in 'admin-license-users' table:
		| ColumnName  | Value1                                        | Value2                                        |
		| User        | auto.test+242SRND@mindmanager.onmicrosoft.com | auto.test+243SRND@mindmanager.onmicrosoft.com |
		| User Status | Active                                        | Active                                        |
		| Last Active | N/A                                           | N/A                                           |
	When User clicks 'Back' button
	Then User sees '<customerName> Admin Home' page header
	Then Rows with following values is displayed in 'admin-home-purchases' table:
		| ColumnName       | Value1                   | Value2     |
		| Product          | MindManager Subscription | Co-editing |
		| License Status   | Active                   | Active     |
		| Expires          | D(10)                    | D(10)      |
		| Seats Used/Total | 2/2                      | 2/4        |

Examples:
	| customerName        |
	| Automation_testSRND |