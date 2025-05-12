@retry(2)
Feature: LisenseSupport
Check License Support Home page

@Licensing @LisenseSupport @QA @Staging @Qase[LICENSE-125] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @Upd_Qase
Scenario: Check_License_support_home_page
	Given User is on the Mindmanager License support website
	Then Right Side panel is displayed
	Then User sees 'Sign In' header on Right Side panel
	Then User sees 'Please enter your corporate ID.' text messege on Right Side panel
	Then 'Sign In' button is displayed
	Then 'Help' button is displayed
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	Then User sees 'License Support' page header
	Then 'license-support-products' table is displayed to User