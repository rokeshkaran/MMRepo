@retry(2)
Feature: Captcha

Background: Pre-condition
	Given User is on the Mindmanager website without captcha key
	Then Right Side panel is displayed
	Then User sees 'Welcome' header on Right Side panel

@MindManager @Account @Captcha @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Cleanup @Qase[WEB-42] @Upd_Qase @Not_Run
#This test excluded from test-run because the functionality is disabled by devs.
Scenario Outline: Scripted_account_creation
	When User clicks 'Create Account' button
	When User fills account creation fields for new UI
		| Email          | FullName       | Password  |
		| <emailAddress> | Automation_RND | TYf78!RND |
	When User clicks 'Create Account' button
	Then Error message with text 'Your account activity was flagged for verification, please refresh and try again.' is displayed to the User

Examples:
	| emailAddress                   |
	| SRNDMindManager@mailinator.com |

@MindManager @Account @Captcha @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Qase[WEB-44] @Upd_Qase @Not_Run
Scenario Outline: Scripted_sign_in
#This test excluded from test-run because the functionality is disabled by devs.
	When User provides the Login and Password and clicks on the Sign In button
	Then Error message with text 'Your account activity was flagged for verification, please refresh and try again.' is displayed to the User
	Then file manager header page is displayed to User