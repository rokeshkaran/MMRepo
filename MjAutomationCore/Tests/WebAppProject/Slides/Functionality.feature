@retry(2)
Feature: Functionality
	Check Slides functionality

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

@MindManager @Slides @Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-903] @Upd_Qase
Scenario: Check_verify_the_Slide_show_UI
	Then 'menu' button is displayed on the Slide toolbar
	Then 'prev' button is displayed on the Slide toolbar
	Then 'next' button is displayed on the Slide toolbar
	Then '1/4' label result is displayed on the Slide toolbar
	Then 'https://www.mindjet.com/go/Publish-logo' logo is displayed on the Slide toolbar

@MindManager @Slides @Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-904] @Upd_Qase
Scenario: Check_Next_button_in_Slide_Show_mode
	Then 'Quarter 1' topic is displayed on Canvas
	When User clicks 'next' button on the Slide toolbar
	Then 'Quarter 2' topic is displayed on Canvas
	Then '2/4' label result is displayed on the Slide toolbar
	When User clicks 'next' button on the Slide toolbar
	When User clicks 'next' button on the Slide toolbar
	Then '4/4' label result is displayed on the Slide toolbar
	Then 'next' button displayed as disabled on the Slide toolbar

@MindManager @Slides @Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-905] @Upd_Qase
Scenario: Check_Back_button_in_Slide_Show_mode
	Then 'Quarter 1' topic is displayed on Canvas
	Then 'prev' button displayed as disabled on the Slide toolbar
	When User clicks 'next' button on the Slide toolbar
	Then 'Quarter 2' topic is displayed on Canvas
	When User clicks 'prev' button on the Slide toolbar
	Then '1/4' label result is displayed on the Slide toolbar
	Then 'Quarter 1' topic is displayed on Canvas

@MindManager @Slides @Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-906] @Upd_Qase @JIRA[MMCV-10476]
Scenario: Check_Menu_button_in_Slide_Show_mode_via_Close_button
	Then 'Quarter 1' topic is displayed on Canvas
	When User clicks 'menu' button on the Slide toolbar
	Then Left side menu panel is displayed to the User
	Then Left side menu panel has 'auto_test_SRND.mdeck' sub title with 'Title' title header
	Then The following button is displayed on the left side menu panel
		| Items            |
		| Back to My Files |
		| Download         |
		| What's New       |
		| Settings         |
	Then app version is displayed on the left side menu panel
	When User clicks Close button in the top right corner on Left side menu panel
	Then Left side menu panel is not displayed to the User
	
@MindManager @Slides @Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-906] @Upd_Qase @JIRA[MMCV-10476]
Scenario: Check_Menu_button_in_Slide_Show_mode_via_body_area
	Then 'Quarter 1' topic is displayed on Canvas
	When User clicks 'menu' button on the Slide toolbar
	Then Left side menu panel is displayed to the User
	Then Left side menu panel has 'auto_test_SRND.mdeck' sub title with 'Title' title header
	Then The following button is displayed on the left side menu panel
		| Items            |
		| Back to My Files |
		| Download         |
		| What's New       |
		| Settings         |
	Then app version is displayed on the left side menu panel
	When User clicks on the Body on Canvas
	Then Left side menu panel is not displayed to the User

@MindManager @Slides @Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-907] @Upd_Qase
Scenario: MindManager_logo_Slides
	When User clicks Logo image on Menu toolbar
	When User switches to '1' tab
	Then page url is 'https://www.mindmanager.com/en/'