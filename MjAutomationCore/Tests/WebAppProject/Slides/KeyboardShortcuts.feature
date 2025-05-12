@retry(2)
Feature: KeyboardShortcuts
Check functionality keyboard shortcuts to the Slide show mode

Background: Pre-condition
	Given '1' User is logged into MindManager web app via Api
	Then file manager header page is displayed to User
	When User clicks 'Published Files' tab on file manager header page
	When User clicks 'View' button in the 'Slide.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	When tutorial card is set to 'true' on navigation panel

@MindManager @MyPublishedFiles @Slides @KeyboardShortcuts @QA @Staging @Prod @Cleanup @Qase[WEB-911] @Upd_Qase
Scenario: Check_that_pressing_Home_Key_will_move_the_selector_to_the_top_sibling_topic_Cloud
	When User clicks 'February' topic on Canvas
	Then 'February' topic border is highlighted 'rgb(62, 158, 255)' color with no quick add buttons on Canvas
	When User presses the 'Home' key on the keyboard
	Then 'January' topic border is highlighted 'rgb(62, 158, 255)' color with no quick add buttons on Canvas

@MindManager @MyPublishedFiles @Slides @KeyboardShortcuts @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-911] @Upd_Qase
Scenario: Check_that_pressing_Home_Key_will_move_the_selector_to_the_top_sibling_topic_App
	When User clicks 'February' topic on Canvas
	Then 'February' topic border is highlighted 'rgb(62, 158, 255)' color with no quick add buttons on Canvas
	When User presses the 'Home' key on the keyboard
	Then 'January' topic border is highlighted 'rgb(62, 158, 255)' color with no quick add buttons on Canvas

@MindManager @MyPublishedFiles @Slides @KeyboardShortcuts @QA @Staging @Prod @Cleanup @Qase[WEB-912] @Upd_Qase
Scenario: Check_that_pressing_End_Key_will_move_the_selector_to_the_bottom_sibling_topic_Cloud
	When User clicks 'January' topic on Canvas
	Then 'January' topic border is highlighted 'rgb(62, 158, 255)' color with no quick add buttons on Canvas
	When User presses the 'End' key on the keyboard
	Then 'March' topic border is highlighted 'rgb(62, 158, 255)' color with no quick add buttons on Canvas

@MindManager @MyPublishedFiles @Slides @KeyboardShortcuts @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-912] @Upd_Qase
Scenario: Check_that_pressing_End_Key_will_move_the_selector_to_the_bottom_sibling_topic_App
	When User clicks 'January' topic on Canvas
	Then 'January' topic border is highlighted 'rgb(62, 158, 255)' color with no quick add buttons on Canvas
	When User presses the 'End' key on the keyboard
	Then 'March' topic border is highlighted 'rgb(62, 158, 255)' color with no quick add buttons on Canvas

@MindManager @MyPublishedFiles @Slides @KeyboardShortcuts @QA @Staging @Prod @Cleanup @Qase[WEB-913] @Upd_Qase
Scenario: Check_that_simultaneously_pressing_Ctr_plus_keys_will_zoom_in_the_map_Cloud
	When User remembers map size
	When User presses the Ctrl_Plus combination key on the keyboard
	Then map is Zoomed in

@MindManager @MyPublishedFiles @Slides @KeyboardShortcuts @QA @Staging @Prod @Cleanup @Qase[WEB-913] @Upd_Qase
Scenario: Check_that_simultaneously_pressing_Ctr_minus_keys_will_zoom_out_the_map_Cloud
	When User remembers map size
	When User presses the Ctrl_Minus combination key on the keyboard
	When User presses the Ctrl_Minus combination key on the keyboard
	Then map is Zoomed out

@MindManager @MyPublishedFiles @Slides @KeyboardShortcuts @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-913] @Upd_Qase
Scenario: Check_that_simultaneously_pressing_Ctr_plus_keys_will_zoom_in_the_map_App
	When User remembers map size
	When User presses the Ctrl_Plus combination key on the keyboard
	Then map is Zoomed in

@MindManager @MyPublishedFiles @Slides @KeyboardShortcuts @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-913] @Upd_Qase
Scenario: Check_that_simultaneously_pressing_Ctr_minus_keys_will_zoom_out_the_map_App
	When User remembers map size
	When User presses the Ctrl_Minus combination key on the keyboard
	When User presses the Ctrl_Minus combination key on the keyboard
	Then map is Zoomed out

@MindManager @MyPublishedFiles @Slides @KeyboardShortcuts @QA @Staging @Prod @Cleanup @Qase[WEB-914] @Upd_Qase
Scenario: Check_that_by_pressing_F3_with_the_topic_selected_the_map_will_be_centered_on_the_selected_topic_Cloud
	When User remembers the map location on Canvas
	When User clicks 'Floating Topic' topic on Canvas
	When User presses the 'F3' key on the keyboard
	Then map has changed location by X axis on Canvas
	Then map has changed location by Y axis on Canvas
	Then "5" collapsed subtopic are displayed to User
	Then 'Subtopic' subtopic is displayed on Canvas

@MindManager @MyPublishedFiles @Slides @KeyboardShortcuts @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-914] @Upd_Qase
Scenario: Check_that_by_pressing_F3_with_the_topic_selected_the_map_will_be_centered_on_the_selected_topic_App
	When User remembers the map location on Canvas
	When User clicks 'Floating Topic' topic on Canvas
	When User presses the 'F3' key on the keyboard
	Then map has changed location by X axis on Canvas
	Then map has changed location by Y axis on Canvas
	Then "5" collapsed subtopic are displayed to User
	Then 'Subtopic' subtopic is displayed on Canvas

@MindManager @MyPublishedFiles @Slides @KeyboardShortcuts @QA @Staging @Prod @Cleanup @Qase[WEB-915] @Upd_Qase
Scenario: Check_that_by_pressing_CTRL_F3_all_the_branches_will_collapse_the_branches_Cloud
	When User remembers the map location on Canvas
	When User presses the Ctrl_F3 combination key on the keyboard
	Then map has changed location by X axis on Canvas
	Then map has changed location by Y axis on Canvas
	Then "5" collapsed subtopic are displayed to User
	Then "1" collapsed subtopic are displayed to User

@MindManager @MyPublishedFiles @Slides @KeyboardShortcuts @App_QA @App_Staging @Cleanup @Qase[WEB-915] @Upd_Qase
Scenario: Check_that_by_pressing_CTRL_F3_all_the_branches_will_collapse_the_branches_App
	When User remembers the map location on Canvas
	When User presses the Ctrl_F3 combination key on the keyboard
	Then map has changed location by X axis on Canvas
	Then map has changed location by Y axis on Canvas
	Then "5" collapsed subtopic are displayed to User
	Then "1" collapsed subtopic are displayed to User

@MindManager @MyPublishedFiles @Slides @KeyboardShortcuts @QA @Staging @Prod @Cleanup @Qase[WEB-916] @Upd_Qase
Scenario: Check_that_the_User_is_able_to_use_CTRL_F5_to_Fit_the_map_Cloud
	When User presses the Ctrl_Minus combination key on the keyboard
	When User remembers the map location on Canvas
	When User presses the Ctrl_F5 combination key on the keyboard
	Then map has changed location by X axis on Canvas
	Then map has changed location by Y axis on Canvas

@MindManager @MyPublishedFiles @Slides @KeyboardShortcuts @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-916]
Scenario: Check_that_the_User_is_able_to_use_CTRL_F5_to_Fit_the_map_App_QA
	When User presses the Ctrl_Minus combination key on the keyboard
	When User remembers the map location on Canvas
	When User presses the Ctrl_F5 combination key on the keyboard
	Then map has changed location by X axis on Canvas
	Then map has changed location by Y axis on Canvas