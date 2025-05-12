@retry(2)
Feature: EmailInvitations
Check that files can be shared on MM Cloud

Background: Pre-condition
	Creating an account in the MM app
	Given User account
		| Email                                      | Password   |
		| auto.test+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Creating Customer on Sales portal
	When User creates new Customer on Sales portal via Api
		| Name                | Type       |
		| Automation_testSRND | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName        | Seats | ProductId      | EndDate |
		| Automation_testSRND | 2     | MMSUBSCRIPTION | D(10)   |
	When User is logged in to 'Automation_testSRND' customer on Admin portal via Api
	When admin 'Automation_testSRND' accepts BULA terms via API
	When 'Automation_testSRND' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails                                     |
		| add        | MMSUBSCRIPTION | auto.test+SRND@mindmanager.onmicrosoft.com |
	When User refresh page
	When User open new tab in browser
	Given User is logged into 'auto.test+SRND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given User is logged into MindManager web app via Api
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User

@MindManager @MindManagerCloud @EmailInvitation @App_QA @App_Staging @Cleanup @Qase[WEB-2089] @Upd_Qase
Scenario: Verify_that_the_access_to_the_map_is_provided_immediately_when_user_is_signedin_with_view_edit_rights
	When User shares 'auto_test_SRND.mmap' MindManager cloud file with 'rw' permission to 'auto.test+SRND@mindmanager.onmicrosoft.com' user email via API
	When User switches to '0' browser
	When 'auto.test+SRND@mindmanager.onmicrosoft.com' User opens 'auto_test_SRND' shared link from outlook email inbox
	When User switches to '2' tab
	When User waits for data loading
	When User clicks 'Web' button
	When User switches to '3' tab
	Then Web Editor page is displayed to the User
	Then 'auto_test_SRND' map name is displayed on Toolbar
	
@MindManager @MindManagerCloud @EmailInvitation @App_QA @App_Staging @Cleanup @Qase[WEB-2090] @Upd_Qase @JIRA[MMCV-10385]
Scenario: Verify_that_the_access_to_the_map_is_denied_to_user_without_permissions_to_the_file
	When User shares 'auto_test_SRND.mmap' MindManager cloud file with 'rw' permission to 'auto.test+SRND@mindmanager.onmicrosoft.com' user email via API
	When User openes 'chrome' browser
	When User switches to '2' browser
	Given '1' User is logged into MindManager web app via Api
	When 'auto.test+SRND@mindmanager.onmicrosoft.com' User opens 'auto_test_SRND' shared link from outlook email inbox
	When User switches to '1' tab
	When User waits for data loading
	When User clicks 'Web' button
	When User switches to '2' tab
	Then message 'Insufficient Permissions. You do not have permission to view this file.' is displayed to User on page
	
@MindManager @MindManagerCloud @EmailInvitation @App_QA @Cleanup @Qase[WEB-2092] @Upd_Qase
Scenario: Verify_that_Secondary_CTA_on_opening_email_when_user_is_not_sign_in_QA
	When User shares 'auto_test_SRND.mmap' MindManager cloud file with 'rw' permission to 'auto.test+SRND@mindmanager.onmicrosoft.com' user email via API
	When User openes 'chrome' browser
	When User switches to '2' browser
	When 'auto.test+SRND@mindmanager.onmicrosoft.com' User opens 'auto_test_SRND' shared link from outlook email inbox
	When User switches to '1' tab
	When User accepts Optanon cookies
	When User waits for data loading
	When User clicks 'Web' hyperlink
	When User switches to '2' tab
	When User waits for data loading
	Then text 'automation.mj.qa@gmail.com shared the file "auto_test_SRND".' is displayed on the SignUp from Shared File page
	Then hyperlink 'login-link' is displayed
	When User clicks 'login-link' hyperlink

@MindManager @MindManagerCloud @EmailInvitation @App_Staging @Cleanup @Qase[WEB-2092] @Upd_Qase
Scenario: Verify_that_Secondary_CTA_on_opening_email_when_user_is_not_sign_in_Staging
	When User shares 'auto_test_SRND.mmap' MindManager cloud file with 'rw' permission to 'auto.test+SRND@mindmanager.onmicrosoft.com' user email via API
	When User openes 'chrome' browser
	When User switches to '2' browser
	When 'auto.test+SRND@mindmanager.onmicrosoft.com' User opens 'auto_test_SRND' shared link from outlook email inbox
	When User switches to '1' tab
	When User accepts Optanon cookies
	When User waits for data loading
	When User clicks 'Web' hyperlink
	When User switches to '2' tab
	When User waits for data loading
	Then text 'automation.mj.s@gmail.com shared the file "auto_test_SRND".' is displayed on the SignUp from Shared File page
	Then hyperlink 'login-link' is displayed
	When User clicks 'login-link' hyperlink