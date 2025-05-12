@retry(2)
Feature: LoginWithSSOMicrosoftAzure
Login With SSO Microsoft Azure

Background: Pre-condition
	Given User is on the Mindmanager website
	When User clicks 'Sign In' button

@MindManager @Login_With_SSO_Microsoft_Azure @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Qase[WEB-644] @Health_Check @Upd_Qase @JIRA[MMCV-10397,MMCV-10518]
#Microsoft Azure
Scenario: First_sign_in_via_web
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	Then 'password' enter field is not displayed to User
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	Then file manager header page is displayed to User

@MindManager @Login_With_SSO_Microsoft_Azure @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Qase[WEB-645] @Upd_Qase @JIRA[MMCV-10397,MMCV-10518]
#Microsoft Azure
Scenario: Second_sign_in_via_web
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	Then file manager header page is displayed to User
	When User waits for data loading
	When User close Admin System Message
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Sign Out' item in 'user-panel' dropdown menu
	When User clicks 'Sign In' button
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	Then 'password' enter field is not displayed to User
	When User clicks 'Sign In' button
	Then file manager header page is displayed to User

@MindManager @Login_With_SSO_Microsoft_Azure @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Qase[WEB-648] @Health_Check @Upd_Qase @JIRA[MMCV-10397,MMCV-10518]
#Microsoft Azure
Scenario: Sign_Out_from_SSO_account
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	Then file manager header page is displayed to User
	When User waits for data loading
	When User close Admin System Message
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Sign Out' item in 'user-panel' dropdown menu
	Then User sees 'Welcome' header on Right Side panel
	Then 'Start Free Trial' button is displayed
	Then 'Sign In' button is displayed
	Then 'Create Account' button is displayed
	Then 'Help' button is displayed