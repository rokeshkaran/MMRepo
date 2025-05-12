@retry(2)
Feature: Spacebar
Check Spacebar functionality

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @Keyboard_Shortcuts @Spacebar @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-547] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_activate_Hand_tool_if_topics_are_selected
	When User presses and hold the 'Space' key on the keyboard
	Then hand cursor icon is displayed on Canvas

@MindManager @EditingCapabilities @Keyboard_Shortcuts @Spacebar @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-548] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_activate_Hand_tool_to_drag_with_Space_key
	When User clicks by coordinates '10' and '10' on Canvas
	And User presses and hold the 'Space' key on the keyboard
	Then hand cursor icon is displayed on Canvas
	When User remembers the map location on Canvas
	And User right-clicks on Canvas and hold and wait
	And User moves cursor by '15' '0' coordinates on Canvas
	Then map has changed location by X axis on Canvas
	When User remembers the map location on Canvas
	And User moves cursor by '0' '15' coordinates on Canvas
	Then map has changed location by Y axis on Canvas
	When User remembers the map location on Canvas
	And User moves cursor by '-40' '-40' coordinates on Canvas
	Then map has changed location by X axis on Canvas
	And map has changed location by Y axis on Canvas

@MindManager @EditingCapabilities @Keyboard_Shortcuts @Spacebar @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-549] @Upd_Qase
# Bug related only for Safari and FF browsers MMCV-7871
Scenario: To_verify_that_hand_tool_is_deactivated_after_releasing_the_space_bar
	When User presses and hold the 'Space' key on the keyboard
	Then hand cursor icon is displayed on Canvas
	When User releases 'Space' key on keyboard
	Then hand cursor icon is not displayed on Canvas

@MindManager @EditingCapabilities @Keyboard_Shortcuts @Spacebar @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-550] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_insert_space_into_the_topic_via_hot_key
	When User clicks 'ImageTopic2' topic on Canvas
	And User presses the Shift and 'Space' key combination on the keyboard
	And User enters 'Test' text to the topic on Canvas
	And User clicks by coordinates '10' and '10' on Canvas
	Then 'ImageTopic2 Test' topic is displayed on Canvas