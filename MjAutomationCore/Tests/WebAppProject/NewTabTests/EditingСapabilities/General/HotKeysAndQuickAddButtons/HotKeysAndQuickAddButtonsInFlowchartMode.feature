@retry(2)
Feature: HotKeysAndQuickAddButtonsInFlowchartMode
Check hotkeys and quick add buttons in Flowchart Mode

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath          |
		| auto_test_SRND.mmap | FlowchartMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @HotKeysAndQuickAddButtons @FlowchartMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-262] @Upd_Qase
Scenario: Check_the_tooltip_for_the_plus_button_on_the_topic_in_Flowchart_mode
	When User clicks 'TT1' topic on Canvas
	Then '4' plus is displayed on border in topic
	When User hovers over 'top' Plus button in 'TT1' topic on Canvas
	Then tooltip is not displayed to the User
	When User hovers over 'left' Plus button in 'TT1' topic on Canvas
	Then tooltip is not displayed to the User
	When User hovers over 'bottom' Plus button in 'TT1' topic on Canvas
	Then tooltip is not displayed to the User
	When User hovers over 'right' Plus button in 'TT1' topic on Canvas
	Then tooltip is not displayed to the User

@MindManager @EditingCapabilities @HotKeysAndQuickAddButtons @FlowchartMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-262] @Upd_Qase
Scenario: Check_that_it_is_possible_to_add_a_topic_with_quick_add_buttons_in_the_Flowchart_mode
	When User clicks 'TT1' topic on Canvas
	Then '4' plus is displayed on border in topic
	When User hovers over 'top' Plus button in 'TT1' topic on Canvas
	And User waits '500' miliseconds
	Then Handles menu of flowchart mode is displayed on Canvas
	When User selects 'diamond' shape icon in handles menu of flowchart mode on Canvas
	And User add floating topic by coordinates '-100', '70' to the Canvas
	Then 'Topic' topic is displayed on Canvas
	And 'Topic' topic border is highlighted 'rgb(57, 181, 74)' color with no quick add buttons on Canvas
	When User clicks 'Topic' topic on Canvas
	And User presses the 'Backspace' key on the keyboard
	And User clicks 'TT1' topic on Canvas
	And User hovers over 'left' Plus button in 'TT1' topic on Canvas
	And User waits '500' miliseconds
	And User selects 'diamond' shape icon in handles menu of flowchart mode on Canvas
	And User add floating topic by coordinates '-140', '70' to the Canvas
	Then 'Topic' topic is displayed on Canvas
	And 'Topic' topic border is highlighted 'rgb(57, 181, 74)' color with no quick add buttons on Canvas
	When User clicks 'Topic' topic on Canvas
	And User presses the 'Backspace' key on the keyboard
	And User clicks 'TT1' topic on Canvas
	And User hovers over 'bottom' Plus button in 'TT1' topic on Canvas
	And User waits '500' miliseconds
	And User selects 'diamond' shape icon in handles menu of flowchart mode on Canvas
	And User add floating topic by coordinates '-100', '90' to the Canvas
	Then 'Topic' topic is displayed on Canvas
	And 'Topic' topic border is highlighted 'rgb(57, 181, 74)' color with no quick add buttons on Canvas
	When User clicks 'Topic' topic on Canvas
	And User presses the 'Backspace' key on the keyboard
	And User clicks 'TT1' topic on Canvas
	And User hovers over 'right' Plus button in 'TT1' topic on Canvas
	And User waits '500' miliseconds
	And User selects 'diamond' shape icon in handles menu of flowchart mode on Canvas
	And User add floating topic by coordinates '-140', '70' to the Canvas
	Then 'Topic' topic is displayed on Canvas
	And 'Topic' topic border is highlighted 'rgb(57, 181, 74)' color with no quick add buttons on Canvas

@MindManager @EditingCapabilities @HotKeysAndQuickAddButtons @FlowchartMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-264] @Upd_Qase
Scenario: Check_that_it_is_possible_to_add_and_delete_topics_with_the_keyboard_in_Flowchart_mode
	When User clicks 'TT1' topic on Canvas
	Then 'TT1' topic border is highlighted 'rgb(57, 181, 74)' color with no quick add buttons on Canvas
	When User presses the 'Enter' key on the keyboard
	Then '1' topics name 'Topic' are displayed on Canvas
	And 'Topic' topic border is highlighted 'rgb(57, 181, 74)' color with no quick add buttons on Canvas
	When User clicks 'TT1' topic on Canvas
	And User presses the Shift_Enter combination key on the keyboard
	Then '2' topics name 'Topic' are displayed on Canvas
	When User clicks 'TT1' topic on Canvas
	And User presses the 'Insert' key on the keyboard
	Then '5' topics name 'Topic' are displayed on Canvas
	When User clicks 'TT1' topic on Canvas
	And User presses the Ctrl_Enter combination key on the keyboard
	Then '8' topics name 'Topic' are displayed on Canvas

@MindManager @EditingCapabilities @HotKeysAndQuickAddButtons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2848] @Upd_Qase
Scenario: Check_that_it_is_possible_to_add_topics_with_quick_add_buttons_in_the_flowchart_mode
	When User clicks 'TT1' topic on Canvas
	Then '4' plus is displayed on border in topic
	When User clicks on 'top' Plus button in 'TT1' topic on Canvas
	Then 'Topic' topic is displayed on Canvas
	And 'Topic' topic border is highlighted 'rgb(57, 181, 74)' color with no quick add buttons on Canvas
	When User presses the 'Backspace' key on the keyboard
	And User clicks 'TT1' topic on Canvas
	And User clicks on 'bottom' Plus button in 'TT1' topic on Canvas
	Then 'Topic' topic is displayed on Canvas
	And 'Topic' topic border is highlighted 'rgb(57, 181, 74)' color with no quick add buttons on Canvas
	When User presses the 'Backspace' key on the keyboard
	And User clicks 'TT1' topic on Canvas
	And User clicks on 'left' Plus button in 'TT1' topic on Canvas
	Then 'Topic' topic is displayed on Canvas
	And 'Topic' topic border is highlighted 'rgb(57, 181, 74)' color with no quick add buttons on Canvas
	When User presses the 'Backspace' key on the keyboard
	And User clicks 'TT1' topic on Canvas
	And User clicks on 'right' Plus button in 'TT1' topic on Canvas
	Then 'Topic' topic is displayed on Canvas
	And 'Topic' topic border is highlighted 'rgb(57, 181, 74)' color with no quick add buttons on Canvas
