@retry(2)
Feature: Login_Logout
Check Login-Logout functionality

Background: Pre-condition
	Given User is on the Mindmanager website
	Then Right Side panel is displayed

@MindManager @Account @Login_Logout @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Qase[WEB-31] @Health_Check @Upd_Qase
Scenario: Check_that_valid_user_is_able_to_sign_in_into_their_account_on_the_web
	Then User sees 'Welcome' header on Right Side panel
	Then 'Start Free Trial' button is displayed
	Then 'Sign In' button is displayed
	Then 'Create Account' button is displayed
	Then 'Help' button is displayed
	When User clicks 'Sign In' button
	Then User sees 'Sign In' header on Right Side panel
	Then User sees 'Please enter your details below.' text messege on Right Side panel
	When User provides the Login and Password and clicks on the Sign In button
	Then file manager header page is displayed to User

@MindManager @Account @Login_Logout @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Qase[WEB-31] @Upd_Qase
Scenario: Check_placeholders_of_sign_in_data_entry_fields
	When User clicks 'Sign In' button
	Then 'Email' placeholder is displayed in 'email' enter field
	When User clicks 'Sign In' button
	Then 'Password' placeholder is displayed in 'password' enter field

@MindManager @Account @Login_Logout @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Qase[WEB-39] @Health_Check @Upd_Qase
Scenario: Check_it_is_possible_to_sign_out_from_the_Mindjet_account
	When User clicks 'Sign In' button
	When User provides the Login and Password and clicks on the Sign In button
	Then file manager header page is displayed to User
	When User clicks arrow down on 'fileManagerHeader' user panel
	Then following items is displayed in 'user-panel' dropdown menu
		| items           |
		| Sign Out        |
		| Account Details |
	When User clicks 'Sign Out' item in 'user-panel' dropdown menu
	Then Right Side panel is displayed
	Then User sees 'Welcome' header on Right Side panel
	Then 'Create Account' button is displayed
	Then 'Help' button is displayed

@MindManager @Account @Login_Logout @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Qase[WEB-34] @Upd_Qase
Scenario: Sign_In_with_invalid_password
	When User clicks 'Sign In' button
	When User enters 'automation.mj.fp@gmail.com' in the 'email' field
	When User enters '12345' in the 'password' field
	When User clicks 'Sign In' button
	Then Error message with text 'Incorrect username or password' is displayed to the User

@MindManager @Account @Login_Logout @QA @App_QA @Qase[WEB-34] @Upd_Qase
Scenario: Sign_In_with_invalid_password_QA
	When User clicks 'Sign In' button
	When User enters 'automation.mj.qa@gmail.com' in the 'email' field
	When User enters '12345' in the 'password' field
	When User clicks 'Sign In' button
	Then Error message with text 'Incorrect username or password' is displayed to the User

@MindManager @Account @Login_Logout @Staging @App_Staging @Qase[WEB-34] @Upd_Qase
Scenario: Sign_In_with_invalid_password_Staging
	When User clicks 'Sign In' button
	When User enters 'automation.mj.s@gmail.com' in the 'email' field
	When User enters '12345' in the 'password' field
	When User clicks 'Sign In' button
	Then Error message with text 'Incorrect username or password' is displayed to the User

@MindManager @Account @Login_Logout @Prod @App_Prod @Qase[WEB-34] @Upd_Qase
Scenario: Sign_In_with_invalid_password_Prod
	When User clicks 'Sign In' button
	When User enters 'automation.prodmj@gmail.com' in the 'email' field
	When User enters '12345' in the 'password' field
	When User clicks 'Sign In' button
	Then Error message with text 'Incorrect username or password' is displayed to the User

@MindManager @Account @Login_Logout @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Qase[WEB-35] @Health_Check @Upd_Qase
Scenario: Sign_In_with_invalid_email
	When User clicks 'Sign In' button
	When User enters 'automation.mj.fp@test.com' in the 'email' field
	When User enters 'TestPs1!' in the 'password' field
	When User clicks 'Sign In' button
	Then Error message with text 'Incorrect username or password' is displayed to the User

@MindManager @Account @Login_Logout @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Qase[WEB-32] @Upd_Qase
Scenario: Check_Sign_In_without_entering_email
	When User clicks 'Sign In' button
	When User enters '' in the 'email' field
	When User clicks 'Sign In' button
	When User enters 'hUsdcsd1l92' in the 'password' field
	When User clicks 'Sign In' button
	Then Error message with text 'Email is required' is displayed to the User

@MindManager @Account @Login_Logout @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Qase[WEB-33] @Upd_Qase
Scenario: Check_Sign_In_without_entering_password
	When User clicks 'Sign In' button
	When User enters 'test_email@gmail.com' in the 'email' field
	When User enters '' in the 'password' field
	When User clicks 'Sign In' button
	Then Error message with text 'Password is required' is displayed to the User