@retry(2)
Feature: AdminPortal
Verify analytics options in Admin Portal

@MindManager @Analytics @QA @App_QA @Staging @App_Staging @Qase[WEB-15] @Cleanup @Upd_Qase
Scenario: Verify_The_BULA_Dialog_Is_Displayed_To_The_Admin_On_First_Home_Page_Visiting
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 3     | MMSUBSCRIPTION | D(1)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	Then 'analytics-opt-in-dialog' dialog is not displayed to User
	Then 'bula-dialog' dialog is displayed to User
	When User checks checkbox by label 'I accept the terms in the Business User License Agreement on behalf of my organization *' on 'bula-dialog' dialog
	Then checkbox by label 'I accept the terms in the Business User License Agreement on behalf of my organization *' is checked on 'bula-dialog' dialog
	Then 'Continue' button is enabled on 'bula-dialog' dialog
	When User clicks 'Continue' button in 'bula-dialog' dialog
	Then 'bula-dialog' dialog is not displayed to User
	Then 'analytics-opt-in-dialog' dialog is not displayed to User
	Then User sees '<customerName> Admin Home' page header

Examples:
	| customerName        |
	| Automation_testSRND |

@MindManager @Analytics @QA @App_QA @Staging @App_Staging @Qase[WEB-16] @Cleanup @Upd_Qase @JIRA[MMCV-9014]
Scenario: Verify_Analytics_Opt_In_Dialog_Is_Displayed_To_The_Admin_On_Second_Home_Page_Visiting
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 3     | MMSUBSCRIPTION | D(1)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	Then 'analytics-opt-in-dialog' dialog is not displayed to User
	When User accepts Optanon cookies
	Then User sees '<customerName> Admin Home' page header
	#User log in on the second time
	Given User is on Customer Admin Portal website
	When User provides the Login and Password of Customer Admin Portal and clicks on the Sign In button
	Then User sees 'Customer Admin Portal' page header
	When User accepts Optanon cookies
	When User find '<customerName>' value in 'Customer' column of 'admin-choose-tenants' table and clicks 'Administrate' button
	Then 'analytics-opt-in-dialog' dialog is displayed to User

Examples:
	| customerName        | emailAddress                                 |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com |

@MindManager @Analytics @QA @App_QA @Staging @App_Staging @Qase[WEB-17] @Cleanup @Upd_Qase
Scenario: Verify_Analytics_Opt_In_Dialog_Is_Displayed_To_The_Admin_On_Second_Home_Page_Settings
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 3     | MMSUBSCRIPTION | D(1)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	Then 'analytics-opt-in-dialog' dialog is not displayed to User
	Then 'bula-dialog' dialog is displayed to User
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User clicks 'Settings' button
	Then 'analytics-opt-in-dialog' dialog is displayed to User
	When User close 'analytics-opt-in-dialog' dialog
	Then User sees '<customerName> Settings' page header

Examples:
	| customerName        |
	| Automation_testSRND |