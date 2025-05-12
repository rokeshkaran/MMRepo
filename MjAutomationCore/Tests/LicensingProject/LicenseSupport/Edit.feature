@retry(2)
Feature: Edit
Check Edit functionality

@Licensing @LisenseSupport @Edit @QA @Staging @Qase[LICENSE-134] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @Upd_Qase
Scenario: Check_that_admin_can_verify_email_manually
	#MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName | AcceptedTerms |
		| Automation | TEST     | true          |
	When User creates given user account via Api
	Then newly created account successfully created
	#Support portal
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	When User waits for data loading
	Then 'User Search' search option is selected on Action panel
	When User enters '<emailAddress>' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'license-support-user-search-result' table:
		| ColumnName     | Value           |
		| User           | <emailAddress>  |
		| Name           | Automation TEST |
		| Products       | 0               |
		| Email Verified | Pending         |
		| Last Active    | D(0)            |
	When User find '<emailAddress>' value of 'User' column of 'license-support-user-search-result' table and select 'Manually Verify' value in 'Email Verified' column
	Then 'Success. User email verified.' text message is displayed in toast container
	Then Rows with following values is displayed in 'license-support-user-search-result' table:
		| ColumnName     | Value           |
		| User           | <emailAddress>  |
		| Name           | Automation TEST |
		| Products       | 0               |
		| Email Verified | Yes             |
		| Last Active    | D(0)            |
	#MM app
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	Then User sees 'You don't have a license to use this product.' header on Right Side panel

Examples:
	| emailAddress                                 | password   |
	| auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |

@Licensing @LisenseSupport @Edit @QA @Staging @Qase[LICENSE-135]  @JIRA[MMCV-10518] @Cleanup @Upd_Qase
Scenario: Update_the_tenant_name
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 5     | COEDIT    | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	Then User sees '<customerName> Admin Home' page header
	#Support portal
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	When User waits for data loading
	When User selects 'Customer Search' search option on Action panel
	When User enters '<customerName>' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'license-support-tenant-search-result' table:
		| ColumnName | Value          |
		| Customer   | <customerName> |
		| Type       | enterprise     |
		| Created    | D(0)           |
	When User find '<customerName>' value in 'Customer' column of 'license-support-tenant-search-result' table and clicks 'Edit' button
	When User enter '<newCustomerName>' value in the 'name' field of 'license-tenant-dialog' dialog
	When User clicks 'Submit' button in 'license-tenant-dialog' dialog
	When User enters '<newCustomerName>' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'license-support-tenant-search-result' table:
		| ColumnName | Value             |
		| Customer   | <newCustomerName> |
		| Type       | enterprise        |
		| Created    | D(0)              |
	When User enters '<customerName>' value in the 'search-input' field on Action panel
	Then 'license-support-tenant-search-result' table does not have values
	Then text message 'No matches found.' is displayed in 'license-support-tenant-search-result' table
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	Then User sees '<newCustomerName> Admin Home' page header
	#Sales portal
	Then following information about 'COEDIT' purchase for customer '<newCustomerName>' is displayed in Sales portal via Api
		| UsedSeats | Seats | EndDateIso |
		| 0         | 5     | D(2)       |

Examples:
	| customerName        | newCustomerName         |
	| Automation_testSRND | automation_testTEAMSRND |

@Licensing @LisenseSupport @Edit @QA @Staging @Qase[LICENSE-136] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @Upd_Qase
Scenario: Update_seat_count_for_a_purchase
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 5     | COEDIT    | D(10)   |
	#Support portal	
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	When User waits for data loading
	When User selects 'Purchases' search option on Action panel
	When User enters '<customerName>' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'license-support-purchase-search-result' table:
		| ColumnName       | Value          |
		| Product          | Co-editing     |
		| Type             | enterprise     |
		| Expiration Date  | D(10)          |
		| Seats Used/Total | 0/5            |
		| Owner            | <customerName> |
	When User find 'Co-editing' value in 'Product' column of 'license-support-purchase-search-result' table and clicks 'Edit' button
	Then 'license-purchase-dialog' dialog is displayed to User
	When User enter '-10' value in the 'seats' field of 'license-purchase-dialog' dialog
	When User clicks 'Submit' button in 'license-purchase-dialog' dialog
	Then 'Total seats cannot be lower than currently used seats.' text message is displayed in toast container
	Then 'license-purchase-dialog' dialog is displayed to User
	When User enter '15' value in the 'seats' field of 'license-purchase-dialog' dialog
	When User clicks 'Submit' button in 'license-purchase-dialog' dialog
	Then 'license-purchase-dialog' dialog is not displayed to User
	Then Rows with following values is displayed in 'license-support-purchase-search-result' table:
		| ColumnName       | Value          |
		| Product          | Co-editing     |
		| Type             | enterprise     |
		| Expiration Date  | D(10)          |
		| Seats Used/Total | 0/15           |
		| Owner            | <customerName> |
	#Admin portal
	When User redirect by reglink for '<customerName>' customer
	When User provides the Login and Password of Customer Admin Portal and clicks on the Sign In button
	Then User sees '<customerName> Admin Home' page header
	Then Rows with following values is displayed in 'admin-home-purchases' table:
		| ColumnName       | Value      |
		| Product          | Co-editing |
		| Seats Used/Total | 0/15       |
	#Sales portal
	Then following information about 'COEDIT' purchase for customer '<customerName>' is displayed in Sales portal via Api
		| UsedSeats | Seats | EndDateIso |
		| 0         | 15    | D(10)      |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @LisenseSupport @Edit @QA @Staging @Qase[LICENSE-137] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @Upd_Qase
Scenario: Change_the_expiry_date_to_past_date 
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type      |
		| <customerName> | standarde |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId   | EndDate |
		| <customerName> | 1     | MSTEAMSVIEW | D(10)   |
	#Support portal
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	When User waits for data loading
	When User selects 'Purchases' search option on Action panel
	When User enters '<customerName>' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'license-support-purchase-search-result' table:
		| ColumnName       | Value                        |
		| Product          | MindManager Teams App Viewer |
		| Type             | standarde                    |
		| Expiration Date  | D(10)                        |
		| Seats Used/Total | 0/1                          |
		| Owner            | <customerName>               |
	When User find 'MindManager Teams App Viewer' value in 'Product' column of 'license-support-purchase-search-result' table and clicks 'Edit' button
	Then 'D(10)' value is displayed to the 'end_date' field of 'license-purchase-dialog' dialog
	When User enter 'D(-3)' value in the 'end_date' field of 'license-purchase-dialog' dialog
	When User clicks 'Submit' button in 'license-purchase-dialog' dialog
	Then Rows with following values is displayed in 'license-support-purchase-search-result' table:
		| ColumnName       | Value                        |
		| Product          | MindManager Teams App Viewer |
		| Type             | standarde                    |
		| Expiration Date  | D(-3)                        |
		| Seats Used/Total | 0/1                          |
		| Owner            | <customerName>               |
	#Admin portal
	When User redirect by reglink for '<customerName>' customer
	When User provides the Login and Password of Customer Admin Portal and clicks on the Sign In button
	Then User sees '<customerName> Admin Home' page header
	Then Rows with following values is displayed in 'admin-home-purchases' table:
		| ColumnName       | Value                        |
		| Product          | MindManager Teams App Viewer |
		| License Status   | Expired                      |
		| Expires          | D(-3)                        |
		| Seats Used/Total | 0/1                          |
	#Sales portal
	Then following information about 'MSTEAMSVIEW' purchase for customer '<customerName>' is displayed in Sales portal via Api
		| UsedSeats | Seats | EndDateIso |
		| 0         | 1     | D(-3)      |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @LisenseSupport @Edit @QA @Staging @Qase[LICENSE-137] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @Upd_Qase
Scenario: Change_the_expiry_date_to_future_date
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId   | EndDate |
		| <customerName> | 1     | MSTEAMSVIEW | D(1)    |
	#Support portal
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	When User waits for data loading
	When User selects 'Purchases' search option on Action panel
	When User enters '<customerName>' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'license-support-purchase-search-result' table:
		| ColumnName       | Value                        |
		| Product          | MindManager Teams App Viewer |
		| Type             | enterprise                   |
		| Expiration Date  | D(1)                         |
		| Seats Used/Total | 0/1                          |
		| Owner            | <customerName>               |
	When User find 'MindManager Teams App Viewer' value in 'Product' column of 'license-support-purchase-search-result' table and clicks 'Edit' button
	Then 'D(1)' value is displayed to the 'end_date' field of 'license-purchase-dialog' dialog
	When User enter 'D(30)' value in the 'end_date' field of 'license-purchase-dialog' dialog
	When User clicks 'Submit' button in 'license-purchase-dialog' dialog
	Then Rows with following values is displayed in 'license-support-purchase-search-result' table:
		| ColumnName       | Value                        |
		| Product          | MindManager Teams App Viewer |
		| Type             | enterprise                   |
		| Expiration Date  | D(30)                        |
		| Seats Used/Total | 0/1                          |
		| Owner            | <customerName>               |
	#Admin portal
	When User redirect by reglink for '<customerName>' customer
	When User provides the Login and Password of Customer Admin Portal and clicks on the Sign In button
	Then User sees '<customerName> Admin Home' page header
	Then Rows with following values is displayed in 'admin-home-purchases' table:
		| ColumnName       | Value                        |
		| Product          | MindManager Teams App Viewer |
		| License Status   | Active                       |
		| Expires          | D(30)                        |
		| Seats Used/Total | 0/1                          |
	#Sales portal
	Then following information about 'MSTEAMSVIEW' purchase for customer '<customerName>' is displayed in Sales portal via Api
		| UsedSeats | Seats | EndDateIso |
		| 0         | 1     | D(30)      |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @LisenseSupport @Edit @QA @Staging @Qase[LICENSE-138] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @Upd_Qase
Scenario: Reset_Admin_Registration
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 2     | MMTRIAL   | D(1)    |
	#Support portal
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	When User waits for data loading
	When User selects 'Customer Search' search option on Action panel
	When User enters '<customerName>' value in the 'search-input' field on Action panel
	When User find '<customerName>' value in 'Customer' column of 'license-support-tenant-search-result' table and clicks 'Reset Admin Registration' button
	Then 'reset-admin-registration-dialog' dialog is displayed to User
	Then 'Warning' header is displayed in 'reset-admin-registration-dialog' dialog
	When User clicks 'Cancel' button in 'reset-admin-registration-dialog' dialog
	Then 'reset-admin-registration-dialog' dialog is not displayed to User
	When User find '<customerName>' value in 'Customer' column of 'license-support-tenant-search-result' table and clicks 'Reset Admin Registration' button
	Then 'reset-admin-registration-dialog' dialog is displayed to User
	When User clicks 'Yes, Reset Admin Registration' button in 'reset-admin-registration-dialog' dialog
	Then 'Admin Registration reset, registration link copied.' text message is displayed in toast container
	Then value is copied to the clipboard
	When User opens link from clipboard in new browser tab
	Then Right Side panel is displayed
	When User provides the Login and Password of Customer Admin Portal and clicks on the Sign In button
	Then User sees '<customerName> Admin Home' page header

Examples:
	| customerName        |
	| Automation_testSRND |