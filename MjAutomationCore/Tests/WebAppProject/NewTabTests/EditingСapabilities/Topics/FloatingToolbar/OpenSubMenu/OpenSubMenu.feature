@retry(2)
Feature: OpenSubMenu
Check the functionality of floating Toolbar for opening Sub Menu

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	Then User set zoom level to '32' via the side tool bar
	When User clicks 'MT8' topic on Canvas
	Then Floating Toolbar is displayed on Canvas

@MindManager @EditingCapabilities @FloatingToolbar @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2422] @Upd_Qase
Scenario: Check_that_it_is_possible_to_open_Text_Editor_sub_menu_via_Floating_Toolbar
	When User clicks on 'Font format' option in Floating Toolbar Popup
	Then text editor is displayed in 'TextEditorPopup' container

@MindManager @EditingCapabilities @FloatingToolbar @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2423] @Upd_Qase
Scenario: Check_that_it_is_possible_to_open_Topic_shape_sub_menu_via_Floating_Toolbar
	When User clicks on 'Topic Shape' option in Floating Toolbar Popup
	Then 'toolpanel-popup' dropdown menu is displayed to User

@MindManager @EditingCapabilities @FloatingToolbar @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2424] @Upd_Qase
Scenario: Check_that_it_is_possible_to_open_Colors_picker_via_Floating_Toolbar
	When User clicks on 'Colors' option in Floating Toolbar Popup
	Then Color Picker window is displayed to User

@MindManager @EditingCapabilities @FloatingToolbar @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2425] @Upd_Qase
Scenario: Check_that_it_is_possible_to_change_topic_color_via_Floating_Toolbar
	When User clicks on 'Colors' option in Floating Toolbar Popup
	Then Color Picker window is displayed to User
	When User clicks 'rgb(50, 131, 192)' checkbox in palette container on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then 'MT8' topic has Fill Color 'rgb(50, 131, 192)' on Canvas
	When User clicks on 'Colors' option in Floating Toolbar Popup
	Then Color Picker window is displayed to User
	When User click Eyedropper button on Color Picker
	When User hovers cursor the 'RL1' topic
	When User moves cursor by '50' '50' coordinates on Canvas
	Then Magnifier Cursor is displayed on Canvas
	When User hovers cursor the 'RL1' topic
	When User clicks 'RL1' topic on Canvas
	Then Color Preview has color 'rgb(251, 209, 188)' on Color Picker
	When User clicks 'Apply' button in Color Picker window
	Then 'MT8' topic has Fill Color 'rgb(251, 209, 188)' on Canvas

@MindManager @EditingCapabilities @FloatingToolbar @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2426] @Upd_Qase
Scenario: Check_that_it_is_possible_to_change_Topic_shape_via_Floating_Toolbar
	When User clicks on 'Topic Shape' option in Floating Toolbar Popup
	Then 'toolpanel-popup' dropdown menu is displayed to User
	When User clicks 'Diamond' item in 'toolpanel' dropdown menu
	Then 'MT8' topic is assigned 'diamond' shape on Canvas