@retry(2)
Feature: EditShapesBO
Check the functionality of edit shapes

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @EditShapesBO @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-374] @Upd_Qase
Scenario: Check_that_it_is_possible_to_resize_the_shape
	When User adds 'Rectangle' shape from 'toolpanel-popup' dropdown menu to '200','50' position on Canvas
	Then 'Rectangle' shape with '111' width and '111' height is displayed on page
	And 'Rectangle' shape is highlighted green frame
	When User drags and drops 'bottom-left' point on 'Rectangle' shape by coordinates '200' and '200'
	Then 'Rectangle' shape with approximate '215' width and approximate '214' height is displayed on page
	When User drags and drops 'top-right' point on 'Rectangle' shape by coordinates '10' and '50'
	Then 'Rectangle' shape with approximate '229' width and approximate '170' height is displayed on page

@MindManager @EditingCapabilities @EditShapesBO @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-375] @Upd_Qase
Scenario: Check_that_it_is_possible_to_rotate_shapes_on_the_map
	When User adds 'Right Angle Triangle' shape from 'toolpanel-popup' dropdown menu to '10','100' position on Canvas
	Then 'Right Angle Triangle' shape is highlighted green frame
	When User clicks 'bottom-left' arrow on the 'Right Angle Triangle' shape
	Then 'Right Angle Triangle' shape has been rotated by '45' degrees
	When User clicks 'top-right' arrow on the 'Right Angle Triangle' shape
	Then 'Right Angle Triangle' shape has been rotated by '0' degrees
	When User clicks and holds 'bottom-left' arrow on the 'Right Angle Triangle' shape and drags mouse by '0' and '-30' coordinates
	Then 'Right Angle Triangle' shape has been rotated by '28' degrees

@MindManager @EditingCapabilities @EditShapesBO @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-376] @Upd_Qase
Scenario: Check_that_it_is_possible_to_move_shapes_on_the_map
	When User adds 'Circle' shape from 'toolpanel-popup' dropdown menu to '200','200' position on Canvas
	And User remembers the location of 'Circle' shape on Canvas
	And User moves 'Circle' shape by coordinates '-5' and '-5' on Canvas
	Then 'Circle' shape has location changed on Canvas
	When User remembers the location of 'Circle' shape on Canvas
	And User presses the 'Left' key on the keyboard
	And User presses the 'Up' key on the keyboard
	Then 'Circle' shape has location changed on Canvas

@MindManager @EditingCapabilities @EditShapesBO @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-376] @Upd_Qase
Scenario: Check_that_it_is_possible_to_move_multiple_shapes_on_the_map
	When User adds 'Circle' shape from 'toolpanel-popup' dropdown menu to '200','200' position on Canvas
	And User adds 'Five Point Star' shape from 'toolpanel-popup' dropdown menu to '10','100' position on Canvas
	And User selects first 'Circle' shape and second 'Five Point Star' shape on Canvas
	Then 'Circle' shape is highlighted green frame
	And 'Five Point Star' shape is highlighted green frame
	When User remembers the location of 'Circle' shape on Canvas
	And User remembers the location of 'Five Point Star' shape on Canvas
	And User moves 'Circle' shape by coordinates '-20' and '-5' on Canvas
	Then 'Circle' shape has location changed on Canvas
	And 'Five Point Star' shape has location changed on Canvas
	When User remembers the location of 'Circle' shape on Canvas
	And User remembers the location of 'Five Point Star' shape on Canvas
	And User presses the 'Left' key on the keyboard
	And User presses the 'Up' key on the keyboard
	Then 'Circle' shape has location changed on Canvas
	And 'Five Point Star' shape has location changed on Canvas
	And 'Five Point Star' shape has location changed on Canvas

@MindManager @EditingCapabilities @EditShapesBO @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-377] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_copy_and_paste_shapes
	When User adds 'Rectangle' shape from 'toolpanel-popup' dropdown menu to '200','200' position on Canvas
	Then 'Rectangle' shape is highlighted green frame
	When User presses the Ctrl_C combination key on the keyboard
	And User double right clicks by coordinates '-100' and '-70' on Canvas
	And User clicks button with 'paste' name in 'blank-contextmenu' menu
	Then '2' Shapes are displayed on Canvas

@MindManager @EditingCapabilities @EditShapesBO @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-377] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_copy_and_paste_shapes_from_the_toolbar
	When User adds 'Block Arrow' shape from 'toolpanel-popup' dropdown menu to '200','200' position on Canvas
	Then 'Block Arrow' shape is highlighted green frame
	When User clicks 'Copy' button on Tools panel
	And User double right clicks by coordinates '-100' and '70' on Canvas
	And User clicks button with 'paste' name in 'blank-contextmenu' menu
	Then '2' Shapes are displayed on Canvas

@MindManager @EditingCapabilities @EditShapesBO @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-377] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_copy_and_paste_multiple_shapes_from_the_toolbar
	When User adds 'Rectangle' shape from 'toolpanel-popup' dropdown menu to '200','200' position on Canvas
	And User adds 'Text Bubble' shape from 'toolpanel-popup' dropdown menu to '10','100' position on Canvas
	And User selects first 'Rectangle' shape and second 'Text Bubble' shape on Canvas
	Then 'Rectangle' shape is highlighted green frame
	And 'Text Bubble' shape is highlighted green frame
	When User clicks 'Copy' button on Tools panel
	And User double right clicks by coordinates '-100' and '-70' on Canvas
	And User clicks button with 'paste' name in 'blank-contextmenu' menu
	Then '4' Shapes are displayed on Canvas

@MindManager @EditingCapabilities @EditShapesBO @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-377] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_cut_shape_multiple_shapes_from_the_toolbar
	When User adds 'Horizontal Divider' shape from 'toolpanel-popup' dropdown menu to '200','200' position on Canvas
	And User adds 'Block Arrow' shape from 'toolpanel-popup' dropdown menu to '10','200' position on Canvas
	And User selects first 'Horizontal Divider' shape and second 'Block Arrow' shape on Canvas
	Then 'Horizontal Divider' shape is highlighted green frame
	And 'Block Arrow' shape is highlighted green frame
	When User clicks 'Cut' button on Tools panel
	And User double right clicks by coordinates '-100' and '-70' on Canvas
	And User clicks button with 'paste' name in 'blank-contextmenu' menu
	Then '2' Shapes are displayed on Canvas

@MindManager @EditingCapabilities @EditShapesBO @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-377] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_cut_multiple_shapes_via_Ctrl_X_key_combination_on_the_keyboard
	When User adds 'Horizontal Divider' shape from 'toolpanel-popup' dropdown menu to '200','200' position on Canvas
	And User adds 'Block Arrow' shape from 'toolpanel-popup' dropdown menu to '10','200' position on Canvas
	And User selects first 'Horizontal Divider' shape and second 'Block Arrow' shape on Canvas
	Then 'Horizontal Divider' shape is highlighted green frame
	And 'Block Arrow' shape is highlighted green frame
	When User presses the Ctrl_X combination key on the keyboard
	Then 'Horizontal Divider' Shape is not displayed on Canvas
	And 'Block Arrow' Shape is not displayed on Canvas
	When User double right clicks by coordinates '-100' and '-70' on Canvas
	And User clicks button with 'paste' name in 'blank-contextmenu' menu
	Then '2' Shapes are displayed on Canvas

@MindManager @EditingCapabilities @EditShapesBO @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-378] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_multi_select_shapes
	When User adds 'Right Arrow' shape from 'toolpanel-popup' dropdown menu to '200','200' position on Canvas
	And User adds 'Left Curly Bracket' shape from 'toolpanel-popup' dropdown menu to '10','100' position on Canvas
	And User clicks on 'Right Arrow' shape
	And User presses Left_CTRL key on keyboard
	And User clicks on 'Left Curly Bracket' shape
	And User releases Left_CTRL key on keyboard
	Then 'Left Curly Bracket' shape is highlighted green frame
	And 'Right Arrow' shape is highlighted green frame

@MindManager @EditingCapabilities @EditShapesBO @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-378] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_move_the_mouse_to_cover_the_shapes
	When User adds 'Right Arrow' shape from 'toolpanel-popup' dropdown menu to '200','200' position on Canvas
	And User adds 'Left Curly Bracket' shape from 'toolpanel-popup' dropdown menu to '100','100' position on Canvas
	And User  clicks and holds at coordinates '-50' and '-50' and moves mouse by '150' and '100' coordinates and release on Canvas
	Then 'Right Arrow' shape is highlighted green frame
	And 'Left Curly Bracket' shape is highlighted green frame
