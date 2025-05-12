@retry(2)
Feature: ViewModes
Check that saved_view_mode_is_displayed_on_next_map_opening

Background: Pre-condition
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

@MindManager @View_Modes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1229] @Upd_Qase
Scenario: Check_that_Standard_saved_view_mode_is_displayed_on_next_map_opening_for_the_same_user
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User mouse hovers menu button with 'tag-view' name in 'view' menu
	When User clicks button with 'Kanban' name in 'tag-view' menu
	Then map is displayed in 'Tag' view mode
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User clicks button with 'save' name in 'file' menu
	Then menu button with 'save' name is displayed in 'saved' state on Overlay panel
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User clicks button with 'standard-view' name in 'view' menu
	Then map is displayed in 'Map' view mode
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User clicks button with 'save' name in 'file' menu
	Then menu button with 'save' name is displayed in 'saved' state on Overlay panel
	When User clicks on the toolbar logo of Tools panel
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'auto_test_SRND.mmap' file
	Then map is displayed in 'Map' view mode

@MindManager @View_Modes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1231] @Upd_Qase
Scenario: Check_that_Icon_saved_view_mode_is_displayed_on_next_map_opening_for_the_same_user
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User mouse hovers menu button with 'icon-view' name in 'view' menu
	When User clicks button with 'Progress' name in 'icon-view' menu
	Then map is displayed in 'Icon' view mode
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User clicks button with 'save' name in 'file' menu
	Then menu button with 'save' name is displayed in 'saved' state on Overlay panel
	When User clicks on the toolbar logo of Tools panel
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'auto_test_SRND.mmap' file
	Then map is displayed in 'Icon' view mode

@MindManager @View_Modes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1232] @Upd_Qase
Scenario: Check_that_Tag_saved_view_mode_is_displayed_on_next_map_opening_for_the_same_user
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User mouse hovers menu button with 'tag-view' name in 'view' menu
	When User clicks button with 'Kanban' name in 'tag-view' menu
	Then map is displayed in 'Tag' view mode
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User clicks button with 'save' name in 'file' menu
	Then menu button with 'save' name is displayed in 'saved' state on Overlay panel
	When User clicks on the toolbar logo of Tools panel
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'auto_test_SRND.mmap' file
	Then map is displayed in 'Tag' view mode

@MindManager @View_Modes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1233] @Upd_Qase
Scenario: Check_that_Slide_saved_view_mode_is_displayed_on_next_map_opening
	When User clicks on the toolbar logo of Tools panel
	When User clicks 'Published Files' tab on file manager header page
	When User clicks 'View' button in the 'Hyperlink.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode