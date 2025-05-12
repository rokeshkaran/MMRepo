@retry(2)
Feature: Deactivate
Check Deactivate functionality

@Licensing @CustomerAdminPortal @Administrate @Deactivate @QA @Staging @Qase[LICENSE-33] @Cleanup @LC_Upd
Scenario: Check_it_is_possible_to_deactivate_user_manually_Deactivate
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 4     | COEDIT    | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId | Emails                                                                                                                                      |
		| add        | COEDIT     | auto.test+209SRND@mindmanager.onmicrosoft.com, auto.test+210SRND@mindmanager.onmicrosoft.com, auto.test+211SRND@mindmanager.onmicrosoft.com |
	When User find 'Co-editing' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	Then Rows with following values is displayed in 'admin-license-users' table:
		| ColumnName  | Value1                                        | Value2                                        | Value3                                        |
		| User        | auto.test+209SRND@mindmanager.onmicrosoft.com | auto.test+210SRND@mindmanager.onmicrosoft.com | auto.test+211SRND@mindmanager.onmicrosoft.com |
		| User Status | Active                                        | Active                                        | Active                                        |
		| Last Active | N/A                                           | N/A                                           | N/A                                           |
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters 'incorrect_email.address' value in the 'email' field in 'manage-user' dialog
	When User checks 'Deactivate' radio button in 'manage-user' dialog
	Then 'Deactivate' radio button is checked in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then dialog popup is displayed to User
	Then text 'Are you sure you want to deactivate users? Deactivated users will no longer be able to use this MindManager license.' is displayed in dialog popup
	When User clicks Ok button in dialog popup
	Then dialog popup is not displayed to User
	Then 'Warning' text message is displayed in toast container
	Then '"incorrect_email.address" is not a valid email address. No valid email addresses detected.' title is displayed in toast container
	When User enters 'auto.test+209SRND@mindmanager.onmicrosoft.com, auto.test+210SRND@mindmanager.onmicrosoft.com' value in the 'email' field in 'manage-user' dialog
	Then 'Deactivate' radio button is checked in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then dialog popup is displayed to User
	Then text 'Are you sure you want to deactivate users? Deactivated users will no longer be able to use this MindManager license.' is displayed in dialog popup
	When User clicks Ok button in dialog popup
	Then dialog popup is not displayed to User
	Then '2 users deactivated.' text message is displayed in toast container
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value      |
		| Version          | Co-editing |
		| Expires          | D(2)       |
		| Seats Used/Total | 1/4        |
	Then Rows with following values is displayed in 'admin-license-users' table:
		| ColumnName  | Value1                                        | Value2                                        | Value3                                        |
		| User        | auto.test+209SRND@mindmanager.onmicrosoft.com | auto.test+210SRND@mindmanager.onmicrosoft.com | auto.test+211SRND@mindmanager.onmicrosoft.com |
		| User Status | Deactivated                                   | Deactivated                                   | Active                                        |
		| Last Active | N/A                                           | N/A                                           | N/A                                           |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @Administrate @Deactivate @QA @Staging @Qase[LICENSE-34] @Cleanup @LC_Upd
Scenario: Check_it_is_possible_to_deactivate_users_via_CSV_file_Deactivate
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId   |
		| <customerName> | 5     | MMD-W21-M13 |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User find 'MindManager Windows 21 / Mac 13' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Windows 21 / Mac 13' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User provides '5Emails.csv' file to 'Import CSV' file upload in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then '5 users added' text message is displayed in toast container
	Then Users from the '5Emails.csv' file are displayed in the 'User' column of the 'admin-license-users' table
	When User find 'MindManager Windows 21 / Mac 13' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User provides '5Emails.csv' file to 'Import CSV' file upload in 'manage-user' dialog
	When User checks 'Deactivate' radio button in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then text 'Are you sure you want to deactivate users? Deactivated users will no longer be able to use this MindManager license.' is displayed in dialog popup
	When User clicks Ok button in dialog popup
	Then '5 users deactivated.' text message is displayed in toast container
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                           |
		| Version          | MindManager Windows 21 / Mac 13 |
		| Expires          | N/A                             |
		| Seats Used/Total | 0/5                             |
	Then Rows with following values is displayed in 'admin-license-users' table:
		| ColumnName  | Value1                                      | Value2                                      | Value3                                      | Value4                                      | Value5                                      |
		| User        | auto.test_1+151@mindmanager.onmicrosoft.com | auto.test_1+152@mindmanager.onmicrosoft.com | auto.test_1+153@mindmanager.onmicrosoft.com | auto.test_1+154@mindmanager.onmicrosoft.com | auto.test_1+155@mindmanager.onmicrosoft.com |
		| User Status | Deactivated                                 | Deactivated                                 | Deactivated                                 | Deactivated                                 | Deactivated                                 |
		| Last Active | N/A                                         | N/A                                         | N/A                                         | N/A                                         | N/A                                         |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @Administrate @Deactivate @QA @Staging @Qase[LICENSE-35] @Cleanup @LC_Upd
Scenario: Import_CSV_that_contains_invalid_values_deactivate_Deactivate
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId   | EndDate |
		| <customerName> | 100   | MSTEAMSEDIT | D(1)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User find 'MindManager Teams App' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Teams App' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User provides '100Emails.csv' file to 'Import CSV' file upload in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then '100 users added' text message is displayed in toast container
	When User find 'MindManager Teams App' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User checks 'Deactivate' radio button in 'manage-user' dialog
	Then 'Deactivate' radio button is checked in 'manage-user' dialog
	When User provides 'InvalidListEmailAddress.csv' file to 'Import CSV' file upload in 'manage-user' dialog
	Then 'Warning' text message is displayed in toast container
	Then 'No valid email addresses detected.' title is displayed in toast container

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @Administrate @Deactivate @QA @Staging @Qase[LICENSE-36] @Cleanup @LC_Upd
Scenario: Check_that_non_existing_user_is_skipped_but_other_users_are_deactivated_Deactivate
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 10    | COEDIT    | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User find 'Co-editing' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters 'auto.test+212SRND@mindmanager.onmicrosoft.com, auto.test+213SRND@mindmanager.onmicrosoft.com' value in the 'email' field in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters 'auto.test+214SRND@mindmanager.onmicrosoft.com, auto.test+212SRND@mindmanager.onmicrosoft.com, auto.test+213SRND@mindmanager.onmicrosoft.com' value in the 'email' field in 'manage-user' dialog
	When User checks 'Deactivate' radio button in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	When User clicks Ok button in dialog popup
	Then '2 users deactivated.' text message is displayed in toast container
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value      |
		| Version          | Co-editing |
		| Expires          | D(2)       |
		| Seats Used/Total | 0/10       |
	Then Rows with following values is displayed in 'admin-license-users' table:
		| ColumnName  | Value1                                        | Value2                                        |
		| User        | auto.test+212SRND@mindmanager.onmicrosoft.com | auto.test+213SRND@mindmanager.onmicrosoft.com |
		| User Status | Deactivated                                   | Deactivated                                   |
		| Last Active | N/A                                           | N/A                                           |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @Administrate @Deactivate @QA @Staging @Qase[LICENSE-37] @Cleanup @LC_Upd
Scenario: Deactivated_user_Deactivate
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 10    | COEDIT    | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId | Emails                                                                                                                                                                                 |
		| add        | COEDIT     | auto.test+215SRND@mindmanager.onmicrosoft.com, auto.test+216SRND@mindmanager.onmicrosoft.com, auto.test+217SRND@mindmanager.onmicrosoft.com, auto.test+218@mindmanager.onmicrosoft.com |
	When User find 'Co-editing' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters 'auto.test+215SRND@mindmanager.onmicrosoft.com' value in the 'email' field in 'manage-user' dialog
	When User checks 'Deactivate' radio button in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	When User clicks Ok button in dialog popup
	Then Rows with following values is displayed in 'admin-license-users' table:
		| ColumnName  | Value1                                        |
		| User        | auto.test+215SRND@mindmanager.onmicrosoft.com |
		| User Status | Deactivated                                   |
		| Last Active | N/A                                           |
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters 'auto.test+215SRND@mindmanager.onmicrosoft.com, auto.test+216SRND@mindmanager.onmicrosoft.com, auto.test+217SRND@mindmanager.onmicrosoft.com' value in the 'email' field in 'manage-user' dialog
	When User checks 'Deactivate' radio button in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	When User clicks Ok button in dialog popup
	Then '2 users deactivated.' text message is displayed in toast container
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value      |
		| Version          | Co-editing |
		| Expires          | D(2)       |
		| Seats Used/Total | 1/10       |
	Then Rows with following values is displayed in 'admin-license-users' table:
		| ColumnName  | Value1                                        | Value2                                        | Value3                                        | Value4                                    |
		| User        | auto.test+215SRND@mindmanager.onmicrosoft.com | auto.test+216SRND@mindmanager.onmicrosoft.com | auto.test+217SRND@mindmanager.onmicrosoft.com | auto.test+218@mindmanager.onmicrosoft.com |
		| User Status | Deactivated                                   | Deactivated                                   | Deactivated                                   | Active                                    |
		| Last Active | N/A                                           | N/A                                           | N/A                                           | N/A                                       |

Examples:
	| customerName        |
	| Automation_testSRND |