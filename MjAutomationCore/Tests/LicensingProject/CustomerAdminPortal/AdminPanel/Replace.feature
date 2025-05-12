@retry(2)
Feature: Replace
Check Replace functionality

@Licensing @CustomerAdminPortal @Administrate @Replace @QA @Staging @Qase[LICENSE-29] @Cleanup @LC_Upd @CleanupOutlookEmail
Scenario: Check_it_is_possible_to_replace_users_manually_Replace
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
		| ActionType | PurchaseId | Emails                                                                                       |
		| add        | COEDIT     | auto.test+400SRND@mindmanager.onmicrosoft.com, auto.test+401SRND@mindmanager.onmicrosoft.com |
	When User find 'Co-editing' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters 'incorrect_email.address' value in the 'email' field in 'manage-user' dialog
	When User checks 'Replace' radio button in 'manage-user' dialog
	Then 'Replace' radio button is checked in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then dialog popup is displayed to User
	Then text 'This action will remove all currently licensed users, Are you sure you want to do this?' is displayed in dialog popup
	When User clicks Ok button in dialog popup
	Then dialog popup is not displayed to User
	Then 'Warning' text message is displayed in toast container
	Then '"incorrect_email.address" is not a valid email address. No valid email addresses detected.' title is displayed in toast container
	When User enters 'auto.test+402SRND@mindmanager.onmicrosoft.com, auto.test+403SRND@mindmanager.onmicrosoft.com, auto.test+404SRND@mindmanager.onmicrosoft.com' value in the 'email' field in 'manage-user' dialog
	Then 'Replace' radio button is checked in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then dialog popup is displayed to User
	When User clicks Ok button in dialog popup
	Then dialog popup is not displayed to User
	Then '3 users added, 2 users removed.' text message is displayed in toast container
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value      |
		| Version          | Co-editing |
		| Expires          | D(2)       |
		| Seats Used/Total | 3/3        |
	Then Rows with following values is displayed in 'admin-license-users' table:
		| ColumnName  | Value1                                        | Value2                                        | Value3                                        |
		| User        | auto.test+402SRND@mindmanager.onmicrosoft.com | auto.test+403SRND@mindmanager.onmicrosoft.com | auto.test+404SRND@mindmanager.onmicrosoft.com |
		| User Status | Active                                        | Active                                        | Active                                        |
		| Last Active | N/A                                           | N/A                                           | N/A                                           |
	When User clicks 'Back' button
	Then User sees '<customerName> Admin Home' page header
	Then User receives an outlook email at 'auto.test@mindmanager.onmicrosoft.com' with the following details:
		| header                  | body                                                                                                                                                                                                                                                                                                                                                                                                    |
		| New MindManager License | Dear Customer, Your MindManager administrator has allocated the following license(s) for this email address (auto.test+402SRND@mindmanager.onmicrosoft.com): Co-editingTo get started using your new license, launch MindManager, then sign in or create an account using your email address (auto.test+402SRND@mindmanager.onmicrosoft.com). Thanks, MindManager This message was sent by MindManager. |
		| New MindManager License | Dear Customer, Your MindManager administrator has allocated the following license(s) for this email address (auto.test+403SRND@mindmanager.onmicrosoft.com): Co-editingTo get started using your new license, launch MindManager, then sign in or create an account using your email address (auto.test+403SRND@mindmanager.onmicrosoft.com). Thanks, MindManager This message was sent by MindManager. |
		| New MindManager License | Dear Customer, Your MindManager administrator has allocated the following license(s) for this email address (auto.test+404SRND@mindmanager.onmicrosoft.com): Co-editingTo get started using your new license, launch MindManager, then sign in or create an account using your email address (auto.test+404SRND@mindmanager.onmicrosoft.com). Thanks, MindManager This message was sent by MindManager. |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @Administrate @Replace @QA @Staging @Qase[LICENSE-30] @Cleanup @Not_Run @LC_Upd
Scenario: Check_it_is_possible_to_replace_users_via_CSV_file_contains_10000_emails_Replace
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId   |
		| <customerName> | 10000 | MMD-W21-M14 |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User find 'MindManager Windows 21 / Mac 14' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Windows 21 / Mac 14' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User provides '10000EmailsTestReplace.csv' file to 'Import CSV' file upload in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	When User find 'MindManager Windows 21 / Mac 14' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User provides '10000Emails.csv' file to 'Import CSV' file upload in 'manage-user' dialog
	When User checks 'Replace' radio button in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then text 'This action will remove all currently licensed users, Are you sure you want to do this?' is displayed in dialog popup
	When User clicks Ok button in dialog popup
	Then dialog popup is not displayed to User
	Then '10000 users added, 10000 users removed.' text message is displayed in toast container
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                           |
		| Version          | MindManager Windows 21 / Mac 14 |
		| Expires          | N/A                             |
		| Seats Used/Total | 10000/10000                     |
	#Email notification is still under investigation and requires correction
	#Then User checks content of email sent to 'automation.test.user.mj@gmail.com' mail
	Then Users from the '10000Emails.csv' file are displayed in the 'User' column of the 'admin-license-users' table

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @Administrate @Replace @QA @Staging @Qase[LICENSE-30] @Cleanup @LC_Upd @CleanupOutlookEmail
Scenario: Check_it_is_possible_to_replace_users_via_CSV_file_Replace
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId   |
		| <customerName> | 100   | MMD-W21-M14 |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User find 'MindManager Windows 21 / Mac 14' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Windows 21 / Mac 14' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User provides '50Emails.csv' file to 'Import CSV' file upload in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	When User find 'MindManager Windows 21 / Mac 14' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User provides '100EmailsForReplace.csv' file to 'Import CSV' file upload in 'manage-user' dialog
	When User checks 'Replace' radio button in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	When User clicks Ok button in dialog popup
	Then '100 users added, 50 users removed.' text message is displayed in toast container
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                           |
		| Version          | MindManager Windows 21 / Mac 14 |
		| Expires          | N/A                             |
		| Seats Used/Total | 100/100                         |
	Then Users from the '100EmailsForReplace.csv' file are displayed in the 'User' column of the 'admin-license-users' table
	When User clicks 'Back' button
	Then User sees '<customerName> Admin Home' page header
	Then User receives an outlook email at 'auto.test@mindmanager.onmicrosoft.com' with the following details:
		| header                  | body                                                                                                                                                                                                                                                                                                                                                                                    |
		| New MindManager License | Dear Customer, Your MindManager administrator has allocated the following license(s) for this email address (auto.test@mindmanager.onmicrosoft.com): MindManager Windows 21 / Mac 14To get started using your new license, launch MindManager, then sign in or create an account using your email address (auto.test@mindmanager.onmicrosoft.com). Thanks, MindManager This message was sent by MindManager. |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @Replace @QA @Staging @Qase[LICENSE-31] @Cleanup @LC_Upd
Scenario: Import_CSV_that_contains_invalid_values_Replace
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 100   | MMSUBSCRIPTION | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Subscription' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User provides '100Emails.csv' file to 'Import CSV' file upload in 'manage-user' dialog
	Then 'Add / Append' radio button is checked in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then '100 users added' text message is displayed in toast container
	When User accepts Optanon cookies
	When User find 'MindManager Subscription' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User checks 'Replace' radio button in 'manage-user' dialog
	When User provides 'InvalidListEmailAddress.csv' file to 'Import CSV' file upload in 'manage-user' dialog
	Then 'Warning' text message is displayed in toast container
	Then 'No valid email addresses detected.' title is displayed in toast container
	When User clicks 'x' button in 'manage-user' dialog
	Then Users from the '100Emails.csv' file are displayed in the 'User' column of the 'admin-license-users' table

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @Replace @QA @Staging @Qase[LICENSE-32] @Cleanup @LC_Upd
Scenario: No_seats_remaining_Replace
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId    | EndDate |
		| <customerName> | 2     | MMESSENTIALS | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId   | Emails                                                                                                       |
		| add        | MMESSENTIALS | auto.test+405SRND@mindmanager.onmicrosoft.com, auto.test+406SRND@mindmanager.onmicrosoft.com |
	When User find 'MindManager Essentials' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Essentials' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters 'auto.test+407SRND@mindmanager.onmicrosoft.com, auto.test+408SRND@mindmanager.onmicrosoft.com, auto.test+409SRND@mindmanager.onmicrosoft.com' value in the 'email' field in 'manage-user' dialog
	When User checks 'Replace' radio button in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	When User clicks Ok button in dialog popup
	Then 'Not enough seats.' text message is displayed in toast container
	Then 'Warning' title is displayed in toast container

Examples:
	| customerName        |
	| Automation_testSRND |