@retry(2)
Feature: Presentation

@MindManager @View_Modes @Presentation @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1234] @Upd_Qase
Scenario: Check_the_bottom_bar_in_presentation_mode
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath                |
		| auto_test_SRND.mmap | Map_For_Automation.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User clicks button with 'presentation-view' name in 'view' menu
	Then Menu toolbar is displayed to Presentation mode
	Then 'menu' button is displayed on Menu toolbar
	Then 'Restart' button is displayed on Menu toolbar
	Then 'Back' button is displayed on Menu toolbar
	Then 'Start' button is displayed on Menu toolbar
	Then 'Search' button is displayed on Menu toolbar
	Then Zoom In button is displayed on Presentation toolbar
	Then Zoom Out button is displayed on Presentation toolbar
	Then 'default' logo is displayed in 'PresentationModeMenuToolbarPage' container on 'right' side

@MindManager @View_Modes @Presentation @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1235] @Upd_Qase
Scenario: Check_that_clicking_on_the_Menu_button_returns_with_side_menu
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath                |
		| auto_test_SRND.mmap | Map_For_Automation.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User clicks button with 'presentation-view' name in 'view' menu
	Then Menu toolbar is displayed to Presentation mode
	When User clicks 'menu' button on Menu toolbar
	Then Left side menu panel is displayed to the User
	When User clicks Close button in the top right corner on Left side menu panel
	Then Left side menu panel is not displayed to the User
	When User clicks Logo image on Menu toolbar
	Then 'New' tab is active on file manager header page
	Then cloud templates page is displayed to User

@MindManager @View_Modes @Presentation @App_QA @QA @App_Staging @Staging @App_Prod @Prod @Cleanup @Qase[WEB-1236] @Upd_Qase
Scenario: Check_that_Start_button_starts_the_presentation
	Given User uploads following publish files via Api
		| Name          | PublishFile             |
		| auto_test_RND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_RND' published file via Api
	When User opens published file with 'auto_test_RND' name in browser via Api
	Then Menu toolbar is displayed to Presentation mode
	When User clicks 'Start' button on Menu toolbar
	Then 'Main Topic' topic border is highlighted 'rgb(255, 255, 255)' color with no quick add buttons on Canvas
	Then 'Start' button is not displayed on Menu toolbar
	Then 'Next' button is displayed on Menu toolbar

@MindManager @View_Modes @Presentation @App_QA @QA @App_Staging @Staging @App_Prod @Prod @Cleanup @Qase[WEB-1237] @Upd_Qase
Scenario: Check_that_Restart_button_starts_the_presentation_from_the_beginning
	Given User uploads following publish files via Api
		| Name          | PublishFile             |
		| auto_test_RND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_RND' published file via Api
	When User opens published file with 'auto_test_RND' name in browser via Api
	Then Menu toolbar is displayed to Presentation mode
	When User clicks 'Start' button on Menu toolbar
	When User clicks 'Next' button on Menu toolbar
	When User clicks 'Restart' button on Menu toolbar
	Then 'Central Topic' topic border is highlighted 'rgb(255, 255, 255)' color with no quick add buttons on Canvas
	Then 'Start' button is displayed on Menu toolbar

@MindManager @View_Modes @Presentation @App_QA @QA @App_Staging @Staging @App_Prod @Prod @Cleanup @Qase[WEB-1238] @Upd_Qase
Scenario: Check_that_Back_returns_the_presentation_to_the_previous_topic
	Given User uploads following publish files via Api
		| Name          | PublishFile             |
		| auto_test_RND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_RND' published file via Api
	When User opens published file with 'auto_test_RND' name in browser via Api
	Then Menu toolbar is displayed to Presentation mode
	Then 'Back' button is disabled on Menu toolbar
	When User clicks 'Start' button on Menu toolbar
	When User clicks 'Next' button on Menu toolbar
	Then 'Subtopic' topic border is highlighted 'rgb(255, 255, 255)' color with no quick add buttons on Canvas
	When User clicks 'Back' button on Menu toolbar
	Then 'Main Topic' topic border is highlighted 'rgb(255, 255, 255)' color with no quick add buttons on Canvas

@MindManager @View_Modes @Presentation @App_QA @QA @App_Staging @Staging @App_Prod @Prod @Cleanup @Qase[WEB-1239] @Upd_Qase
Scenario: Check_zoom_option_in_presentation_side_panel
	Given User uploads following publish files via Api
		| Name          | PublishFile             |
		| auto_test_RND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_RND' published file via Api
	When User opens published file with 'auto_test_RND' name in browser via Api
	Then Menu toolbar is displayed to Presentation mode
	When User remembers map size
	When User clicks Zoom Out button on zoom bar of side toolbox
	Then map is Zoomed out
	When User clicks Zoom In button on zoom bar of side toolbox
	When User clicks Zoom In button on zoom bar of side toolbox
	Then map is Zoomed in

@MindManager @View_Modes @Presentation @App_QA @QA @App_Staging @Staging @App_Prod @Prod @Cleanup @Qase[WEB-1239] @Upd_Qase
Scenario: Check_zoom_option_in_presentation_on_main_navigation_panel
	Given User uploads following publish files via Api
		| Name          | PublishFile             |
		| auto_test_RND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_RND' published file via Api
	When User opens published file with 'auto_test_RND' name in browser via Api
	Then Menu toolbar is displayed to Presentation mode
	When User remembers map size
	When User clicks Zoom Out button on Main navigation panel of Presentation mode
	Then map is Zoomed out
	When User clicks Zoom In button on Main navigation panel of Presentation mode
	When User clicks Zoom In button on Main navigation panel of Presentation mode
	Then map is Zoomed in

@MindManager @View_Modes @Presentation @QA @Staging @Prod @Cleanup @Qase[WEB-1240] @Upd_Qase
Scenario: MindManager_logo_lead_to_mindmanager_magazine_cloud
	Given User uploads following publish files via Api
		| Name          | PublishFile             |
		| auto_test_RND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| BrandingHyperlink               |
		| https://www.mindmanager.com/en/ |
	When User performs publish update request for 'auto_test_RND' published file via Api
	When User opens published file with 'auto_test_RND' name in browser via Api
	Then Menu toolbar is displayed to Presentation mode
	When User clicks Logo image on Menu toolbar
	When User switches to '1' tab
	Then page url is 'https://www.mindmanager.com/en/'

@MindManager @View_Modes @Presentation @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1240] @Upd_Qase
Scenario: MindManager_logo_lead_to_mindmanager_magazine
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath                |
		| auto_test_SRND.mmap | Map_For_Automation.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User clicks button with 'presentation-view' name in 'view' menu
	Then Menu toolbar is displayed to Presentation mode
	When User clicks Logo image on Menu toolbar
	Then 'New' tab is active on file manager header page
	Then cloud templates page is displayed to User

@MindManager @Top_Menu @Search @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1241] @Upd_Qase @JIRA[MMCV-10174]
Scenario: Check_the_functionality_of_Search_function_when_a_map_is_opened_In_Presentation_mode
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath                |
		| auto_test_SRND.mmap | Map_For_Automation.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	When User clicks button with 'collapse-all' name in 'view' menu
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	When User clicks button with 'presentation-view' name in 'view' menu
	Then all subtopics are collapsed on Canvas
	When User clicks 'Search' button on Menu toolbar
	Then Search toolbar is expanded in Presentation mode
	When User enters 'T' value in input filed on Search toolbar
	Then 'Central Topic' topic text is highlighted 'yellow' color
	Then 'Main Topic' topic text is highlighted 'orange' color
	Then 'Floating Topic' topic text is highlighted 'orange' color
	Then 'LinkTopic' topic text is highlighted 'orange' color
	Then '1 of 5' label result is displayed on Search toolbar
	When User clicks Next button on Search toolbar
	Then 'Central Topic' topic text is highlighted 'orange' color
	Then 'Floating Topic' topic text is highlighted 'orange' color
	Then 'LinkTopic' topic text is highlighted 'orange' color
	Then '2 of 5' label result is displayed on Search toolbar
	When User enters 'est' value in input filed on Search toolbar
	Then '0 of 0' label result is displayed on Search toolbar
	When User clicks 'Close' button on Search toolbar
	Then Search toolbar is collapsed in Presentation mode