@retry(2)
Feature: Login_Logout
Check Login-Logout functionality

Background: Pre-condition
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name                | Type     |
		| Automation_testSRND | standard |

@Licensing @CustomerAdminPortal @Login_Logout @QA @Staging @Cleanup
Scenario: Check_Login_in_the_admin_portal
	#Admin portal
	When User redirect by reglink for 'Automation_testSRND' customer
	Then User sees 'MindManager License Administration' header on Right Side panel
	Then User sees 'New Administrator?' subheader on Right Side panel
	Then 'Sign In' button is displayed
	Then 'Create Account' button is displayed
	Then 'Help' button is displayed
	When User clicks 'Sign In' button
	Then User sees 'Sign In' header on Right Side panel
	Then User sees 'Please enter your details below.' text messege on Right Side panel
	Then 'Sign In' button is displayed
	Then 'Help' button is displayed
	When User provides the Login and Password of Customer Admin Portal and clicks on the Sign In button
	Then User sees 'Automation_testSRND Admin Home' page header

@Licensing @CustomerAdminPortal @Login_Logout @QA @Staging @Cleanup
Scenario: Check_Logout_in_the_admin_portal
	#Admin portal
	When User is logged in to 'Automation_testSRND' customer on Admin portal via Api
	When admin 'Automation_testSRND' accepts BULA terms via API
	When User refresh page
	When User clicks Sign Out button in section header
	Then User sees 'MindManager License Administration' header on Right Side panel
	Then 'Sign In' button is displayed