@retry(2)
Feature: Rotation
Use hot keys on keyboard to rotate 

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath                   |
		| auto_test_SRND.mmap | NavigationControlsMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @Keyboard_Shortcuts @Rotation @App_QA @App_Staging @App_Prod @Qase[WEB-565] @Upd_Qase @Cleanup
Scenario: To_verify_that_it_is_possible_to_rotate_shape_15_degrees_via_hotkeys
	When User adds 'Right Angle Triangle' shape from 'toolpanel-popup' dropdown menu to '200','50' position on Canvas
	Then border for 'Right Angle Triangle' shape is highlighted green color
	When User presses and hold the 'Shift' key on the keyboard
	When User clicks and holds 'bottom-left' arrow on the 'Right Angle Triangle' shape and drags mouse by '0' and '-20' coordinates
	Then 'Right Angle Triangle' shape has been rotated by '15' degrees

@MindManager @Keyboard_Shortcuts @Rotation @App_QA @App_Staging @App_Prod @Qase[WEB-566] @Upd_Qase @Cleanup
Scenario: To_verify_that_it_is_possible_to_rotate_smart_shape_15_degrees_via_hotkeys
	When User adds 'Swim Lanes' Smart shape on the 'Horizontal' option to '200','50' position on canvas
	Then 'Swim Lanes' Smart shape with '3' Horizontal lanes is displayed on Canvas
	Then 'Swim Lanes' Smart shape is displayed on Canvas
	When User presses and hold the 'Shift' key on the keyboard
	When User clicks and holds 'bottom-left' arrow on the 'Swim Lanes' Smart shape and drags mouse by '0' and '-20' coordinates
	Then 'Swim Lanes' Smart shape has been rotated by '15' degrees

@MindManager @Keyboard_Shortcuts @Rotation @App_QA @App_Staging @App_Prod @Qase[WEB-567] @Upd_Qase @Cleanup
Scenario: To_verify_that_it_is_possible_to_rotate_image_15_degrees_via_hotkeys
	When User uploads 'CoolFreesh.jfif' image from Tool panel to '300','300' position on Canvas
	When User uploads 'FruitsOutlineIcon.png' image from Tool panel to '50','50' position on Canvas
	When User clicks on 'CoolFreesh.jfif' uploaded image on Canvas
	When User presses and hold the 'Shift' key on the keyboard
	When User clicks and holds 'bottom-left' arrow on 'CoolFreesh.jfif' image and drags mouse by '0' and '-35' coordinates
	Then 'CoolFreesh.jfif' uploaded image has been rotated by '15' degrees

@MindManager @Keyboard_Shortcuts @Rotation @App_QA @App_Staging @App_Prod @Qase[WEB-568] @Upd_Qase @Cleanup @JIRA[MMCV-9842]
Scenario: To_verify_that_it_is_possible_to_rotate_textbox_15_degrees_via_hotkeys
	When User adds text box from tool panel with text 'Tester' to '300','200' position on Canvas
	When User adds text box from tool panel with text 'Testing' to '50','25' position on Canvas
	When User clicks on added textbox with text 'Tester' on Canvas
	When User presses and hold the 'Shift' key on the keyboard
	When User clicks and holds 'bottom-left' arrow on textbox with text 'Tester' and drags mouse by '0' and '-5' coordinates
	Then Text box with text 'Tester' has been rotated by '15' degrees