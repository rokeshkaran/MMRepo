@retry(2)
Feature: View_Account_Details
Check View Account Details functionality

@MindManager @Via_Accounts_Details @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Qase[WEB-140] @Upd_Qase
Scenario: Check_that_user_is_able_to_view_their_account_details
	Given User is logged into MindManager web app via Api
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	Then header 'Account Details' is displayed on page
	Then 'General' section is displayed on Account Details page
	Then 'My Products' section is displayed on Account Details page
	Then 'Settings' section is displayed on Account Details page
	Then checkbox 'Yes! I would like to receive in-product offers' is unchecked in 'Settings' section on Account Details page
	Then checkbox 'Help make MindManager better' is checked in 'Settings' section on Account Details page

@MindManager @Via_Accounts_Details @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Qase[WEB-141] @Upd_Qase
Scenario: Check_that_it_is_possible_to_show_and_hide_email
	Given User is logged into MindManager web app via Api
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	Then header 'Account Details' is displayed on page
	Then Email address is hidden in 'EMAIL' subsection in 'General' section on Account Details page
	Then Toggle Email icon is hidden in 'EMAIL' subsection in 'General' section on Account Details page
	When User clicks Toggle Email icon in 'EMAIL' subsection in 'General' section on Account Details page
	Then Email address is displayed fully in 'EMAIL' subsection in 'General' section on Account Details page
	Then Toggle Email icon changes to 'show-eye' in 'EMAIL' subsection in 'General' section on Account Details page
	When User clicks Toggle Email icon in 'EMAIL' subsection in 'General' section on Account Details page
	Then Email address is hidden in 'EMAIL' subsection in 'General' section on Account Details page
	Then Toggle Email icon changes to 'hide-eye' in 'EMAIL' subsection in 'General' section on Account Details page
   
@MindManager @Via_Accounts_Details @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-150] @Health_Check @Upd_Qase
Scenario: Check_that_ipm_setting_is_hidden_on_account-details_page_for_user_with_trial_license
	Given User account
		| Email                                | Password   |
		| user.SRND@mindmanager.auto.tests.com | 6j9k2!SRND |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	Given User is logged into 'user.SRND@mindmanager.auto.tests.com' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	Then 'Start Free Trial' button is displayed
	When User clicks 'Start Free Trial' button
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	Then header 'Account Details' is displayed on page
	Then 'Settings' section is not displayed on Account Details page

@MindManager @Via_Accounts_Details @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Qase[WEB-152] @Upd_Qase
Scenario: Check_that_hovering_on_ipm_learnmore_text_shows_a_tooltip
	Given User is logged into MindManager web app via Api
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	Then header 'Account Details' is displayed on page
	When User mouses over 'Learn more' link in row with 'Yes! I would like to receive in-product offers' label in 'Settings' section on Account Details page
	Then tooltip with content 'Keep up-to-date with our exclusive offers and more!Change your mind? Simply uncheck the box to update your preferences.' is displayed for 'Learn more' link of row with 'Yes! I would like to receive in-product offers' label in 'Settings' section on Account Details page

@MindManager @Via_Accounts_Details @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Qase[WEB-153] @Upd_Qase
Scenario: Check_that_hovering_on_analytics_learnmore_text_shows_a_tooltip
	Given User is logged into MindManager web app via Api
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	Then header 'Account Details' is displayed on page
	When User mouses over 'Learn more' link in row with 'Help make MindManager better' label in 'Settings' section on Account Details page
	Then tooltip with content 'We need your permission to collect anonymous data about how you use MindManager.We use this data only to understand which features are used most often so we can focus our efforts in those areas. We never share or sell this data and it can never be used to identify you.' is displayed for 'Learn more' link of row with 'Help make MindManager better' label in 'Settings' section on Account Details page

@MindManager @Via_Accounts_Details @QA @App_QA @Staging @App_Staging @Qase[WEB-144] @Upd_Qase
Scenario: Verify_product_statuses_are_displayed_correctly_on_Account_details_page
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
		| <customerName> | 1     | MMSUBSCRIPTION | D(1)    |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId   | EndDate |
		| <customerName> | 1     | MSTEAMSEDIT | D(1)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Subscription' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters '<emailAddress>' value in the 'email' field in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                    |
		| Version          | MindManager Subscription |
		| Expires          | D(1)                     |
		| Seats Used/Total | 1/1                      |
	When User clicks 'Back' button
	When User find 'MindManager Teams App' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Teams App' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters '<emailAddress>' value in the 'email' field in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                 |
		| Version          | MindManager Teams App |
		| Expires          | D(1)                  |
		| Seats Used/Total | 1/1                   |
	When User updates 'MSTEAMSEDIT' purchase data for '<customerName>' customer in Sales portal via Api
		| EndDate |
		| D(-1)   |
	#MM app
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	Then header 'Account Details' is displayed on page
	Then header 'My Products' is displayed on page
	Then product 'MindManager Subscription' is displayed with status 'Active' in 'My Products' section on Account Details page
	Then product 'MindManager Teams App' is displayed with status 'Expired' in 'My Products' section on Account Details page

Examples:
	| customerName        | emailAddress                                 | password   |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |

@MindManager @Via_Accounts_Details @QA @App_QA @Staging @App_Staging @Qase[WEB-146] @Upd_Qase @JIRA[MMCV-10397,MMCV-10518]
Scenario: Verify_expiration_date_is_displayed_on_account_details_page
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
		| <customerName> | 1     | MMSUBSCRIPTION | D(1)    |
	#Support portal
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	When User selects 'Purchases' search option on Action panel
	When User enters '<customerName>' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'license-support-purchase-search-result' table:
		| ColumnName       | Value                    |
		| Product          | MindManager Subscription |
		| Type             | enterprise               |
		| Expiration Date  | D(1)                     |
		| Seats Used/Total | 0/1                      |
		| Owner            | <customerName>           |
	When User find 'MindManager Subscription' value in 'Product' column of 'license-support-purchase-search-result' table and clicks 'Edit' button
	Then 'D(1)' value is displayed to the 'end_date' field of 'license-purchase-dialog' dialog
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Subscription' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters '<emailAddress>' value in the 'email' field in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                    |
		| Version          | MindManager Subscription |
		| Expires          | D(1)                     |
		| Seats Used/Total | 1/1                      |
	#MM app
	When User open new tab in browser
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	Then header 'Account Details' is displayed on page
	Then header 'My Products' is displayed on page
	Then product 'MindManager Subscription' is displayed with status 'Active' in 'My Products' section on Account Details page
	When User clicks on Toggle arrow button for product name 'MindManager Subscription' in 'My Products' section on Account Details page
	Then content row with header 'Expires' and date 'D(1)' is displayed for 'MindManager Subscription' product in 'My Products' section on the Account Details page
	Then collapsible content is visible in 'MindManager Subscription' product in 'My Products' section on Account Details page
	When User clicks on Toggle arrow button for product name 'MindManager Subscription' in 'My Products' section on Account Details page
	Then collapsible content is not visible in 'MindManager Subscription' product in 'My Products' section on Account Details page

Examples:
	| customerName        | emailAddress                                 | password   |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |