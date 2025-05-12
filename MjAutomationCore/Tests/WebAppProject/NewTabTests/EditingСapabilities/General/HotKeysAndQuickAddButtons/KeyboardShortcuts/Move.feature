@retry(2)
Feature: Move
Check Move functionality

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath      |
		| auto_test_SRND.mmap | ImageMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @Keyboard_Shortcuts @Move @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-562] @Upd_Qase @Build_23.2.205
Scenario: To_verify_that_it_is_possible_to_select_multiple_topics_via_hot_keys
	When User remembers '12345' topic model id and name
	And User remembers 'ImageTopic2' topic model id and name
	And User remembers 'ImageTopic1' topic model id and name
	And User presses and hold the 'Shift' key on the keyboard
	And User clicks '12345' topic on Canvas
	And User clicks 'ImageTopic2' topic on Canvas
	And User clicks 'ImageTopic1' topic on Canvas
	And User releases 'Shift' key on keyboard
	Then 'ImageTopic1' topic is highlighted with 'rgb(62, 158, 255)' color in '1' opacity on Canvas
	And 'ImageTopic2' topic is highlighted with 'rgb(62, 158, 255)' color in '0.5' opacity on Canvas
	And '12345' topic is highlighted with 'rgb(62, 158, 255)' color in '0.5' opacity on Canvas

@MindManager @EditingCapabilities @Keyboard_Shortcuts @Move @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-564] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_maintain_aspect_ratio_when_resizing_images
	When User uploads 'FruitsOutlineIcon.png' image from Tool panel to '50','50' position on Canvas
	Then 'FruitsOutlineIcon.png' image with approximate '264' width and approximate '184' height is displayed on page
	When User presses and hold the 'Shift' key on the keyboard
	And User drags and drops 'bottom-right' point on 'FruitsOutlineIcon.png' image by coordinates '100' and '100'
	Then 'FruitsOutlineIcon.png' image with approximate '409' width and approximate '329' height is displayed on page