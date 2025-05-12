@retry(2)
Feature: EmailInvitation_None_Existing_Account
Check that files can be shared on MM Cloud

Background: Pre-condition
	Given User is logged into MindManager web app via Api
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User

@MindManager @MindManagerCloud @EmailInvitation @App_QA @Cleanup @Qase[WEB-2091] @Upd_Qase
Scenario: Verify_that_primary_CTA_on_opening_email_when_user_is_not_sign_in_QA
	When User shares 'auto_test_SRND.mmap' MindManager cloud file with 'rw' permission to 'auto.test+SRND@mindmanager.onmicrosoft.com' user email via API
	When User openes 'chrome' browser
	When User switches to '1' browser
	When 'auto.test+SRND@mindmanager.onmicrosoft.com' User opens 'auto_test_SRND' shared link from outlook email inbox
	When User switches to '1' tab
	When User waits for data loading
	When User accepts Optanon cookies
	When User clicks 'Web' hyperlink
	When User switches to '2' tab
	Then 'Create Account' button is displayed
	Then 'auto.test+SRND@mindmanager.onmicrosoft.com' email is displayed in the SignUp from Shared File email field
	Then hyperlink 'login-link' is displayed
	Then text 'automation.mj.qa@gmail.com shared the file "auto_test_SRND".' is displayed on the SignUp from Shared File page

@MindManager @MindManagerCloud @EmailInvitation @App_Staging @Cleanup @Qase[WEB-2091] @Upd_Qase
Scenario: Verify_that_primary_CTA_on_opening_email_when_user_is_not_sign_in_Staging
	When User shares 'auto_test_SRND.mmap' MindManager cloud file with 'rw' permission to 'auto.test+SRND@mindmanager.onmicrosoft.com' user email via API
	When User openes 'chrome' browser
	When User switches to '1' browser
	When 'auto.test+SRND@mindmanager.onmicrosoft.com' User opens 'auto_test_SRND' shared link from outlook email inbox
	When User switches to '1' tab
	When User waits for data loading
	When User accepts Optanon cookies
	When User clicks 'Web' hyperlink
	When User switches to '2' tab
	Then 'Create Account' button is displayed
	Then 'auto.test+SRND@mindmanager.onmicrosoft.com' email is displayed in the SignUp from Shared File email field
	Then hyperlink 'login-link' is displayed
	Then text 'automation.mj.s@gmail.com shared the file "auto_test_SRND".' is displayed on the SignUp from Shared File page