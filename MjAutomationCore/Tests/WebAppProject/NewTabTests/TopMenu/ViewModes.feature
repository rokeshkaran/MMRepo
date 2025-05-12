@retry(2)
Feature: ViewModes
Check View modes functionality in Toolbar Menu

@MindManager @Top_Menu @View @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1215] @Upd_Qase
Scenario: Switch_to_Standard_view_mode
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | Tags_mode.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	Then map is displayed in 'Tag' view mode
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	When User clicks button with 'standard-view' name in 'view' menu
	Then Menu toolbar is displayed to Standard mode in 'top' side on page

@MindManager @Top_Menu @View @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1216] @Upd_Qase
Scenario: Switch_to_Tag_view_mode
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	When User mouse hovers menu button with 'tag-view' name in 'view' menu
	When User clicks button with 'Kanban' name in 'tag-view' menu
	Then map is displayed in 'Tag' view mode

@MindManager @Top_Menu @View @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1217] @Upd_Qase
Scenario: Switch_to_Icon_view_mode
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	When User mouse hovers menu button with 'icon-view' name in 'view' menu
	When User clicks button with 'Priority' name in 'icon-view' menu
	Then map is displayed in 'Icon' view mode

@MindManager @Top_Menu @View @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1218] @Upd_Qase
Scenario: Switch_to_Presentation_view_mode
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	When User clicks button with 'presentation-view' name in 'view' menu
	Then Menu toolbar is displayed to Presentation mode

@MindManager @Top_Menu @View @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1219] @Upd_Qase
Scenario: Exit_with_Presentation_mode
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	When User clicks button with 'presentation-view' name in 'view' menu
	Then Menu toolbar is displayed to Presentation mode
	When User clicks 'menu' button on Menu toolbar
	Then Left side menu panel is displayed to the User
	When User clicks 'Exit Presentation View' button on Left side menu panel
	Then Menu toolbar is displayed to Standard mode in 'top' side on page

@MindManager @Top_Menu @View @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2355] @Upd_Qase
Scenario: To_verify_it_is_possible_to_switch_to_Gantt_View
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	When User clicks button with 'gantt-view' name in 'view' menu
	Then map is existed in 'Gantt' view mode
	Then Tools panel is not displayed on page
	Then Gantt toolbar is displayed to User