@retry(2)
Feature: LoadTestForProvisioning
Load Test For Provisioning

@Licensing @Load_Testing @Automatic_Provisioning @Staging @Not_Run
Scenario: Load_test_to_activate_throttling_Stg
	When User redirect by reglink 'https://cloud-staging.mindmanager.com/admin?regcode=8712b35b-3503-47fa-be3c-5c6a55671da7'
	Then Right Side panel is displayed
	When User clicks 'Sign In' button
	When User enters 'automationtestmj.licens.tp.stg@mailinator.com' in the 'email' field
	When User enters 'Testautomation0378' in the 'password' field
	When User clicks 'Sign In' button
	When User creates SCIM Groups via Api for throttling using '026081ac-c8a2-41ab-9d11-f2d0bf335f5c' secret token
		| Name             |
		| Automation_Group |
	When User adds '20000' Users from 'SCIMUsersIdStg.txt' file to the SCIM group 'Automation_Group' via Api
	#When User adds '20000' Users from 'SCIMUsersIdStg.txt' file to the SCIM group 'Automation_Group' via Api one user at a time
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Subscription' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	Then 'manage-user' dialog is displayed to User
	When User clicks 'Automatic Provisioning' button in 'manage-user' dialog
	When User selects 'Automation_Group' option from the scim group dropdown in 'scim-group-assign' dialog
	When User clicks 'Submit' button in 'scim-group-assign' dialog
	Then Rows with following values is displayed in 'admin-license-scim-group' table:
		| ColumnName    | Value            |
		| Azure Group   | Automation_Group |
		| Users (20000) | 20000            |
		| Status        | Active           |
	When User remove 'Automation_Group' group via Api for throttling using '026081ac-c8a2-41ab-9d11-f2d0bf335f5c' secret token

@Licensing @Load_Testing @Automatic_Provisioning @QA @Not_Run
Scenario: Load_test_to_activate_throttling_QA
	When User redirect by reglink 'https://cloud-qa.mindmanager.com/admin?regcode=f589280d-becb-4b04-be88-1a0fc67de1c8'
	Then Right Side panel is displayed
	When User clicks 'Sign In' button
	When User enters 'automationtestmj.licens.tp@mailinator.com' in the 'email' field
	When User enters 'Testautomation0378' in the 'password' field
	When User clicks 'Sign In' button
	When User creates SCIM Groups via Api for throttling using '38171fb8-a39d-42ac-9d40-c5af686e95bc' secret token
		| Name             |
		| Automation_Group |
	When User adds '1000' Users from 'UsersID.txt' file to the SCIM group 'Automation_Group' via Api
	#When User adds '1000' Users from 'UsersID.txt' file to the SCIM group 'Automation_Group' via Api one user at a time
	When User remove 'Automation_Group' group via Api for throttling using '38171fb8-a39d-42ac-9d40-c5af686e95bc' secret token

@Licensing @Load_Testing @Automatic_Provisioning @QA @Not_Run
Scenario: Load_testing_for_large_group_provisioning_test
	When User redirect by reglink 'https://cloud-qa.mindmanager.com/admin?regcode=a9ce1cff-e25a-4b9f-854f-741b6adeb8af'
	When User provides the Login and Password from provisioning SCIM Groups load test of Customer Admin Portal and clicks on the Sign In button
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Subscription' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	Then 'manage-user' dialog is displayed to User
	When User clicks 'Automatic Provisioning' button in 'manage-user' dialog
	When User selects 'Automation_Group' option from the scim group dropdown in 'scim-group-assign' dialog
	When User clicks 'Submit' button in 'scim-group-assign' dialog
	Then Rows with following values is displayed in 'admin-license-scim-group' table:
		| ColumnName    | Value            |
		| Azure Group   | Automation_Group |
		| Users (25000) | 25000            |
		| Status        | Active           |
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                    |
		| Version          | MindManager Subscription |
		| Expires          | 06/05/2022               |
		| Seats Used/Total | 25000/25000              |
	When User find 'Automation_Group' value of 'Azure Group' column of 'admin-license-scim-groups' table and select 'Remove' value in 'Status' column
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                    |
		| Version          | MindManager Subscription |
		| Expires          | 06/05/2022               |
		| Seats Used/Total | 0/25000                  |
	Then 'admin-license-scim-groups' table does not have values
	Then 'admin-license-users' table does not have values

@Licensing @Load_Testing @Automatic_Provisioning @Staging @Not_Run
Scenario: Load_testing_for_group_provisioning_with_5000_users
	When User redirect by reglink 'https://cloud-staging.mindmanager.com/admin?regcode=fefae988-9314-4c38-80ce-8c9584fb35d3'
	When User clicks 'Sign In' button
	When User enters 'automationtestmj.licens@gmail.com' in the 'email' field
	When User enters 'Testautomation0378' in the 'password' field
	When User clicks 'Sign In' button
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Subscription' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User clicks 'Automatic Provisioning' button in 'manage-user' dialog
	When User selects 'Automation_Group' option from the scim group dropdown in 'scim-group-assign' dialog
	When User clicks 'Submit' button in 'scim-group-assign' dialog
	Then Rows with following values is displayed in 'admin-license-scim-group' table:
		| ColumnName   | Value            |
		| Azure Group  | Automation_Group |
		| Users (5000) | 5000             |
		| Status       | Active           |
	When User find 'Automation_Group' value of 'Azure Group' column of 'admin-license-scim-groups' table and select 'Remove' value in 'Status' column
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                    |
		| Version          | MindManager Subscription |
		| Expires          | 08/13/2022               |
		| Seats Used/Total | 0/5000                   |
	Then 'admin-license-scim-groups' table does not have values
	Then 'admin-license-users' table does not have values

@Licensing @Load_Testing @Automatic_Provisioning @Staging @Not_Run
Scenario: Load_testing_for_group_provisioning_with_9000_users
	When User redirect by reglink 'https://cloud-staging.mindmanager.com/admin?regcode=41224245-e513-4d1b-8891-d942eff1fa22'
	When User clicks 'Sign In' button
	When User enters '84207licensing@mailinator.com' in the 'email' field
	When User enters '4439267Lq' in the 'password' field
	When User clicks 'Sign In' button
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Subscription' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	Then 'manage-user' dialog is displayed to User
	When User clicks 'Automatic Provisioning' button in 'manage-user' dialog
	When User selects 'Automation_Group' option from the scim group dropdown in 'scim-group-assign' dialog
	When User clicks 'Submit' button in 'scim-group-assign' dialog
	Then Rows with following values is displayed in 'admin-license-scim-group' table:
		| ColumnName   | Value            |
		| Azure Group  | Automation_Group |
		| Users (9000) | 9000             |
		| Status       | Active           |
	When User find 'Automation_Group' value of 'Azure Group' column of 'admin-license-scim-groups' table and select 'Remove' value in 'Status' column
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                    |
		| Version          | MindManager Subscription |
		| Expires          | 08/13/2022               |
		| Seats Used/Total | 0/9000                   |
	Then 'admin-license-scim-groups' table does not have values
	Then 'admin-license-users' table does not have values

@Licensing @Load_Testing @Automatic_Provisioning @Staging @Not_Run
Scenario: Load_testing_for_group_provisioning_with_9999_users
	When User redirect by reglink 'https://cloud-staging.mindmanager.com/admin?regcode=45adf9db-b123-43fb-baad-d185eaffade7'
	When User clicks 'Sign In' button
	When User enters '77302licensing@mailinator.com' in the 'email' field
	When User enters '4439267Lq' in the 'password' field
	When User clicks 'Sign In' button
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Subscription' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	Then 'manage-user' dialog is displayed to User
	When User clicks 'Automatic Provisioning' button in 'manage-user' dialog
	When User selects 'Automation_Group' option from the scim group dropdown in 'scim-group-assign' dialog
	When User clicks 'Submit' button in 'scim-group-assign' dialog
	Then Rows with following values is displayed in 'admin-license-scim-group' table:
		| ColumnName   | Value            |
		| Azure Group  | Automation_Group |
		| Users (9999) | 9999             |
		| Status       | Active           |
	When User find 'Automation_Group' value of 'Azure Group' column of 'admin-license-scim-groups' table and select 'Remove' value in 'Status' column
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                    |
		| Version          | MindManager Subscription |
		| Expires          | 08/13/2022               |
		| Seats Used/Total | 0/10000                  |
	Then 'admin-license-scim-groups' table does not have values
	Then 'admin-license-users' table does not have values

@Licensing @Load_Testing @Automatic_Provisioning @Staging @Not_Run
Scenario: Load_testing_for_group_provisioning_with_25000_users
	When User redirect by reglink 'https://cloud-staging.mindmanager.com/admin?regcode=e4c6a09e-c3fb-4c1b-a25b-74ce8289c717'
	When User clicks 'Sign In' button
	When User enters '996283licensing@mailinator.com' in the 'email' field
	When User enters '4439267Lq' in the 'password' field
	When User clicks 'Sign In' button
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Subscription' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	Then 'manage-user' dialog is displayed to User
	When User clicks 'Automatic Provisioning' button in 'manage-user' dialog
	When User selects 'Automation_Group' option from the scim group dropdown in 'scim-group-assign' dialog
	When User clicks 'Submit' button in 'scim-group-assign' dialog
	Then Rows with following values is displayed in 'admin-license-scim-group' table:
		| ColumnName    | Value            |
		| Azure Group   | Automation_Group |
		| Users (25000) | 25000            |
		| Status        | Active           |
	When User find 'Automation_Group' value of 'Azure Group' column of 'admin-license-scim-groups' table and select 'Remove' value in 'Status' column
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                    |
		| Version          | MindManager Subscription |
		| Expires          | 08/15/2022               |
		| Seats Used/Total | 0/25000                  |
	Then 'admin-license-scim-groups' table does not have values
	Then 'admin-license-users' table does not have values