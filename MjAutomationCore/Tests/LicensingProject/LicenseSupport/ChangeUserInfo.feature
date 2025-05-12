@retry(2)
Feature: ChangeUserInfo
Check Change User Info functionality

Background: Pre-condition
	Given User account
		| Email                                        | Password   |
		| auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name                | Type       |
		| Automation_testSRND | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName        | Seats | ProductId      | EndDate |
		| Automation_testSRND | 1     | MMSUBSCRIPTION | D(2)    |
	#Admin portal
	When User is logged in to 'Automation_testSRND' customer on Admin portal via Api
	When 'Automation_testSRND' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails                                       |
		| add        | MMSUBSCRIPTION | auto.test_1+SRND@mindmanager.onmicrosoft.com |
	When admin 'Automation_testSRND' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	#Support portal
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	Then 'User Search' search option is selected on Action panel
	When User enters 'auto.test_1+SRND@mindmanager.onmicrosoft.com' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'license-support-user-search-result' table:
		| ColumnName     | Value                                        |
		| User           | auto.test_1+SRND@mindmanager.onmicrosoft.com |
		| Name           | Automation Automation                        |
		| Products       | 1                                            |
		| Email Verified | Yes                                          |
		| Last Active    | D(0)                                         |
	When User find 'auto.test_1+SRND@mindmanager.onmicrosoft.com' value in 'User' column of 'license-support-user-search-result' table and clicks 'Details' button

@Licensing @LisenseSupport @UserDetails @QA @Staging @Qase[LICENSE-148] @Cleanup @Upd_Qase @JIRA[MMCV-9293,MMCV-10397,MMCV-10518]
Scenario: First_name
	When User clicks 'Change User Info' button
	Then 'license-user' dialog is displayed to User
	Then 'Automation' value is displayed to the 'first_name' field of 'license-user' dialog
	When User enter 'automation first name' value in the 'first_name' field of 'license-user' dialog
	Then 'automation first name' value is displayed to the 'first_name' field of 'license-user' dialog
	When User clicks 'Submit' button in 'license-user' dialog
	Then 'Success. User updated.' text message is displayed in toast container
	When User clicks 'Back' button
	When User enters '<emailAddress>' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'license-support-user-search-result' table:
		| ColumnName     | Value                            |
		| User           | <emailAddress>                   |
		| Name           | automation first name Automation |
		| Products       | 1                                |
		| Email Verified | Yes                              |
		| Last Active    | D(0)                             |
	#Mind Manager
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	Then file manager header page is displayed to User
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	Then header 'Account Details' is displayed on page
	Then User Name 'automation first name' is displayed in 'ACCOUNT NAME' subsection in 'General' section on Account Details page

Examples:
	| customerName        | emailAddress                                 |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com |

@Licensing @LisenseSupport @UserDetails @QA @Staging @Qase[LICENSE-148] @Cleanup @Upd_Qase @JIRA[MMCV-9293,MMCV-10518]
Scenario: Last_name
	When User clicks 'Change User Info' button
	Then 'license-user' dialog is displayed to User
	Then 'Automation' value is displayed to the 'last_name' field of 'license-user' dialog
	When User enter 'automation last name' value in the 'last_name' field of 'license-user' dialog
	Then 'automation last name' value is displayed to the 'last_name' field of 'license-user' dialog
	When User clicks 'Submit' button in 'license-user' dialog
	Then 'Success. User updated.' text message is displayed in toast container
	When User clicks 'Back' button
	When User enters '<emailAddress>' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'license-support-user-search-result' table:
		| ColumnName     | Value                           |
		| User           | <emailAddress>                  |
		| Name           | Automation automation last name |
		| Products       | 1                               |
		| Email Verified | Yes                             |
	#Mind Manager
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	Then file manager header page is displayed to User
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	Then header 'Account Details' is displayed on page
	Then User Name 'automation last name' is displayed in 'ACCOUNT NAME' subsection in 'General' section on Account Details page

Examples:
	| customerName        | emailAddress                                 |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com |

@Licensing @LisenseSupport @UserDetails @QA @Staging @Qase[LICENSE-148] @Cleanup @JIRA[MMCV-6821,MMCV-10518]
Scenario: Verify_that_the_support_representative_can_update_the_customer_info_for_regular_client
	When User clicks 'Change User Info' button
	Then 'license-user' dialog is displayed to User
	Then '<emailAddress>' value is displayed to the 'email' field of 'license-user' dialog
	When User enter 'automation.mj.fp@gmail.com' value in the 'email' field of 'license-user' dialog
	Then 'automation.mj.fp@gmail.com' value is displayed to the 'email' field of 'license-user' dialog
	When User clicks 'Submit' button in 'license-user' dialog
	Then 'This email already exists for another user' text message is displayed in toast container
	Then '<emailAddress>' value is displayed to the 'email' field of 'license-user' dialog
	When User enter '<newEmailAddress>' value in the 'email' field of 'license-user' dialog
	Then '<newEmailAddress>' value is displayed to the 'email' field of 'license-user' dialog
	When User clicks 'Submit' button in 'license-user' dialog
	Then 'Success. User updated.' text message is displayed in toast container
	When User clicks 'Back' button
	When User enters '<newEmailAddress>' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'license-support-user-search-result' table:
		| ColumnName     | Value                 |
		| User           | <newEmailAddress>     |
		| Name           | Automation Automation |
		| Products       | 1                     |
		| Email Verified | Yes                   |
		| Last Active    | D(0)                  |

Examples:
	| customerName        | emailAddress                                 | newEmailAddress                             |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com | auto.test_1+RND@mindmanager.onmicrosoft.com |