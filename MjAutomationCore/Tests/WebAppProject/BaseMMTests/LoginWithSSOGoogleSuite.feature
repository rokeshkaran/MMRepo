@retry(2)
Feature: LoginWithSSOGoogleSuite
Login With SSO Google Suite

@MindManager @Login_With_SSO_Google_Suite @QA @Prod @testRail[286847] @Not_Run
#C286847
#Google Suite
Scenario: First_sign_in_via_web_Google_Suite
	Given User is on the Mindmanager website
	Then Right Side panel is displayed
	When User clicks 'Sign In' button
	When User enters 'pavel@mindmanagergsqa.com' in the 'email' field
	Then 'password' enter field is not displayed to User
	When User clicks 'Sign In' button
	When User provides the Login and Password from Google Suite company account and clicks on Sign In button
	Then User sees 'You don't have a license to use this product.' header on Right Side panel

@MindManager @Login_With_SSO @Staging @Prod @testRail[286847] @Not_Run
#C286847
#Google Suite
#Add tag @QA
Scenario: Check_that_the_password_is_required_if_you_are_not_logged_in_to_your_company_account_Google_Suite
	Given User is on the Mindmanager website
	Then Right Side panel is displayed
	When User clicks 'Sign In' button
	When User enters 'pavel@mindmanagergsqa.com' in the 'email' field
	Then 'password' enter field is not displayed to User
	When User clicks 'Sign In' button
	When User provides the Login and Password from Google Suite company account and clicks on Sign In button
	Then file manager header page is displayed to User

@MindManager @Login_With_SSO @Staging @Prod @testRail[286848,658948] @Not_Run
#C286848, C658948
##Google Suite
#Add tag @QA
Scenario: Check_that_password_is_not_required_if_you_were_signed_in_to_the_account_previously_Google_Suite
	Given User is on the Mindmanager website
	Then Right Side panel is displayed
	When User clicks 'Sign In' button
	When User enters 'pavel@mindmanagergsqa.com' in the 'email' field
	Then 'password' enter field is not displayed to User
	When User clicks 'Sign In' button
	When User provides the Login and Password from Google Suite company account and clicks on Sign In button
	Then file manager header page is displayed to User
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Sign Out' item in 'user-panel' dropdown menu
	Then Right Side panel is displayed
	Then User sees 'Welcome' header on Right Side panel
	When User clicks 'Sign In' button
	When User enters 'pavel@mindmanagergsqa.com' in the 'email' field
	Then 'password' enter field is not displayed to User
	When User clicks 'Sign In' button
	Then file manager header page is displayed to User