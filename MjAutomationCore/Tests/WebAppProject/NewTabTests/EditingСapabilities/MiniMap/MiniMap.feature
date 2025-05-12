@retry(2)
Feature: MiniMap
Check Mini-map functionality

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User selects first 'MT1' and second 'MT1ST1' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox

@MindManager @EditingCapabilities @MiniMap @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-501] @Upd_Qase
Scenario: Check_open_Mini_map
	Then mini map icon is disabled on navigation panel
	When User clicks mini map button
	Then mini map icon is enabled on navigation panel
	Then 'mini-map' navigation panel is displayed to User

@MindManager @EditingCapabilities @MiniMap @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-501] @Upd_Qase
Scenario: Check_close_Mini_map
	When User clicks mini map button
	When User clicks mini map button
	Then mini map icon is disabled on navigation panel
	Then 'mini-map' navigation panel is not displayed to User

@MindManager @Mini_Map @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-502] @Upd_Qase
Scenario: Check_Mini_map_frame_on_zooming
	When User clicks mini map button
	When User remembers mini map frame size
	When User clicks Zoom Out button on zoom bar of side toolbox
	Then mini map frame is increased
	When User remembers mini map frame size
	When User clicks Zoom In button on zoom bar of side toolbox
	When User clicks Zoom In button on zoom bar of side toolbox
	Then mini map frame is decreased

@MindManager @Mini_Map @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-503] @Upd_Qase
Scenario: Change_view_area_drag_mini_map
	When User clicks mini map button
	When User remembers location of 'CT' topic on Canvas
	When User remembers mini map frame location
	When User moves mini map frame by '7' and '7' coordinates
	Then 'CT' topic has changed location by X axis on Canvas
	Then 'CT' topic has changed location by Y axis on Canvas
	Then mini map frame has changed location by X axis
	Then mini map frame has changed location by Y axis

@MindManager @Mini_Map @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-503] @Upd_Qase
Scenario: Change_view_area_click_mini_map
	When User clicks mini map button
	When User remembers location of 'CT' topic on Canvas
	When User remembers mini map frame location
	When User clicks Zoom In button on zoom bar of side toolbox
	When User clicks on mini map by '25' and '25' coordinates
	Then 'CT' topic has changed location by X axis on Canvas
	Then 'CT' topic has changed location by Y axis on Canvas
	Then mini map frame has changed location by X axis
	Then mini map frame has changed location by Y axis

@MindManager @Mini_Map @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-504] @Upd_Qase
Scenario: Check_position_of_mini_map_button
	When User left click on the Overlay panel
	Then 'settings' dropdown menu is displayed to User
	When User clicks button with 'bottom-right' name in 'settings' menu
	Then Overlay panel is located by approximate '1417' X axis and approximate '639' Y axis
	Then button with 'mini-map-placeholder' name is displayed in 'OverlayPanelPageElement' container
	Then button with 'tutorial-card-placeholder' name is displayed in 'OverlayPanelPageElement' container
	When User left click on the Overlay panel by offset '-78' X and '0' Y
	When User clicks button with 'top-right' name in 'settings' menu
	Then Overlay panel is located by approximate '1089' X axis and approximate '93' Y axis
	Then Mini map navigation panel is located by approximate '1133' X axis and approximate'637' Y axis
	Then 'mini-map' icon is displayed on navigation panel
	Then 'tutorial-card' icon is displayed on navigation panel

@MindManager @Mini_Map @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2506] @Upd_Qase
Scenario: Verify_the_X_button_is_added_on_Navigation_Popup
	Then mini map icon is disabled on navigation panel
	When User clicks mini map button
	Then mini map icon is enabled on navigation panel
	Then 'mini-map' navigation panel is displayed to User
	When User click on Close button in 'mini-map' Navigation Panel Popup 
	Then mini map icon is disabled on navigation panel
	Then 'mini-map' navigation panel is not displayed to User