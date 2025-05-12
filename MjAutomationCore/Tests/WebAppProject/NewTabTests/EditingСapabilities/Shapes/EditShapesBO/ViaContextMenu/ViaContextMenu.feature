@retry(2)
Feature: ViaContextMenu
Check can edit Shape attributes via context menu

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @Shapes @Via_context_menu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-379] @Upd_Qase
Scenario: Check_it_is_possible_to_change_the_stacking_order_of_shapes
	When User adds 'Rectangle' shape from 'toolpanel-popup' dropdown menu to '200','200' position on Canvas
	And User adds 'Circle' shape from 'toolpanel-popup' dropdown menu to '100','100' position on Canvas
	And User adds 'Isosceles Triangle' shape from 'toolpanel-popup' dropdown menu to '50','50' position on Canvas
	And User right clicks on 'Rectangle' shape
	Then border for 'Rectangle' shape is highlighted green color
	And 'background-object-contextmenu' Menu is displayed to User
	And button with 'send-backward' name is disabled in 'background-object-contextmenu' menu
	And button with 'send-to-bottom' name is disabled in 'background-object-contextmenu' menu
	When User clicks button with 'bring-forward' name in 'background-object-contextmenu' menu
	Then 'Rectangle' shape is displayed on the '1' position
	And border for 'Rectangle' shape is highlighted green color
	When User right clicks on 'Rectangle' shape
	Then 'background-object-contextmenu' Menu is displayed to User
	When User clicks button with 'send-backward' name in 'background-object-contextmenu' menu
	Then 'Rectangle' shape is displayed on the '0' position
	When User right clicks on 'Isosceles Triangle' shape
	Then button with 'bring-forward' name is disabled in 'background-object-contextmenu' menu
	And button with 'bring-to-top' name is disabled in 'background-object-contextmenu' menu
	When User clicks button with 'send-to-bottom' name in 'background-object-contextmenu' menu
	Then 'Isosceles Triangle' shape is displayed on the '0' position
	When User right clicks on 'Isosceles Triangle' shape
	And User clicks button with 'bring-to-top' name in 'background-object-contextmenu' menu
	Then 'Isosceles Triangle' shape is displayed on the '2' position
	When User clicks on 'Isosceles Triangle' shape
	Then border for 'Isosceles Triangle' shape is highlighted green color
	When User drags and drops 'Isosceles Triangle' shape onto 'ImageTopic2' topic
	Then 'Isosceles Triangle' shape is overlapped by 'ImageTopic2' topic on Canvas

@MindManager @EditingCapabilities @Shapes @Via_context_menu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-380] @Upd_Qase
Scenario: Check_that_it_is_possible_to_show_or_hide_the_name_of_the_shape
	When User adds 'Right Arrow' shape from 'toolpanel-popup' dropdown menu to '200','100' position on Canvas
	Then border for 'Right Arrow' shape is highlighted green color
	When User right clicks on 'Right Arrow' shape
	Then 'background-object-contextmenu' Menu is displayed to User
	And button with 'title' name is unchecked in 'background-object-contextmenu' menu
	When User clicks button with 'title' name in 'background-object-contextmenu' menu
	Then 'Right Arrow 1' title is displayed of the 'Right Arrow' shape
	When User right clicks on 'Right Arrow' shape
	Then button with 'title' name is checked in 'background-object-contextmenu' menu
	When User clicks button with 'title' name in 'background-object-contextmenu' menu
	Then title is not displayed for 'Right Arrow' shape
	When User right clicks on 'Right Arrow' shape
	Then button with 'title' name is unchecked in 'background-object-contextmenu' menu

@MindManager @EditingCapabilities @Shapes @Via_context_menu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-381] @Upd_Qase
Scenario: Check_that_it_is_possible_to_change_the_fill_color_of_shapes
	When User adds 'Rectangle' shape from 'toolpanel-popup' dropdown menu to '200','50' position on Canvas
	And User adds 'Explosion' shape from 'toolpanel-popup' dropdown menu to '100','100' position on Canvas
	And User right clicks on 'Explosion' shape
	Then 'background-object-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'Fill Color' name in 'background-object-contextmenu' menu
	Then Color Picker window is displayed to User
	When User enters '#ffea20ce' hex code in input field on Color picker
	And User clicks 'Apply' button in Color Picker window
	Then 'rgb(234, 32, 206)' fill color is displayed to the 'Explosion' Shape
	When User right clicks on 'Rectangle' shape
	Then 'background-object-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'Fill Color' name in 'background-object-contextmenu' menu
	Then checkbox with color 'rgb(234, 32, 206)' is displayed in palette container on Color picker
	When User clicks 'rgb(234, 32, 206)' checkbox in palette container on Color picker
	And User clicks 'Apply' button in Color Picker window
	Then 'rgb(234, 32, 206)' fill color is displayed to the 'Rectangle' Shape

@MindManager @EditingCapabilities @Shapes @Via_context_menu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-382] @Upd_Qase
Scenario: Check_that_it_is_possible_to_change_the_line_color_of_shapes
	When User adds 'Text Bubble' shape from 'toolpanel-popup' dropdown menu to '200','50' position on Canvas
	And User adds 'Right Arrow' shape from 'toolpanel-popup' dropdown menu to '100','100' position on Canvas
	And User right clicks on 'Right Arrow' shape
	Then 'background-object-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'Line Color' name in 'background-object-contextmenu' menu
	Then Color Picker window is displayed to User
	When User enters '#ff1ed1d5' hex code in input field on Color picker
	And User clicks 'Apply' button in Color Picker window
	Then 'rgb(30, 209, 213)' color is displayed to the 'Right Arrow' shape line
	When User right clicks on 'Text Bubble' shape
	Then 'background-object-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'Line Color' name in 'background-object-contextmenu' menu
	Then Color Picker window is displayed to User
	And checkbox with color 'rgb(30, 209, 213)' is displayed in palette container on Color picker
	When User clicks 'rgb(30, 209, 213)' checkbox in palette container on Color picker
	And User clicks 'Apply' button in Color Picker window
	Then 'rgb(30, 209, 213)' color is displayed to the 'Text Bubble' shape line

@MindManager @EditingCapabilities @Shapes @Via_context_menu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-383] @Upd_Qase
Scenario: Check_the_More_Format_options_button
	When User adds 'Isosceles Triangle' shape from 'toolpanel-popup' dropdown menu to '200','50' position on Canvas
	And User right clicks on 'Isosceles Triangle' shape
	Then 'background-object-contextmenu' Menu is displayed to User
	When User clicks button with 'more-format-options' name in 'background-object-contextmenu' menu
	Then 'PanelByName' side panel with 'Format Shape' header is displayed to the User