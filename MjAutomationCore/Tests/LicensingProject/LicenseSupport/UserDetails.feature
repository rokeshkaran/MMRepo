@retry(2)
Feature: UserDetails
Check User Details functionality

Background: Pre-condition
	#Creating an account in the MM app
	Given User account
		| Email                                        | Password   |
		| auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name                | Type     |
		| Automation_testSRND | standard |
	When User creates new Purchase on Sales portal via Api
		| CustomerName        | Seats | ProductId | EndDate |
		| Automation_testSRND | 2     | MMTRIAL   | D(1)    |
	#Admin portal
	When User is logged in to 'Automation_testSRND' customer on Admin portal via Api
	When 'Automation_testSRND' Admin makes subscription action via API
		| ActionType | PurchaseId | Emails                                       |
		| add        | MMTRIAL    | auto.test_1+SRND@mindmanager.onmicrosoft.com |
	When admin 'Automation_testSRND' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies

@Licensing @LisenseSupport @UserDetails @QA @Staging @Qase[LICENSE-141] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @Upd_Qase
Scenario: User_Lisense_Details_screen
	#Support portal
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	When User enters '<emailAddress>' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'license-support-user-search-result' table:
		| ColumnName     | Value                 |
		| User           | <emailAddress>        |
		| Name           | Automation Automation |
		| Products       | 1                     |
		| Email Verified | Yes                   |
		| Last Active    | D(0)                  |
	When User find '<emailAddress>' value in 'User' column of 'license-support-user-search-result' table and clicks 'Details' button
	Then User sees 'License Support / User Search / <emailAddress>' page header
	Then Rows with following values is displayed in 'license-support-user-details-subscriptions' table:
		| ColumnName     | Value             |
		| Product        | MindManager Trial |
		| License Status | Active            |
		| Expires        | D(1)              |
		| Owner          | N/A               |
		| User Status    | Active            |
		| Device         | N/A               |
	Then 'Change User Info' button is displayed
	Then 'Get Password Reset Link' button is displayed
	When User clicks 'Back' button
	Then 'license-support-user-details-subscriptions' table is not displayed to User
	Then User sees 'License Support' page header
	Then Rows with following values is displayed in 'license-support-user-search-result' table:
		| ColumnName     | Value                 |
		| User           | <emailAddress>        |
		| Name           | Automation Automation |
		| Products       | 1                     |
		| Email Verified | Yes                   |
		| Last Active    | D(0)                  |

Examples:
	| emailAddress                                 | customerName        |
	| auto.test_1+SRND@mindmanager.onmicrosoft.com | Automation_testSRND |

@Licensing @LisenseSupport @UserDetails @QA @Staging @Qase[LICENSE-146] @Cleanup @JIRA[MMCV-6852,MMCV-10518] @Upd_Qase
Scenario: Get_Reset_password_link
	#Support portal
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	When User enters '<emailAddress>' value in the 'search-input' field on Action panel
	When User find '<emailAddress>' value in 'User' column of 'license-support-user-search-result' table and clicks 'Details' button
	Then Rows with following values is displayed in 'license-support-user-details-subscriptions' table:
		| ColumnName     | Value             |
		| Product        | MindManager Trial |
		| License Status | Active            |
		| Expires        | D(1)              |
		| Owner          | N/A               |
		| User Status    | Active            |
		| Device         | N/A               |
	When User clicks 'Get Password Reset Link' button
	Then 'Password Reset Link Copied.' text message is displayed in toast container
	Then value is copied to the clipboard
	When User opens link from clipboard in new browser tab
	Then Right Side panel is displayed
	Then User sees 'Reset Password' header on Right Side panel
	When User enters '12345678' in the 'password' field
	When User enters '12345678' in the 'confirm_password' field
	When User clicks 'Set New Password' button
	Then User sees 'Sign In' header on Right Side panel
	Then User sees 'Please enter your details below.' text messege on Right Side panel
	When User enters '<emailAddress>' in the 'email' field
	When User enters 'zxcvbnm,./!1' in the 'password' field
	When User clicks 'Sign In' button
	Then User sees 'Success!' header on Right Side panel
	Then User sees 'Your MindManager account is connected. Please close this window to continue.' text messege on Right Side panel
	When User clicks 'Done' button
	Then file manager header page is displayed to User
	When User clicks arrow down on 'fileManagerHeader' user panel
	Then following items is displayed in 'user-panel' dropdown menu
		| items           |
		| Sign Out        |
		| Account Details |
	When User clicks 'Sign Out' item in 'user-panel' dropdown menu
	Then Right Side panel is displayed

Examples:
	| emailAddress                                 | customerName        |
	| auto.test_1+SRND@mindmanager.onmicrosoft.com | Automation_testSRND |

@Licensing @LisenseSupport @UserDetails @QA @Staging @Qase[LICENSE-143] @Cleanup @JIRA[MMCV-5307,MMCV-9486,MMCV-9707,MMCV-10397,MMCV-10518] @Upd_Qase
Scenario: Extend_trial
	#Sales portal
	When User updates 'MMTRIAL' purchase data for '<customerName>' customer in Sales portal via Api
		| EndDate |
		| D(-1)   |
	#Support portal
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	Then 'User Search' search option is selected on Action panel
	When User enters '<emailAddress>' value in the 'search-input' field on Action panel
	When User find '<emailAddress>' value in 'User' column of 'license-support-user-search-result' table and clicks 'Details' button
	Then Rows with following values is displayed in 'license-support-user-details-subscriptions' table:
		| ColumnName     | Value             |
		| Product        | MindManager Trial |
		| License Status | Expired           |
		| Expires        | D(-1)             |
		| Owner          | N/A               |
		| User Status    | Active            |
		| Device         | N/A               |
	Then 'MindManager Trial' row of 'Product' column of 'license-support-user-details-subscriptions' table has 'D(-1)' value highlighted red color in 'Expires' column
	When User find 'MindManager Trial' value of 'Product' column of 'license-support-user-details-subscriptions' table and select 'Add 7 days' value in 'Expires' column
	Then Rows with following values is displayed in 'license-support-user-details-subscriptions' table:
		| ColumnName     | Value             |
		| Product        | MindManager Trial |
		| License Status | Active            |
		| Expires        | D(6)              |
		| Owner          | N/A               |
		| User Status    | Active            |
		| Device         | N/A               |
	When User find 'MindManager Trial' value of 'Product' column of 'license-support-user-details-subscriptions' table and select 'Add 14 days' value in 'Expires' column
	Then Rows with following values is displayed in 'license-support-user-details-subscriptions' table:
		| ColumnName     | Value             |
		| Product        | MindManager Trial |
		| License Status | Active            |
		| Expires        | D(20)             |
		| Owner          | N/A               |
		| User Status    | Active            |
		| Device         | N/A               |
	When User find 'MindManager Trial' value of 'Product' column of 'license-support-user-details-subscriptions' table and select 'Add 30 days' value in 'Expires' column
	Then Rows with following values is displayed in 'license-support-user-details-subscriptions' table:
		| ColumnName     | Value             |
		| Product        | MindManager Trial |
		| License Status | Active            |
		| Expires        | D(50)             |
		| Owner          | N/A               |
		| User Status    | Active            |
		| Device         | N/A               |

Examples:
	| emailAddress                                 | customerName        |
	| auto.test_1+SRND@mindmanager.onmicrosoft.com | Automation_testSRND |

@Licensing @LisenseSupport @UserDetails @QA @Staging @Qase[LICENSE-145] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @Upd_Qase
Scenario: Check_the_possibility_to_change_User_status_on_Deactivated
	#Support portal
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	Then 'User Search' search option is selected on Action panel
	When User enters '<emailAddress>' value in the 'search-input' field on Action panel
	When User find '<emailAddress>' value in 'User' column of 'license-support-user-search-result' table and clicks 'Details' button
	When User find 'MindManager Trial' value of 'Product' column of 'license-support-user-details-subscriptions' table and select 'Deactivated' value in 'User Status' column
	Then 'MindManager Trial' row of 'Product' column of 'license-support-user-details-subscriptions' table has 'deactivated' status
	#Admin portal
	When User open new tab in browser
	When User switches to '1' tab
	When User redirect by reglink for '<customerName>' customer
	When User provides the Login and Password of Customer Admin Portal and clicks on the Sign In button
	When User find 'MindManager Trial' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value             |
		| Version          | MindManager Trial |
		| Expires          | D(1)              |
		| Seats Used/Total | 0/2               |
	Then Rows with following values is displayed in 'admin-license-users' table:
		| ColumnName  | Value          |
		| User        | <emailAddress> |
		| User Status | Deactivated    |
		| Last Active | D(0)           |
	#MM app
	When User open new tab in browser
	When User switches to '2' tab
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	Then User sees 'Your MindManager Trial has expired.' header on Right Side panel
	Then User sees 'Please purchase to continue using MindManager.' subheader on Right Side panel

Examples:
	| emailAddress                                 | customerName        |
	| auto.test_1+SRND@mindmanager.onmicrosoft.com | Automation_testSRND |

@Licensing @LisenseSupport @UserDetails @QA @Staging @Qase[LICENSE-145] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @Upd_Qase
Scenario: Check_the_possibility_to_change_User_status_on_Remove
	#Support portal
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	Then 'User Search' search option is selected on Action panel
	When User enters '<emailAddress>' value in the 'search-input' field on Action panel
	When User find '<emailAddress>' value in 'User' column of 'license-support-user-search-result' table and clicks 'Details' button
	When User find 'MindManager Trial' value of 'Product' column of 'license-support-user-details-subscriptions' table and select 'Deactivated' value in 'User Status' column
	When User find 'MindManager Trial' value of 'Product' column of 'license-support-user-details-subscriptions' table and select 'Remove' value in 'User Status' column
	Then 'license-support-user-details-subscriptions' table does not have values
	#Admin portal
	When User open new tab in browser
	When User switches to '1' tab
	When User redirect by reglink for '<customerName>' customer
	When User provides the Login and Password of Customer Admin Portal and clicks on the Sign In button
	When User find 'MindManager Trial' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value             |
		| Version          | MindManager Trial |
		| Expires          | D(1)              |
		| Seats Used/Total | 0/2               |
	Then 'admin-license-users' table does not have values
	#MM app
	When User open new tab in browser
	When User switches to '2' tab
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	Then User sees 'You don't have a license to use this product.' header on Right Side panel
	Then User sees 'Good news! You're eligible for a free trial.' subheader on Right Side panel

Examples:
	| emailAddress                                 | customerName        |
	| auto.test_1+SRND@mindmanager.onmicrosoft.com | Automation_testSRND |

@Licensing @LisenseSupport @UserDetails @QA @Staging @Qase[LICENSE-142] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @Upd_Qase
Scenario: Copy_activation_code
	#Support portal
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	Then 'User Search' search option is selected on Action panel
	When User enters '<emailAddress>' value in the 'search-input' field on Action panel
	When User find '<emailAddress>' value in 'User' column of 'license-support-user-search-result' table and clicks 'Details' button
	When User find 'MindManager Trial' value in 'Product' column of 'license-support-user-details-subscriptions' table and clicks clipboard copy button in 'License Key' column
	Then 'Copied.' text message is displayed in toast container
	Then value is copied to the clipboard
	Then License key field is not editable in Admin panel table

Examples:
	| emailAddress                                 | customerName        |
	| auto.test_1+SRND@mindmanager.onmicrosoft.com | Automation_testSRND |