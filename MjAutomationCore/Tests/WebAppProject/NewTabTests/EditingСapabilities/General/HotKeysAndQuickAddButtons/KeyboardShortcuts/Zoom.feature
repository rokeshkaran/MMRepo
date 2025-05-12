@retry(2)
Feature: Zoom
Check can Zoom in and out using ctrl + mouse scroll wheel or cmd + mouse scroll wheel

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @Keyboard_Shortcuts @Zoom @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-555] @Upd_Qase
Scenario: Check_that_it_is_possible_to_zoom_in_via_ctrl_plus_mouse_scroll_wheel_up
	When User remembers map size
	When User presses Ctrl key on keyboard and scroll mouse wheel up
	Then map is Zoomed in

@MindManager @EditingCapabilities @Keyboard_Shortcuts @Zoom @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-555] @Upd_Qase
Scenario: Check_that_it_is_possible_to_zoom_in_via_cmd_key_plus_mouse_scroll_wheel_up
	When User remembers map size
	When User presses Cmd key on keyboard and scroll mouse wheel up
	Then map is Zoomed in

@MindManager @EditingCapabilities @Keyboard_Shortcuts @Zoom @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-556] @Upd_Qase
Scenario: Check_that_it_is_possible_to_zoom_out_via_ctrl_plus_mouse_scroll_wheel_down
	When User remembers map size
	When User presses Ctrl key on keyboard and scroll mouse wheel down
	Then map is Zoomed out

@MindManager @EditingCapabilities @Keyboard_Shortcuts @Zoom @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-556] @Upd_Qase
Scenario: Check_that_it_is_possible_to_zoom_out_via_cmd_key_plus_mouse_scroll_wheel_down
	When User remembers map size
	When User presses Cmd key on keyboard and scroll mouse wheel down 
	Then map is Zoomed out

@MindManager @EditingCapabilities @Keyboard_Shortcuts @Zoom @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-555,WEB-556] @Upd_Qase
Scenario: Check_that_it_is_possible_to_zoom_in_via_ctrl_key_and_plus_key
	When User remembers map size
	When User presses the Ctrl and 'Plus' key combination on the keyboard
	Then map is Zoomed in
	When User remembers map size
	When User presses the Ctrl and 'Subtract' key combination on the keyboard
	Then map is Zoomed out