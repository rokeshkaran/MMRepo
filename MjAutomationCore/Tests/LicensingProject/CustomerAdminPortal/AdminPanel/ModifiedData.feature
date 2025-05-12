@retry(2)
Feature: ModifiedData
Export user list from license admin portal

@Licensing @Admin_Portal @ModifiedData @QA @Staging @Qase[LICENSE-24] @Cleanup @LC_Upd @CleanupOutlookEmail
Scenario: Check_that_it_is_possible_to_remove_the_users_from_subscription_by_removing_the_raws_in_the_exported_list
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
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId | Emails                           |
		| add        | COEDIT     | <emailAddress1>, <emailAddress2> |
	When User find 'Co-editing' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User refresh page
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value      |
		| Version          | Co-editing |
		| Expires          | D(2)       |
		| Seats Used/Total | 2/100      |
	Then Rows with following values is displayed in 'admin-license-users' table:
		| ColumnName  | Value1          | Value2          |
		| User        | <emailAddress1> | <emailAddress2> |
		| User Status | Active          | Active          |
		| Last Active | N/A             | N/A             |
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Export' button
	Then User checks that file 'user-list' was downloaded
	Then User verifies '2' rows in 'user-list' downloaded file
		| user_email      | status | last_login | scim_group |
		| <emailAddress1> | Active | N/A        |            |
		| <emailAddress2> | Active | N/A        |            |
	When User updates data in the 'user-list' exported file
		| user_email      | status | last_login | scim_group |
		| <emailAddress3> | Active | N/A        |            |
		| <emailAddress4> | Active | N/A        |            |
	When User updates data in the 'user-list' exported file
		| user_email      | status | last_login | scim_group |
		| <emailAddress3> | Active | N/A        |            |
		| <emailAddress4> | Active | N/A        |            |
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User uploads the updated CSV file
	Then 'Replace' radio button is checked in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then dialog popup is displayed to User
	Then text 'This action will remove all currently licensed users, Are you sure you want to do this?' is displayed in dialog popup
	When User clicks Ok button in dialog popup
	Then '2 users added (active), 0 users added (deactivated), 0 users updated, 2 users removed' text message is displayed in toast container
	Then Rows with following values is displayed in 'admin-license-users' table:
		| ColumnName  | Value1          | Value2          |
		| User        | <emailAddress3> | <emailAddress4> |
		| User Status | Active          | Active          |
		| Last Active | N/A             | N/A             |
	Then User receives an outlook email at 'auto.test@mindmanager.onmicrosoft.com' with the following details:
		| header                      | body                                                                                                                                                                                                                        |
		| MindManager License Revoked | Dear Customer, Your MindManager administrator has revoked the following license(s) for this email address (auto.test+SRND@mindmanager.onmicrosoft.com): Co-editingThanks, MindManager This message was sent by MindManager. |

Examples:
	| customerName        | emailAddress1                              | emailAddress2                                 | emailAddress3                                 | emailAddress4                                 |
	| Automation_testSRND | auto.test+SRND@mindmanager.onmicrosoft.com | auto.test+524SRND@mindmanager.onmicrosoft.com | auto.test+525SRND@mindmanager.onmicrosoft.com | auto.test+526SRND@mindmanager.onmicrosoft.com |

@Licensing @Admin_Portal @ModifiedData @QA @Staging @Qase[LICENSE-25] @Cleanup @LC_Upd
Scenario: Check_that_it_is_possible_to_change_the_users_status_by_changing_the_data_in_the_exported_list
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
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId | Emails                                            |
		| add        | COEDIT     | <emailAddress1>, <emailAddress2>, <emailAddress3> |
	When User find 'Co-editing' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User refresh page
	Then Rows with following values is displayed in 'admin-license-users' table:
		| ColumnName  | Value1          | Value2          | Value3          |
		| User        | <emailAddress1> | <emailAddress2> | <emailAddress3> |
		| User Status | Active          | Active          | Active          |
		| Last Active | N/A             | N/A             | N/A             |
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Export' button
	Then User checks that file 'user-list' was downloaded
	Then User verifies '3' rows in 'user-list' downloaded file
		| user_email      | status | last_login | scim_group |
		| <emailAddress3> | Active | N/A        |            |
		| <emailAddress2> | Active | N/A        |            |
		| <emailAddress1> | Active | N/A        |            |
	When User updates data in the 'user-list' exported file
		| user_email      | status      | last_login | scim_group |
		| <emailAddress1> | Deactivated | N/A        |            |
		| <emailAddress2> | Deactivated | N/A        |            |
		| <emailAddress3> | Active      | N/A        |            |
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User uploads the updated CSV file
	Then 'Replace' radio button is checked in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then dialog popup is displayed to User
	Then text 'This action will remove all currently licensed users, Are you sure you want to do this?' is displayed in dialog popup
	When User clicks Ok button in dialog popup
	Then '0 users added (active), 0 users added (deactivated), 2 users updated, 0 users removed' text message is displayed in toast container
	Then Rows with following values is displayed in 'admin-license-users' table:
		| ColumnName  | Value1          | Value2          | Value2          |
		| User        | <emailAddress1> | <emailAddress2> | <emailAddress3> |
		| User Status | Deactivated     | Deactivated     | Active          |
		| Last Active | N/A             | N/A             | N/A             |

Examples:
	| customerName        | emailAddress1                                 | emailAddress2                                 | emailAddress3                                 |
	| Automation_testSRND | auto.test+527SRND@mindmanager.onmicrosoft.com | auto.test+528SRND@mindmanager.onmicrosoft.com | auto.test+529SRND@mindmanager.onmicrosoft.com |

@Licensing @Admin_Portal @ModifiedData @QA @Staging @Qase[LICENSE-26] @Cleanup @LC_Upd
Scenario: Check_that_wrong_statuses_in_csv_files_are_ignored
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
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId | Emails                           |
		| add        | COEDIT     | <emailAddress1>, <emailAddress2> |
	When User find 'Co-editing' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User refresh page
	Then Rows with following values is displayed in 'admin-license-users' table:
		| ColumnName  | Value1          | Value2          |
		| User        | <emailAddress1> | <emailAddress2> |
		| User Status | Active          | Active          |
		| Last Active | N/A             | N/A             |
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Export' button
	Then User checks that file 'user-list' was downloaded
	Then User verifies '2' rows in 'user-list' downloaded file
		| user_email      | status | last_login | scim_group |
		| <emailAddress2> | Active | N/A        |            |
		| <emailAddress1> | Active | N/A        |            |
	When User updates data in the 'user-list' exported file
		| user_email      | status | last_login | scim_group |
		| <emailAddress2> | 123456 | N/A        |            |
		| <emailAddress1> | test   | N/A        |            |
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User uploads the updated CSV file
	Then 'Replace' radio button is checked in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then dialog popup is displayed to User
	Then text 'This action will remove all currently licensed users, Are you sure you want to do this?' is displayed in dialog popup
	When User clicks Ok button in dialog popup
	Then '0 users added (active), 0 users added (deactivated), 2 users updated, 0 users removed' text message is displayed in toast container
	Then Rows with following values is displayed in 'admin-license-users' table:
		| ColumnName  | Value1          | Value2          |
		| User        | <emailAddress2> | <emailAddress1> |
		| User Status | Active          | Active          |
		| Last Active | N/A             | N/A             |

Examples:
	| customerName        | emailAddress1                                 | emailAddress2                                 |
	| Automation_testSRND | auto.test+530SRND@mindmanager.onmicrosoft.com | auto.test+531SRND@mindmanager.onmicrosoft.com |

@Licensing @Admin_Portal @ModifiedData @QA @Staging @Qase[LICENSE-27] @Cleanup @LC_Upd
Scenario: Check_that_it_is_not_possible_to_change_Last_active_value
	Given User account
		| Email           | Password   |
		| <emailAddress1> | 6j9k2!SRND |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
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
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId | Emails                           |
		| add        | COEDIT     | <emailAddress1>, <emailAddress2> |
	When User find 'Co-editing' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User refresh page
	Then Rows with following values is displayed in 'admin-license-users' table:
		| ColumnName  | Value1          | Value2          |
		| User        | <emailAddress1> | <emailAddress2> |
		| User Status | Active          | Active          |
		| Last Active | D(0)            | N/A             |
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Export' button
	Then User checks that file 'user-list' was downloaded
	Then User verifies '2' rows in 'user-list' downloaded file
		| user_email      | status | last_login | scim_group |
		| <emailAddress1> | Active | D(0)       |            |
		| <emailAddress2> | Active | N/A        |            |
	When User updates data in the 'user-list' exported file
		| user_email      | status | last_login | scim_group |
		| <emailAddress1> | Active | D(5)       |            |
		| <emailAddress2> | Active | D(-5)      |            |
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User uploads the updated CSV file
	Then 'Replace' radio button is checked in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then dialog popup is displayed to User
	Then text 'This action will remove all currently licensed users, Are you sure you want to do this?' is displayed in dialog popup
	When User clicks Ok button in dialog popup
	Then '0 users added (active), 0 users added (deactivated), 0 users updated, 0 users removed' text message is displayed in toast container
	Then Rows with following values is displayed in 'admin-license-users' table:
		| ColumnName  | Value1          | Value2          |
		| User        | <emailAddress1> | <emailAddress2> |
		| User Status | Active          | Active          |
		| Last Active | D(0)            | N/A             |

Examples:
	| customerName        | emailAddress1                              | emailAddress2                                 |
	| Automation_testSRND | auto.test+SRND@mindmanager.onmicrosoft.com | auto.test+532SRND@mindmanager.onmicrosoft.com |