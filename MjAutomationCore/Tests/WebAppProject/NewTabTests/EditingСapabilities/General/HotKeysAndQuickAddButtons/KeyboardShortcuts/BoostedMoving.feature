@retry(2)
Feature: BoostedMoving
Use nudge keys on keyboard to move

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath                   |
		| auto_test_SRND.mmap | NavigationControlsMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @Keyboard_Shortcuts @BoostedMoving @App_QA @App_Staging @App_Prod @Qase[WEB-577] @Upd_Qase @Cleanup
Scenario: Check_possibility_to_move_floating_topic_up_via_nudge_keys
	When User clicks 'Floating Topic' topic on Canvas
	Then 'Floating Topic' is outlined with a blue circuit
	When User remembers location of 'Floating Topic' topic on Canvas
	And User presses the Shift and 'Up' key combination on the keyboard
	Then 'Floating Topic' topic has changed location by Y axis on Canvas

@MindManager @Keyboard_Shortcuts @BoostedMoving @App_QA @App_Staging @App_Prod @Qase[WEB-577] @Upd_Qase @Cleanup
Scenario: Check_possibility_to_move_floating_topic_down_via_nudge_keys
	When User clicks 'Floating Topic' topic on Canvas
	Then 'Floating Topic' is outlined with a blue circuit
	When User remembers location of 'Floating Topic' topic on Canvas
	And User presses the Shift and 'Down' key combination on the keyboard
	Then 'Floating Topic' topic has changed location by Y axis on Canvas

@MindManager @Keyboard_Shortcuts @BoostedMoving @App_QA @App_Staging @App_Prod @Qase[WEB-577] @Upd_Qase @Cleanup
Scenario: Check_possibility_to_move_floating_topic_left_via_nudge_keys
	When User clicks 'Floating Topic' topic on Canvas
	Then 'Floating Topic' is outlined with a blue circuit
	When User remembers location of 'Floating Topic' topic on Canvas
	And User presses the Shift and 'Left' key combination on the keyboard
	Then 'Floating Topic' topic has changed location by X axis on Canvas

@MindManager @Keyboard_Shortcuts @BoostedMoving @App_QA @App_Staging @App_Prod @Qase[WEB-577] @Upd_Qase @Cleanup
Scenario: Check_possibility_to_move_floating_topic_right_via_nudge_keys
	When User clicks 'Floating Topic' topic on Canvas
	Then 'Floating Topic' is outlined with a blue circuit
	When User remembers location of 'Floating Topic' topic on Canvas
	And User presses the Shift and 'Right' key combination on the keyboard
	Then 'Floating Topic' topic has changed location by X axis on Canvas

@MindManager @Keyboard_Shortcuts @BoostedMoving @App_QA @App_Staging @App_Prod @Qase[WEB-578] @Upd_Qase @Cleanup
Scenario: Check_possibility_to_move_shape_up_via_nudge_keys
	When User adds 'Rectangle' shape from 'toolpanel-popup' dropdown menu to '200','50' position on Canvas
	Then 'Rectangle' shape with '111' width and '111' height is displayed on page
	And border for 'Rectangle' shape is highlighted green color
	When User remembers the location of 'Rectangle' shape on Canvas
	And User presses the Shift and 'Up' key combination on the keyboard
	Then 'Rectangle' shape has changed location by Y axis on Canvas

@MindManager @Keyboard_Shortcuts @BoostedMoving @App_QA @App_Staging @App_Prod @Qase[WEB-578] @Upd_Qase @Cleanup
Scenario: Check_possibility_to_move_shape_down_via_nudge_keys
	When User adds 'Rectangle' shape from 'toolpanel-popup' dropdown menu to '200','50' position on Canvas
	Then 'Rectangle' shape with '111' width and '111' height is displayed on page
	And border for 'Rectangle' shape is highlighted green color
	When User remembers the location of 'Rectangle' shape on Canvas
	And User presses the Shift and 'Down' key combination on the keyboard
	Then 'Rectangle' shape has changed location by Y axis on Canvas

@MindManager @Keyboard_Shortcuts @BoostedMoving @App_QA @App_Staging @App_Prod @Qase[WEB-578] @Upd_Qase @Cleanup
Scenario: Check_possibility_to_move_shape_left_via_nudge_keys
	When User adds 'Rectangle' shape from 'toolpanel-popup' dropdown menu to '200','50' position on Canvas
	Then 'Rectangle' shape with '111' width and '111' height is displayed on page
	And border for 'Rectangle' shape is highlighted green color
	When User remembers the location of 'Rectangle' shape on Canvas
	And User presses the Shift and 'Left' key combination on the keyboard
	Then 'Rectangle' shape has changed location by X axis on Canvas

@MindManager @Keyboard_Shortcuts @BoostedMoving @App_QA @App_Staging @App_Prod @Qase[WEB-578] @Upd_Qase @Cleanup
Scenario: Check_possibility_to_move_shape_right_via_nudge_keys
	When User adds 'Rectangle' shape from 'toolpanel-popup' dropdown menu to '200','50' position on Canvas
	Then 'Rectangle' shape with '111' width and '111' height is displayed on page
	And border for 'Rectangle' shape is highlighted green color
	When User remembers the location of 'Rectangle' shape on Canvas
	And User presses the Shift and 'Right' key combination on the keyboard
	Then 'Rectangle' shape has changed location by X axis on Canvas

@MindManager @Keyboard_Shortcuts @BoostedMoving @App_QA @App_Staging @App_Prod @Qase[WEB-579] @Upd_Qase @Cleanup
Scenario: Check_possibility_to_move_image_up_via_nudge_keys
	When User clicks 'ImageTopic1' topic on Canvas
	And User clicks on image in 'ImageTopic1' topic
	And User remembers location of 'ImageTopic1' topic on Canvas
	And User presses the Shift and 'Up' key combination on the keyboard
	Then 'ImageTopic1' topic has changed location by Y axis on Canvas

@MindManager @Keyboard_Shortcuts @BoostedMoving @App_QA @App_Staging @App_Prod @Qase[WEB-579] @Upd_Qase @Cleanup
Scenario: Check_possibility_to_move_image_down_via_nudge_keys
	When User clicks 'ImageTopic1' topic on Canvas
	And User clicks on image in 'ImageTopic1' topic
	And User remembers location of 'ImageTopic1' topic on Canvas
	And User presses the Shift and 'Down' key combination on the keyboard
	Then 'ImageTopic1' topic has changed location by Y axis on Canvas

@MindManager @Keyboard_Shortcuts @BoostedMoving @App_QA @App_Staging @App_Prod @Qase[WEB-579] @Upd_Qase @Cleanup
Scenario: Check_possibility_to_move_image_left_via_nudge_keys
	When User clicks 'ImageTopic1' topic on Canvas
	And User clicks on image in 'ImageTopic1' topic
	And User remembers location of 'ImageTopic1' topic on Canvas
	And User presses the Shift and 'Left' key combination on the keyboard
	Then 'ImageTopic1' topic has changed location by X axis on Canvas

@MindManager @Keyboard_Shortcuts @BoostedMoving @App_QA @App_Staging @App_Prod @Qase[WEB-579] @Upd_Qase @Cleanup
Scenario: Check_possibility_to_move_image_right_via_nudge_keys
	When User clicks 'ImageTopic1' topic on Canvas
	And User clicks on image in 'ImageTopic1' topic
	And User remembers location of 'ImageTopic1' topic on Canvas
	And User presses the Shift and 'Right' key combination on the keyboard
	Then 'ImageTopic1' topic has changed location by X axis on Canvas