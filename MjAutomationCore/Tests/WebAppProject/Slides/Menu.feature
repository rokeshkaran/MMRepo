@retry(2)
Feature: Menu
Verify Menu functionality in Slide Show mode

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName             | FilePath    |
		| auto_test_SRND.mdeck | Slide.mdeck |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mdeck' file
	Then Web Editor page is displayed to the User
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	When User clicks 'menu' button on the Slide toolbar
	Then Left side menu panel is displayed to the User

@MindManager @MyPublishedFiles @Slides @Menu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1294] @Upd_Qase
Scenario: Check_Whats_New_button
	When User clicks 'What's New' button on Left side menu panel
	When User switches to '1' tab
	When User waits for data loading
	Then page url is 'https://share.mindmanager.com/#publish/9Vz-cnj9jsjZW-I-mjtP2LZhpQ3rwOaG2yD-Mvwq'

@MindManager @MyPublishedFiles @Slides @Menu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-909] @Upd_Qase
Scenario: Check_Settings_button
	When User clicks 'Settings' button on Left side menu panel
	Then 'Settings' screen is displayed to User
	When User clicks Close button in the top right corner on 'Settings' screen
	Then 'Settings' screen is not displayed to User