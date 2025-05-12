@retry(2)
Feature: View
Check View functionality in Toolbar Menu

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
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User

@MindManager @Top_Menu @View @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1210] @Upd_Qase
Scenario: Check_that_it_is_possible_to_Zoom_in_Zoom_out_the_map_on_the_Webeditor
	When User remembers map size
	When User clicks button with 'zoom-out' name in 'view' menu
	Then map is Zoomed out
	When User clicks button with 'zoom-in' name in 'view' menu
	When User clicks button with 'zoom-in' name in 'view' menu
	Then map is Zoomed in

@MindManager @Top_Menu @View @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1211] @Upd_Qase
Scenario: Check_that_it_is_possible_to_fit_the_map_to_the_screen
	When User remembers map size
	When User remembers the map location on Canvas
	When User clicks button with 'fit' name in 'view' menu
	Then map is Zoomed in
	Then map has changed location by X axis on Canvas
	Then map has changed location by Y axis on Canvas

@MindManager @Top_Menu @View @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1212] @Upd_Qase
Scenario: Check_that_it_is_possible_to_focus_on_a_definite_topic_in_the_Web_editor
	Then button with 'focus' name is disabled in 'view' menu
	When User clicks 'MT' topic on Canvas
	When User remembers location of 'MT' topic on Canvas
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then button with 'focus' name is enabled in 'view' menu
	When User remembers location of 'MT' topic on Canvas
	When User clicks button with 'focus' name in 'view' menu
	Then 'MT' topic has changed location by X axis on Canvas
	Then 'MT' topic has changed location by Y axis on Canvas

@MindManager @Top_Menu @View @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1213,WEB-1214] @Upd_Qase
Scenario: Check_Collapsed_and_Expand_all_topics
	When User clicks button with 'collapse-all' name in 'view' menu
	Then all subtopics are collapsed on Canvas
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	When User clicks button with 'expand-all' name in 'view' menu
	Then all subtopics are expanded on Canvas