@retry(2)
Feature: ResetPasswordOnJoiningSession
Verification that it is possible to reset the password on joining the co-editing session

@MindManager @ResetPasswordOnJoiningSession @App_QA @App_Staging @App_Prod @Cleanup @ForgotPasswordEmailCleanup @Do_Not_Run_With_Forgot_Password @Qase[WEB-38] @Upd_Qase @JIRA[MMCV-9693]
Scenario: Reset_password_on_joining_session
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	#MM app
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Share' button on Tools panel
	When User clicks button with 'copy-link' name in 'share-contextmenu' menu
	Then Invite others to edit link is copied to clipboard
	#User create account to co-editing
	When User openes 'chrome' browser
	When User switches to '1' browser
	When '1' User opens shared map link in browser
	When User clicks 'Web' button
	When User switches to '1' tab
	Then Right Side panel is displayed
	When User clicks 'Sign In' button
	When User enters '<emailAddress>' in the 'email' field
	Then 'Forgot Password?' button is displayed
	When User clicks 'Forgot Password?' button
	Then User sees 'Forgot Password' header on Right Side panel
	Then User sees 'Please enter your email' text messege on Right Side panel
	Then 'Send Reset Link' button is displayed
	Then 'Cancel' button is displayed
	When User accepts Optanon cookies
	When User enters '<emailAddress>' in the 'email' field
	When User clicks 'Send Reset Link' button
	Then User sees 'Success' page header
	Then User sees 'If the user <emailAddress> exists in our system you'll receive an email with a link to reset your password soon.' text messege on Right Side panel
	Then 'Done' button is displayed
	When User clicks 'Done' button
	Then Right Side panel is displayed
	Then User sees 'Welcome' header on Right Side panel
	When User navigates the password reset link in the newly received email with 'MindManager: Reset Password' email title header
	Then User sees 'Reset Password' header on Right Side panel
	Then User sees 'Please enter new password' text messege on Right Side panel
	When User enters 'anrpw+SRND' in the 'password' field
	When User enters 'anrpw+SRND' in the 'confirm_password' field
	When User clicks 'Set New Password' button
	Then Right Side panel is displayed
	Then User sees 'Sign In' header on Right Side panel
	Then User sees 'Please enter your details below.' text messege on Right Side panel
	When User enters '<emailAddress>' in the 'email' field
	When User enters 'anrpw+SRND' in the 'password' field
	When User clicks 'Sign In' button
	Then Web Editor page is displayed to the User
	Then text 'FTCO' is displayed to the topic on Canvas

Examples:
	| emailAddress               |
	| automation.mj.fp@gmail.com |