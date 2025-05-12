@retry(2)
Feature: ViaToolbar
Check can edit Shape attributes via toolbar

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @Shapes @Via_Toolbar @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-387] @Upd_Qase
Scenario: Check_that_the_User_can_add_and_change_color_of_selected_shapes_via_the_toolbar
	When User adds 'Block Arrow' shape from 'toolpanel-popup' dropdown menu to '200','50' position on Canvas
	When User adds 'Trapezoid' shape from 'toolpanel-popup' dropdown menu to '100','100' position on Canvas
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#0a45e8' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then 'rgb(10, 69, 232)' fill color is displayed to the 'Trapezoid' Shape
	When User clicks on 'Block Arrow' shape
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	Then checkbox with color 'rgb(10, 69, 232)' is displayed in palette container on Color picker
	When User clicks 'rgb(10, 69, 232)' checkbox in palette container on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	Then 'rgb(10, 69, 232)' fill color is displayed to the 'Block Arrow' Shape

@MindManager @EditingCapabilities @Shapes @ColorPicker @Via_Toolbar @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1511] @Upd_Qase
Scenario: Check_that_the_User_can_add_and_change_color_of_selected_shapes_line_via_the_toolbar
	When User adds 'Block Arrow' shape from 'toolpanel-popup' dropdown menu to '200','50' position on Canvas
	When User adds 'Trapezoid' shape from 'toolpanel-popup' dropdown menu to '100','100' position on Canvas
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User click on 'Line Color' tab in Color Picker Header
	When User clicks 'rgba(255, 255, 255, 0)' checkbox in palette container on Color picker
	Then Color Preview has color 'rgba(255, 255, 255, 0)' on Color Picker
	#ColorCanvas
	When User click mouse by '10' '10' coordinates in field color Area
	Then Color Preview has not color 'rgb(255, 255, 255)' on Color Picker
	When User enters '800080' hex code in input field on Color picker
	When User presses the 'Enter' key on the keyboard
	Then Color Preview has color 'rgb(128, 0, 128)' on Color Picker
    #Slider
	When User moves cursor by '20' '20' coordinates to field color Picker
	Then Color Preview has color 'rgb(0, 128, 128)' on Color Picker
	Then Colour Hex code '#008080' is displayed on Hex Code Color Picker
	When User clicks on 'Block Arrow' shape
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	Then checkbox with color 'rgb(128, 0, 128)' is displayed in palette container on Color picker
	When User clicks 'rgb(68, 68, 68)' checkbox in palette container on Color picker
	Then Color Preview has color 'rgb(68, 68, 68)' on Color Picker