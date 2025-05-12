@retry(2)
Feature: CreateAccount
Check Creating Account functionality

@Licensing @CustomerAdminPortal @CreateAccount @QA @Staging @Cleanup @CleanupOutlookEmail
Scenario: Check_account_creation_in_the_admin_portal
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	#Admin portal
	When User redirect by reglink for '<customerName>' customer
	Then User sees 'MindManager License Administration' header on Right Side panel
	Then User sees 'New Administrator?' subheader on Right Side panel
	Then 'Sign In' button is displayed
	Then 'Create Account' button is displayed
	Then 'Help' button is displayed
	When User clicks 'Create Account' button
	When User fills account creation fields for new UI
		| Email          | Full_Name      | Password  |
		| <emailAddress> | Automation_RND | TYf78!RND |
	Then 'Create Account' button is displayed
	When User clicks 'Create Account' button
	Then User sees 'Verify your account to continue' subheader on Right Side panel
	Then User sees 'An email was just sent to <emailAddress>(change email) from noreply@mindmanager.com. Please follow the instructions in the email, then come back here and click "Continue" to complete your account setup.' text messege on Right Side panel
	When User clicks 'Continue' button
	When User activates newly created Mind Manager account in outlook for 'auto.test@mindmanager.onmicrosoft.com' email address with 'Please verify your MindManager account' email title header and 'Something Else' use case button
	When User switches to '0' tab
	When User clicks 'Something Else' button for use case options on Right Side panel
	When User waits '3000' miliseconds
	Then User sees '<customerName> Admin Home' page header

Examples:
	| customerName        | emailAddress                               |
	| Automation_testSRND | auto.test+SRND@mindmanager.onmicrosoft.com |