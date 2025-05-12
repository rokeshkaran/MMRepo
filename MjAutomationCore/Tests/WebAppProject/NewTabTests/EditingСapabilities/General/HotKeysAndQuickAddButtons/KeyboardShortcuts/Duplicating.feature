@retry(2)
Feature: Duplicating
Check Duplicating functionality

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @Keyboard_Shortcuts @Duplicating @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-570] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_duplicate_shape_via_hot_keys_and_drag
	When User adds 'Right Angle Triangle' shape from 'toolpanel-popup' dropdown menu to '25','25' position on Canvas
	Then border for 'Right Angle Triangle' shape is highlighted green color
	And '1' Shapes are displayed on Canvas
	When User presses and hold the 'Alt' key on the keyboard
	And User clicks on the 'Right Angle Triangle' shape and drags mouse by '50' and '50' coordinates
	Then '2' Shapes are displayed on Canvas

@MindManager @EditingCapabilities @Keyboard_Shortcuts @Duplicating @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-571] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_duplicate_image_via_hot_keys_and_drag
	When User uploads 'FruitsOutlineIcon.png' image from Tool panel to '300','300' position on Canvas
	And User presses and hold the 'Alt' key on the keyboard
	And User clicks on the 'FruitsOutlineIcon.png' image and drags mouse by '50' and '50' coordinates
	Then '2' Images with name 'FruitsOutlineIcon.png' are displayed on Canvas