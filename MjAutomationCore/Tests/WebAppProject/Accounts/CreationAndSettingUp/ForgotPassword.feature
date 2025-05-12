@retry(2)
Feature: Forgot Password
Check Forgot Password functionality

Background: Pre-condition
	Given User is on the Mindmanager website
	Then Right Side panel is displayed
	When User clicks 'Sign In' button

@MindManager @Account @Forgot_Password @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Qase[WEB-40] @Upd_Qase
Scenario: Cancel_password_reset
	When User enters 'automation.mj.fp@gmail.com' in the 'email' field
	Then 'Forgot Password?' button is displayed
	When User clicks 'Forgot Password?' button
	Then User sees 'Forgot Password' header on Right Side panel
	Then User sees 'Please enter your email' text messege on Right Side panel
	When User accepts Optanon cookies
	Then 'Send Reset Link' button is displayed
	Then 'Cancel' button is displayed
	When User clicks 'Send Reset Link' button
	Then Error message with text 'Email is required' is displayed to the User
	When User clicks 'Cancel' button
	Then User sees 'Welcome' header on Right Side panel

@MindManager @Account @Forgot_Password @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Qase[WEB-40] @Upd_Qase
Scenario: Check_placeholders_of_sign_up_data_entry_fields
	When User clicks 'Sign In' button
	Then 'Forgot Password?' button is displayed
	When User clicks 'Forgot Password?' button
	Then 'Email' placeholder is displayed in 'email' enter field

@MindManager @Account @Forgot_Password @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Cleanup @ForgotPasswordEmailCleanup @Do_Not_Run_With_Forgot_Password @Qase[WEB-37] @Health_Check @Upd_Qase @JIRA[MMCV-10102]
Scenario: Check_Forgot_Password_Functionality
	When User enters '<emailAddress>' in the 'email' field
	Then 'Forgot Password?' button is displayed
	When User clicks 'Forgot Password?' button
	Then User sees 'Forgot Password' header on Right Side panel
	Then User sees 'Please enter your email' text messege on Right Side panel
	When User accepts Optanon cookies
	Then 'Send Reset Link' button is displayed
	Then 'Cancel' button is displayed
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
	When User enters 'anrpw!SRND' in the 'password' field
	When User enters 'anrpw!SRND' in the 'confirm_password' field
	When User clicks 'Set New Password' button
	Then Right Side panel is displayed
	Then User sees 'Sign In' header on Right Side panel
	Then User sees 'Please enter your details below.' text messege on Right Side panel
	When User enters '<emailAddress>' in the 'email' field
	When User enters 'anrpw!SRND' in the 'password' field
	When User clicks 'Sign In' button
	Then file manager header page is displayed to User

Examples:
	| emailAddress               |
	| automation.mj.fp@gmail.com |