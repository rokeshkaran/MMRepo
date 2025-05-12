@retry(2)
Feature: Remove
Check Remove functionality

@Licensing @CustomerAdminPortal @Administrate @Remove @QA @Staging @Qase[LICENSE-38] @Cleanup @LC_Upd
Scenario: Check_it_is_possible_to_remove_users_manually_Remove
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 3     | COEDIT    | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId | Emails                                                                                                                                      |
		| add        | COEDIT     | auto.test+218SRND@mindmanager.onmicrosoft.com, auto.test+219SRND@mindmanager.onmicrosoft.com, auto.test+220SRND@mindmanager.onmicrosoft.com |
	When User find 'Co-editing' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters 'incorrect_email.address' value in the 'email' field in 'manage-user' dialog
	When User checks 'Remove' radio button in 'manage-user' dialog
	Then 'Remove' radio button is checked in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then text 'Are you sure you want to remove users? Removed users will have this MindManager license removed from their account, but if they know your license key they can re-input it again. To prevent re-inputting use the deactivate operation instead.' is displayed in dialog popup
	When User clicks Ok button in dialog popup
	Then 'Warning' text message is displayed in toast container
	Then '"incorrect_email.address" is not a valid email address. No valid email addresses detected.' title is displayed in toast container
	When User enters 'auto.test+218SRND@mindmanager.onmicrosoft.com, auto.test+220SRND@mindmanager.onmicrosoft.com' value in the 'email' field in 'manage-user' dialog
	Then 'Remove' radio button is checked in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then dialog popup is displayed to User
	Then text 'Are you sure you want to remove users? Removed users will have this MindManager license removed from their account, but if they know your license key they can re-input it again. To prevent re-inputting use the deactivate operation instead.' is displayed in dialog popup
	When User clicks Ok button in dialog popup
	Then dialog popup is not displayed to User
	Then '2 users removed.' text message is displayed in toast container
	Then Rows with following values is displayed in 'admin-license-users' table:
		| ColumnName  | Value                                         |
		| User        | auto.test+219SRND@mindmanager.onmicrosoft.com |
		| User Status | Active                                        |
		| Last Active | N/A                                           |
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value      |
		| Version          | Co-editing |
		| Expires          | D(2)       |
		| Seats Used/Total | 1/3        |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @Administrate @Remove @QA @Staging @Qase[LICENSE-39] @Cleanup @LC_Upd
Scenario: Check_it_is_possible_to_remove_users_via_CSV_file_Remove
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 5     | COEDIT    | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User find 'Co-editing' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User provides '5Emails.csv' file to 'Import CSV' file upload in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then '5 users added' text message is displayed in toast container
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value      |
		| Version          | Co-editing |
		| Expires          | D(2)       |
		| Seats Used/Total | 5/5        |
	Then Users from the '5Emails.csv' file are displayed in the 'User' column of the 'admin-license-users' table
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User provides '5Emails.csv' file to 'Import CSV' file upload in 'manage-user' dialog
	When User checks 'Remove' radio button in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then text 'Are you sure you want to remove users? Removed users will have this MindManager license removed from their account, but if they know your license key they can re-input it again. To prevent re-inputting use the deactivate operation instead.' is displayed in dialog popup
	When User clicks Ok button in dialog popup
	Then '5 users removed.' text message is displayed in toast container
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value      |
		| Version          | Co-editing |
		| Expires          | D(2)       |
		| Seats Used/Total | 0/5        |
	Then 'admin-license-users' table does not have values

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @Administrate @Remove @QA @Staging @Cleanup @Not_Run
Scenario: Check_it_is_possible_to_remove_users_via_CSV_file_contains_10000_emails_Remove
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 10000 | COEDIT    | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User find 'Co-editing' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User provides '10000Emails.csv' file to 'Import CSV' file upload in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value       |
		| Version          | Co-editing  |
		| Expires          | D(2)        |
		| Seats Used/Total | 10000/10000 |
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User provides '10000Emails.csv' file to 'Import CSV' file upload in 'manage-user' dialog
	When User checks 'Remove' radio button in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then dialog popup is displayed to User
	Then text 'Are you sure you want to remove users? Removed users will have this MindManager license removed from their account, but if they know your license key they can re-input it again. To prevent re-inputting use the deactivate operation instead.' is displayed in dialog popup
	When User clicks Ok button in dialog popup
	Then '10000 users removed.' text message is displayed in toast container
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value      |
		| Version          | Co-editing |
		| Expires          | D(2)       |
		| Seats Used/Total | 0/10000    |
	Then 'admin-license-users' table does not have values

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @Administrate @Remove @QA @Staging @Qase[LICENSE-40] @Cleanup @LC_Upd
Scenario: Import_CSV_that_contains_invalid_values_Remove
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 12    | COEDIT    | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User find 'Co-editing' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User provides '5Emails.csv' file to 'Import CSV' file upload in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then '5 users added' text message is displayed in toast container
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User checks 'Remove' radio button in 'manage-user' dialog
	When User provides 'InvalidListEmailAddress.csv' file to 'Import CSV' file upload in 'manage-user' dialog
	Then 'Warning' text message is displayed in toast container
	Then 'No valid email addresses detected.' title is displayed in toast container

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @Administrate @Remove @QA @Staging @Qase[LICENSE-41] @Cleanup @LC_Upd
Scenario: Non_existing_user_Remove
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId |
		| <customerName> | 10    | MMD-W22   |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId | Emails                                                                                       |
		| add        | MMD-W22    | auto.test+221SRND@mindmanager.onmicrosoft.com, auto.test+222SRND@mindmanager.onmicrosoft.com |
	When User find 'MindManager Windows 22' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Windows 22' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters 'auto.test+223SRND@mindmanager.onmicrosoft.com, auto.test+221SRND@mindmanager.onmicrosoft.com, auto.test+222SRND@mindmanager.onmicrosoft.com' value in the 'email' field in 'manage-user' dialog
	When User checks 'Remove' radio button in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then dialog popup with text 'Are you sure you want to remove users? Removed users will have this MindManager license removed from their account, but if they know your license key they can re-input it again. To prevent re-inputting use the deactivate operation instead.' is displayed to User
	When User clicks Ok button in dialog popup
	Then '2 users removed.' text message is displayed in toast container
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                  |
		| Version          | MindManager Windows 22 |
		| Expires          | N/A                    |
		| Seats Used/Total | 0/10                   |
	Then 'admin-license-users' table does not have values

Examples:
	| customerName        |
	| Automation_testSRND |