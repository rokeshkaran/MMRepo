@retry(2)
Feature: Menu
Check Menu functionality in Toolbar Menu
	
Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName              | FilePath       |
		| auto_test_SRND.mmap   | SimpleMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	Then 'file' Menu is displayed to User

@MindManager @Top_Menu @Menu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1195] @Upd_Qase
Scenario: Check_that_Setting_section_can_be_closed_by_clicking_X_button
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	Then 'Settings' screen is displayed to User
	When User clicks Close button in the top right corner on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	Then Web Editor page is displayed to the User

@MindManager @Top_Menu @Menu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1195] @Upd_Qase
Scenario: Check_the_file_Setting_options
	When User mouse hovers menu button with 'settings' name in 'file' menu
	Then following buttons are displayed in 'settings' menu
		| Button               |
		| General              |
		| Presentation Options |
		| Gantt View           |

@MindManager @Top_Menu @Menu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1196] @Upd_Qase
Scenario: Check_to_verify_that_Viewing_Options_can_be_closed_by_clicking_X_button
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'presentational-settings' name in 'settings' menu
	Then 'Presentation Options' screen is displayed to User
	When User clicks Close button in the top right corner on 'Presentation Options' screen
	Then 'Presentation Options' screen is not displayed to User
	Then Web Editor page is displayed to the User