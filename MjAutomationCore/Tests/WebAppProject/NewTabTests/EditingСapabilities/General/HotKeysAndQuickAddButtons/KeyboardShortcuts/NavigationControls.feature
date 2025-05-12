@retry(2)
Feature: NavigationControls
Check Navigation Control on keyboard

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath                   |
		| auto_test_SRND.mmap | NavigationControlsMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @Keyboard_Shortcuts @NavigationControls @App_QA @App_Staging @App_Prod @Qase[WEB-1489] @Upd_Qase @Cleanup
Scenario: Check_possibility_to_select_topics_using_down_key
	When User clicks 'Callout' topic on Canvas
	Then 'Callout' is outlined with a blue circuit
	When User presses the 'Down' key on the keyboard
	Then 'Main Topic' is outlined with a blue circuit

@MindManager @Keyboard_Shortcuts @NavigationControls @App_QA @App_Staging @App_Prod @Qase[WEB-1489] @Upd_Qase @Cleanup
Scenario: Check_possibility_to_select_topics_using_left_key
	When User clicks 'Main Topic' topic on Canvas
	Then 'Main Topic' is outlined with a blue circuit
	When User presses the 'Left' key on the keyboard
	Then 'Central Topic' is outlined with a blue circuit

@MindManager @Keyboard_Shortcuts @NavigationControls @App_QA @App_Staging @App_Prod @Qase[WEB-1489] @Upd_Qase @Cleanup
Scenario: Check_possibility_to_select_topics_using_right_key
	When User clicks 'Main Topic' topic on Canvas
	Then 'Main Topic' is outlined with a blue circuit
	When User presses the 'Right' key on the keyboard
	Then 'Subtopic' is outlined with a blue circuit

@MindManager @Keyboard_Shortcuts @NavigationControls @App_QA @App_Staging @App_Prod @Qase[WEB-1489] @Upd_Qase @Cleanup
Scenario: Check_possibility_to_select_topics_using_up_key
	When User clicks 'Main Topic' topic on Canvas
	Then 'Main Topic' is outlined with a blue circuit
	When User presses the 'Up' key on the keyboard
	Then 'Callout' is outlined with a blue circuit

@MindManager @Keyboard_Shortcuts @NavigationControls @App_QA @App_Staging @App_Prod @Qase[WEB-1490] @Upd_Qase @Cleanup
Scenario: Check_possibility_to_select_top_topics_using_home_key
	When User clicks 'MT2' topic on Canvas
	Then 'MT2' is outlined with a blue circuit
	When User presses the 'Home' key on the keyboard
	Then 'Main Topic' is outlined with a blue circuit

@MindManager @Keyboard_Shortcuts @NavigationControls @App_QA @App_Staging @App_Prod @Qase[WEB-1491] @Upd_Qase @Cleanup
Scenario: Check_possibility_to_select_bottom_topics_using_end_key
	When User clicks 'Main Topic' topic on Canvas
	Then 'Main Topic' is outlined with a blue circuit
	When User presses the 'End' key on the keyboard
	Then 'MT2' is outlined with a blue circuit

@MindManager @Keyboard_Shortcuts @NavigationControls @App_QA @App_Staging @App_Prod @Qase[WEB-1492] @Upd_Qase @Cleanup
Scenario: Check_possibility_to_move_floating_topic_using_down_key
	When User clicks 'Floating Topic' topic on Canvas
	Then 'Floating Topic' is outlined with a blue circuit
	When User remembers location of 'Floating Topic' topic on Canvas
	And User presses the 'Down' key on the keyboard
	Then 'Floating Topic' topic has changed location by Y axis on Canvas

@MindManager @Keyboard_Shortcuts @NavigationControls @App_QA @App_Staging @App_Prod @Qase[WEB-1492] @Upd_Qase @Cleanup
Scenario: Check_possibility_to_move_floating_topic_using_left_key
	When User clicks 'Floating Topic' topic on Canvas
	Then 'Floating Topic' is outlined with a blue circuit
	When User remembers location of 'Floating Topic' topic on Canvas
	And User presses the 'Left' key on the keyboard
	Then 'Floating Topic' topic has changed location by X axis on Canvas

@MindManager @Keyboard_Shortcuts @NavigationControls @App_QA @App_Staging @App_Prod @Qase[WEB-1492] @Upd_Qase @Cleanup
Scenario: Check_possibility_to_move_floating_topic_using_right_key
	When User clicks 'Floating Topic' topic on Canvas
	Then 'Floating Topic' is outlined with a blue circuit
	When User remembers location of 'Floating Topic' topic on Canvas
	And User presses the 'Right' key on the keyboard
	Then 'Floating Topic' topic has changed location by X axis on Canvas

@MindManager @Keyboard_Shortcuts @NavigationControls @App_QA @App_Staging @App_Prod @Qase[WEB-1492] @Upd_Qase @Cleanup
Scenario: Check_possibility_to_move_floating_topic_using_up_key
	When User clicks 'Floating Topic' topic on Canvas
	Then 'Floating Topic' is outlined with a blue circuit
	When User remembers location of 'Floating Topic' topic on Canvas
	And User presses the 'Up' key on the keyboard
	Then 'Floating Topic' topic has changed location by Y axis on Canvas

@MindManager @Keyboard_Shortcuts @NavigationControls @App_QA @App_Staging @App_Prod @Qase[WEB-1492] @Upd_Qase @Cleanup
Scenario: Check_possibility_to_move_floating_topic_with_subtopic_using_down_key
	When User clicks 'Floating Topic' topic on Canvas
	Then 'Floating Topic' is outlined with a blue circuit
	When User clicks 'Add subtopic' button on Tools panel
	Then 'Subtopic' subtopic is displayed on Canvas
	And 'Subtopic' is outlined with a blue circuit
	When User clicks 'Floating Topic' topic on Canvas
	Then 'Floating Topic' is outlined with a blue circuit
	When User remembers location of 'Floating Topic' topic on Canvas
	And User presses the 'Down' key on the keyboard
	Then 'Floating Topic' topic has changed location by Y axis on Canvas

@MindManager @Keyboard_Shortcuts @NavigationControls @App_QA @App_Staging @App_Prod @Qase[WEB-1492] @Upd_Qase @Cleanup
Scenario: Check_possibility_to_move_floating_topic_with_subtopic_using_left_key
	When User clicks 'Floating Topic' topic on Canvas
	Then 'Floating Topic' is outlined with a blue circuit
	When User clicks 'Add subtopic' button on Tools panel
	Then 'Subtopic' subtopic is displayed on Canvas
	And 'Subtopic' is outlined with a blue circuit
	When User clicks 'Floating Topic' topic on Canvas
	Then 'Floating Topic' is outlined with a blue circuit
	When User remembers location of 'Floating Topic' topic on Canvas
	And User presses the 'Left' key on the keyboard
	Then 'Floating Topic' topic has changed location by X axis on Canvas

@MindManager @Keyboard_Shortcuts @NavigationControls @App_QA @App_Staging @App_Prod @Qase[WEB-1492] @Upd_Qase @Cleanup
Scenario: Check_possibility_to_move_floating_topic_with_subtopic_using_right_key
	When User clicks 'Floating Topic' topic on Canvas
	Then 'Floating Topic' is outlined with a blue circuit
	When User clicks 'Add subtopic' button on Tools panel
	Then 'Subtopic' subtopic is displayed on Canvas
	And 'Subtopic' is outlined with a blue circuit
	When User clicks 'Floating Topic' topic on Canvas
	Then 'Floating Topic' is outlined with a blue circuit
	When User remembers location of 'Floating Topic' topic on Canvas
	And User presses the 'Right' key on the keyboard
	Then 'Floating Topic' topic has changed location by X axis on Canvas

@MindManager @Keyboard_Shortcuts @NavigationControls @App_QA @App_Staging @App_Prod @Qase[WEB-1492] @Upd_Qase @Cleanup
Scenario: Check_possibility_to_move_floating_topic_with_subtopic_using_up_key
	When User clicks 'Floating Topic' topic on Canvas
	Then 'Floating Topic' is outlined with a blue circuit
	When User clicks 'Add subtopic' button on Tools panel
	Then 'Subtopic' subtopic is displayed on Canvas
	And 'Subtopic' is outlined with a blue circuit
	When User clicks 'Floating Topic' topic on Canvas
	Then 'Floating Topic' is outlined with a blue circuit
	When User remembers location of 'Floating Topic' topic on Canvas
	And User presses the 'Up' key on the keyboard
	Then 'Floating Topic' topic has changed location by Y axis on Canvas