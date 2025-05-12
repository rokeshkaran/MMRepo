@retry(2)
Feature: AddAppend
Check Add/Append functionality

@Licensing @Admin_Portal @Add_Append @QA @Staging @Qase[LICENSE-16] @Cleanup @LC_Upd
Scenario: Check_that_cannot_add_a_user_with_an_invalid_email_address
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 2     | COEDIT    | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User find 'Co-editing' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters 'automation.email' value in the 'dialog-input' field in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then 'Warning' text message is displayed in toast container
	Then '"automation.email" is not a valid email address. No valid email addresses detected.' title is displayed in toast container

Examples:
	| customerName        |
	| Automation_testSRND |
	 
@Licensing @Admin_Portal @Add_Append @QA @Qase[LICENSE-16] @Cleanup @LC_Upd @CleanupOutlookEmail
Scenario: Check_it_is_possible_to_add_users_manually_to_use_a_license
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 2     | COEDIT    | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	Then Rows with following values is displayed in 'admin-home-purchases' table:
		| ColumnName       | Value      |
		| Product          | Co-editing |
		| License Status   | Active     |
		| Expires          | D(2)       |
		| Seats Used/Total | 0/2        |
	When User find 'Co-editing' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters '<emailAddress>' value in the 'dialog-input' field in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then '1 user added' text message is displayed in toast container
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value      |
		| Version          | Co-editing |
		| Expires          | D(2)       |
		| Seats Used/Total | 1/2        |
	Then Rows with following values is displayed in 'admin-license-users' table:
		| ColumnName  | Value          |
		| User        | <emailAddress> |
		| User Status | Active         |
		| Last Active | N/A            |
	Then User receives an outlook email at 'auto.test@mindmanager.onmicrosoft.com' with the following details:
		| header                  | body                                                                                                                                                                                                                                                                                                                                                                                              |
		| New MindManager License | Dear Customer, Your MindManager administrator has allocated the following license(s) for this email address (auto.test+SRND@mindmanager.onmicrosoft.com): Co-editingTo get started using your new license, launch MindManager, then sign in or create an account using your email address (auto.test+SRND@mindmanager.onmicrosoft.com). Thanks, MindManager This message was sent by MindManager. |

Examples:
	| customerName        | emailAddress                               |
	| Automation_testSRND | auto.test+SRND@mindmanager.onmicrosoft.com |

@Licensing @Admin_Portal @Add_Append @QA @Staging @Qase[LICENSE-16] @Cleanup @LC_Upd @CleanupOutlookEmail
Scenario: Check_it_is_possible_to_add_comma_separated_list_of_valid_email_addresses_to_the_Email_data_entry_field
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
	When User find 'Co-editing' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters 'auto.test+300SRND@mindmanager.onmicrosoft.com, auto.test+301SRND@mindmanager.onmicrosoft.com, auto.test+302SRND@mindmanager.onmicrosoft.com' value in the 'dialog-input' field in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then '3 users added' text message is displayed in toast container
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value      |
		| Version          | Co-editing |
		| Expires          | D(2)       |
		| Seats Used/Total | 3/3        |
	Then Rows with following values is displayed in 'admin-license-users' table:
		| ColumnName  | Value1                                        | Value2                                        | Value3                                        |
		| User        | auto.test+300SRND@mindmanager.onmicrosoft.com | auto.test+301SRND@mindmanager.onmicrosoft.com | auto.test+302SRND@mindmanager.onmicrosoft.com |
		| User Status | Active                                        | Active                                        | Active                                        |
		| Last Active | N/A                                           | N/A                                           | N/A                                           |
	Then User receives an outlook email at 'auto.test@mindmanager.onmicrosoft.com' with the following details:
		| header                  | body                                                                                                                                                                                                                                                                                                                                                                                                    |
		| New MindManager License | Dear Customer, Your MindManager administrator has allocated the following license(s) for this email address (auto.test+300SRND@mindmanager.onmicrosoft.com): Co-editingTo get started using your new license, launch MindManager, then sign in or create an account using your email address (auto.test+300SRND@mindmanager.onmicrosoft.com). Thanks, MindManager This message was sent by MindManager. |
		| New MindManager License | Dear Customer, Your MindManager administrator has allocated the following license(s) for this email address (auto.test+301SRND@mindmanager.onmicrosoft.com): Co-editingTo get started using your new license, launch MindManager, then sign in or create an account using your email address (auto.test+301SRND@mindmanager.onmicrosoft.com). Thanks, MindManager This message was sent by MindManager. |
		| New MindManager License | Dear Customer, Your MindManager administrator has allocated the following license(s) for this email address (auto.test+302SRND@mindmanager.onmicrosoft.com): Co-editingTo get started using your new license, launch MindManager, then sign in or create an account using your email address (auto.test+302SRND@mindmanager.onmicrosoft.com). Thanks, MindManager This message was sent by MindManager. |
	
Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @Admin_Portal @Add_Append @QA @Staging @Qase[LICENSE-17] @Cleanup @LC_Upd @CleanupOutlookEmail
Scenario: Check_the_Import_CSV_function
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 100   | COEDIT    | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User find 'Co-editing' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User provides '100Emails.csv' file to 'Import CSV' file upload in 'manage-user' dialog
	Then 'Add / Append' radio button is checked in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then '100 users added' text message is displayed in toast container
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value      |
		| Version          | Co-editing |
		| Expires          | D(2)       |
		| Seats Used/Total | 100/100    |
	When User accepts Optanon cookies
	Then Users from the '100Emails.csv' file are displayed in the 'User' column of the 'admin-license-users' table
	Then User receives an outlook email at 'auto.test@mindmanager.onmicrosoft.com' with the following details:
		| header                  | body                                                                                                                                                                                                                                                                                                                                                                                    |
		| New MindManager License | Dear Customer, Your MindManager administrator has allocated the following license(s) for this email address (auto.test@mindmanager.onmicrosoft.com): Co-editingTo get started using your new license, launch MindManager, then sign in or create an account using your email address (auto.test@mindmanager.onmicrosoft.com). Thanks, MindManager This message was sent by MindManager. |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @Admin_Portal @Add_Append @QA @Staging @Qase[LICENSE-18] @Cleanup @Not_Run @LC_Upd
Scenario: Import_CSV_that_contains_10000_emails
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 10000 | COEDIT    | D(1)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User find 'Co-editing' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User provides '10000Emails.csv' file to 'Import CSV' file upload in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then '10000 users added' text message is displayed in toast container
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value       |
		| Version          | Co-editing  |
		| Expires          | D(1)        |
		| Seats Used/Total | 10000/10000 |
	Then User receives an outlook email at 'auto.test@mindmanager.onmicrosoft.com' with the following details:
		| header                  | body                                                                                                                                                                                                                                                                                                                                                                                    |
		| New MindManager License | Dear Customer, Your MindManager administrator has allocated the following license(s) for this email address (auto.test@mindmanager.onmicrosoft.com): Co-editingTo get started using your new license, launch MindManager, then sign in or create an account using your email address (auto.test@mindmanager.onmicrosoft.com). Thanks, MindManager This message was sent by MindManager. |
	Then Users from the '10000Emails.csv' file are displayed in the 'User' column of the 'admin-license-users' table

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @Admin_Portal @Add_Append @QA @Staging @Qase[LICENSE-19] @Cleanup @LC_Upd
Scenario: Import_CSV_that_contains_invalid_values
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
	When User provides 'InvalidListEmailAddress.csv' file to 'Import CSV' file upload in 'manage-user' dialog
	Then 'Warning' text message is displayed in toast container
	Then 'No valid email addresses detected.' title is displayed in toast container
	When User clicks 'x' button in 'manage-user' dialog
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value      |
		| Version          | Co-editing |
		| Expires          | D(2)       |
		| Seats Used/Total | 0/10       |
	Then 'admin-license-users' table does not have values

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @Admin_Portal @Add_Append @QA @Staging @Qase[LICENSE-20] @Cleanup @LC_Upd
Scenario: Add_existing_user
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
	When User enters 'auto.test+200SRND@mindmanager.onmicrosoft.com' value in the 'dialog-input' field in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters 'auto.test+200SRND@mindmanager.onmicrosoft.com, auto.test+201SRND@mindmanager.onmicrosoft.com, auto.test+202SRND@mindmanager.onmicrosoft.com' value in the 'dialog-input' field in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then '2 users added' text message is displayed in toast container
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value      |
		| Version          | Co-editing |
		| Expires          | D(2)       |
		| Seats Used/Total | 3/5        |
	Then Rows with following values is displayed in 'admin-license-users' table:
		| ColumnName  | Value1                                        | Value2                                        | Value3                                        |
		| User        | auto.test+200SRND@mindmanager.onmicrosoft.com | auto.test+201SRND@mindmanager.onmicrosoft.com | auto.test+202SRND@mindmanager.onmicrosoft.com |
		| User Status | Active                                        | Active                                        | Active                                        |
		| Last Active | N/A                                           | N/A                                           | N/A                                           |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @Admin_Portal @Add_Append @QA @Staging @Qase[LICENSE-20] @Cleanup @LC_Upd
Scenario: Add_existing_user_via_CSV_file
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 100   | COEDIT    | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User find 'Co-editing' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters 'auto.test@mindmanager.onmicrosoft.com' value in the 'dialog-input' field in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User provides '100Emails.csv' file to 'Import CSV' file upload in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then '99 users added' text message is displayed in toast container
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value      |
		| Version          | Co-editing |
		| Expires          | D(2)       |
		| Seats Used/Total | 100/100    |
	When User accepts Optanon cookies
	Then Users from the '100Emails.csv' file are displayed in the 'User' column of the 'admin-license-users' table

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @Admin_Portal @Add_Append @QA @Staging @Qase[LICENSE-21] @Cleanup @LC_Upd
Scenario: Check_that_the_removed_user_is_allowed_to_use_the_license_again
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId   | EndDate |
		| <customerName> | 5     | MSTEAMSEDIT | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId  | Emails                                                                                      |
		| add        | MSTEAMSEDIT | auto.test+203SRND@mindmanager.onmicrosoft.com,auto.test+204SRND@mindmanager.onmicrosoft.com |
		| remove     | MSTEAMSEDIT | auto.test+203SRND@mindmanager.onmicrosoft.com,auto.test+204SRND@mindmanager.onmicrosoft.com |
	When User find 'MindManager Teams App' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Teams App' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters 'auto.test+203SRND@mindmanager.onmicrosoft.com, auto.test+204SRND@mindmanager.onmicrosoft.com' value in the 'dialog-input' field in 'manage-user' dialog
	Then 'Add / Append' radio button is checked in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                 |
		| Version          | MindManager Teams App |
		| Expires          | D(2)                  |
		| Seats Used/Total | 2/5                   |
	Then Rows with following values is displayed in 'admin-license-users' table:
		| ColumnName  | Value1                                        | Value2                                        |
		| User        | auto.test+203SRND@mindmanager.onmicrosoft.com | auto.test+204SRND@mindmanager.onmicrosoft.com |
		| User Status | Active                                        | Active                                        |
		| Last Active | N/A                                           | N/A                                           |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @Admin_Portal @AddAppend @QA @Staging @Qase[LICENSE-21] @Cleanup @LC_Upd
Scenario: Check_that_the_removed_user_is_allowed_to_use_the_license_again_via_CSV_file
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId   | EndDate |
		| <customerName> | 100   | MSTEAMSEDIT | D(10)   |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User find 'MindManager Teams App' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Teams App' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User provides '100Emails.csv' file to 'Import CSV' file upload in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	When User find 'MindManager Teams App' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User provides '100Emails.csv' file to 'Import CSV' file upload in 'manage-user' dialog
	When User checks 'Remove' radio button in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	When User clicks Ok button in dialog popup
	Then 'admin-license-users' table does not have values
	When User find 'MindManager Teams App' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User provides '100Emails.csv' file to 'Import CSV' file upload in 'manage-user' dialog
	Then 'Add / Append' radio button is checked in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                 |
		| Version          | MindManager Teams App |
		| Expires          | D(10)                 |
		| Seats Used/Total | 100/100               |
	When User accepts Optanon cookies
	Then Users from the '100Emails.csv' file are displayed in the 'User' column of the 'admin-license-users' table

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @Admin_Portal @AddAppend @QA @Staging @Qase[LICENSE-22] @Cleanup @LC_Upd
Scenario: Add_user_if_no_seats_remaining
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId   | EndDate |
		| <customerName> | 2     | MSTEAMSEDIT | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId  | Emails                                                                                      |
		| add        | MSTEAMSEDIT | auto.test+205SRND@mindmanager.onmicrosoft.com,auto.test+206SRND@mindmanager.onmicrosoft.com |
	When User find 'MindManager Teams App' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Teams App' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters 'auto.test+207SRND@mindmanager.onmicrosoft.com,auto.test+208SRND@mindmanager.onmicrosoft.com' value in the 'dialog-input' field in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then 'Not enough seats.' text message is displayed in toast container
	Then 'Warning' title is displayed in toast container
	Then 'manage-user' dialog is displayed to User
	When User clicks close button in 'manage-user' dialog
	Then 'manage-user' dialog is not displayed to User
	Then Rows with following values is displayed in 'admin-license-users' table:
		| ColumnName  | Value1                                        | Value2                                        |
		| User        | auto.test+205SRND@mindmanager.onmicrosoft.com | auto.test+206SRND@mindmanager.onmicrosoft.com |
		| User Status | Active                                        | Active                                        |
		| Last Active | N/A                                           | N/A                                           |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @Admin_Portal @AddAppend @QA @Staging @Qase[LICENSE-23] @Cleanup @LC_Upd
Scenario: User_is_added_after_license_key_is_applied_manually
	#MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 2     | MMSUBSCRIPTION | D(10)   |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks clipboard copy button in 'License Key' column
	Then 'Copied.' text message is displayed in toast container
	Then value is copied to the clipboard
	#MM app
	When User open new tab in browser
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	Then User sees 'You don't have a license to use this product.' header on Right Side panel
	When User clicks 'Enter License Key' button
	Then User sees 'Enter License Key.' header on Right Side panel
	Then User sees 'Unlock MindManager by entering the license key below:' subheader on Right Side panel
	When User switches to iframe
	When User pastes copied key into 'license_key' field
	When User clicks 'Submit' button
	Then User sees 'Success!' header on Right Side panel
	Then User sees 'Your license key was successfully added to your account.' subheader on Right Side panel
	When User clicks 'Continue' button
	When User switches to iframe
	Then file manager header page is displayed to User
	#Admin portal
	When User switches to '0' tab
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                    |
		| Version          | MindManager Subscription |
		| Expires          | D(10)                    |
		| Seats Used/Total | 1/2                      |
	Then Rows with following values is displayed in 'admin-license-users' table:
		| ColumnName  | Value          |
		| User        | <emailAddress> |
		| User Status | Active         |
		| Last Active | D(0)           |

Examples:
	| customerName        | emailAddress                               | password   |
	| Automation_testSRND | auto.test+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |