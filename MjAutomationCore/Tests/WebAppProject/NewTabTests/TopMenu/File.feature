@retry(2)
Feature: File
	Check File functionality in Toolbar Menu
	
Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName              | FilePath       |
		| auto_test_SRND.mmap   | SimpleMap.mmap |
		| auto_test_2_SRND.mmap | SimpleMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User

@MindManager @Top_Menu @File @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1198] @Upd_Qase
Scenario: Check_it_is_possible_to_create_a_new_file_via_the_Web_editor
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	Then 'file' Menu is displayed to User
	When User clicks button with 'new' name in 'file' menu
	Then cloud templates page is displayed to User

@MindManager @Top_Menu @File @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1199] @Upd_Qase
Scenario: Check_that_Open_button_leads_to_the_Open_File_From_screen
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	Then 'file' Menu is displayed to User
	When User clicks button with 'open' name in 'file' menu
	Then content page is displayed to User

@MindManager @Top_Menu @File @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1204] @Upd_Qase
Scenario: Check_that_the_Print_button_invokes_the_print_dialog
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	Then 'file' Menu is displayed to User
	When User clicks button with 'print' name in 'file' menu
	Then Print Preview screen is displayed to the User

@MindManager @Top_Menu @File @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1205] @Upd_Qase
Scenario: Check_that_the_Export_button_allows_export_HTML_file
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	Then 'file' Menu is displayed to User
	When User mouse hovers menu button with 'export' name in 'file' menu
	Then following buttons are displayed in 'export' menu
		| Button             |
		| Download as HTML 5 |
		| Download as MMAP   |
	When User clicks button with 'export-html' name in 'export' menu
	Then User checks that file 'auto_test_SRND.html' was downloaded

@MindManager @Top_Menu @File @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1206] @Upd_Qase
Scenario: Check_that_the_Export_button_allows_download_mmap_file
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	Then 'file' Menu is displayed to User
	When User mouse hovers menu button with 'export' name in 'file' menu
	Then following buttons are displayed in 'export' menu
		| Button             |
		| Download as HTML 5 |
		| Download as MMAP   |
	When User clicks button with 'export-mmap' name in 'export' menu
	Then User checks that file 'auto_test_SRND.mmap' was downloaded

@MindManager @Top_Menu @File @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1207] @Upd_Qase
Scenario: Check_that_the_Close_button_leads_to_New_File_screen
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	Then 'file' Menu is displayed to User
	When User clicks button with 'close' name in 'file' menu
	Then 'My Files' tab is active on file manager header page

@MindManager @Top_Menu @File @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1201] @Upd_Qase
Scenario: Verify_save_button_saves_changes_to_existing_map
	When User clicks 'CT' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	When User clicks '50% done' item in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User clicks button with 'save' name in 'file' menu
	Then menu button with 'save' name is displayed in 'saved' state on Overlay panel
	Then '50% done' item is displayed as selected in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	Then '50% done' Icon is displayed to the 'CT' Topic
	When User clicks Logo image on Menu toolbar
	When User clicks 'My Files' tab on file manager header page
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	Then '50% done' Icon is displayed to the 'CT' Topic

@MindManager @Top_Menu @File @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1203] @Upd_Qase
Scenario: Verify_save_to_button_invokes_storage_locations
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	Then 'file' Menu is displayed to User
	When User mouse hovers menu button with 'save-to' name in 'file' menu
	When User clicks button with 'auto.test@mindmanagercloudqa.com (https://mindmanager.sharepoint.com/sites/milan)' name in 'save-to' menu
	When User clicks on Save In This Folder button on content manager cloud
	Then 'choose-name-dialog' dialog is displayed to User
	When User enters 'auto_test_change_location_SRND' value in the 'text' field in 'choose-name-dialog' dialog
	When User clicks 'Save' button in 'choose-name-dialog' dialog
	Then Web Editor page is displayed to the User
	Then 'auto_test_change_location_SRND.mmap' file name with path 'Shared Documents/For QA automation' exist on Sharepoint cloud storage via Api

@MindManager @Top_Menu @File @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1202] @Upd_Qase
Scenario: Verify_save_as_button_saves_copy_file_with_new_custom_name
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	Then 'file' Menu is displayed to User
	When User mouse hovers menu button with 'save-to' name in 'file' menu
	When User clicks button with 'auto.test@mindmanagercloudqa.com (https://mindmanager.sharepoint.com/sites/milan)' name in 'save-to' menu
	When User clicks on Save In This Folder button on content manager cloud
	Then 'choose-name-dialog' dialog is displayed to User
	When User enters 'auto_test_new_custom_name_SRND' value in the 'text' field in 'choose-name-dialog' dialog
	When User clicks 'Save' button in 'choose-name-dialog' dialog
	Then Web Editor page is displayed to the User
	Then 'auto_test_new_custom_name_SRND.mmap' file name with path 'Shared Documents/For QA automation' exist on Sharepoint cloud storage via Api
